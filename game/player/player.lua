Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
PhysicsObject = require "game.player.physics_object"
Images  = require "resource.images"

Player = Class {
    __includes = PhysicsObject,
    init = function(self, x, y, hc)
        PhysicsObject.init(self, x, y, 11, 5, 60, 1, 20, hc)

        self.direction = 1

        self.sprite = Images['player']
        self.sprite:setTag("idle")
        self.sprite:play()

        self.hc = hc
        self:registerCollider(self.hc)

        self.jumpHeight = 0.5

        self.buttons = {
            up = "w",
            down = "s",
            left = "a",
            right = "d",
            use = "f"
        }
    end,
}


function Player:changeVelocity( dt )
    -- self.speed.x = 0

    if love.keyboard.isDown(self.buttons["up"]) and self.isGrounded then
        self.speed.y = self.speed.y + -self.jumpHeight
        -- self.grounded = false
    end 

    if love.keyboard.isDown(self.buttons["right"]) then
        self.direction = 1
        self:changeSpeed(self.direction, dt)
    elseif love.keyboard.isDown(self.buttons["left"]) then
        self.direction = -1
        self:changeSpeed(self.direction, dt)
    else
        self:changeSpeed(0, dt)
        if math.abs(self.speed.x) > 0 then
            self.sprite:setTag("brake")
        end
    end

end

function Player:addSomethingInEnd( dt )
    if self.speed.y < 0 then
        self.sprite:setTag("jumpup")
    elseif self.speed.y > 0 then
        self.sprite:setTag("jumpdown")
    elseif math.abs(self.speed.x) > 0 then
        self.sprite:setTag("run")
        self.sprite:onLoop (function( player ) 
                                print("Loop1")
                                player.sprite:setTag("brake") 
                                player.sprite:onLoop (function( player ) 
                                                        print("Loop2")
                                                        player.sprite:setTag("idle") 
                                                    end, 
                                                    player)
                            end, 
                            self)
    else
        self.sprite:setTag("idle")
    end
    self.sprite:update(dt)
end

function Player:draw()
    self.sprite:draw(self.position.x, self.position.y, 0, self.direction, 1, self.direction < 0 and self.width or 0 , 0)
    if Debug.DrawDebugForPlayer and Debug.DrawDebugForPlayer == 1 then
        self:drawDebug()
    end
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
                self.position.x + - self.deltaVector:perpendicular():normalized().x * self.maxSpeed * 10, 
                self.position.y + - self.deltaVector:perpendicular():normalized().y * self.maxSpeed * 10)
        end
        -- Сделать ещё дебаг
        love.graphics.setColor(0, 255, 255)
        if self.deltaVector then
            love.graphics.line(self.position.x, self.position.y, 
                self.position.x +  self.deltaVector:perpendicular():normalized().x * self.maxSpeed * 10, 
                self.position.y +  self.deltaVector:perpendicular():normalized().y * self.maxSpeed * 10)
        end

      -- Сделать ещё дебаг
      love.graphics.setColor(255, 255, 255)


    x = self.position.x+8;
    y = self.position.y+8;
    love.graphics.print( "Position x = "..self.position.x,
                        x,
                        y+24,
                        0,
                        1/scale,
                        1/scale
                        )
    love.graphics.print( "Position y = "..self.position.y,
                        x,
                        y+16,
                        0,
                        1/scale,
                        1/scale)
    love.graphics.print( "Speed x = "..self.speed.x,
                        x,
                        y+8,
                        0,
                        1/scale,
                        1/scale)
    love.graphics.print( "Speed y = "..self.speed.y,
                        x,
                        y,
                        0,
                        1/scale,
                        1/scale)
    love.graphics.print( "Grounded = "..(self.isGrounded and 1 or 0),
                        x,
                        y - 8,
                        0,
                        1/scale,
                        1/scale)
end

return Player