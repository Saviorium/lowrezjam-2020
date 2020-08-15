Class = require "lib.hump.class"
Door = require "game.objects.door"

DoorToggle = Class {
    __includes = Door,
    init = function(self, x, y, hc)
        Door.init(self, x, y, hc)
    end
}

function DoorToggle:handleEventActivate()
    self:toggle()
end

function DoorToggle:handleEventDeactivate()
    -- do nothing
end

function DoorToggle:toggle()
    if self.isOpen then
        Door.handleEventDeactivate(self)
    else
        Door.handleEventActivate(self)
    end
end

return DoorToggle
