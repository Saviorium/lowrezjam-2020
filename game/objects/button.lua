Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
EventSender = require "game.links.event_sender"
Images = require "resource.images"

Button = Class {
    __includes = EventSender,
    init = function(self, x, y, hc)
        self.position = Vector( x, y )

        self.sprite = Images:getNewPeachySprite("button")
        self.sprite:setTag("up")
        self.sprite:play()

        self.isPushed = false
        self.width = 4
        self.height = 4
        self.collider = { mainCollider = hc:rectangle(self.position.x, self.position.y, self.width, self.height)}

        EventSender.init(self)
    end
}

function Button:update(dt)
    if love.keyboard.isDown("b") then -- TODO: it should activate when touching with player
        if not self.isPushed then
            self:handlePushDown()
        end
    -- else
    --     if self.isPushed then
    --         self:handlePushUp()
    --     end
    end
    self.sprite:update(dt)
end

function Button:handlePushDown()
    print('Button pushed')
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
