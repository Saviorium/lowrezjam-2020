Class = require "lib.hump.class"
Vector = require "lib.hump.vector"

PhysicsObject = Class {
    init = function(self, x, y, image)
    	self.curr_pos = Vector( x, y )
        self.image = image
        self.image:setFilter("nearest", "nearest")
        self.cur_speed = Vector( 0, 0)
        self.height = self.image:getHeight()
        self.width  = self.image:getWidth()
    end,
    minGroundNormal = 0.05,
    minMove		    = 0.01
}


function PhysicsObject:registerCollider(hc_instance)
  self.collider = hc_instance:rectangle(self.curr_pos.x + self.width/2, self.curr_pos.y + self.height/2, self.width, self.height)
  --self.HC = hc_instance
end

function PhysicsObject:update( dt )
  --self.cur_speed = self.cur_speed + gravity * dt
  self.cur_speed.x = 10
  self:onCollide()
  self:move( self.cur_speed )
end

function PhysicsObject:move( moveVector )
  self.curr_pos = self.curr_pos + moveVector
  self.collider:move(moveVector)
end

function PhysicsObject:draw()
    love.graphics.draw(self.image,
                       self.curr_pos.x,
                       self.curr_pos.y, 
                       0, 
                       scale, 
                       scale )


    local x = self.curr_pos.x
    local y = self.curr_pos.y
    if self.deltaVector then
		love.graphics.setColor(255,0,0)
		love.graphics.line( x, y, x+self.deltaVector.x*10, y+self.deltaVector.y*10)
		love.graphics.setColor(0,255,0)
		love.graphics.line( x, y, x+self.cur_speed.x*10, y+self.cur_speed.y*10)
		love.graphics.setColor(0,0,255)
		love.graphics.line( x, y, x+self.deltaVector:perpendicular().x*10, y+self.deltaVector:perpendicular().y*10)

		love.graphics.setColor(125,0,125)
		love.graphics.line( x, y, x+self.cur_speed:projectOn( self.deltaVector:perpendicular()) .x*10, y+self.cur_speed:projectOn( self.deltaVector:perpendicular()) .y*10)
		self.cur_speed:projectOn( self.deltaVector:perpendicular()) 
	end
end

function PhysicsObject:onCollide()
	local collisions = HC:collisions(self.collider)
    for shape, delta in pairs(collisions) do
        self.deltaVector = Vector( delta.x, delta.y)
        self:move(self.deltaVector)
        if delta.y < -self.minGroundNormal then
	        self.grounded = true
	        self.cur_speed.x = self.cur_speed:projectOn( self.deltaVector:perpendicular()).x
        end  		
        if delta.y > self.minGroundNormal then
	        self.cur_speed = self.cur_speed:projectOn( self.deltaVector:perpendicular()) 
        end  	

        if math.abs(delta.x) > self.minGroundNormal then
	        self.cur_speed.x = 0
        end  		
    end
end

return PhysicsObject