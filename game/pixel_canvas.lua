Class = require "lib.hump.class"

PixelCanvas = Class {
    init = function(self, width, height, scale)
        print("HERE")
        self.canvas = love.graphics.newCanvas(width, height)
        self.canvas:setFilter("nearest", "nearest")
        self.scale = scale
    end
}

function PixelCanvas:setScale(scaleFactor)
    self.scale = scaleFactor
end

function PixelCanvas:getCanvas()
    return self.canvas
end

function PixelCanvas:draw()
    if not self.canvas then return end
    love.graphics.draw(
        self.canvas,
        love.graphics.getWidth() / 2,
        love.graphics.getHeight() / 2,
        0,
        self.scale,
        self.scale,
        self.canvas:getWidth() / 2,
        self.canvas:getHeight() / 2
    )
end

return PixelCanvas
