Class = require "lib.hump.class"

Trigger = Class {
    init = function(self, type, target, level, hc, x, y, width, height) --conditionFunction, triggerFunction, name)
        self.position = Vector( x, y )
        -- self.name = name
        self.conditionFunction = self.defaultCondition
        self.level = level
        self.type = type
        if type == 'exit' then
            self.triggerFunction = function(level)
                if self:isPlayerInSync() then
                    StateManager.switch(states.game, target)
                end
            end
        elseif type == 'dialog' then
            self.triggerFunction = function(level)
                level.dialog = DialogWindow(target)
            end
        end
        self.enabled = true
        self.width = width
        self.height = height
        self.collider = { mainCollider = hc:rectangle(self.position.x, self.position.y, self.width, self.height)}
    end
}
function Trigger:update(dt)
end

function Trigger:draw()
end

function Trigger:isPlayerInSync()
    print(self.level.isPlayerInSync)
    return self.level.isPlayerInSync
end

function Trigger:tryToStartAction()
    if self.conditionFunction(self) and self.enabled then
        self.triggerFunction(self.level)
        if not self.type == exit then
            self.enabled = false
        end
    end
end

function Trigger.defaultCondition(self)
    return true
end

return Trigger
