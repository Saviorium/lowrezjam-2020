Class = require "lib.hump.class"
Button = require "game.objects.button"

Switch = Class {
    __includes = Button,
    init = function(self, x, y, hc)
        Button.init(self, x, y, hc)
        self.useKeyIsHeld = false
    end,
    useKey = config.controls.use
}

function Switch:setAutoOff(autoOff)
    self.autoOff = autoOff
    self:setSprite("button_wall".. (autoOff and "_hollow" or ""))
end

function Switch:update(dt)
    if not love.keyboard.isDown(self.useKey) then
        self.useKeyIsHeld = false
    end
    Button.update(self, dt)
end

function Switch:handleInteract()
    if not love.keyboard.isDown(self.useKey) or self.useKeyIsHeld then
        return
    end
    self.useKeyIsHeld = true
    self.timerSwitchOff = self.delayToSwitchOff
    self:toggle()
end

function Switch:toggle()
    if not self.isPushed then
        Button.handlePushDown(self)
    else
        Button.handlePushUp(self)
    end
end

return Switch
