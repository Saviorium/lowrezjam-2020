Class         = require "lib.hump.class"
Vector        = require "lib.hump.vector"
PhysicsObject = require "game.player.physics_object"
Images        = require "resource.images"
local sti     = require "lib/sti"

MapPiece = Class {
    init = function(self, scheme, HC)
        self.HC = HC

        love.physics.setMeter(8)
        self.map = sti(scheme) -- "resource/maps/physics-test.lua"
        self.world = love.physics.newWorld(0, 0)
        love.graphics.setBackgroundColor({.3,.3,.3,1})

        self.objects = {}
        for _, object in ipairs(self.map.layers["objects"].objects) do
            if object.type == "player" then
                newObject = Player(object.x, object.y, self.HC)
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

function MapPiece:update( dt )
    self.map:update(dt)
    for ind, object in pairs(self.objects) do
        object:update(dt)
    end
end

function MapPiece:draw()

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


return MapPiece