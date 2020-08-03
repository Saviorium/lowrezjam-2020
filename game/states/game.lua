Images 			= require "resource.images"
Fonts           = require "resource.fonts"
HC 				= require 'lib/hardoncollider'
Map        		= require "game.map.map"
local sti 		= require "lib/sti"
local Player 	= require "game/player/player"

local game = {}
gravity = Vector(0, 0.98)

function game:enter()

    self.currentMap ={
        r = Map("resource/maps/sample_level.lua", HC.new()),
        g = Map("resource/maps/sample_level.lua", HC.new()),
        b = Map("resource/maps/sample_level.lua", HC.new()),
    }
    self.canvas = {
        r = love.graphics.newCanvas(),
        g = love.graphics.newCanvas(),
        b = love.graphics.newCanvas()
    }

end

function game:mousepressed(x, y)
end

function game:mousereleased(x, y)
end

function game:keypressed( key )
end

function game:draw()
    love.graphics.push()
    local mainCanvas = love.graphics.getCanvas()

    love.graphics.setColor(1, 1, 1)
    love.graphics.setCanvas(self.canvas.r)
    love.graphics.clear({0.3,0,0,1})
    self.currentMap.r:draw()
    love.graphics.setCanvas(self.canvas.g)
    love.graphics.clear({0,0.3,0,1})
    self.currentMap.g:draw()
    love.graphics.setCanvas(self.canvas.b)
    love.graphics.clear({0,0,0.3,1})
    self.currentMap.b:draw()

    love.graphics.setCanvas(mainCanvas)
    love.graphics.clear({0,0,0,1})
    love.graphics.setBlendMode("add", "premultiplied")
    love.graphics.setColor(1, 0, 0)
    love.graphics.draw(self.canvas.r)
    love.graphics.setColor(0, 1, 0)
    love.graphics.draw(self.canvas.g)
    love.graphics.setColor(0, 0, 1)
    love.graphics.draw(self.canvas.b)
    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1)

    love.graphics.pop()
end

function game:update(dt)
    self.currentMap.r:update(dt)
    self.currentMap.g:update(dt)
    self.currentMap.b:update(dt)
end

return game