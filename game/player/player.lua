Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
PhysicsObject = require "game.player.physics_object"
Images  = require "resource.images"

Player = Class {
    __includes = PhysicsObject,
    init = function(self, x, y, hc)
        PhysicsObject.init(self, x, y, 12, 5, hc)
        self.max_speed = 1
        self.jump_height = 1

        self.direction = 1

        self.sprite = Images['player']
        self.sprite:setTag("idle")
        self.sprite:play()

        self.hc = hc
        self:registerCollider(self.hc)

        self.lastPressedButton = nil

        self.buttons = {
            up = "w",
            down = "s",
            left = "a",
            right = "d",
            use = "f"
        }
    end,
}

function Player:update( dt )
    self.speed.x = 0

    if love.keyboard.isDown(self.buttons["up"]) and self.grounded then
        self.speed.y = -self.jump_height
    end 

    if love.keyboard.isDown(self.buttons["right"]) then
        self.speed.x = self.max_speed
    end 

    if love.keyboard.isDown(self.buttons["left"]) then
        self.speed.x = -self.max_speed
    end

    self:onCollide()
    self:move( self.speed )

    self.sprite:update(dt)
end

function Player:draw()
    self.sprite:draw(self.position.x, self.position.y, 0, self.direction * scale, scale, self.direction < 0 and self.width or 0 , 0)
end

function Player:drawDebug()
        local x = self.position.x
        local y = self.position.y
        local width, height = love.graphics.getWidth() / 2, love.graphics.getHeight() / 2

        love.graphics.setColor(0, 255, 0)
        love.graphics.line(x, y, x + self.speed.x * 10, y + self.speed.y * 10)

        love.graphics.setColor(255, 0, 0)
        if self.deltaVector then
            local normDeltaVector = self.deltaVector:normalized()
            love.graphics.line(self.position.x, self.position.y, self.position.x + normDeltaVector.x * 10, self.position.y + normDeltaVector.y * 10)
        end
        -- Сделать ещё дебаг
        love.graphics.setColor(0, 0, 255) 
        if self.deltaVector then
            local perpendicularDeltaVector = self.deltaVector:perpendicular():normalized()
            love.graphics.line(self.position.x, self.position.y, self.position.x + perpendicularDeltaVector.x * 10, self.position.y + perpendicularDeltaVector.y * 10)
        end


        love.graphics.setColor(255, 255, 0)
        if self.deltaVector then
            love.graphics.line(self.position.x, self.position.y, 
                self.position.x + - self.deltaVector:perpendicular():normalized().x * self.max_speed * 10, 
                self.position.y + - self.deltaVector:perpendicular():normalized().y * self.max_speed * 10)
        end
        -- Сделать ещё дебаг
        love.graphics.setColor(0, 255, 255)
        if self.deltaVector then
            love.graphics.line(self.position.x, self.position.y, 
                self.position.x +  self.deltaVector:perpendicular():normalized().x * self.max_speed * 10, 
                self.position.y +  self.deltaVector:perpendicular():normalized().y * self.max_speed * 10)
        end

      -- Сделать ещё дебаг
      love.graphics.setColor(255, 255, 255)
end

return Player