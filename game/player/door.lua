Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
EventReciever = require "game.player.event_reciever"
Images = require "resource.images"

Door = Class {
    __includes = EventReciever,
    init = function(self, x, y)
        self.position = Vector( x, y )

        self.sprite = Images["door"]
        self.sprite:setTag("closed")
        self.sprite:play()

        self.links = {}

        self.isOpen = false

        EventReciever.init(self)
    end
}

function Door:update(dt)
    self.sprite:update(dt)
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
    self.sprite:draw(self.position.x, self.position.y)
end

return Door
