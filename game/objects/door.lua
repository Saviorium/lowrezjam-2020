Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
EventReciever = require "game.links.event_reciever"
Images = require "resource.images"

Door = Class {
    __includes = EventReciever,
    init = function(self, hc, x, y, leftSide)
        self.position = Vector( x, y )

        if leftSide then
            self.sprite = Images:getNewPeachySprite("door_city_left")
        else
            self.sprite = Images:getNewPeachySprite("door_city")
        end
        self.sprite:setTag("closed")
        self.sprite:play()

        self.links = {}

        self.isOpen = false

        self.width = 4
        self.height = 16
        self.collider = { mainCollider = hc:rectangle(self.position.x, self.position.y, self.width, self.height)}

        EventReciever.init(self)
    end
}

function Door:update(dt)
    self.sprite:update(dt)
end

function Door:invertOpenClose() -- normally open door
    self:handleEventActivate()
    self.handleEventActivate = Door.handleEventDeactivate
    self.handleEventDeactivate = Door.handleEventActivate
end

function Door:handleEventActivate()
    self.isOpen = true
    self.sprite:setTag("open")
end

function Door:handleEventDeactivate()
    self.isOpen = false
    self.sprite:setTag("closed")
end

function Door:draw()
    self.sprite:draw(self.position.x-6, self.position.y)
end

return Door
