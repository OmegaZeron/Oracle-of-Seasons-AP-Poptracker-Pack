ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/hint_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}
COLLECTED_HINTS = {}

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

		Archipelago:SetNotify({HINTS_ID, DATA_STORAGE_ID})
		Archipelago:Get({HINTS_ID, DATA_STORAGE_ID})
	end

	if slot_data["required_essences"] then
		Tracker:FindObjectForCode("onox_essences").CurrentStage = slot_data["required_essences"]
	end
	if slot_data["treehouse_old_man_requirement"] then
		Tracker:FindObjectForCode("oldmanessences").CurrentStage = slot_data["treehouse_old_man_requirement"]
	end
	if slot_data["golden_beasts_requirement"] then
		Tracker:FindObjectForCode("goldenbeastsrequired").CurrentStage = slot_data["golden_beasts_requirement"]
	end
	if slot_data["tarm_gate_required_jewels"] then
		Tracker:FindObjectForCode("jewelreq").CurrentStage = slot_data["tarm_gate_required_jewels"]
	end
	if slot_data["logic_difficulty"] then
		Tracker:FindObjectForCode("logiclevel").CurrentStage = slot_data["logic_difficulty"]
	end
	if slot_data["shuffle_dungeons"] then
		Tracker:FindObjectForCode("dungeonshuffle").CurrentStage = slot_data["shuffle_dungeons"]
	end
	if slot_data["shuffle_portals"] then
		Tracker:FindObjectForCode("portalshuffle").CurrentStage = slot_data["shuffle_portals"]
	end
	if slot_data["goal"] then
		Tracker:FindObjectForCode("goal").CurrentStage = slot_data["goal"]
	end
	if slot_data["normalize_horon_village_season"] then
		Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage = slot_data["normalize_horon_village_season"]
	end
	if slot_data["shuffle_old_men"] then
		Tracker:FindObjectForCode("shuffle_old_men").CurrentStage = slot_data["shuffle_old_men"]
	end
	if slot_data["shuffle_golden_ore_spots"] then
		Tracker:FindObjectForCode("shuffle_gold_ores").CurrentStage = slot_data["shuffle_golden_ore_spots"]
	end
	if slot_data["randomize_lost_woods_main_sequence"] then
		Tracker:FindObjectForCode("shuffle_lost_woods").CurrentStage = slot_data["randomize_lost_woods_main_sequence"]
	end
	if slot_data["randomize_lost_woods_item_sequence"] then
		Tracker:FindObjectForCode("shuffle_pedestal").CurrentStage = slot_data["randomize_lost_woods_item_sequence"]
	end
	if slot_data["advance_shop"] then
		Tracker:FindObjectForCode("advance_shop").CurrentStage = slot_data["advance_shop"]
	end
	if slot_data["master_keys"] then
		Tracker:FindObjectForCode("master_keys").CurrentStage = slot_data["master_keys"]
	end
	if slot_data["remove_d0_alt_entrance"] then
		Tracker:FindObjectForCode("d0_alt_entrance").CurrentStage = slot_data["remove_d0_alt_entrance"]
	end
	if slot_data["remove_d2_alt_entrance"] then
		Tracker:FindObjectForCode("d2_alt_entrance").CurrentStage = slot_data["remove_d2_alt_entrance"]
	end
	if slot_data["keysanity_small_keys"] then
		Tracker:FindObjectForCode("small_keysanity").CurrentStage = slot_data["keysanity_small_keys"]
	end
	if slot_data["keysanity_boss_keys"] then
		Tracker:FindObjectForCode("boss_keysanity").CurrentStage = slot_data["keysanity_boss_keys"]
	end
	if slot_data["enforce_potion_in_shop"] then
		Tracker:FindObjectForCode("horon_shop_potion").CurrentStage = slot_data["enforce_potion_in_shop"]
	end
	if slot_data["sign_guy_requirement"] then
		Tracker:FindObjectForCode("sign_guy_requirement").CurrentStage = slot_data["sign_guy_requirement"]
	end
	if slot_data["secret_locations"] then
		Tracker:FindObjectForCode("secrets").CurrentStage = slot_data["secret_locations"]
	end
	
	if slot_data["animal_companion"] == "Ricky" then
		Tracker:FindObjectForCode("natzu_animal").CurrentStage = 0
	elseif slot_data["animal_companion"] == "Dimitri" then
		Tracker:FindObjectForCode("natzu_animal").CurrentStage = 1
	elseif slot_data["animal_companion"] == "Moosh" then
		Tracker:FindObjectForCode("natzu_animal").CurrentStage = 2
	end

	Tracker:FindObjectForCode("default_seasons").CurrentStage = DefaultSeasonOptionMapping[slot_data["default_seasons_option"]]

	for region_name, season_id in pairs(slot_data["default_seasons"]) do
		if (region_name ~= "HORON_VILLAGE" or Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1) then
			Tracker:FindObjectForCode(RegionToSeasonMapping[region_name]).CurrentStage = season_id
		end
	end

	for region_name, portal_name in pairs(slot_data["portal_connections"]) do
		Tracker:FindObjectForCode(PortalMapping[region_name]).CurrentStage = PortalDictionary[region_name][portal_name]
		Tracker:FindObjectForCode(PortalMapping[portal_name]).CurrentStage = PortalDictionary[portal_name][region_name]
	end

	for dungeon_entrance, dungeon_interior in pairs(slot_data["dungeon_entrances"]) do
		Tracker:FindObjectForCode(DungeonMapping[dungeon_interior]).CurrentStage = DungeonDictionary[dungeon_entrance]
	end

	-- deterministic gasha locations setting
	if (slot_data["deterministic_gasha_locations"]) then
		Tracker:FindObjectForCode("gashareq").CurrentStage = slot_data["deterministic_gasha_locations"]
	end

	-- business scrubs setting
	if (slot_data["shuffle_business_scrubs"]) then
		Tracker:FindObjectForCode("shufflescrubs").CurrentStage = slot_data["shuffle_business_scrubs"]
	end

	-- shop prices
	if (slot_data["shop_rupee_requirements"]) then
		for shop, price in pairs(slot_data["shop_rupee_requirements"]) do
			ShopPrices[shop] = price
		end
	end
	if (slot_data["shop_costs"]) then
		for k, v in pairs(slot_data["shop_costs"]) do
			if (k:find("^subrosia")) then
				ShopPrices[SubrosianMarketPrice] = ShopPrices[SubrosianMarketPrice] + v
			end
		end
	end

	-- if starting maps/compasses, auto collect
	if (slot_data["starting_maps_compasses"] == 1) then
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
function onItem(index, item_id, item_name, player_number)
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
					local defaultSeed = Tracker:FindObjectForCode(SeedMapping[SLOT_DATA["default_seed"]])
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
function onLocation(location_id, location_name)
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
			clearHints(location_id)
		else
			print(string.format("onLocation: could not find object for code %s", location))
		end
	end
