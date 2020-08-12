Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
PhysicsObject = require "game.physics.physics_object"
Images = require "resource.images"

Player =
    Class {
    __includes = PhysicsObject,
    init = function(self, x, y, hc)
        PhysicsObject.init(self, x, y, 11, 5, 30, 5, 0.8, 0.5, hc)

        self.direction = Vector(1, 1)
        self.prevDirection = self.direction
        self.deltaVectorCap = Vector( 0, 0)

        self.sprite = Images:getNewPeachySprite("player")
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
                        if player.sprite.tagName == "climb" then
                            player.sprite:setTag("jumpup")
                        end
                    end,
                    self
                )

        self.arrowActive = true
        self.arrowTimeout = 0
        self.arrowTimeoutLength = 1 -- seconds
        self.arrowImage = Images["ui_player_arrow"].img

        self.isHanging = false
        self.pushingBox = false

        self.hc = hc

        self.buttons = {
            up = "w",
            down = "s",
            left = "a",
            right = "d",
            use = "f"
        }
        self.hangCapWidth = 2
        self:registerCap()

        self.collider.interactionCollider = self.HC:rectangle(
                self.position.x-2,
                self.position.y,
                9, 11)
        self.collider.interactionCollider.objectPointer = self
        self.inHands = nil

        self.timer = Timer
    end,
    maxJumpable = 0.4,
}

function Player:setVelocityForFrame(dt)

    local moveDirection = Vector(self.direction.x, self.direction.y)

    if love.keyboard.isDown(self.buttons["up"]) and (self.isGrounded or self.isHanging) then
        if self.deltaVector.y == 0 then -- player was hanging on wall
            self.sprite:setTag("climb")
        end
        moveDirection.y = -1
        self.isGrounded = false
        self:turnCapCollider(self.direction)
    elseif love.keyboard.isDown(self.buttons["down"]) and (self.canJumpDown or self.isHanging) then
        self:disableCapCollider()
        self.isHanging = false
        moveDirection.y = 1
    else
        self:registerCap()
        self:turnCapCollider(self.direction)
        moveDirection.y = 0
    end
    self.canJumpDown = false

    if love.keyboard.isDown(self.buttons["right"]) and not self.isHanging and self.deltaVector.x >= 0 then
        moveDirection.x = 1
    elseif love.keyboard.isDown(self.buttons["left"])  and not self.isHanging and self.deltaVector.x <= 0 then
        moveDirection.x = -1
    else
        moveDirection.x = 0
    end

    self.direction = Vector(moveDirection.x == 0 and self.direction.x or moveDirection.x, moveDirection.y)
    self:addSpeedInDirection(Vector(self.acceleration, moveDirection.y == 1 and self.jumpSpeed/1.2 or self.jumpSpeed), moveDirection, dt)

    if math.abs(self.speed.x) > 0 and moveDirection.x == 0 then
        self.sprite:setTag("brake")
    end
    -- Это дерьмо появилось из-за того что перса надо поворачивать ручками в коде
end

function Player:turnCapCollider(direction)
    if direction.x > 0 then
        self.collider.capCollider:moveTo(self.position.x + self.width, self.position.y - 1)
    else
        self.collider.capCollider:moveTo(self.position.x - self.hangCapWidth, self.position.y - 1)
    end
end

function Player:disableCapCollider()
    if self.collider.capCollider then
        self.HC:remove(self.collider.capCollider)
        self.collider.capCollider = nil
    end
end

function Player:registerCap()
    if not self.collider.capCollider then
        self.collider.capCollider = self.HC:rectangle(
            self.position.x - self.hangCapWidth, 
            self.position.y - 1, 
            self.hangCapWidth, 
            1)
        self.collider.capCollider.objectPointer = self
    end
end


function Player:updateAnimation(dt)
    if self.speed.y < 0 and self.sprite.tagName ~= "climb" then
        if (self.sprite.tagName ~= "jumpup") then
            self.sprite:setTag("jumpup")
        end
    elseif self.speed.y > 0 then
        if (self.sprite.tagName ~= "jumpdown") then
            self.sprite:setTag("jumpdown")
        end
    elseif self.isHanging then
        self.sprite:setTag("hang")
    elseif self.direction.x ~= self.prevDirection.x then
        if self.sprite.tagName == "run" then
            self.sprite:setTag("turn")
        elseif self.sprite.tagName == "climb" then
            self.sprite:setTag("jumpup")
        end
    elseif math.abs(self.speed.x) > 0 then
        if (self.sprite.tagName ~= "run" and self.sprite.tagName ~= "turn" and self.sprite.tagName ~= "climb") then
            self.sprite:setTag("run")
        end
    elseif self.sprite.tagName ~= "brake" and self.sprite.tagName ~= "jumpdown" and self.sprite.tagName ~= "idle" and self.speed.y == 0 and self.speed.x == 0 then
        self.sprite:setTag("brake")
    elseif self.sprite.tagName ~= "brake" and self.sprite.tagName ~= "idle" and self.speed.y == 0 and self.speed.x == 0 then
        self.sprite:setTag("idle")
    end
    self.prevDirection = self.direction
    self.sprite:update(dt)

    self.pushingBox = not (self.deltaVector.x == 0 and self.pushingBox)
    self:updateArrow(dt)
