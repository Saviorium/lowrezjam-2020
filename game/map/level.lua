Class = require "lib.hump.class"
HC = require "lib.hardoncollider"
Layer = require "game.map.level_layer"
Map = require "game.map.map"

Level = Class {
    init = function(self, name)
        local level = LEVELS[name]
        if not level then
            print("No such level: " .. name)
            return
        end
        self.layers = {}
        for layerName, layerColor in pairs(level) do
            table.insert( self.layers, Layer(
                Map("resource/maps/" .. name .. ".lua", layerName, HC.new()),
                layerColor
            ))
        end
    end
}

function Level:draw()
    love.graphics.push()
    local mainCanvas = love.graphics.getCanvas() -- save for later

    love.graphics.setColor(1, 1, 1)
    for layerName, layer in pairs(self.layers) do -- draw maps on virtual canvases
        love.graphics.setCanvas(layer.canvas)
        love.graphics.clear({0,0,0,1})
        layer.map:draw()
    end

    love.graphics.setCanvas(mainCanvas)
    love.graphics.clear({0,0,0,1})
    love.graphics.setBlendMode("add", "premultiplied") -- mix colors, not redraw

    for layerName, layer in pairs(self.layers) do -- draw canvases on main screen(canvas)
        love.graphics.setColor(layer.color)
        love.graphics.draw(layer.canvas)
    end

    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1)

    love.graphics.pop()
end

function Level:update(dt)
    for layerName, layer in pairs(self.layers) do
        layer.map:update(dt)
    end
end

LEVELS = {
    sample_level = {r = {1, 0, 0}, g = {0, 1, 0}, b = {0, 0, 1}}
}

return Level
