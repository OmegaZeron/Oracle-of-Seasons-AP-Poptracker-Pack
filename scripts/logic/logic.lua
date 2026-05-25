local IsStale = true
local Staleness = 0
local NamedRegions = {}

---@return accessibilityLevel
local function Always()
	return AccessibilityLevel.Normal
end

---@class (exact) ExitData
---@field exit Region
---@field rule fun(): accessibilityLevel

---@class Region
---@field name string
---@field exits ExitData[]
---@field exitsToRecheck Region[]
---@field staleness integer
---@field accessibilityLevel accessibilityLevel
---@field cleared boolean
Region = {}
Region.__index = Region

-- creates a lua object for the given name. it acts as a representation of a overworld region or indoor location and
-- tracks its connected objects via the exit-table
---@param name string
---@return Region
function Region.New(name)
	if NamedRegions[name] then
		print(name .. " already exists")
	end
	local self = setmetatable({}, Region)
	self.name = name
	NamedRegions[self.name] = self
	self.exits = {}
	self.exitsToRecheck = {}
	self.staleness = -1
	self.accessibilityLevel = AccessibilityLevel.None
	self.cleared = false
	return self
end

-- marks a 1-way connections between 2 "locations/regions" in the source "locations" exit-table with rules if provided
---@param exit Region
---@param rule? fun(): accessibilityLevel|boolean
---@param requiredExit? Region[]
function Region:connect_one_way(exit, rule, requiredExit)
	rule = rule or Always
	self.exits[#self.exits + 1] = {exit = exit, rule = rule}

	if not requiredExit then return end
	for _, recheck in pairs(requiredExit) do
		if not TableContains(recheck.exitsToRecheck, self) then
			recheck.exitsToRecheck[#recheck.exitsToRecheck + 1] = self
		end
	end
end

-- marks a 2-way connection between 2 locations. acts as a shortcut for 2 connect_one_way-calls
---@param exit Region
---@param rule? fun(): accessibilityLevel|boolean
function Region:connect_two_ways(exit, rule)
	self:connect_one_way(exit, rule)
	exit:connect_one_way(self, rule)
end

-- creates a 1-way connection from a region/location to another one via a 1-way connector like a ledge, hole,
-- self-closing door, 1-way teleport, ...
---@param exit Region
---@param rule? fun(): accessibilityLevel|boolean
---@param requiredExit? Region[]
function Region:connect_one_way_entrance(exit, rule, requiredExit)
	rule = rule or Always
	self.exits[#self.exits + 1] = {exit = exit, rule = rule}

	if not requiredExit then return end
	for _, recheck in pairs(requiredExit) do
		if not TableContains(recheck.exitsToRecheck, self) then
			recheck.exitsToRecheck[#recheck.exitsToRecheck + 1] = self
		end
	end
end

-- creates a connection between 2 locations that is traversable in both ways using the same rules both ways
-- acts as a shortcut for 2 connect_one_way_entrance-calls
---@param exit Region
---@param rule? fun(): accessibilityLevel|boolean
---@param requiredExit? Region[]
function Region:connect_two_ways_entrance(exit, rule, requiredExit)
	self:connect_one_way_entrance(exit, rule, requiredExit)
	exit:connect_one_way_entrance(self, rule, requiredExit)
end

-- creates a connection between 2 locations that is traversable in both ways but each connection follow different rules.
-- acts as a shortcut for 2 connect_one_way_entrance-calls
function Region:connect_two_ways_entrance_door_stuck(exit, rule1, rule2)
	self:connect_one_way_entrance(exit, rule1)
	exit:connect_one_way_entrance(self, rule2)
end

-- checks for the accessibility of a region/location given its own exit requirements
---@return accessibilityLevel
function Region:accessibility()
	if self.staleness < Staleness then
		return AccessibilityLevel.None
	end
	return self.accessibilityLevel
end

---@param accessibility accessibilityLevel
function Region:discover(accessibility)
	local change = false
	if accessibility > self:accessibility() then
		change = true
		self.staleness = Staleness
		self.accessibilityLevel = accessibility
	end
	if not change then return end

	for _, recheck in ipairs(self.exitsToRecheck) do
		for _, exitData in pairs(recheck.exits) do
			if (exitData.exit:accessibility() < accessibility) then
				local location, access = CheckAccess(recheck, exitData)
				location:discover(access)
			end
		end
	end
	for _, exitData in pairs(self.exits) do
		if (exitData.exit:accessibility() < accessibility) then
			local location, access = CheckAccess(self, exitData)
			location:discover(access)
		end
	end
end

---@param loc Region
---@param exitData ExitData
---@return Region, accessibilityLevel
function CheckAccess(loc, exitData)
	local region = exitData.exit
	local access = exitData.rule()
	if (access == nil) then
		print("Error in rule for", region.name)
		access = AccessibilityLevel.None
	end
	if type(access) == "boolean" then
		access = BoolToAccess(access)
	end

	-- prevents certain regions from looping back around to turn sequence break locs into normal access
	if (loc.accessibilityLevel < access) then
		access = loc.accessibilityLevel
	end
	return region, access
end

function SetAsStale(code)
	if code ~= LocationRefresh then
		IsStale = true
	end
end

function StateChange()
	-- print("StateChange stated", IsStale)
	-- fixes certain CanReach calls permanently marking locs as green, even after removing items
	for _, region in pairs(NamedRegions) do
		region.accessibilityLevel = 0
	end
	IsStale = false
	Staleness = Staleness + 1
	InvalidateCache()
	StartLocation:discover(AccessibilityLevel.Normal)
end

---@param name string|Region
---@return accessibilityLevel
function CanReach(name)
	if IsStale then
		StateChange()
	end

	local region
	if type(name) == "table" then
		region = NamedRegions[name.name]
	else
		region = NamedRegions[name]
	end
	---@cast region Region

	if region == nil then
		if type(name) == "table" then
			print("Unknown location: " .. tostring(name.name))
		else
			print("Unknown location: " .. tostring(name))
		end
		return AccessibilityLevel.None
	end
	return region:accessibility()
end

---@param item string
---@param amount integer|string?
---@return boolean
function Has(item, amount)
	amount = amount or 1
	local count = Tracker:ProviderCountForCode(item)
	amount = tonumber(amount)
	return amount ~= nil and count >= amount
end

---@param result boolean
---@return accessibilityLevel
function BoolToAccess(result)
	if result then
		return AccessibilityLevel.Normal
	else
		return AccessibilityLevel.None
	end
end

---@param ... boolean|string|function|accessibilityLevel
---@return accessibilityLevel
function All(...)
	local args = { ... }
	local min = AccessibilityLevel.Normal
	for _, access in ipairs(args) do
		if type(access) == "function" then
			access = access()
		elseif type(access) == "string" then
			access = BoolToAccess(Has(access))
		end
		if type(access) == "boolean" then
			access = BoolToAccess(access)
		end

		if access < min then
			if access == AccessibilityLevel.None then
				return AccessibilityLevel.None
			else
				min = access
			end
		end
	end
	return min
end

---@param ... boolean|string|function|accessibilityLevel
---@return accessibilityLevel
function Any(...)
	local args = { ... }
	local max = AccessibilityLevel.None
	for _, access in ipairs(args) do
		if type(access) == "function" then
			access = access()
		elseif type(access) == "string" then
			access = BoolToAccess(Has(access))
		end
		if type(access) == "boolean" then
			access = BoolToAccess(access)
		end

		if access > max then
			if access == AccessibilityLevel.Normal then
				return AccessibilityLevel.Normal
			else
				max = access
			end
		end
	end
	return max
end

ScriptHost:AddWatchForCode("StateChange", "*", SetAsStale)