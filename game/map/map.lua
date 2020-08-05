Class         = require "lib.hump.class"
Vector        = require "lib.hump.vector"
PhysicsObject = require "game.physics.physics_object"
Box           = require "game.objects.box"
Button        = require "game.objects.button"
Door          = require "game.objects.door"
Images        = require "resource.images"
DialogWindow  = require "game.ui.dialog_window"
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

        self.ground = self.map.layers[layerName .. ".ground"]

        self.objects = {}
        for _, object in ipairs(self.map.layers[layerName .. ".objects"].objects) do
            local newObject = nil
            if object.type == "player" then
                newObject = Player(object.x, object.y, self.HC)
                self.player = newObject
            end
            if object.type == "box" then
                newObject = Box(object.x, object.y, self.HC)
            end
            if object.type == "button" then
                newObject = Button(object.x, object.y)
            end

            if object.type == "door" then
                newObject = Door(object.x, object.y)
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
        print(table.getn(self.objects))

        for _, object in ipairs(self.map.layers[layerName .. ".solid"].objects) do
            if object.polygon then
                local polygon = {}
                for _, vertex in ipairs(object.polygon) do
                    table.insert(polygon, vertex.x)
                    table.insert(polygon, vertex.y)
                end
                self.HC:polygon(unpack(polygon))
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