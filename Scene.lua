local Scene = Class("Scene")

function Scene:initialize(resmgr)
	self.resmgr = resmgr
	self.key = {}
	self.entitiesId = 0
	self.entities = {}
end

function Scene:update(dt)
	for i, v in ipairs(self.entities) do
		if v:isActive() then
			v:update(dt)
		end
	end
	for i=#self.entities, 1, -1 do
		if self.entities[i]:isAlive() == false then
         if self.entities[i].body then
            self.entities[i].body:destroy()
         end
			table.remove(self.entities, i);
		end
	end
end

function Scene:draw()
	for i, v in ipairs(self.entities) do
		if v:isActive() then
			v:draw()
		end
	end
end

function Scene:addEntity(e)
	e:setId(self:getNewId())
	table.insert(self.entities, e)
	return e
end

function Scene:keypressed(key, isrepeat)
	self.key[key] = true
end

function Scene:keyreleased(key, isrepeat)
	self.key[key] = false
end

function Scene:getNewId()
	local nid = self.entitiesId
	self.entitiesId = self.entitiesId + 1
	return nid
end


function Scene:beginContact(a,b,coll)
end

function Scene:endContact(a,b,coll)
end


function Scene:preSolve(a,b,coll)
end

function Scene:postSolve(a, b, coll, normalimpulse1, tangentimpulse1, normalimpulse2, tangentimpulse2)
end

return Scene
