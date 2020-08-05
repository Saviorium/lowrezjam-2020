Class = require "lib.hump.class"
Vector = require "lib.hump.vector"

PhysicsObject = Class {
    init = function(self, x, y, height, width, acceleration, maxSpeed, slowDownSpeed, hc)
    	self.position = Vector( x, y )
        self.speed    = Vector( 0, 0)
        self.width  = width 
        self.height = height 
        self.HC = hc

        self.gravity = Vector(0, 1)

        self.isGrounded = false

        self.acceleration  = acceleration
        self.jumpSpeed     = 40
        self.maxSpeed      = maxSpeed
        self.slowDownSpeed = slowDownSpeed
        
        self.collider = {}
        table.insert(self.collider, self.HC:rectangle(self.position.x, self.position.y, self.width, self.height))
    end,
    maxGroundNormal = 0.05,
    minGroundNormal = 0.005,
    minMove		    = 0.01
}

function PhysicsObject:update( dt )
    self:setVelocityForFrame(dt)
    self:onCollide()
    self:move( self.speed )
    self:updateAnimation(dt)
end

function PhysicsObject:setVelocityForFrame( dt )
    self:addSpeedInDirection(Vector(0, 0), Vector(0,0), dt)
end

function PhysicsObject:updateAnimation( dt )
    -- Функция для добавления всякого что выполняется после всех действий со скоростью и перемещение, например анимация
end

function PhysicsObject:addSpeedInDirection(acceleration, direction, dt)

    -- Блок накидывания скорости объекту
    local changeSpeedVector = Vector(direction.x * acceleration.x*dt, direction.y * acceleration.y*dt)
    if direction.x * (self.speed.x + changeSpeedVector.x) <= self.maxSpeed then
        self.speed.x = self.speed.x + changeSpeedVector.x
    else
        self.speed.x = direction.x * self.maxSpeed
    end

    self.speed.y = self.speed.y + changeSpeedVector.y


    -- Блок снижения скороти (гравитация и трение о поверхность воздух, вся фигня)
    local slowDownDirection = self.speed.x >= 0 and -1 or 1
    if -slowDownDirection * (self.speed.x + slowDownDirection * self.slowDownSpeed * dt) > 0 then
        self.speed.x = self.speed.x + slowDownDirection * self.slowDownSpeed * dt
    else
        self.speed.x = 0
    end

    if not self.isGrounded then
        self.speed = self.speed + self.gravity * dt
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
        self.deltaVector = self.deltaVector + delta
    end

    if math.abs(self.deltaVector.x) > self.maxGroundNormal then
        self:move(self.deltaVector)
    end

    if math.abs(self.deltaVector.y) > self.maxGroundNormal then
        
        self.speed.y = (self.speed.y < 0 or self.deltaVector.y < 0) and 0 or self.speed.y
        self:move(self.deltaVector/2)
        self.isGrounded = self.deltaVector.y < 0
    end
    if math.abs(self.deltaVector.y) < self.minGroundNormal and self.isGrounded then
        self.isGrounded = false
    end

    self:additionalCollide()
end

function PhysicsObject:additionalCollide()

end

return PhysicsObject