Class = require "lib.hump.class"

Trigger = Class {
    init = function(self, type, target, isSyncable, level, hc, x, y, width, height) --conditionFunction, triggerFunction, name)
        self.position = Vector( x, y )
        self.conditionFunction = self.defaultCondition
        self.level = level
        self.type = type
        if isSyncable == nil then
            self.isSyncable = true 
        else
            self.isSyncable = isSyncable
        end

        if type == 'exit' then
            self.triggerFunction = function(level)
                if self.isSyncable then
                    if self:isPlayerInSync() then
                        if target == 'intro' then
                            StateManager.switch(states.intro)
                        else
                            StateManager.switch(states.game, target)
                        end
                    end
                else
                    StateManager.switch(states.game, target)
                end
            end
        elseif type == 'dialog' then
            self.triggerFunction = function(level)
                if self.isSyncable then
                    if self:isPlayerInSync() then
                        level.dialog = DialogWindow(target)
                        self.enabled = false
                    end
                else
                    level.dialog = DialogWindow(target)
                    self.enabled = false
                end
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
    return self.level.isPlayerInSync
end

function Trigger:tryToStartAction()
    if self.conditionFunction(self) and self.enabled then
        self.triggerFunction(self.level)
    end
end

function Trigger.defaultCondition(self)
    return true
end

return Trigger
