Class = require "lib.hump.class"

EventSender = Class {
    init = function(self)
        self.links = {}
    end
}

function EventSender:addLink(link)
    table.insert(self.links, link)
end

function EventSender:sendEvent(eventName, args)
    for _, link in pairs(self.links) do
        if Debug and Debug.LogEvents == 1 then
            print("Sent event "..eventName)
        end
        link:sendEvent(eventName, args)
    end
end

return EventSender