Class = require "lib.hump.class"
Vector = require "lib.hump.vector"

PhysicsObject = Class {
    init = function(self, x, y, height, width, hc)
    	self.position = Vector( x, y )
        self.speed = Vector( 0, 0)
        self.width  = width and width or 5
        self.height = height and height or 11
        self.HC = hc
        self.grounded = false
    end,
    minGroundNormal = 0.05,
    minMove		    = 0.01
}


function PhysicsObject:registerCollider(hc_instance)
    self.collider = hc_instance:rectangle(self.position.x , self.position.y , self.width, self.height)
end

function PhysicsObject:update( dt )
    
    self.speed.x = 10
    self:onCollide()
    self:move( self.speed )
end

function PhysicsObject:move( moveVector )
  self.position = self.position + moveVector
  self.collider:move(moveVector)
end

function PhysicsObject:onCollide()
	local collisions = self.HC:collisions(self.collider)
    for shape, delta in pairs(collisions) do
        self.deltaVector = Vector( delta.x, delta.y)

        		
    end
end

return PhysicsObject