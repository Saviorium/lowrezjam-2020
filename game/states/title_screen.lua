Images = require "resource.images"

local TitleScreen = {}

function TitleScreen:enter()
	self.titleScreen = love.graphics.newImage('resource/images/title_screen.png')
	self.started_import = false
	self.timer = 0
end

function TitleScreen:draw()
    love.graphics.draw(self.titleScreen, 0, 0)
    if not self.started_import then
    	self.started_import = true
    	recursimeImport("/resource/images", false)
    end
end

function TitleScreen:update(dt)
	if self.timer < 2 then
		self.timer = self.timer + dt
	else
    	StateManager.switch(states.menu)
	end
end

return TitleScreen