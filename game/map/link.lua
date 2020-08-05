Class = require "lib.hump.class"

Link = Class {
    init = function(self, from, to, name)
        self.name = name
        self.from = from
        self.to = to
        self.active = false
    end
}

function Link:finalize(fromObj, toObj)
    self.from = fromObj
    self.to = toObj
    if not self.from or not self.to or self.to.onEvent == nil then
        print("Error: can't initialize link " .. self.name)
        return
    end
    self.active = true
end

function Link:sendEvent(eventName, args)
    if not self.active or not self.to or self.to.onEvent == nil then
        print("Error: can't send event: \"" .. eventName .. "\"")
        return
    end

    self.to:onEvent(eventName, args)
end

return Link
