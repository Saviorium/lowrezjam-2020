Class = require "lib.hump.class"

LevelLayer = Class {
    init = function(self, map, color)
        self.map = map
        self.canvas = love.graphics.newCanvas()
        self.color = color
    end
}

return LevelLayer