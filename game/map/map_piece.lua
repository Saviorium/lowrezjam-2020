Class         = require "lib.hump.class"
Vector        = require "lib.hump.vector"
PhysicsObject = require "game.player.physics_object"
Images        = require "resource.images"
local sti     = require "lib/sti"

MapPiece = Class {
    init = function(self, entrance_x, entrance_y, scheme, objects, HC)
        self.HC = HC
        self.player = Player(entrance_x, entrance_y, self.HC)

        love.physics.setMeter(16)
        self.map = sti(scheme) -- "resource/maps/physics-test.lua"
        self.world = love.physics.newWorld(0, 0)
        love.graphics.setBackgroundColor({.3,.5,1,1})

        self.objects = objects and objects or {}

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

function MapPiece:update( dt )
    self.player:update(dt)
    self.map:update(dt)
    for ind, object in pairs(self.objects) do
        object:update(dt)
    end
end

function MapPiece:draw()

    self.map:drawLayer(self.map.layers["ground"])

    love.graphics.setColor(0, 0, 1)
    local shapes = self.HC:hash():shapes()
    for _, shape in pairs(shapes) do
        shape:draw()
    end

    self.player:draw()

    for ind, object in pairs(self.objects) do
        object:draw()
    end

    if Debug.DrawDebugForPlayer == 1 then
        self.player:drawDebug()
    end

    if Debug.DrawDebugForMapPiece == 1 then
        -- Draw some debug
    end
    
end


return MapPiece