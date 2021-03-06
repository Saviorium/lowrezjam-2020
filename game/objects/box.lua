Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
PhysicsObject = require "game.physics.physics_object"

Box = Class {
    __includes = PhysicsObject,
    init = function(self, x, y, hc)
        self.sprite = Images["box"].img
        PhysicsObject.init(self, x, y, 7, 7, 0, 20, 20, 0.5, hc, true, true)
		self.additionalSpeed = Vector(0, 0)
		self.direction = Vector(0, 0)
        self.pushBack = 0
        self.dropout = false
        self.pickUpVector = {
            Vector(3,4),
            Vector(3,4),
            Vector(3,4),
            Vector(3,3),
            Vector(2,2),
            Vector(0,1)
        }
    end
}

function Box:setInteract()
    self.collider.mainCollider.layer = 'inUse'
end

function Box:unsetInteract()
    self.collider.mainCollider.layer = 'box'
    self.dropout = false
end

function Box:draw()
    love.graphics.draw(self.sprite, self.position.x, self.position.y)
end

function Box:setVelocityForFrame(dt)
    if self.collider.mainCollider.layer == 'inUse' then
        self.isGrounded = true
    end 
    self:addSpeedInDirection(self.additionalSpeed, self.direction, dt)
    self.additionalSpeed = Vector(0, 0)
    self.direction = Vector(0, 0)
    self.pushBack = self.deltaVector.x
    self.dropout = math.abs(self.deltaVector.y) > 1
end

return Box
