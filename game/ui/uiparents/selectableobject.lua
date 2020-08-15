Class = require "lib.hump.class"
UIobject = require "game.ui.uiparents.uiobject"

SelectableObject = Class {
    __includes = UIobject,
    init = function(self, x, y, width,height, tag)
        UIobject.init(self, x, y, width, height, tag)
        -- Добавлен признак выбранности, если  он указан то что-то может происходить: какие-то объекты можно завязать на это флаг
        self.selected = false
        -- Действие происходящее при изменении выбранности, тут установлен дефолт в виде вбрасывания в консоль сообщения
        self.onChangeSelect = self.defaultOnSelect
    end
}
-- Процедура изменнеия выбранности объекта
function SelectableObject:setSelected( flag )
    if flag ~= self.selected then
        self.selected = flag
        self.onChangeSelect(self)
    end
end

function SelectableObject:defaultOnSelect() -- Функция начала перетаскивания
    print(self.tag,'selected:',self.selected)
end

return SelectableObject