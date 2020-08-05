Class = require "lib.hump.class"
Vector = require "lib.hump.vector"
PhysicsObject = require "game.physics.physics_object"
Images = require "resource.images"

ColliderLayer = Class {
    init = function(self, name)
        self.name = name
        self.enabled = 1
        self.collideRulesList = {}
    end
}

function ColliderLayer:switchEnabled()
    self.enabled = not self.enabled
end

function ColliderLayer:registerRule(collideName, onCollideAction)
    self.collideRulesList[collideName] = onCollideAction
    print(self.name)
    for name, rule in pairs(self.collideRulesList) do
    	print(name, rule)
    end
end

function ColliderLayer:regiterCollision(object, collideObject, delta)
	if collideObject.collider then
		if self.collideRulesList[collideObject.collider.mainCollider.layer] then
			self.collideRulesList[collideObject.collider.mainCollider.layer](object, collideObject, delta)
		end
	else
		if self.collideRulesList[collideObject] then
			self.collideRulesList[collideObject](object, collideObject, delta)
		end
	end
end

return ColliderLayer
