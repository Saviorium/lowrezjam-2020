Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
EventSender = require "game.links.event_sender"
Images = require "resource.images"

Button = Class {
    __includes = EventSender,
    init = function(self, x, y, hc)
        self.position = Vector( x, y )

        self:setAutoOff(false)

        self.isPushed = false

        self.delayToSwitchOff = 0.1 -- seconds
        self.timerSwitchOff = self.delayToSwitchOff

        self.width = 4
        self.height = 2
        self.collider = { mainCollider = hc:rectangle(self.position.x+2, self.position.y+6, self.width, self.height)}

        EventSender.init(self)
    end
}

function Button:setAutoOff(autoOff)
    if autoOff == true then
        self.sprite = Images:getNewPeachySprite("button_hollow")
    else
        self.sprite = Images:getNewPeachySprite("button")
    end
    self.sprite:setTag("up")
    self.sprite:play()
    self.autoOff = autoOff
end

function Button:setDelay(delay)
    self.delayToSwitchOff = delay
end

function Button:update(dt)
    print(self.timerSwitchOff)
    if self.isPushed and self.autoOff then
        if self.timerSwitchOff < 0 then
            self:handlePushUp()
        else
            self.timerSwitchOff = self.timerSwitchOff - dt
        end
    end
    self.sprite:update(dt)
end

function Button:handlePushDown()
    self.timerSwitchOff = self.delayToSwitchOff
    if not self.isPushed then
        self.isPushed = true
        self.sprite:setTag("down")
        self:sendEvent("Activate")
    end
end

function Button:handlePushUp()
    if self.isPushed then
        self.isPushed = false
        self.sprite:setTag("up")
        self:sendEvent("Deactivate")
    end
end

function Button:draw()
    self.sprite:draw(self.position.x, self.position.y)
end

return Button
