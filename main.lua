StateManager = require "lib.hump.gamestate"
PixelCanvas = require "game.pixel_canvas"
require "conf"
require "game.utils"

Debug = {} --require "game.debug"
serpent = require "lib.debug.serpent"
states = {
    game = require "game.states.game"
}

strings = {""}

maxScale = 1

function love.load()
    maxScale = getMaxScale()
    mainCanvas = PixelCanvas(64, 64, config.graphics.scale)
    setScale(config.graphics.scale)
    StateManager.switch(states.game)
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
    if key == "r" then
        StateManager.switch(states.game)
    end
    if key == "1" or key == "2" or key == "3" or key == "4" or key == "5" then
        local scaleFactor = math.pow(2, tonumber(key) - 1)
        setScale(scaleFactor)
    end
    if StateManager.current().keypressed then
        StateManager.current():keypressed(key)
    end
end

function getMaxScale()
    local width, height = love.window.getDesktopDimensions()
    return math.floor( math.min(width, height) / 64 )
end

function setScale(scaleFactor)
    scaleFactor = math.min(maxScale, scaleFactor)
    mainCanvas:setScale(scaleFactor)
    love.window.setMode(64*scaleFactor, 64*scaleFactor)
end
