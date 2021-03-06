require "conf"
require "game.utils"

Class = require "lib.hump.class"
Vector = require "lib.hump.vector"

Debug = require "game.debug"
serpent = require "lib.debug.serpent"

StateManager = require "lib.hump.gamestate"
local PixelCanvas = require "game.pixel_canvas"

states = {
    titleScreen = require "game.states.title_screen",
    menu = require "game.states.menu",
    game = require "game.states.game",
    intro = require "game.states.intro",
    end_game = require "game.states.end_game",
}

local maxScale = 1
local mainCanvas

local function getMaxScale()
    local width, height = love.window.getDesktopDimensions()
    local maxWidthScale  = width  / config.graphics.resolution.x
    local maxHeightScale = height / config.graphics.resolution.y
    return math.floor( math.min(maxWidthScale, maxHeightScale) )
end

local function setScale(scaleFactor)
    scaleFactor = math.min(maxScale, scaleFactor)
    mainCanvas:setScale(scaleFactor)
    love.window.setMode(config.graphics.resolution.x*scaleFactor, config.graphics.resolution.y*scaleFactor)
end

local sound = {
    mute = false,
    muteMusic = false
}

function love.load()
   if arg[#arg] == "-debug" then
        require("mobdebug").start()
    end
    maxScale = getMaxScale()
    mainCanvas = PixelCanvas(config.graphics.resolution.x, config.graphics.resolution.y, config.graphics.scale)
    setScale(config.graphics.scale)
    StateManager.switch(states.titleScreen)
end

function love.draw()
    love.graphics.setCanvas(mainCanvas:getCanvas())
        love.graphics.clear({0.3,0.3,0.3,1})
        StateManager.draw()
    love.graphics.setCanvas()

    mainCanvas:draw()
end

function love.update(dt)
    StateManager.update(dt)
end

function love.mousepressed(x, y)
    if StateManager.current().mousepressed then
        StateManager.current():mousepressed(x, y)
    end
end

function love.mousereleased(x, y)
    if StateManager.current().mousereleased then
        StateManager.current():mousereleased(x, y)
    end
end

function love.keypressed(key)
    if key == "1" or key == "2" or key == "3" or key == "4" or key == "5" then
        local scaleFactor = math.pow(2, tonumber(key) - 1)
        setScale(scaleFactor)
    end
    if key == "m" then
        if sound.mute then
            sound.mute = false
            love.audio.setVolume(1)
        else
            sound.mute = true
            love.audio.setVolume(0)
        end
    end
    if StateManager.current().keypressed then
        StateManager.current():keypressed(key)
    end
end

