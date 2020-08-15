Class = require "lib.hump.class"
UIobject = require "game.ui.uiparents.uiobject"

-- Кнопка, умеет нажиматься и писать при этом в лог, все кнопки по хорошему должны наследоваться от этого класса и накидывать кастомные действия и картинки
local Button = Class {
    __includes = UIobject,
    init = function(self, x, y, width, height, callback, tag)
        UIobject.init(self, x, y, width, height, tag)
        self.clickInteraction = callback and callback or self.defaultCallback
    end
}

function Button:render()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height )
    love.graphics.print(self.tag,self.x+self.width/2, self.y+self.height/2)
end

function Button.defaultCallback(self)
     print(self.tag,'Clicked')
end

return Button