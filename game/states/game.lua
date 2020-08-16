Images          = require "resource.images"
Fonts           = require "resource.fonts"
HC              = require 'lib/hardoncollider'
Level           = require "game.map.level"
local sti       = require "lib/sti"
local Player    = require "game.objects.player"
tracks          = require "resource/tracks"

local game = {}

musicPlaying = nil -- fixme: global

function game:enter(prev_state, level)
    if not musicPlaying then
        musicPlaying = tracks.play_sound( tracks.list_of_sounds.music )
    end
    self.level = Level(level)
    self.levelName = level
end

function game:mousepressed(x, y)
end

function game:mousereleased(x, y)
end

function game:keypressed(key)
    if key == "r" then
        self.level = Level(self.levelName)
    end
    self.level:keypressed(key)
end

function game:draw()
    self.level:draw()
    if Debug and Debug.ShowFps == 1 then
        love.graphics.setFont(Fonts.thin.font)
        love.graphics.print(""..tostring(love.timer.getFPS( )), 1, config.graphics.resolution.y-7)
    end
end

function game:update(dt)
    self.level:update(dt)
end

return game