end

-- called when a locations is scouted
function onScout(location_id, location_name, item_id, item_name, item_player)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onScout: %s, %s, %s, %s, %s", location_id, location_name, item_id, item_name,
			item_player))
	end
end

function onNotify(key, value, old_value)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onNotify: %s, %s, %s", key, dump(value), old_value))
	end

	if value == old_value then
		return
	end

	if key == HINTS_ID then
		COLLECTED_HINTS = {}
		for _, hint in ipairs(value) do
			if not hint.found and hint.finding_player == Archipelago.PlayerNumber then
				updateHints(hint.location, hint.item_flags)
			elseif hint.found then
				clearHints(hint.location)
			end
		end
	elseif key == DATA_STORAGE_ID and value ~= nil then
		for k, v in pairs(value) do
			if (DataStorageLocationTable[k]) then
				Tracker:FindObjectForCode(DataStorageLocationTable[k]).AvailableChestCount = v and 0 or 1
			elseif (DataStorageItemTable[k]) then
				Tracker:FindObjectForCode(DataStorageItemTable[k]).Active = v or false
			end
		end
	end
	Tracker:FindObjectForCode(HiddenSetting).Active = not Tracker:FindObjectForCode(HiddenSetting).Active
end

function onNotifyLaunch(key, value)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onNotifyLaunch: %s, %s", key, dump(value)))
	end
	onNotify(key, value)
end

-- called when a location is hinted
function updateHints(locationID, quality)
	local item_codes = HINT_MAPPING[locationID]
	-- print("Hint", dump(item_codes), quality)
	for _, item_code in ipairs(item_codes) do
		if (QualityToAccess[quality]) then
			COLLECTED_HINTS[item_code] = QualityToAccess[quality]
		end
		local obj = Tracker:FindObjectForCode(item_code)
		if obj then
			obj.Active = true
		else
			print(string.format("No object found for code: %s", item_code))
		end
	end
end

function clearHints(locationID)
	local item_codes = HINT_MAPPING[locationID]
	if (not item_codes) then
		return
	end
	for _, item_code in ipairs(item_codes) do
		local obj = Tracker:FindObjectForCode(item_code)
		if obj then
			obj.Active = false
		else
			print(string.format("No object found for code: %s", item_code))
		end
	end
end

function HasHint(code)
	if (COLLECTED_HINTS[code]) then
		return COLLECTED_HINTS[code]
	end
	local hintLoc = Tracker:FindObjectForCode(code)
	if (hintLoc and hintLoc.Active) then
		hintLoc.Active = false
	end
	return AccessibilityLevel.None
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
	Archipelago:AddItemHandler("item handler", onItem)
end
if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
	Archipelago:AddLocationHandler("location handler", onLocation)
end
Archipelago:AddSetReplyHandler("notify handler", onNotify)
Archipelago:AddRetrievedHandler("notify launch handler", onNotifyLaunch)
Archipelago:AddBouncedHandler("bounce handler", OnBounce)