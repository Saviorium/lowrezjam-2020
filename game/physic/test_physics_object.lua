Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
PhysicsObject = require "game.player.physics_object"
Images = require "resource.images"

TestPhysicsObject =
    Class {
    __includes = PhysicsObject,
    init = function(self, x, y, hc)
        PhysicsObject.init(self, x, y, 1, 10, 0, 0, 0, hc)
        self.isGrounded = true
    end
}

function TestPhysicsObject:changeVelocity(dt)
    local x = self.position.x
    local y = self.position.y
    local width, height = love.graphics.getWidth() / 2, love.graphics.getHeight() / 2

    local current_cursor =
        Vector(
        (love.mouse.getX()) and -width + love.mouse.getX() or 0,
        (love.mouse.getY()) and -height + love.mouse.getY() or 0
    )

    self.speed.x = love.mouse.getX()/config.graphics.scale - x
    self.speed.y = love.mouse.getY()/config.graphics.scale - y
end

function TestPhysicsObject:addSomethingInEnd(dt)

end

function TestPhysicsObject:draw()

    self:drawDebug()
end

function TestPhysicsObject:drawDebug()
    -- Сделать ещё дебаг
    love.graphics.setColor(255, 255, 255)

    x = self.position.x + 8
    y = self.position.y + 8

    love.graphics.setFont(Fonts.thin)

    love.graphics.print("Dv.x " .. self.deltaVector.x, math.floor(x), math.floor(y), 0)
    love.graphics.print("Dv.y " .. self.deltaVector.y, math.floor(x), math.floor(y + 4), 0)
end

return TestPhysicsObject
