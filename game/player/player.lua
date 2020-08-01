Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
PhysicsObject = require "game.physicsobject"

Player = Class {
    __includes = PhysicsObject,
    init = function(self, x, y )
      PhysicsObject.init(self, x, y, love.graphics.newImage('data/images/main_character_1.png'))
      self.max_speed = 2
      self.jump_height = 1
      self.speed_increment = 1
      self.slow_down_speed = 0.1
      self.grounded = false
    end,
}

function Player:update( dt )
  self.cur_speed = self.cur_speed + gravity * dt
  self.cur_speed.x = 0

  if love.keyboard.isDown( "right" ) and self.cur_speed.x <= self.max_speed then
    self.cur_speed.x = self.cur_speed.x + self.speed_increment
  elseif love.keyboard.isDown( "left" ) and self.cur_speed.x >= -self.max_speed then
    self.cur_speed.x = self.cur_speed.x - self.speed_increment  
  else
    self.cur_speed.x = self.cur_speed.x/2
  end
  if love.keyboard.isDown( "up" ) and self.grounded == true then
    self.cur_speed.y = self.cur_speed.y - self.jump_height  
  end
  self.grounded = false
  self:onCollide()
  self:move( self.cur_speed )
end

return Player