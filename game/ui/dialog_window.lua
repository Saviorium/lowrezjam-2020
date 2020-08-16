Class = require "lib.hump.class"
Vector = require "lib.hump.vector"

local DialogColors = {
    white = {1, 1, 1},
    orange = {1, 0.75, 0},
    blue = {0, 0.33, 1},
    red = {1, 0.1, 0.1},
    green = {0.1, 1, 0.1}
}

DialogWindow =
    Class {
    init = function(self, scenarioNumber)
        self.buttonToContinue = "space"
        self.scenarioNumber = scenarioNumber
        self.scenario = require ("resource.scenario."..scenarioNumber)
        self.currentSlide = 1
        self.displayStartPos = Vector(
            (config.graphics.resolution.x - config.game.roomSize.x) / 2,
            (config.graphics.resolution.y - config.game.roomSize.y) / 2
        )
        self.changedSlide = 0

        self.portraits = {}
        self.portraits.left = Images:getNewPeachySprite("player_portrait")
        self.portraits.right = Images:getNewPeachySprite("player_portrait")
        self.portraits.left:setTag("neutral")
        self.portraits.left:play()
        self.portraits.right:setTag("neutral")
        self.portraits.right:play()

        self.textHeight = 40

        self.startSlideIndex = 0
        self.index = 0

        self.textSpeed = 20

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

    self.portraits.left:update(dt)
    self.portraits.right:update(dt)

    return not self.scenario[self.currentSlide]
end

function DialogWindow:draw()
    local currentSlide = self.scenario[self.currentSlide]
    local leftColor, rightColor, textColor
    if currentSlide.leftPerson and DialogColors[currentSlide.leftPerson] then
        leftColor = DialogColors[currentSlide.leftPerson]
    else
        print("No color for dialogue " .. self.scenarioNumber .. "-" .. self.currentSlide)
        leftColor = DialogColors["white"]
    end
    leftColor = DialogColors[currentSlide.leftPerson] and DialogColors[currentSlide.leftPerson] or DialogColors.white
    rightColor = DialogColors[currentSlide.rightPerson] and DialogColors[currentSlide.rightPerson] or DialogColors.white
    if currentSlide.whoTalks == "right" then
        textColor = rightColor
    else
        textColor = leftColor
    end
    if currentSlide.leftPersonSprite then
        self.portraits.left:setTag(currentSlide.leftPersonSprite)
    end
    love.graphics.setColor(leftColor)
    if currentSlide.leftPerson then
        self.portraits.left:draw(0,  0)
    end
    love.graphics.setColor(rightColor)
    if currentSlide.rightPerson then
        self.portraits.right:draw(64, 0, 0, -1, 1)
    end
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle( 'fill', 0, 64 - self.textHeight,  64, self.textHeight )
    love.graphics.setColor(textColor)
    love.graphics.printf(currentSlide.text:sub(0, math.floor(self.startSlideIndex + self.index)), 
                         Fonts.thin.font,
                         2,
                         64 - self.textHeight + 2,
                         64)
                         love.graphics.setColor(1,1,1)

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
