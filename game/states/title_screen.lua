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

function TitleScreen:keypressed(key)
    if key == "space" then
        self:nextState()
    end
end

function TitleScreen:update(dt)
	if self.timer < 2 then
		self.timer = self.timer + dt
	else
    	self:nextState()
	end
end

function TitleScreen:nextState()
	StateManager.switch(states.game, 'first_level')
end

return TitleScreen