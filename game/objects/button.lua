Class           = require "lib.hump.class"
Vector          = require "lib.hump.vector"
EventSender     = require "game.links.event_sender"
tracks          = require "resource/tracks"

local Button = Class {
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

function Button:setSprite(spriteName)
    self.sprite = Images:getNewPeachySprite(spriteName)
    self.sprite:setTag("up")
    self.sprite:play()
end

function Button:setAutoOff(autoOff)
    self.autoOff = autoOff
    self:setSprite("button".. (autoOff and "_hollow" or ""))
end

function Button:setDelay(delay)
    self.delayToSwitchOff = delay
end

function Button:setGroup(group)
    self.group = group
end

function Button:update(dt)
    if self.isPushed and self.autoOff then
        if self.timerSwitchOff < 0 then
            self:handlePushUp()
        else
            self.timerSwitchOff = self.timerSwitchOff - dt
        end
    end
    if self.sound then
        if not self.sound:isPlaying() then
            self.sound = nil
        end
    end
    self.sprite:update(dt)
end

function Button:handleInteract()
    self:handlePushDown()
end

function Button:handlePushDown()
    self.timerSwitchOff = self.delayToSwitchOff
    if not self.isPushed then
        self.isPushed = true
        self.sprite:setTag("down")
        if not self.sound then
            self.sound = tracks.play_sound( tracks.list_of_sounds.buttonSelect )
        end
        if self.group then
            self:handleGroupDown()
        else
            self:sendEvent("Activate")
        end
    end
end

function Button:handlePushUp()
    if self.isPushed then
        self.isPushed = false
        self.sprite:setTag("up")
        if self.group then
            self:handleGroupUp()
        else
            self:sendEvent("Deactivate")
        end
    end
end

function Button:handleGroupDown()
    for _, button in pairs(self.group) do
        if not button.isPushed then
            return
        end
    end
    self:groupSend("Activate", true) -- Send singal only if all pushed in group
end

function Button:handleGroupUp()
    self:groupSend("Deactivate", true) -- Send singal if any unpushed in group
end

function Button:groupSend(signal, initialSignal)
    if initialSignal then
        for _, button in pairs(self.group) do
            button:groupSend(signal) 
        end
    else
        self:sendEvent(signal)
    end
end

function Button:draw()
    self.sprite:draw(self.position.x, self.position.y)
end

return Button
