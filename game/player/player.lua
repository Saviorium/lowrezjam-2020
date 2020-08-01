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

      self.image = Images['main_character']
      self.image:setFilter("nearest", "nearest")

      self.hc = hc
      self:registerCollider(self.hc)

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
    self.speed = self.speed + gravity * dt

    if love.keyboard.isDown(self.buttons["down"]) then
        self.speed.y = self.speed.y + self.max_speed
    end
    if love.keyboard.isDown(self.buttons["up"]) then
        self.speed.y = self.speed.y + -self.max_speed
    end
    if love.keyboard.isDown(self.buttons["right"]) then
        self.speed.x = self.speed.x + self.max_speed
    end
    if love.keyboard.isDown(self.buttons["left"]) then
        self.speed.x = self.speed.x + -self.max_speed
    end
  self.grounded = false
  self:onCollide()
  self:move( self.speed )
end

function Player:draw()
    love.graphics.draw(
        self.image,
        self.position.x,
        self.position.y,
        0,
        scale,
        scale,
        self.width/2,
        self.height/2
    )
end

function Player:drawDebug()
    local x = self.position.x
    local y = self.position.y
    local width, height = love.graphics.getWidth() / 2, love.graphics.getHeight() / 2

    love.graphics.setColor(0, 255, 0)
    love.graphics.line(x, y, x + self.speed.x * 10, y + self.speed.y * 10)
    love.graphics.setColor(255, 255, 0)
    -- Сделать ещё дебаг
    love.graphics.setColor(0, 0, 255) 
    -- Сделать ещё дебаг
    love.graphics.setColor(255, 255, 255)
end

return Player