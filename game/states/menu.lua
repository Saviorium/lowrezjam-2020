Fonts           = require "resource.fonts"
Level           = require "game.map.level"
Button_UI       = require "game.ui.button"
UiContainer       = require "game.ui.uiparents.ui_container"
WindowManager   = require "game.ui.window_manager"


local Menu = {}


function presetMainMenu()
    love.graphics.setFont(Fonts.thin.font)
	local WM = WindowManager(0,0,64,64)
	WM:registerObject(Button_UI(16, 10, 30, 15, function(button) WM = presetLevels() end, 'Levels'))
	WM:registerObject(Button_UI(16, 30, 30, 15, function() love.event.quit() end, 'Exit'))
	return WM
end

function presetLevels()
    love.graphics.setFont(Fonts.thin.font)
	local WM = WindowManager(0,0,64,64)
	WM:registerObject(UIcontainer(0, 0, nil, 32, 4, 5, 5))
	WM:registerObject(Button_UI(16, 40, 30, 15, function(button) WM = presetMainMenu() end, 'Back'))
	return WM
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
	WM = presetMainMenu()
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