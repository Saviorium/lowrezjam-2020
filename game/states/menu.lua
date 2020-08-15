Fonts           = require "resource.fonts"
Level           = require "game.map.level"
Button_UI       = require "game.ui.button"
WindowManager   = require "game.ui.window_manager"


local Menu = {}

function Menu:enter()
    love.graphics.setFont(Fonts.thin.font)
	WM = WindowManager(0,0,64,64)
	WM:registerObject(Button_UI(16, 10, 30, 15, function() print('Show levels') end, 'Levels'))
	WM:registerObject(Button_UI(16, 30, 30, 15, function() love.event.quit() end, 'Exit'))
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