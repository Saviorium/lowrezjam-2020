Class         = require "lib.hump.class"
Vector        = require "lib.hump.vector"
PhysicsObject = require "game.player.physics_object"
Images        = require "resource.images"
DialogWindow  = require "game.player.dialog_window"
local sti     = require "lib/sti"

Map = Class {
    init = function(self, scheme, HC)
        self.HC = HC
        
        self.curPos = Vector(0,0)

        love.physics.setMeter(16)
        self.map = sti(scheme) -- "resource/maps/physics-test.lua"
        self.world = love.physics.newWorld(0, 0)
        love.graphics.setBackgroundColor({.3,.3,.3,1})

        self.objects = {}
        for _, object in ipairs(self.map.layers["objects"].objects) do
            if object.type == "player" then
                newObject = Player(object.x, object.y, self.HC)
                self.player = newObject
            end
            table.insert(self.objects, newObject)
        end

        for _, object in ipairs(self.map.layers["solid"].objects) do
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
        self.player:checkIfExited(self.curPos, dt)


        if love.keyboard.isDown('e') then
            self.dialog = DialogWindow(self.curPos, 1)
        end
    end
end

function Map:draw()

    if self.dialog then
        self.dialog:draw()
    else
        love.graphics.translate(self.curPos.x, self.curPos.y)

        self.map:drawLayer(self.map.layers["ground"])

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
    end
    
end

return Map