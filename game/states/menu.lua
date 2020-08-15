Fonts           = require "resource.fonts"
Level           = require "game.map.level"
Button_UI       = require "game.ui.button"
UiContainer       = require "game.ui.uiparents.ui_container"
WindowManager   = require "game.ui.window_manager"


local Menu = {}


function presetMainMenu(WindowManager)
    local new_objects = {}
	table.insert(new_objects, Button_UI(16, 10, 30, 15, function(button) presetLevels(WM) end, 'Levels'))
	new_objects[1].parent = WindowManager
	table.insert(new_objects, Button_UI(16, 30, 30, 15, function() love.event.quit() end, 'Exit'))
	new_objects[2].parent = WindowManager
	WindowManager.objects = new_objects
end

function presetLevels(WindowManager)
    local new_objects = {}
	table.insert(new_objects, UIcontainer(0, 0, nil, 32, 4, 5, 5))
	new_objects[1]:registerObject(Node(0, 0, '1', function() StateManager.switch(states.game, 'first_level') end))
	new_objects[1]:registerObject(Node(0, 0, '2', function() StateManager.switch(states.game, 'second_level') end))
	new_objects[1]:registerObject(Node(0, 0, '3', function() StateManager.switch(states.game, 'third_level') end))
	new_objects[1]:registerObject(Node(0, 0, '4', function() StateManager.switch(states.game, 'fourth_level') end))
	new_objects[1]:registerObject(Node(0, 0, '5', function() StateManager.switch(states.game, 'fifth_level') end))
	new_objects[1]:registerObject(Node(0, 0, '6', function() StateManager.switch(states.game, 'sixth_level') end))
	new_objects[1]:registerObject(Node(0, 0, '7', function() StateManager.switch(states.game, 'seventh_level') end))
	new_objects[1]:registerObject(Node(0, 0, '8', function() StateManager.switch(states.game, 'eigth_level') end))
	new_objects[1].parent = WindowManager
	table.insert(new_objects, Button_UI(30, 48, 16, 10, function(button) presetMainMenu(WM) end, 'Back'))
	new_objects[2].parent = WindowManager
	WindowManager.objects = new_objects

end

-- function presetmainSettings()
--     love.graphics.setFont(Fonts.thin.font)
-- 	WM = WindowManager(0,0,64,64)
-- 	WM:registerObject(Button_UI(16, 10, 30, 15, function(button) button.parent print('Show levels') end, 'Levels'))
-- 	WM:registerObject(UIcontainer(0, 0, 250, nil, 10, 1, 10))
-- 	WM:registerObject(Button_UI(16, 30, 30, 15, function() love.event.quit() end, 'Exit'))
-- end

function Menu:enter()
    love.graphics.setFont(Fonts.thin.font)
	WM = WindowManager(0,0,64,64)
	presetMainMenu(WM)
end

function Menu:mousepressed(x, y)
	WM:mousepressed(x, y)
end

function Menu:mousereleased(x, y)
	WM:mousereleased(x, y)
end

function Menu:draw()
	WM:draw()
end

function Menu:update(dt)
	WM:update(dt)
end

return Menu