Class         = require "lib.hump.class"
Vector        = require "lib.hump.vector"
PhysicsObject = require "game.physics.physics_object"
Box           = require "game.objects.box"
Button        = require "game.objects.button"
Door          = require "game.objects.door"
Images        = require "resource.images"
DialogWindow  = require "game.ui.dialog_window"
Trigger  = require "game.links.trigger"
ColliderLayer  = require "game.physics.collider_layer"
local sti     = require "lib/sti"

Map = Class {
    init = function(self, scheme, layerName, HC, level)
        self.HC = HC
        self.level = level
        
        self.curentRoomPos = Vector(0,0)
        self.displayStartPos = Vector(
            (config.graphics.resolution.x - config.game.roomSize.x) / 2,
            (config.graphics.resolution.y - config.game.roomSize.y) / 2
        )

        love.physics.setMeter(16)
        self.map = sti(scheme) -- "resource/maps/physics-test.lua"
        self.world = love.physics.newWorld(0, 0)
        love.graphics.setBackgroundColor({.3,.3,.3,1})

        self:initColliders()
        self.ground = {}
        if self.map.layers[layerName .. ".ground"] then
            self.ground['ground'] = self.map.layers[layerName .. ".ground"]
        end
        if self.map.layers[layerName .. ".background"] then
            self.ground['background'] = self.map.layers[layerName .. ".background"]
        end
        if self.map.layers[layerName .. ".front layer"] then
            self.ground['front layer'] = self.map.layers[layerName .. ".front layer"]
        end

        self.colliderToObject = {}

        self.objects = {}
        for _, object in ipairs(self.map.layers[layerName .. ".objects"].objects) do
            local newObject = nil
            if object.type == "player" then
                newObject = Player(object.x, object.y, self.HC)
                newObject.collider.mainCollider.layer = 'player'
                self.player = newObject
            end
            if object.type == "box" then
                newObject = Box(object.x, object.y, self.HC)
                newObject.collider.mainCollider.layer = 'box'
            end
            if object.type == "button" then
                newObject = Button(object.x, object.y, self.HC)
                newObject.collider.mainCollider.layer = 'button'
            end

            if object.type == "door" then
                newObject = Door(object.x, object.y, self.HC)
                newObject.collider.mainCollider.layer = 'door'
            end

            if object.type == "trigger" then
                local triggerType, triggerTarget
                for propertyName, property in pairs(object.properties) do
                    if propertyName == 'type' then
                       triggerType = property
                    elseif propertyName == 'target' then
                       triggerTarget = property
                    end
                end
                newObject = Trigger(triggerType, 
                                    triggerTarget, 
                                    self.level,
                                    self.HC,
                                    object.x,
                                    object.y,
                                    object.width,
                                    object.height)
                newObject.collider.mainCollider.layer = 'trigger'
            end

            if newObject then
                table.insert(self.objects, newObject)
                self.level:addObject(object.id, newObject)
            end

            -- save links to level
            for propertyName, property in pairs(object.properties) do
                if string.find(propertyName, "^link_") then
                    self.level:linkObjects(object.id, property.id, propertyName)
                end
            end
        end

        for _, object in ipairs(self.map.layers[layerName .. ".solid"].objects) do
            if object.polygon or object.rectangle then
                local polygon = {}
                for _, vertex in ipairs(object.polygon and object.polygon or object.rectangle) do
                    table.insert(polygon, vertex.x)
                    table.insert(polygon, vertex.y)
                end
                local poligonCollider = self.HC:polygon(unpack(polygon))
                poligonCollider.layer = object.type == 'jumpable' and object.type or 'terrain'
            end
        end


    end,
}

