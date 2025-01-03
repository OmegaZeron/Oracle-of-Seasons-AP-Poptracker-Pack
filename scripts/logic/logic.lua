IsStale = true
Staleness = 0

OoSLocation = {}
OoSLocation.__index = OoSLocation

NamedLocations = {}

-- creates a lua object for the given name. it acts as a representation of a overworld reagion or indoor location and
-- tracks its connected objects via the exit-table
function OoSLocation.New(name)
	local self = setmetatable({}, OoSLocation)
	if name then
		self.name = name
	else
		self.name = self
	end
	NamedLocations[self.name] = self
	self.exits = {}
	self.exits_to_recheck = {}
	self.Staleness = -1
	self.accessibility_level = AccessibilityLevel.None
	self.cleared = false
	return self
end

local function Always()
	return AccessibilityLevel.Normal
end

-- markes a 1-way connections between 2 "locations/regions" in the source "locations" exit-table with rules if provided
function OoSLocation:connect_one_way(exit, rule, requiredExit)
	if type(exit) == "string" then
		exit = OoSLocation.New(exit)
	end
	if rule == nil then
		rule = Always
	end
	self.exits[#self.exits + 1] = { exit, rule }
	if (requiredExit ~= nil) then
		requiredExit.exits_to_recheck[#requiredExit.exits_to_recheck + 1] = self
	end
end

-- markes a 2-way connection between 2 locations. acts as a shortcut for 2 connect_one_way-calls 
function OoSLocation:connect_two_ways(exit, rule)
	self:connect_one_way(exit, rule)
	exit:connect_one_way(self, rule)
end

-- creates a 1-way connection from a region/location to another one via a 1-way connector like a ledge, hole,
-- self-closing door, 1-way teleport, ...
function OoSLocation:connect_one_way_entrance(exit, rule, requiredExit)
	if rule == nil then
		rule = Always
	end
	self.exits[#self.exits + 1] = { exit, rule }
	if (requiredExit ~= nil) then
		requiredExit.exits_to_recheck[#requiredExit.exits_to_recheck + 1] = self
	end
end

-- creates a connection between 2 locations that is traversable in both ways using the same rules both ways
-- acts as a shortcut for 2 connect_one_way_entrance-calls
function OoSLocation:connect_two_ways_entrance(exit, rule, requiredExit)
	if exit == nil then -- for ER
		return
	end
	self:connect_one_way_entrance(exit, rule, requiredExit)
	exit:connect_one_way_entrance(self, rule, requiredExit)
end

-- creates a connection between 2 locations that is traversable in both ways but each connection follow different rules.
-- acts as a shortcut for 2 connect_one_way_entrance-calls
function OoSLocation:connect_two_ways_entrance_door_stuck(exit, rule1, rule2)
	self:connect_one_way_entrance(exit, rule1)
	exit:connect_one_way_entrance(self, rule2)
end

-- checks for the accessibility of a region/location given its own exit requirements
function OoSLocation:accessibility()
	if self.Staleness < Staleness then
		return AccessibilityLevel.None
	else
		return self.accessibility_level
	end
end

function OoSLocation:discover(accessibility)
	local change = false
	if accessibility > self:accessibility() then
		change = true
		self.Staleness = Staleness
		self.accessibility_level = accessibility
	end

	if change then
		for _, recheck in ipairs(self.exits_to_recheck) do
			for _, exit in pairs(recheck.exits) do
				local location, access = CheckAccess(recheck, exit)
				location:discover(access)
			end
		end
		for _, exit in pairs(self.exits) do
			local location, access = CheckAccess(self, exit)
			location:discover(access)
		end
	end
end

function CheckAccess(loc, exit)
	local location = exit[1]
	local rule = exit[2]
	local access = rule()
	if access == true then
		access = AccessibilityLevel.Normal
	elseif access == false then
		access = AccessibilityLevel.None
	end

	-- prevents certain regions from looping back around to turn sequence break locs into normal access
	if (loc.accessibility_level < access) then
		access = loc.accessibility_level
	end
	return location, access
end

function SetAsStale()
	IsStale = true
end


function StateChange()
	-- print("StateChange stated", IsStale)
	-- if (not IsStale) then
	-- 	return
	-- end
	
	-- fixes certain CanReach calls permanently marking locs as green, even after removing items
	for _, location in pairs(NamedLocations) do
		location.accessibility_level = 0
	end
	IsStale = false
	Staleness = Staleness + 1
	StartLocation:discover(AccessibilityLevel.Normal)
end

function CanReach(name)
	-- for k,v in pairs(NamedLocations) do
	--	 print("NamedLocations", dump(k))
	-- end
	if IsStale then
		StateChange()
	end

	local location
	if type(name) == "table" then
		location = NamedLocations[name.name]
	else
		location = NamedLocations[name]
	end

	if location == nil then
		if type(name) == "table" then
			print("Unknown location: " .. tostring(name.name))
		else
			print("Unknown location: " .. tostring(name))
		end
		return AccessibilityLevel.None
	end
	return location:accessibility()
end

function Has(item, amount)
	if (amount == nil) then
		amount = 1
	end
	local count = Tracker:ProviderCountForCode(item)
	amount = tonumber(amount)
	return count >= amount
end

function BoolToAccess(result)
	if result then
		return AccessibilityLevel.Normal
	else
		return AccessibilityLevel.None
	end
end

function All(...)
	local args = { ... }
	local min = AccessibilityLevel.Normal
	for _, access in ipairs(args) do
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

function Any(...)
	local args = { ... }
	local max = AccessibilityLevel.None
	-- print("any", args)
	for _, access in ipairs(args) do
		-- print(i, v)
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