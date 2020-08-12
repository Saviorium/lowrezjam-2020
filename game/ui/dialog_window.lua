Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
Images = require "resource.images"

DialogWindow =
    Class {
    init = function(self, scenarioNumber)
        self.buttonToContinue = "space"
        self.scenario = require ("resource.scenario."..scenarioNumber)
        self.currentSlide = 1
        self.displayStartPos = Vector(
            (config.graphics.resolution.x - config.game.roomSize.x) / 2,
            (config.graphics.resolution.y - config.game.roomSize.y) / 2
        )
        self.changedSlide = 0

        self.textHeight = 32
        self.index = 0
        self.textSpeed = 5
    end
}

function DialogWindow:update(dt)
    self.changedSlide = self.changedSlide < 1 and self.changedSlide + dt or self.changedSlide

    if love.keyboard.isDown(self.buttonToContinue) and self.changedSlide >= 1 then
        self:nextSlide(dt)
        self.changedSlide = 0
        self.index = 0
    end
    self.index = self.index + self.textSpeed * dt
    return not self.scenario[self.currentSlide]
end

function DialogWindow:draw()

    love.graphics.setColor(255, 255, 0)
    love.graphics.rectangle( 'fill', 0,  0,  16, 64 - self.textHeight )
    love.graphics.setColor(0, 0, 255)
    love.graphics.rectangle( 'fill', 48, 0,  16, 64 - self.textHeight )
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle( 'fill', 0, 32,  64, self.textHeight )
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(self.scenario[self.currentSlide].whoTalks, 
                         Fonts.small, 
                         16 + (32 - self.scenario[self.currentSlide].whoTalks:len()*4)/2, 
                         64 - self.textHeight - 4, 
                         16)
    love.graphics.printf(self.scenario[self.currentSlide].text:sub(0, math.floor(self.index)), 
                         Fonts.thin, 
                         0, 
                         64 - self.textHeight, 
                         64)

end

function DialogWindow:nextSlide()
    self.currentSlide = self.currentSlide + 1
end

return DialogWindow
