Images          = require "resource.images"

local intro = {}

function intro:enter()
    self.index = 0
    self.screen = Images[self.index..'_screen']
end


function intro:draw()
    love.graphics.draw(self.screen, 0, 0)
end

function intro:update(dt)
    if self.timer < 1 then
        self.timer = self.timer + dt
    else
        if self.index > 10 then
            StateManager.switch(states.game, 'fourth_level')
        else
            self.index = self.index + 1
            self.screen = Images[self.index..'_screen']
        end
    end
end

return intro