ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}

function onClear(slot_data)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onClear, slot_data:\n%s", dump(slot_data)))
	end
	SLOT_DATA = slot_data
	CUR_INDEX = -1
	-- reset locations
	for _, location_array in pairs(LOCATION_MAPPING) do
		for _, location in pairs(location_array) do
			if location then
				local obj = Tracker:FindObjectForCode(location)
				if obj then
					if location:sub(1, 1) == "@" then
						obj.AvailableChestCount = obj.ChestCount
					else
						obj.Active = false
					end
				end
			end
		end
	end
	for _, dsLoc in pairs(DataStorageLocationTable) do
		local obj = Tracker:FindObjectForCode(dsLoc)
		if (obj) then
			obj.AvailableChestCount = obj.ChestCount
		end
	end
	for _, dsItem in pairs(DataStorageItemTable) do
		local obj = Tracker:FindObjectForCode(dsItem)
		if (obj) then
			obj.Active = false
		end
	end
	-- reset items
	for _, v in pairs(ITEM_MAPPING) do
		if v[1] and v[2] then
			if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
				print(string.format("onClear: clearing item %s of type %s", v[1], v[2]))
			end
			local obj = Tracker:FindObjectForCode(v[1])
			if obj then
				if v[2] == "toggle" then
					obj.Active = false
				elseif v[2] == "progressive" then
					obj.CurrentStage = 0
					obj.Active = false
				elseif v[2] == "consumable" then
					obj.AcquiredCount = 0
				elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
					print(string.format("onClear: unknown item type %s for code %s", v[2], v[1]))
				end
			elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
				print(string.format("onClear: could not find object for code %s", v[1]))
			end
		end
	end

	PLAYER_ID = Archipelago.PlayerNumber or -1
	TEAM_NUMBER = Archipelago.TeamNumber or 0

	if Archipelago.PlayerNumber > -1 then
		HINTS_ID = "_read_hints_"..TEAM_NUMBER.."_"..PLAYER_ID
		DATA_STORAGE_ID = "OoS_"..TEAM_NUMBER.."_"..PLAYER_ID

		if Highlight then
			Archipelago:SetNotify({HINTS_ID, DATA_STORAGE_ID})
			Archipelago:Get({HINTS_ID, DATA_STORAGE_ID})
		else
			Archipelago:SetNotify({DATA_STORAGE_ID})
			Archipelago:Get({DATA_STORAGE_ID})
		end
	end

	for opt, val in pairs(slot_data["options"]) do
		if (Tracker:ProviderCountForCode(opt) > 0) then
			Tracker:FindObjectForCode(opt).CurrentStage = val
		end
	end

	Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage = slot_data["default_seasons"]["HORON_VILLAGE"] == 255 and 0 or 1
	for region_name, season_id in pairs(slot_data["default_seasons"]) do
		if (region_name ~= "HORON_VILLAGE" or Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1) then
			Tracker:FindObjectForCode(RegionToSeasonMapping[region_name]).CurrentStage = season_id
		end
	end

	for region_name, portal_name in pairs(slot_data["subrosia_portals"]) do
		Tracker:FindObjectForCode(PortalMapping[region_name]).CurrentStage = PortalDictionary[region_name][portal_name]
		Tracker:FindObjectForCode(PortalMapping[portal_name]).CurrentStage = PortalDictionary[portal_name][region_name]
	end

	for dungeon_entrance, dungeon_interior in pairs(slot_data["dungeon_entrances"]) do
		Tracker:FindObjectForCode(DungeonMapping[dungeon_interior]).CurrentStage = DungeonDictionary[dungeon_entrance]
	end

	-- shop prices
	if (slot_data["shop_rupee_requirements"]) then
		for shop, price in pairs(slot_data["shop_rupee_requirements"]) do
			ShopPrices[shop] = math.floor(price / 2)
		end
	end
	if (slot_data["shop_costs"]) then
		for k, v in pairs(slot_data["shop_costs"]) do
			if (k:find("^subrosia")) then
				ShopPrices[SubrosianMarketPrice] = ShopPrices[SubrosianMarketPrice] + v
			end
		end
	end
	if (slot_data["old_man_rupee_values"]) then
		for man, value in pairs(slot_data["old_man_rupee_values"]) do
			OldMenValues[man][1] = value
		end
	end

	-- if starting maps/compasses, auto collect
	if (slot_data["options"]["starting_maps_compasses"] == 1) then
		for i = 1, 8 do
			Tracker:FindObjectForCode("d"..i.."_map").Active = true
			Tracker:FindObjectForCode("d"..i.."_compass").Active = true
		end
	end

	-- auto tab and set the season for the starting location
	CurrentLocation = nil
	CurrentTab = nil
	-- TODO get this from slot_data once it's a setting
	local startLocation = "impa's house"
	if (Tracker:FindObjectForCode("autotab").CurrentStage == 1 and startLocation) then
		OnBounce({["data"] = {["Current Room"] = StartLocationMapping[startLocation]}})
	end
