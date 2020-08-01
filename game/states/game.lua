Images 			= require "resource.images"
HC 				= require 'lib/hardoncollider'
Debug           = require "game.debug"
local sti 		= require "lib/sti"
local Player 	= require "game/player/player"

local game = {}
gravity = Vector(0, 0.98)

function game:enter()
    love.physics.setMeter(16)
    self.map = sti("resource/maps/physics-test.lua")
    self.world = love.physics.newWorld(0, 0)
    love.graphics.setBackgroundColor({.3,.5,1,1})

    self.HC = HC.new()
    self.player = Player(50, 150, self.HC)

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
end

function game:mousepressed(x, y)
end

function game:mousereleased(x, y)
end

function game:keypressed( key )
end

function game:draw()
    love.graphics.push()
    love.graphics.scale(scale, scale)
    love.graphics.setColor(1, 1, 1)
    self.map:drawLayer(self.map.layers["ground"])

    if debug_physics then
        love.graphics.setColor(0, 0, 1)
        local shapes = HC:hash():shapes()
        for _, shape in pairs(shapes) do
            shape:draw()
        end
    end

    self.player:draw()
    if Debug.DrawDebugForPlayer == 1 then
        self.player:drawDebug()
    end

    love.graphics.pop()
end

function game:update(dt)
    self.player:update(dt)
    self.map:update(dt)
end

return game