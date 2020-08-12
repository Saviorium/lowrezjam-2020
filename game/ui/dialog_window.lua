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

        self.startSlideIndex = 0
        self.index = 0

        self.textSpeed = 5

        self.fontForText = Fonts.thin
        self.rows = math.floor(self.textHeight/self.fontForText.height)
        self.symbolsInRow = math.ceil(64/self.fontForText.width)

    end
}

function DialogWindow:update(dt)
    self.changedSlide = self.changedSlide < 1 and self.changedSlide + dt or self.changedSlide

    if love.keyboard.isDown(self.buttonToContinue) and self.changedSlide >= 1 then
        self:nextSlide(dt)
        self.changedSlide = 0
        self.index = 0
    end

    if self.index <= self.symbolsInRow * self.rows then
        self.index = self.index + self.textSpeed * dt
    end

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
                         Fonts.small.font, 
                         16 + (32 - self.scenario[self.currentSlide].whoTalks:len()*4)/2, 
                         64 - self.textHeight - 4, 
                         32)
    love.graphics.printf(self.scenario[self.currentSlide].text:sub(self.startSlideIndex, math.floor(self.startSlideIndex + self.index)), 
                         Fonts.thin.font, 
                         0, 
                         64 - self.textHeight, 
                         64)

end

function DialogWindow:nextSlide()
    if self.scenario[self.currentSlide].text:len() <= self.startSlideIndex + self.symbolsInRow * self.rows then
        self.currentSlide = self.currentSlide + 1
        self.startSlideIndex = 0
    else
        self.startSlideIndex = self.startSlideIndex + self.symbolsInRow * self.rows + 1
        self.index = 0
    end
end

return DialogWindow
