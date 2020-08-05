Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
EventSender = require "game.links.event_sender"
Images = require "resource.images"

Button = Class {
    __includes = EventSender,
    init = function(self, x, y)
        self.position = Vector( x, y )

        self.sprite = Images["button"]
        self.sprite:setTag("up")
        self.sprite:play()

        self.isPushed = false

        EventSender.init(self)
    end
}

function Button:update(dt)
    if love.keyboard.isDown("b") then -- TODO: it should activate when touching with player
        if not self.isPushed then
            self:handlePushDown()
        end
    else
        if self.isPushed then
            self:handlePushUp()
        end
    end
    self.sprite:update(dt)
end

function Button:handlePushDown()
    self.isPushed = true
    self.sprite:setTag("down")
    self:sendEvent("Activate")
end

function Button:handlePushUp()
    self.isPushed = false
    self.sprite:setTag("up")
    self:sendEvent("Deactivate")
end

function Button:draw()
    self.sprite:draw(self.position.x, self.position.y)
end

return Button
