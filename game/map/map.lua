Class         = require "lib.hump.class"
Vector        = require "lib.hump.vector"
PhysicsObject = require "game.physics.physics_object"
Box           = require "game.objects.box"
Button        = require "game.objects.button"
Door          = require "game.objects.door"
Images        = require "resource.images"
DialogWindow  = require "game.ui.dialog_window"
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

        self.collideObjects = { player  = ColliderLayer('player'),
                                box     = ColliderLayer('box'),
                                button  = ColliderLayer('button'),
                                door    = ColliderLayer('door'),
                                background_objects = ColliderLayer('background_objects'),
                                terrain = ColliderLayer('terrain')} 

        self.collideObjects.player:registerRule('box', function(player, box, delta) player.deltaVector = player.deltaVector + delta end)  
        -- self.collideObjects.player:registerRule('button', function(player, delta) player.deltaVector = player.deltaVector + delta end)  
        self.collideObjects.player:registerRule('door', function(player, door, delta) if not door.isOpen then player.deltaVector = player.deltaVector + delta end end)  
        self.collideObjects.player:registerRule('terrain', function(player, terrain, delta) player.deltaVector = player.deltaVector + delta end)  

        self.collideObjects.box:registerRule('player', function(box, player, delta) box.deltaVector = box.deltaVector + delta end) 
        self.collideObjects.box:registerRule('terrain', function(box, terrain, delta) box.deltaVector = box.deltaVector + delta end)  
        self.collideObjects.box:registerRule('door', function(box, door, delta) box.deltaVector = box.deltaVector + delta end)  

        self.collideObjects.button:registerRule('player', function(button, player, delta) button:handlePushDown() end)  


        self.ground = self.map.layers[layerName .. ".ground"]

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

            if newObject then
                table.insert(self.objects, newObject)
                self.level:addObject(object.id, newObject)
            end

            -- save links to level
            for propertyName, property in pairs(object.properties) do
                self.level:linkObjects(object.id, property.id, propertyName)
            end
        end

        for _, object in ipairs(self.map.layers[layerName .. ".solid"].objects) do
            if object.polygon then
                local polygon = {}
                for _, vertex in ipairs(object.polygon) do
                    table.insert(polygon, vertex.x)
                    table.insert(polygon, vertex.y)
                end
                local poligonCollider = self.HC:polygon(unpack(polygon))
                poligonCollider.layer = 'terrain'
            end
        end


    end,
}

function Map:update( dt )
    if self.dialog then
        if self.dialog:update(dt) then
            self.dialog = nil
        end
    else
        self.map:update(dt)
        for ind, object in pairs(self.objects) do

            local collisions = self.HC:collisions(object.collider.mainCollider)
            for shape, delta in pairs(collisions) do
                local collideObject
                if shape.layer == 'terrain' then
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


        if love.keyboard.isDown('e') then
            self.dialog = DialogWindow(self.curentRoomPos, 1)
        end


    end
end

function Map:draw()
    if self.dialog then
        self.dialog:draw()
    else
        love.graphics.push()
        love.graphics.translate(self.curentRoomPos.x, self.curentRoomPos.y)
        love.graphics.translate(self.displayStartPos.x, self.displayStartPos.y)

        self.map:drawLayer(self.ground)

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
    
end

return Map