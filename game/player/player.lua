Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
PhysicsObject = require "game.player.physics_object"
Images = require "resource.images"

Player =
    Class {
    __includes = PhysicsObject,
    init = function(self, x, y, hc)
        PhysicsObject.init(self, x, y, 11, 5, 20, 0.5, 20, hc)

        self.exited = 0
        self.direction = 1
        self.prevDirection = 0

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
        self:registerCollider(self.hc)

        self.jumpHeight = 0.25

        self.buttons = {
            up = "w",
            down = "s",
            left = "a",
            right = "d",
            use = "f"
        }
    end
}

function Player:changeVelocity(dt)
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

function Player:addSomethingInEnd(dt)
    if self.direction ~= self.prevDirection and self.sprite.tagName == "run" then
        self.sprite:setTag("turn")
    end
    if self.speed.y < 0 and self.sprite.tagName ~= "jumpup" then
        self.sprite:setTag("jumpup")
    elseif self.speed.y > 0 and self.sprite.tagName ~= "jumpdown" then
        self.sprite:setTag("jumpdown")
    elseif math.abs(self.speed.x) > 0 and self.speed.y == 0 and self.sprite.tagName ~= "run" and self.sprite.tagName ~= "turn" then
        self.sprite:setTag("run")
    elseif self.sprite.tagName ~= "brake" and self.sprite.tagName ~= "idle" and self.speed.x == 0 then
        self.sprite:setTag("brake")
    elseif self.sprite.tagName ~= "idle" and self.sprite.tagName ~= "brake" and self.speed.y == 0 and self.speed.x == 0 then
        self.sprite:setTag("idle")
    end
    if self.exited <= 1 then
        self.exited = self.exited + dt
    end
    self.prevDirection = self.direction
    self.sprite:update(dt)
end

function Player:checkIfExited(mapPos, dt)
    local deltaX = self.position.x + mapPos.x
    local deltaY = self.position.y + mapPos.y
    if self.exited >= 1 then
        if deltaX < 0 then
            mapPos.x = mapPos.x + 64
            self.exited = 0
        elseif deltaX > 64 then
            mapPos.x = mapPos.x - 64
            self.exited = 0
        end

        if deltaY < 0 then
            mapPos.y = mapPos.y + 64
            self.exited = 0
        elseif deltaY > 64 then
            mapPos.y = mapPos.y - 64
            self.exited = 0
        end
    end
end

function Player:draw()
    self.sprite:draw(self.position.x, self.position.y, 0, self.direction, 1, self.direction < 0 and self.width or 0, 0)
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

    love.graphics.setColor(255, 255, 0)
    if self.deltaVector then
        love.graphics.line(
            self.position.x,
            self.position.y,
            self.position.x + -self.deltaVector:perpendicular():normalized().x * self.maxSpeed * 10,
            self.position.y + -self.deltaVector:perpendicular():normalized().y * self.maxSpeed * 10
        )
    end
    -- Сделать ещё дебаг
    love.graphics.setColor(0, 255, 255)
    if self.deltaVector then
        love.graphics.line(
            self.position.x,
            self.position.y,
            self.position.x + self.deltaVector:perpendicular():normalized().x * self.maxSpeed * 10,
            self.position.y + self.deltaVector:perpendicular():normalized().y * self.maxSpeed * 10
        )
    end

    -- Сделать ещё дебаг
    love.graphics.setColor(255, 255, 255)

    x = self.position.x + 8
    y = self.position.y + 8

    love.graphics.setFont(Fonts.small)
    love.graphics.print("P.x " .. self.position.x, x, y + 12, 0)
    love.graphics.print("P.y " .. self.position.y, x, y + 8, 0)
    love.graphics.print("S.x " .. self.speed.x, x, y + 4, 0)
    love.graphics.print("S.y " .. self.speed.y, x, y, 0)
    love.graphics.print("Gr " .. (self.isGrounded and 1 or 0), x, y - 4, 0)
end

return Player