end

function Player:checkIfExited(mapPos, dt)
    local roomWidth, roomHeight = config.game.roomSize.x, config.game.roomSize.y
    mapPos.x = -math.floor(self.position.x/roomWidth)*roomWidth
    mapPos.y = -math.floor(self.position.y/roomHeight)*roomHeight
end

function Player:draw()
    self.sprite:draw(self.position.x, self.position.y, 0, self.direction.x, 1, self.direction.x < 0 and self.width+1 or 1, 0)
    self:drawArrow()
    if Debug.DrawDebugForPlayer and Debug.DrawDebugForPlayer == 1 then
        self:drawDebug()
    end
end

function Player:additionalCollide()
    if self.inHands == nil then
        if self.collider.capCollider then
            local collisions = self.HC:collisions(self.collider.capCollider)
            self.deltaVectorCap = Vector( 0, 0)
            for shape, delta in pairs(collisions) do
                self.deltaVectorCap = self.deltaVectorCap + Vector( delta.x, delta.y)
            end
            self.isHanging = false
            if not self.isGrounded and self.deltaVectorCap.y < -self.maxGroundNormal and self.deltaVectorCap.x == 0 then
                self.speed.y =  self.speed.y >= 0 and 0 or self.speed.y
                self:move(self.deltaVector/2)
                self.isHanging = self.deltaVectorCap.y < -self.minGroundNormal and self.speed.y >= 0
            end
        end
        print(self.deltaVector)
        if self.collider.interactionCollider then
            local interactionCollisions = self.HC:collisions(self.collider.interactionCollider)
            for shape, delta in pairs(interactionCollisions) do
                local object = shape.objectPointer
                if object ~= nil and object.isInteractable and love.keyboard.isDown(self.buttons["use"]) then
                    self.inHands = object
                    object:setInteract()
                end
            end
        end
    elseif love.keyboard.isDown(self.buttons["use"]) then
        self.inHands:unsetInteract()
        self.inHands = nil
    end
end

function Player:showArrow()
    self.arrowActive = true
    self.arrowTimeout = self.arrowTimeoutLength
end

function Player:hideArrow()
    self.arrowActive = false
end

function Player:drawArrow()
    if self.arrowActive then
        love.graphics.draw(self.arrowImage, self.position.x, self.position.y + self.height + 2)
    end
end

function Player:updateArrow(dt)
    if self.arrowActive then
        self.arrowTimeout = self.arrowTimeout - dt
        if self.arrowTimeout < 0 then
            self.arrowActive = false
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
    -- Сделать ещё дебаг
    love.graphics.setColor(0, 0, 255)
        local perpendicularDeltaVector = self.deltaVector:perpendicular():normalized()
        love.graphics.line(
            self.position.x,
            self.position.y,
            self.position.x + perpendicularDeltaVector.x * 10,
            self.position.y + perpendicularDeltaVector.y * 10
        )
    end

    love.graphics.setColor(255, 255, 255)

    x = self.position.x + 8
    y = self.position.y - 8

    love.graphics.setFont(Fonts.thin)
    love.graphics.print("P.x " .. self.position.x, math.floor(x), math.floor(y + 21), 0)
    love.graphics.print("P.y " .. self.position.y, math.floor(x), math.floor(y + 14), 0)
    love.graphics.print("S.x " .. self.speed.x, math.floor(x), math.floor(y + 7), 0)
    love.graphics.print("S.y " .. self.speed.y, math.floor(x), math.floor(y), 0)
    love.graphics.print("Gr " .. (self.isGrounded and 1 or 0), math.floor(x), math.floor(y - 7), 0)
    love.graphics.print("Ha " .. (self.isHanging and 1 or 0), math.floor(x), math.floor(y - 14), 0)
end

return Player
