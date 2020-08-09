Images          = require "resource.images"
Fonts           = require "resource.fonts"
HC              = require 'lib/hardoncollider'
Level           = require "game.map.level"
local sti       = require "lib/sti"
local Player    = require "game.objects.player"

local game = {}
gravity = Vector(0, 0.98)

function game:enter()
    self.level = Level("first_level")
end

function game:mousepressed(x, y)
end

function game:mousereleased(x, y)
end

function game:keypressed(key)
    self.level:keypressed(key)
end

function game:draw()
    self.level:draw()
end

function game:update(dt)
    self.level:update(dt)
end

return game