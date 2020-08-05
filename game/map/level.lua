Class   = require "lib.hump.class"
HC      = require "lib.hardoncollider"
Layer   = require "game.map.level_layer"
Map     = require "game.map.map"
Link    = require "game.links.link"

Level = Class {
    init = function(self, name)
        local level = LEVELS[name]
        if not level then
            print("No such level: " .. name)
            return
        end
        self.layers = {}
        self.objects = {} -- { id => object } dictionary
        self.links = {} 
        for layerName, layerColor in pairs(level) do
            table.insert( self.layers, Layer(
                Map("resource/maps/" .. name .. ".lua", layerName, HC.new(), self),
                layerColor
            ))
        end
        self:finalizeLinks()
    end
}

function Level:addObject(id, obj)
    self.objects[id] = obj
end

function Level:linkObjects(idFrom, idTo, linkName)
    table.insert(self.links, Link(idFrom, idTo, linkName))
end

function Level:finalizeLinks()
    -- links added as id to id because objects are not created yet
    -- here we change ids to links to objects
    -- only then links can be used
    for _, link in pairs(self.links) do
        local fromObj = self.objects[link.from]
        local toObj = self.objects[link.to]
        link:finalize(fromObj, toObj)
        fromObj:addLink(link)
    end
end

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
    sample_level = {r = {1, 0, 0}, g = {0, 1, 0}, b = {0, 0, 1}},
    rainbow_test = {
        a = {1,0,0},
        b = {1,0.75,0},
        c = {0.5,1,0},
        d = {0,1,0.25},
        e = {0,1,1},
        f = {0,0.25,1},
        g = {0.5,0,1},
        h = {1,0,0.75}
    }
}

return Level
