Images 			= require "resource.images"
Fonts           = require "resource.fonts"
HC 				= require 'lib/hardoncollider'
Map        		= require "game.map.map"
local sti 		= require "lib/sti"
local Player 	= require "game/player/player"

local game = {}
gravity = Vector(0, 0.98)

function game:enter()

    self.HC = HC.new()
    self.currentMap = Map("resource/maps/sample_level.lua", self.HC)
    self.curPosX = 0

end

function game:mousepressed(x, y)
end

function game:mousereleased(x, y)
end

function game:keypressed( key )
end

function game:draw()
    love.graphics.push()
    love.graphics.setColor(1, 1, 1)
    love.graphics.translate(self.curPosX, 0)
    self.currentMap:draw()

    love.graphics.pop()
end

function game:update(dt)
    self.currentMap:update(dt)
end

return game