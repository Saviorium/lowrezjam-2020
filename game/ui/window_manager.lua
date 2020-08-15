Class = require "lib.hump.class"

-- Менеджер окошка, предполагается как менеджер одного небольшого или большого окошка, всех действий в нём и прочего, независимо от остальных таких же окошек
-- Задачей объекта является отображение и считывание событий для объектов в рамках своего оконца
WindowManager = Class {
	init = function(self, x ,y, width, height, background)
		self.objects = {}
		self.x = x
		self.y = y
		self.width = width
		self.height = height
		self.background = background and background or nil -- Сюда можно впихнуть базовый бэк
    end
}
-- Регистрация объекта в окошке, для его отображения и считывания действий
function WindowManager:registerObject(object)
	table.insert(self.objects, object)
	object.parent = self
end

function WindowManager:update(dt)
	for _, object in pairs(self.objects) do
		object:update(dt)
	end
end

-- Отображение объектов, с учётом релативной и фиксированной расположенности
function WindowManager:draw()
	for _, object in pairs(self.objects) do
		if object.position == 'relative' then
			local xPos =  (object.right and ((self.x + self.width) - object.right) or (object.left and (self.x + object.left) or self.x))
			local yPos =  (object.down and ((self.y + self.height) - object.down) or (object.up and (self.y + object.up) or self.y))
			drawObject( object, 
			 			xPos, 
			 			yPos, 
			 			object.angle, 
			 			object.width, 
			 			object.heigth)
		elseif object.position == 'fixed' then
			object:draw()
		else 
			object:draw()
		end
	end
end

-- Обработчик нажатия кнопки мыши на объекты
function WindowManager:mousepressed(x, y)
	for ind, object in pairs(self.objects) do
		if object:getCollision(x/config.graphics.scale, y/config.graphics.scale) then
			if object.clickInteraction then 
				object.clickInteraction(object)
			end
			if object.startHoldInteraction then 
				object.startHoldInteraction(object)
			end
		end
	end
end

-- Обработчик отпускания кнопки мыши
function WindowManager:mousereleased(x, y)
	for _, object in pairs(self.objects) do
		if object.state == "dragged" then
			if object.endtHoldInteraction then 
				object.endtHoldInteraction(object)
			end
		end 
	end
end

return WindowManager