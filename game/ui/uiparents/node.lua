Class = require "lib.hump.class"
UIobject = require "game.ui.uiparents.uiobject"
-- Пример ноды для Контейнеров объектов, тут необходимо задать шаблон всех объектов, по которому будет строиться каждый элемент
-- Структура своя собственная, главные требования: 
-- 1) Быть любым UIObject-ом, чтобы можно было с ним взаимодействовать через WindowManager и 
-- 2) иметь функцию пересборки, чтобы под экраны подстраиваться

Node = Class {
    __includes = UIobject,
    init = function(self, x, y, tag)
        UIobject.init(self, x, y, 0, 0, tag)
        self.imageOfObject = love.graphics.newImage("assets/ship.png")
        self.printTag = true
        self.displayed = false
    end
}
-- Функция пересборки, смысл которой заключается в изменении Ноды под новые требования, например просто сжатие или убирание не влезающих объектов
function Node:refresh(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.printTag = true
    self.displayed = true
end

function Node:render()
    if self.displayed then
        local scaleX = 100/self.width
        local scaleY = 100/self.height
        love.graphics.rectangle("line", self.x, self.y, self.width, self.height )
        if self.printTag then love.graphics.print(self.tag, self.x+10 * scaleX, self.y+(self.height*0.9),0, scaleX, scaleY) end
        if self.drawImage then love.graphics.draw(self.imageOfObject, self.x+10*scaleX, self.y+5*scaleY, 0, scaleX, scaleY) end
    end
end

function Node:hide()
    self.displayed = false
end

function Node:onDrag() -- Функция начала перетаскивания
    self.state = "dragged"
    self.dragCursorX = self.x - love.mouse.getX()
    self.dragCursorY = self.y - love.mouse.getY()
    self.startX = self.x
    self.startY = self.y
end

function Node:onDrop()-- Функция конца перетаскивания
    self.state = "dropped"
    self.x = self.startX
    self.y = self.startY
end

return Node