function Map:initColliders()
        self.collideObjects = {
            player     = ColliderLayer('player'),
            box        = ColliderLayer('box'),
            button     = ColliderLayer('button'),
            door       = ColliderLayer('door'),
            trigger    = ColliderLayer('trigger'),
            background_objects = ColliderLayer('background_objects'),
            terrain = ColliderLayer('terrain'),
            jumpable = ColliderLayer('jumpable')
        } 

        self.collideObjects.player:registerRule('box',
            function(player, box, delta)
                player.deltaVector = player.deltaVector + delta
                player.pushingBox = true
            end)  
        self.collideObjects.player:registerRule('door',
            function(player, door, delta)
                if not door.isOpen then player.deltaVector = player.deltaVector + delta end
            end)  
        self.collideObjects.player:registerRule('terrain',
            function(player, terrain, delta)
                player.deltaVector = player.deltaVector + delta
            end)  
        self.collideObjects.player:registerRule('jumpable',
            function(player, jumpable, delta)
                if delta.y > -player.maxJumpable - (player.speed.y > 0 and player.speed.y or 0)  and delta.y < 0 and player.direction.y <= 0 then
                    player.speed.y = 0
                    player.deltaVector.y = player.deltaVector.y > -player.minGroundNormal and -player.minGroundNormal*1.1 or player.deltaVector.y
                    player.isGrounded = player.deltaVector.y < -player.minGroundNormal
                    player.canJumpDown = true
                end
            end)  

        self.collideObjects.box:registerRule('player',
            function(box, player, delta)
                if delta.x ~= 0 then
                    box.acceleration.x = box.acceleration.x + player.acceleration
                    box.direction.x = player.direction.x
                end
            end)
        self.collideObjects.box:registerRule('box',
            function(box1, box2, delta)
                -- print(delta.x, delta.y )
                -- if delta.x ~= 0 then
                --     print('In da collision ',box1.speed.x)
                --     box2.acceleration.x = box2.acceleration.x + box1.speed.x
                --     box2.direction.x = box1.direction.x
                -- end
                box1.deltaVector = box1.deltaVector + delta
            end) 
        self.collideObjects.box:registerRule('terrain',
            function(box, terrain, delta)
                box.deltaVector = box.deltaVector + delta
            end)  
        self.collideObjects.box:registerRule('jumpable',
            function(box, jumpable, delta)
                box.deltaVector = box.deltaVector + ((delta.y < 0) and delta or Vector(0,0))
            end)  
        self.collideObjects.box:registerRule('door',
            function(box, door, delta)
                if not door.isOpen then box.deltaVector = box.deltaVector + delta end
            end)  

        self.collideObjects.button:registerRule('player',
            function(button, player, delta)
                button:handlePushDown()
            end)

        self.collideObjects.trigger:registerRule('player',
            function(trigger, player, delta)
                trigger:tryToStartAction()
            end)
end

function Map:changeFocus(isInFocus)
    if isInFocus then
        self.player:showArrow()
    else
        self.player:hideArrow()
    end
end

function Map:update( dt )
    self.map:update(dt)
    for ind, object in pairs(self.objects) do

        local collisions = self.HC:collisions(object.collider.mainCollider)
        for shape, delta in pairs(collisions) do
            local collideObject
            if shape.layer == 'terrain' or shape.layer == 'jumpable' then
               collideObject = shape.layer 
            else
                for ind, secondObject in pairs(self.objects) do
                    collideObject = secondObject.collider.mainCollider == shape and secondObject or collideObject
                end
            end

            if collideObject then    
                self.collideObjects[object.collider.mainCollider.layer]:regiterCollision(object, collideObject, delta)
            end
        end

        object:update(dt)

    end
    self.player:checkIfExited(self.curentRoomPos, dt)

    -- self.dialog = DialogWindow(self.curentRoomPos, 1)
end

function Map:draw()
    love.graphics.push()
    love.graphics.translate(self.curentRoomPos.x, self.curentRoomPos.y)
    love.graphics.translate(self.displayStartPos.x, self.displayStartPos.y)

    for ind, layer in pairs(self.ground) do
        self.map:drawLayer(layer)
    end

    if Debug.DrawDebugColliders and Debug.DrawDebugColliders == 1 then
        love.graphics.setColor(0, 0, 1)
        local shapes = self.HC:hash():shapes()
        for _, shape in pairs(shapes) do
            shape:draw()
        end
        love.graphics.setColor(1, 1, 1)
    end

    for ind, object in pairs(self.objects) do
        object:draw()
    end

    if Debug.DrawDebugForMapPiece == 1 then
        -- Draw some debug
    end
    love.graphics.pop()
end

return Map