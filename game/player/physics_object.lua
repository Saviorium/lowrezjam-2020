Class = require "lib.hump.class"
Vector = require "lib.hump.vector"

PhysicsObject = Class {
    init = function(self, x, y, height, width, acceleration, maxSpeed, slowDownSpeed, hc)
    	self.position = Vector( x, y )
        self.speed = Vector( 0, 0)
        self.width  = width 
        self.height = height 
        self.HC = hc

        self.isGrounded = false

        self.acceleration = acceleration
        self.maxSpeed = maxSpeed
        self.slowDownSpeed = slowDownSpeed
        
        self.collider = {}
        table.insert(self.collider, self.HC:rectangle(self.position.x, self.position.y, self.width, self.height))
    end,
    maxGroundNormal = 0.05,
    minGroundNormal = 0.005,
    minMove		    = 0.01
}

function PhysicsObject:update( dt )
    if not self.isGrounded then
        self.speed = self.speed + gravity * dt
    end
    self:changeVelocity(dt)
    self:onCollide()
    self:move( self.speed )
    self:addSomethingInEnd(dt)
end

function PhysicsObject:changeVelocity( dt )
    self.speed.x = 0
end

function PhysicsObject:addSomethingInEnd( dt )
    -- Функция для добавления всякого что выполняется после всех действий со скоростью и перемещение, например анимация
end

function PhysicsObject:changeSpeed(direction, dt)
    local movementDirection = self.speed.x > 0 and 1 or -1

    if (math.abs(self.speed.x) < self.maxSpeed or not(movementDirection == direction)) and not( direction  == 0) then
        if math.abs(self.speed.x + direction * self.acceleration*dt) > self.maxSpeed then
            self.speed.x = direction * self.maxSpeed
        else
            self.speed.x = self.speed.x + direction * self.acceleration*dt
        end
    elseif math.abs(self.speed.x) > 0 and direction == 0 then 
        if self.speed.x > movementDirection * self.slowDownSpeed*dt then
            self.speed.x = self.speed.x - movementDirection * self.slowDownSpeed*dt
        else
            self.speed.x = 0
        end
    end
end

function PhysicsObject:move( moveVector )
    self.position = self.position + moveVector
    for ind, collider in pairs(self.collider) do
        collider:move(moveVector)
    end    
end

function PhysicsObject:onCollide()
	local collisions = self.HC:collisions(self.collider[1])
    self.deltaVector = Vector( 0, 0)
    for shape, delta in pairs(collisions) do
        self.deltaVector = Vector( delta.x, delta.y)

        if math.abs(self.deltaVector.x) > self.maxGroundNormal then
            self:move(self.deltaVector)
        end

        if math.abs(self.deltaVector.y) > self.maxGroundNormal then
            
            self.speed.y = (self.speed.y < 0 or self.deltaVector.y < 0) and 0 or self.speed.y
            self:move(self.deltaVector/2)
            self.isGrounded = self.deltaVector.y < 0
        end
    end
    if math.abs(self.deltaVector.y) < self.minGroundNormal and self.isGrounded then
        self.isGrounded = false
    end

    self:additionalCollide()
end

function PhysicsObject:additionalCollide()

end

return PhysicsObject