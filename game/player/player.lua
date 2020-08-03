Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
PhysicsObject = require "game.player.physics_object"
Images = require "resource.images"

Player =
    Class {
    __includes = PhysicsObject,
    init = function(self, x, y, hc)
        PhysicsObject.init(self, x, y, 11, 5, 20, 0.5, 20, hc)

        self.direction = 1
        self.prevDirection = 1
        self.deltaVectorCap = Vector( 0, 0)

        self.sprite = Images["player"]
        self.sprite:setTag("idle")
        self.sprite:play()
        self.sprite:onLoop(
                    function(player)
                        if player.sprite.tagName == "turn" then
                          player.sprite:setTag("run")
                        end
                        if player.sprite.tagName == "brake" then
                            player.sprite:setTag("idle")
                        end
                    end,
                    self
                )

        self.hc = hc

        self.jumpHeight = 0.65

        self.buttons = {
            up = "w",
            down = "s",
            left = "a",
            right = "d",
            use = "f"
        }

        table.insert(self.collider, self.HC:rectangle(self.position.x - 3, self.position.y - 2, self.width + 6, 1))
    end
}

function Player:changeVelocity(dt)
    if love.keyboard.isDown(self.buttons["up"]) and self.isGrounded then
        self.speed.y = self.speed.y + -self.jumpHeight
        self.isGrounded = false
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

function Player:addSomethingInEnd(dt)
    if self.speed.y < 0 then
        if (self.sprite.tagName ~= "jumpup") then
            self.sprite:setTag("jumpup")
        end
    elseif self.speed.y > 0 then
        if (self.sprite.tagName ~= "jumpdown") then
            self.sprite:setTag("jumpdown")
        end
    elseif self.direction ~= self.prevDirection and self.sprite.tagName == "run" then
        self.sprite:setTag("turn")
    elseif math.abs(self.speed.x) > 0  then
        if (self.sprite.tagName ~= "run" and self.sprite.tagName ~= "turn") then
            self.sprite:setTag("run")
        end
    elseif self.sprite.tagName ~= "brake" and self.sprite.tagName ~= "jumpdown" and self.sprite.tagName ~= "idle" and self.speed.y == 0 and self.speed.x == 0 then
        self.sprite:setTag("brake")
    elseif self.sprite.tagName ~= "brake" and self.sprite.tagName ~= "idle" and self.speed.y == 0 and self.speed.x == 0 then
        self.sprite:setTag("idle")
    end
    self.prevDirection = self.direction
    self.sprite:update(dt)
end

function Player:checkIfExited(mapPos, dt)
    mapPos.x = -math.floor(self.position.x/64)*64
    mapPos.y = -math.floor(self.position.y/64)*64
end

function Player:draw()
    self.sprite:draw(self.position.x, self.position.y, 0, self.direction, 1, self.direction < 0 and self.width or 0, 0)
    if Debug.DrawDebugForPlayer and Debug.DrawDebugForPlayer == 1 then
        self:drawDebug()
    end
end

function Player:additionalCollide()
    local collisions = self.HC:collisions(self.collider[2])
    self.deltaVectorCap = Vector( 0, 0)
    for shape, delta in pairs(collisions) do
        self.deltaVectorCap = Vector( delta.x, delta.y)
        if not self.isGrounded and delta.y < -self.minGroundNormal and delta.x == 0 then
            self.speed.y =  self.speed.y >= 0 and 0 or self.speed.y
            self:move(self.deltaVector/2)
            self.isGrounded = delta.y < -self.minGroundNormal and self.speed.y >= 0
        end
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
        love.graphics.line(
            self.position.x,
            self.position.y,
            self.position.x + normDeltaVector.x * 10,
            self.position.y + normDeltaVector.y * 10
        )
    end
    -- Сделать ещё дебаг
    love.graphics.setColor(0, 0, 255)
    if self.deltaVector then
        local perpendicularDeltaVector = self.deltaVector:perpendicular():normalized()
        love.graphics.line(
            self.position.x,
            self.position.y,
            self.position.x + perpendicularDeltaVector.x * 10,
            self.position.y + perpendicularDeltaVector.y * 10
        )
    end

    -- Сделать ещё дебаг
    love.graphics.setColor(255, 255, 255)

    x = self.position.x + 8
    y = self.position.y + 8

    love.graphics.setFont(Fonts.thin)
    love.graphics.print("P.x " .. self.position.x, math.floor(x), math.floor(y + 21), 0)
    love.graphics.print("P.y " .. self.position.y, math.floor(x), math.floor(y + 14), 0)
    love.graphics.print("S.x " .. self.speed.x, math.floor(x), math.floor(y + 7), 0)
    love.graphics.print("S.y " .. self.speed.y, math.floor(x), math.floor(y), 0)
    love.graphics.print("Gr " .. (self.isGrounded and 1 or 0), math.floor(x), math.floor(y - 7), 0)
end

return Player