end

-- called when an item gets collected
function OnItem(index, item_id, item_name, player_number)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onItem: %s, %s, %s, %s, %s", index, item_id, item_name, player_number, CUR_INDEX))
	end
	if not AUTOTRACKER_ENABLE_ITEM_TRACKING then
		return
	end
	if index <= CUR_INDEX then
		return
	end
	SetAsStale()
	local is_local = player_number == Archipelago.PlayerNumber
	CUR_INDEX = index;
	local v = ITEM_MAPPING[item_id]
	if not v then
		if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("onItem: could not find item mapping for id %s", item_id))
		end
		return
	end
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("onItem: code: %s, type %s", v[1], v[2]))
	end
	if not v[1] then
		return
	end
	local obj = Tracker:FindObjectForCode(v[1])
	if obj then
		if v[2] == "toggle" then
			obj.Active = true
		elseif v[2] == "progressive" then
			if obj.Active then
				obj.CurrentStage = obj.CurrentStage + 1
			else
				obj.Active = true
				-- if collecting satchel or slingshot, auto-collect default seed
				if (v[1] == Satchel or v[1] == Slingshot) then
					local defaultSeed = Tracker:FindObjectForCode(SeedMapping[SLOT_DATA["options"]["default_seed"]])
					if (defaultSeed) then
						defaultSeed.Active = true
					end
				end
			end
		elseif v[2] == "consumable" then
			local mult = 1
			if (v[3]) then
				mult = v[3]
			end
			obj.AcquiredCount = obj.AcquiredCount + (obj.Increment * mult)
			if (obj.MaxCount > 0 and obj.AcquiredCount > obj.MaxCount) then
				obj.AcquiredCount = obj.MaxCount
			end
		elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
		end
	elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("onItem: could not find object for code %s", v[1]))
	end
end

-- called when a location gets cleared
function OnLocation(location_id, location_name)
	SetAsStale()
	local location_array = LOCATION_MAPPING[location_id]
	if not location_array or not location_array[1] then
		print(string.format("onLocation: could not find location mapping for id %s", location_id))
		return
	end

	for _, location in pairs(location_array) do
		local obj = Tracker:FindObjectForCode(location)
		-- print(location, obj)
		if obj then
			if location:sub(1, 1) == "@" then
				obj.AvailableChestCount = obj.AvailableChestCount - 1
			else
				obj.Active = true
			end
			ClearHints(location_id)
		else
			print(string.format("onLocation: could not find object for code %s", location))
		end
	end
end

-- called when a locations is scouted
-- function onScout(location_id, location_name, item_id, item_name, item_player)
-- 	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
-- 		print(string.format("called onScout: %s, %s, %s, %s, %s", location_id, location_name, item_id, item_name,
-- 			item_player))
-- 	end
-- end

function OnNotify(key, value, old_value)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onNotify: %s, %s, %s", key, dump(value), old_value))
	end

	if value == old_value then
		return
	end

	if key == HINTS_ID and Highlight then
		for _, hint in ipairs(value) do
			if not hint.found and hint.finding_player == Archipelago.PlayerNumber then
				UpdateHints(hint.location, hint.status)
			else
				ClearHints(hint.location)
			end
		end
	elseif key == DATA_STORAGE_ID and value ~= nil then
		for k, v in pairs(value) do
			if (DataStorageLocationTable[k]) then
				Tracker:FindObjectForCode(DataStorageLocationTable[k]).AvailableChestCount = v and 0 or 1
			elseif (DataStorageItemTable[k]) then
				Tracker:FindObjectForCode(DataStorageItemTable[k]).Active = v or false
			elseif (k == "Learned Pedestal Sequence" and v) then
				for i, pair in ipairs(SLOT_DATA["lost_woods_item_sequence"]) do
					if (i < 4) then
						Tracker:FindObjectForCode("pedestal_d_"..i).CurrentStage = 3 - pair[1]
					end
					Tracker:FindObjectForCode("pedestal_"..i).CurrentStage = pair[2]
				end
			elseif (k == "Learned Lost Woods Sequence" and v) then
				for i, pair in ipairs(SLOT_DATA["lost_woods_main_sequence"]) do
					if (i < 4) then
						Tracker:FindObjectForCode("lost_woods_d_"..i).CurrentStage = 3 - pair[1]
					end
					Tracker:FindObjectForCode("lost_woods_"..i).CurrentStage = pair[2]
				end
			end
		end
		Tracker:FindObjectForCode(HiddenSetting).Active = not Tracker:FindObjectForCode(HiddenSetting).Active
	end
