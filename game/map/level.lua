Class   = require "lib.hump.class"
HC      = require "lib.hardoncollider"
Layer   = require "game.map.level_layer"
Map     = require "game.map.map"
Link    = require "game.links.link"
local sti     = require "lib/sti"

Level = Class {
    init = function(self, name)
        local level = LEVELS[name]
        if not level then
            print("No such level: " .. name)
            return
        end
        self.map = sti("resource/maps/" .. name .. ".lua")
        self.layers = {}
        self.objects = {} -- { id => object } dictionary
        self.buttonGroups = {}
        self.links = {}
        self.triggers = {}
        self.isPlayerInSync = false
        for layerName, layerColor in pairs(level) do
            table.insert( self.layers, Layer(
                Map(self.map, layerName, HC.new(), self),
                layerColor
            ))
        end
        self:finalizeLinks()

        self.focusLayer = 1

        self.backgroundCanvas = love.graphics.newCanvas()
        self.foregroundCanvas = love.graphics.newCanvas()

        self.backgroundTileMap = self.map.layers.background
        self.backgroundColor = {0, 0, 0}
    end,
    playerSyncMaxDistance = 0.5 -- if players farther than this, player is not in sync
}

function Level:addObject(id, obj)
    self.objects[id] = obj
end

function Level:linkObjects(idFrom, idTo, linkName)
    table.insert(self.links, Link(idFrom, idTo, linkName))
end

function Level:keypressed(key)
    if key == config.controls.nextLayer then
        self:switchToNextLayer()
    end
end

function Level:switchToNextLayer()
    self.focusLayer = self.focusLayer + 1
    if self.focusLayer > #self.layers then
        self.focusLayer = 1
    end

    for layerIndex, layer in pairs(self.layers) do
        if layerIndex == self.focusLayer then
            layer.map:changeFocus(true)
        else
            layer.map:changeFocus(false)
        end
    end
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
    if self.dialog then
        self.dialog:draw()
    else
        love.graphics.push()
        local mainCanvas = love.graphics.getCanvas() -- save for later, as this may be not the main screen

        -- draw layers on virtual canvases
        love.graphics.setColor(1, 1, 1)
        for layerName, layer in pairs(self.layers) do
            love.graphics.setCanvas(layer.canvas)
            love.graphics.clear({0,0,0,0})
            layer.map:draw()
        end

        -- merge layers of foreground objects
        local activeRoomPos = self.layers[self.focusLayer].map.curentRoomPos -- room of player in focus
        love.graphics.setCanvas(self.foregroundCanvas)
        love.graphics.clear({0,0,0,0})
        love.graphics.setBlendMode("screen", "premultiplied") -- mix colors, not redraw

        self.backgroundColor[1], self.backgroundColor[2], self.backgroundColor[3] = 0, 0, 0
        for layerName, layer in pairs(self.layers) do
            if layer.map.curentRoomPos == activeRoomPos then -- draw only layers where player is in active room
                love.graphics.setColor(layer.color)
                love.graphics.draw(layer.canvas)
                addColorsInPlace(self.backgroundColor, layer.color)
            end
        end

        love.graphics.setBlendMode("alpha")
        love.graphics.setColor(1, 1, 1)

        -- draw common background for level
        love.graphics.setCanvas(self.backgroundCanvas)
        love.graphics.draw(Images['city_background'].img)
        if self.backgroundTileMap then
                love.graphics.push()
                love.graphics.setColor(self.backgroundColor)
                love.graphics.translate(activeRoomPos.x, activeRoomPos.y)
                self.map:drawLayer(self.backgroundTileMap)
            love.graphics.pop()
        end

        -- draw on main screen
        love.graphics.setCanvas(mainCanvas)
        love.graphics.setColor(1, 1, 1)

        love.graphics.draw(self.backgroundCanvas)
        love.graphics.draw(self.foregroundCanvas)

        love.graphics.pop()
    end
end

function Level:update(dt)
    if self.dialog then
        if self.dialog:update(dt) then
            self.dialog = nil
        end
    else
        local playerPositions = {}
        for layerName, layer in pairs(self.layers) do
            layer.map:update(dt)
            playerPositions[layerName] = layer.map:getPlayerPosition()
        end
        self.isPlayerInSync = self:checkPlayersSync(playerPositions)
    end
end

local function generateLayerColors(n)
    local layers = {}
    for i = 0, n-1, 1 do
        layers[string.char(string.byte("a")+i)] = hslToRgb(i/n, 1, 0.5, 1)
    end
    return layers
end

function Level:checkPlayersSync(playerPositions)
    local playersDistances = {}
    local previousPosition = nil
    for _, position in pairs(playerPositions) do
        if not previousPosition then previousPosition = position end
        if (position - previousPosition):len2() > Level.playerSyncMaxDistance then
            return false
        end
    end
    return true
end

LEVELS = {
    first_level = {a = {1, 1, 1}},
    second_level = {a = {1, 1, 1}},
    third_level = {a = {1, 1, 1}},
    fourth_level = {r = {1, 0, 0}, g = {0, 1, 0}, b = {0, 0, 1}},
    sample_level = {r = {1, 0, 0}, g = {0, 1, 0}, b = {0, 0, 1}},
    rainbow_test = generateLayerColors(8)
}

return Level
