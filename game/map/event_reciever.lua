Class = require "lib.hump.class"

EventReciever = Class {
    init = function(self)
    end
}

-- exapmle:
-- in EventSender:
-- self:sendEvent("Activate", {var = 123, var2 = "test"})
-- this calls in EventReciever:
-- Door:handleEventActivate({var = 123, var2 = "test"})
function EventReciever:onEvent(eventName, args)
    local func = self["handleEvent" .. eventName]
    if func == nil then
        print("Event " .. eventName .. " is ignored.")
        return
    end
    func(self, args)
end

return EventReciever