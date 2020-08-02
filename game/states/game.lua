Images 			= require "resource.images"
HC 				= require 'lib/hardoncollider'
MapPiece        = require "game.map.map_piece"
local sti 		= require "lib/sti"
local Player 	= require "game/player/player"

local game = {}
gravity = Vector(0, 0.98)

function game:enter()

    self.HC = HC.new()
    self.currentMapPiece = MapPiece("resource/maps/sample_level.lua", self.HC)

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
    self.currentMapPiece:draw()

    love.graphics.pop()
end

function game:update(dt)
    self.currentMapPiece:update(dt)
end

return game