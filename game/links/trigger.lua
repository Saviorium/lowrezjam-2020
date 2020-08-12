Class = require "lib.hump.class"

Trigger = Class {
    init = function(self, type, target, level, hc, x, y) --conditionFunction, triggerFunction, name)
        self.position = Vector( x, y )
        -- self.name = name
        self.conditionFunction = self.defaultCondition
        self.level = level
        if type == 'exit' then
            self.triggerFunction = nil
        elseif type == 'dialog' then
            self.triggerFunction = function(level)
                local curentRoomPos 
                for layerIndex, layer in pairs(level.layers) do
                    if layerIndex == level.focusLayer then
                        print(layerIndex)
                        curentRoomPos = layer.map.curentRoomPos
                    end
                end
                level.dialog = DialogWindow(curentRoomPos, target)
            end
        end
        self.width = 1
        self.height = 10
        self.collider = { mainCollider = hc:rectangle(self.position.x, self.position.y, self.width, self.height)}
    end
}
function Trigger:update(dt)
end

function Trigger:draw()
end


function Trigger:tryToStartAction()
    if self.conditionFunction(self) then
        -- self.triggerFunction(self.level)
    end
end

function Trigger.defaultCondition(self)
    return true
end

return Trigger
