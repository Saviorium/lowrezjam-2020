Class = require "lib.hump.class"
Vector = require "lib.hump.vector"

PhysicsObject = Class {
    init = function(self, x, y, width, height, hc)
    	  self.position = Vector( x, y )
        self.speed = Vector( 0, 0)
        self.height = width and width or 11
        self.width  = width and width or 5
        self.HC = hc
        self.grounded = false
    end,
    minGroundNormal = 0.05,
    minMove		    = 0.01
}


function PhysicsObject:registerCollider(hc_instance)
    self.collider = hc_instance:rectangle(self.position.x + self.width/2, self.position.y + self.height/2, self.width, self.height)
end

function PhysicsObject:update( dt )
    
    self.cur_speed.x = 10
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
        self:move(self.deltaVector)
        if delta.y < -self.minGroundNormal then
	        self.grounded = true
	        self.speed.x = self.speed:projectOn( self.deltaVector:perpendicular()).x
        end  		
        if delta.y > self.minGroundNormal then
	        self.speed = self.speed:projectOn( self.deltaVector:perpendicular()) 
        end  	

        if math.abs(delta.x) > self.minGroundNormal then
	        self.speed.x = 0
        end  		
    end
end

return PhysicsObject