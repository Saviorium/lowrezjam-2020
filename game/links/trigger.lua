Class = require "lib.hump.class"

Trigger = Class {
    init = function(self, type, target) --conditionFunction, triggerFunction, name)
        -- self.name = name
        self.conditionFunction = self.defaultCondition
        if type == 'exit' then
            self.triggerFunction = nil
        elseif type == 'dialog' then
            self.triggerFunction = triggerFunction
        end
    end
}

function Trigger:tryToStartAction(player)
    if self.conditionFunction(self, player) then
        self.triggerFunction(self, player)
    end
end

function Trigger:defaultCondition(player)
    return true
end

return Trigger