end

function OnNotifyLaunch(key, value)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onNotifyLaunch: %s, %s", key, dump(value)))
	end
	OnNotify(key, value)
end

-- called when a location is hinted or the status of a hint is changed
function UpdateHints(locationID, status)
	if not Highlight then
		return
	end
	local locations = LOCATION_MAPPING[locationID]
	-- print("Hint", dump(locations), status)
	for _, location in ipairs(locations) do
		local section = Tracker:FindObjectForCode(location)
		---@cast section LocationSection
		if section then
			section.Highlight = PriorityToHighlight[status]
		else
			print(string.format("No object found for code: %s", location))
		end
	end
end

function ClearHints(locationID)
	if not Highlight then
		return
	end
	local locations = LOCATION_MAPPING[locationID]
	if (not locations) then
		return
	end
	for _, location in ipairs(locations) do
		local section = Tracker:FindObjectForCode(location)
		---@cast section LocationSection
		if section then
			section.Highlight = Highlight.None
		else
			print(string.format("No object found for code: %s", location))
		end
	end
end

-- called when a bounce message is received 
function OnBounce(json)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onBounce: %s", dump(json)))
	end
	if not json["data"] then
		return
	end
	if json["data"]["Current Room"] then
		local prevRoom = CurrentRoom
		CurrentRoom = json["data"]["Current Room"]
		if prevRoom == CurrentRoom or CurrentRoom == nil then
			return
		end

		if (CurrentLocationMapping[CurrentRoom]) then
			for _, roomMap in ipairs(CurrentLocationMapping[CurrentRoom]) do
				if (roomMap["type"] == "Autotab" and Tracker:FindObjectForCode("autotab").CurrentStage == 1) then
					if CurrentTab ~= roomMap["tab"][#roomMap["tab"]] then
						CurrentTab = roomMap["tab"][#roomMap["tab"]]
						for _, room in ipairs(roomMap["tab"]) do
							Tracker:UiHint("ActivateTab", room)
						end
					end
				elseif roomMap["type"] == "Portal" and prevRoom ~= nil then
					-- make sure we came from another portal
					if CurrentLocationMapping[prevRoom] then
						for _, prevMap in ipairs(CurrentLocationMapping[prevRoom]) do
							if prevMap["type"] == "Portal" then
								Tracker:FindObjectForCode(roomMap["portal"]).CurrentStage = Tracker:FindObjectForCode(roomMap["portal_hidden"]).CurrentStage
								Tracker:FindObjectForCode(prevMap["portal"]).CurrentStage = Tracker:FindObjectForCode(prevMap["portal_hidden"]).CurrentStage
							end
						end
					end
				elseif roomMap["type"] == "DungeonEnt" and prevRoom ~= nil then
					-- make sure we came from the inside
					if CurrentLocationMapping[prevRoom] then
						for _, prevMap in ipairs(CurrentLocationMapping[prevRoom]) do
							if prevMap["type"] == "DungeonIn" then
								Tracker:FindObjectForCode(prevMap["dungeon"].."_ent_selector").CurrentStage = Tracker:FindObjectForCode(prevMap["dungeon"].."_ent_selector_hidden").CurrentStage
								Tracker:FindObjectForCode(roomMap["loc"]).AvailableChestCount = 0
							end
						end
					end
				elseif roomMap["type"] == "DungeonIn" and prevRoom ~= nil then
					-- make sure we came from the outside
					if CurrentLocationMapping[prevRoom] then
						for _, prevMap in ipairs(CurrentLocationMapping[prevRoom]) do
							if prevMap["type"] == "DungeonEnt" then
								Tracker:FindObjectForCode(roomMap["dungeon"].."_ent_selector").CurrentStage = Tracker:FindObjectForCode(roomMap["dungeon"].."_ent_selector_hidden").CurrentStage
								Tracker:FindObjectForCode(prevMap["loc"]).AvailableChestCount = 0
							end
						end
					end
				elseif roomMap["type"] == "SeeSeason" then
					Tracker:FindObjectForCode(roomMap["season"]).CurrentStage = Tracker:FindObjectForCode(roomMap["season_hidden"]).CurrentStage
				end
			end
		end
	end

end

Archipelago:AddClearHandler("clear handler", onClear)
if AUTOTRACKER_ENABLE_ITEM_TRACKING then
	Archipelago:AddItemHandler("item handler", OnItem)
end
if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
	Archipelago:AddLocationHandler("location handler", OnLocation)
end
Archipelago:AddSetReplyHandler("notify handler", OnNotify)
Archipelago:AddRetrievedHandler("notify launch handler", OnNotifyLaunch)
Archipelago:AddBouncedHandler("bounce handler", OnBounce)