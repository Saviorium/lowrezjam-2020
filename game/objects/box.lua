Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
PhysicsObject = require "game.physics.physics_object"
Images = require "resource.images"

Box = Class {
    __includes = PhysicsObject,
    init = function(self, x, y, hc)
        self.sprite = Images["box"].img
        PhysicsObject.init(self, x, y, 7, 7, 0, 20, 20, 0.5, hc, true)
		self.acceleration = Vector(0, 0)
		self.direction = Vector(0, 0)
    end
}

function Box:setInteract()
    self.collider.mainCollider.layer = 'player'
end

function Box:unsetInteract()
    self.collider.mainCollider.layer = 'box'
end

function Box:draw()
    love.graphics.draw(self.sprite, self.position.x, self.position.y)
end

function Box:setVelocityForFrame(dt)
    self:addSpeedInDirection(self.acceleration, self.direction, dt)
    self.acceleration = Vector(0, 0)
    self.direction = Vector(0, 0)
end

return Box
