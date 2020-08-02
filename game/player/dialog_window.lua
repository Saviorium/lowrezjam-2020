Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
Images = require "resource.images"

DialogWindow =
    Class {
    init = function(self, displayPos, scenarioNumber)
        self.buttonToContinue = "space"
        self.scenario = require ("resource.scenario."..scenarioNumber)
        self.currentSlide = self.scenario[1]
        self.displayPos = displayPos

        self.textHeight = 32
    end
}

function DialogWindow:update(dt)

    if love.keyboard.isDown(self.buttonToContinue) then
        self:nextSlide(dt)
    end
    return false
end

function DialogWindow:draw()
    print('draw')

    love.graphics.setColor(255, 255, 0)
    love.graphics.rectangle( 'fill', self.displayPos.x,      self.displayPos.y,       16, 64 - self.textHeight )
    love.graphics.setColor(0, 0, 255)
    love.graphics.rectangle( 'fill', self.displayPos.x + 48, self.displayPos.y,       16, 64 - self.textHeight )
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle( 'fill', self.displayPos.x,      self.displayPos.y + 32,  64, self.textHeight )
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(self.currentSlide.whoTalks, Fonts.small, self.displayPos.x + 16 + (32 - self.currentSlide.whoTalks:len()*4)/2, self.displayPos.y + (64 - self.textHeight - 4), 16)
    love.graphics.printf(self.currentSlide.text, Fonts.medium, self.displayPos.x, self.displayPos.y + (64 - self.textHeight), 64)


end

function DialogWindow:nextSlide()

end

return DialogWindow
