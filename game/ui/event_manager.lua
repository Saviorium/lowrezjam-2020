Class = require "lib.hump.class"

EventManager = Class {
	init = function(self)
		self.objects = {}
    end
}

function EventManager:registerObject(object)
	table.insert(self.objects, object)
end

function EventManager:update()
	-- local currentCursor = {
	-- 	x = (love.mouse.getX()) and love.mouse.getX() or 0,
	-- 	y = (love.mouse.getY()) and love.mouse.getY() or 0
	-- }
	-- for _, object in pairs(self.objects) do
	-- 	if object:getCollision( currentCursor.x, currentCursor.y ) then
	-- 		object:setSelected(true)
	--     else
	-- 		object:setSelected(false)
	-- 	end
	-- end
end

function EventManager:mousepressed()
	local currentCursor = {
		x = (love.mouse.getX()) and love.mouse.getX() or 0,
		y = (love.mouse.getY()) and love.mouse.getY() or 0
	}
	for _, object in pairs(self.objects) do
		if object.EventManager(currentCursor.x, currentCursor.y) then
			object.clickInteraction(object)
			object.startHoldInteraction(object)
		end
	end
end

function EventManager:mousereleased()
	local currentCursor = {
		x = (love.mouse.getX()) and love.mouse.getX() or 0,
		y = (love.mouse.getY()) and love.mouse.getY() or 0
	}
	for _, object in pairs(self.objects) do
		if object.state == "dragged" then
			object.endtHoldInteraction(object)
		end 
	end
end

return EventManager