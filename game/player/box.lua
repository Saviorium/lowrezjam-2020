Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
PhysicsObject = require "game.player.physics_object"
Images = require "resource.images"

Box = Class {
    __includes = PhysicsObject,
    init = function(self, x, y, hc)
        self.sprite = Images["box"]
        PhysicsObject.init(self, x, y, 7, 7, 20, 0.5, 20, hc)
    end
}

function Box:draw()
    love.graphics.draw(self.sprite, self.position.x, self.position.y)
end

return Box
