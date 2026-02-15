require("scripts.autotracking.item_mapping")
require("scripts.autotracking.location_mapping")

local CUR_INDEX = -1
local SLOT_DATA = {}
local WORLD_VERSION <const> = "17"
local IGNORE_VERSION = false
local ALL_LOCATIONS = {}
local IS_MANUAL_CLICK = true
local DEFAULT_SEED <const> = "default"
local ROOM_SEED = DEFAULT_SEED
local IS_HIGHLIGHT_UPDATE = false

function PreOnClear()
	PLAYER_ID = Archipelago.PlayerNumber or -1
	TEAM_NUMBER = Archipelago.TeamNumber or 0

	if Archipelago.PlayerNumber > -1 then
		if #ALL_LOCATIONS > 0 then
			ALL_LOCATIONS = {}
		end
		for _, value in pairs(Archipelago.MissingLocations) do
			table.insert(ALL_LOCATIONS, #ALL_LOCATIONS + 1, value)
		end

		for _, value in pairs(Archipelago.CheckedLocations) do
			table.insert(ALL_LOCATIONS, #ALL_LOCATIONS + 1, value)
		end
	end

	local manualStorageItem = Tracker:FindObjectForCode(ManualStorageCode)
	if manualStorageItem then
		manualStorageItem = manualStorageItem.ItemState
	end
	local seedBase = (Archipelago.Seed or #ALL_LOCATIONS).."_"..Archipelago.TeamNumber.."_"..Archipelago.PlayerNumber
	if manualStorageItem and (ROOM_SEED == DEFAULT_SEED or ROOM_SEED ~= seedBase) then
		ROOM_SEED = seedBase
		if #manualStorageItem.ManualLocations > 10 then
			manualStorageItem.ManualLocations[manualStorageItem.ManualLocationsOrder[1]] = nil
			table.remove(manualStorageItem.ManualLocationsOrder, 1)
		end
		if manualStorageItem.ManualLocations[ROOM_SEED] == nil then
			manualStorageItem.ManualLocations[ROOM_SEED] = {}
			table.insert(manualStorageItem.ManualLocationsOrder, ROOM_SEED)
		end
	end
end

function OnClear(slot_data)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called OnClear, slot_data:\n%s", dump(slot_data)))
	end

	SLOT_DATA = slot_data

	Tracker:FindObjectForCode(VersionMismatch).Active = false
	if not IGNORE_VERSION and slot_data["version"] and not slot_data["version"]:find("^"..WORLD_VERSION) then
		Tracker:FindObjectForCode(VersionMismatch).Active = true
		return
	end

	IS_MANUAL_CLICK = false
	local manualStorageItem = Tracker:FindObjectForCode(ManualStorageCode)
	if manualStorageItem == nil then
		CreateLuaManualLocationStorage(ManualStorageCode)
	end
	manualStorageItem = Tracker:FindObjectForCode(ManualStorageCode).ItemState

	PreOnClear()

	CUR_INDEX = -1
	-- reset locations
	for _, location_array in pairs(LOCATION_MAPPING) do
		for _, location in pairs(location_array) do
			local obj = Tracker:FindObjectForCode(location)
			if obj then
				if location:sub(1, 1) == "@" then
					---@cast obj LocationSection
					if manualStorageItem and manualStorageItem.ManualLocations[ROOM_SEED] and manualStorageItem.ManualLocations[ROOM_SEED][obj.FullID] then
						obj.AvailableChestCount = manualStorageItem.ManualLocations[ROOM_SEED][obj.FullID]
						if EventTable[obj.FullID] then
							Tracker:FindObjectForCode(EventTable[obj.FullID]).Active = true
						end
					else
						obj.AvailableChestCount = obj.ChestCount
						if EventTable[obj.FullID] then
							Tracker:FindObjectForCode(EventTable[obj.FullID]).Active = false
						end
					end
				else
					---@cast obj JsonItem
					obj.Active = false
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
	for _, itemData in pairs(ITEM_MAPPING) do
		if itemData[1] and itemData[2] then
			if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
				print(string.format("onClear: clearing item %s of type %s", itemData[1], itemData[2]))
			end
			local obj = Tracker:FindObjectForCode(itemData[1])
			if obj then
				if itemData[2] == "toggle" then
					obj.Active = false
				elseif itemData[2] == "progressive" or itemData[2] == "progressive_set" then
					obj.CurrentStage = 0
				elseif itemData[2] == "consumable" then
					obj.AcquiredCount = 0
				elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
					print(string.format("onClear: unknown item type %s for code %s", itemData[2], itemData[1]))
				end
			elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
				print(string.format("onClear: could not find object for code %s", itemData[1]))
			end
		end
	end

	-- reset "dungeons with essence" data
	for k, _ in pairs(EssencesInWorld) do
		EssencesInWorld[k] = false
	end
	for i = 1, 8 do
		Tracker:FindObjectForCode("d"..i.."_label").Active = false
	end

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

	AutoCollectLocationTable = {
		["AP"] = {
			[Satchel] = {"@Horon Village/Horon Tree/Horon Village: Seed Tree", SeedMapping[slot_data["options"]["default_seed"]]},
			[Slingshot] = {"@Horon Village/Horon Tree/Horon Village: Seed Tree", SeedMapping[slot_data["options"]["default_seed"]]},
			[SeedShooter] = {"@Horon Village/Horon Tree/Horon Village: Seed Tree", SeedMapping[slot_data["options"]["default_seed"]]},
			[AnyFlute] = {function() Tracker:FindObjectForCode(Companion).CurrentStage = SLOT_DATA["options"]["animal_companion"] end}
		},
		["Any"] = {DefaultAutoCollectLocationTable}
	}

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

	Tracker:FindObjectForCode("linked_cave").CurrentStage = LinkedCaveMapping[slot_data["options"]["linked_heros_cave"] & (LinkedEnum.Samasa)] -- OR all locations together as they get added
	Tracker:FindObjectForCode("remove_lc_alt_entrance").CurrentStage = LinkedCaveMapping[slot_data["options"]["linked_heros_cave"] & LinkedEnum.NoAltEnt]

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

	if slot_data["essences_in_game"] then
		for _, v in ipairs(slot_data["essences_in_game"]) do
			EssencesInWorld[v] = true
		end
	end

	if slot_data["options"]["show_dungeons_with_essence"] == 2 then
		for i = 1, 8 do
			RevealEssence(i)
		end
	end
	-- if starting maps/compasses, auto collect
	if (slot_data["options"]["starting_maps_compasses"] == 1) then
		for i = 0, 9 do
			if i == 9 then
				i = 11
			end
			Tracker:FindObjectForCode("d"..i.."_map").Active = true
			Tracker:FindObjectForCode("d"..i.."_compass").Active = true
			RevealDungeon(i)
			if (slot_data["options"]["show_dungeons_with_essence"] == 1) then
				RevealEssence(i, true)
			end
		end
	end

	-- auto tab and set the season for the starting location
	CurrentLocation = nil
	CurrentTab = nil
	-- TODO get this from slot_data once it's a setting
	local startLocation = StartImpa
	if (Tracker:FindObjectForCode("autotab").CurrentStage == 1 and startLocation) then
		CurrentRoom = nil
		OnBounce({["data"] = {["Current Room"] = StartLocationMapping[startLocation]}})
	end

	IS_MANUAL_CLICK = true
end

-- called when an item gets collected
function OnItem(index, item_id, item_name, player_number)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onItem: %s, %s, %s, %s, %s", index, item_id, item_name, player_number, CUR_INDEX))
	end
	if Tracker:FindObjectForCode(VersionMismatch).Active then
		return
	end
	if not AUTOTRACKER_ENABLE_ITEM_TRACKING then
		return
	end
	if index <= CUR_INDEX then
		return
	end
	SetAsStale()
	CUR_INDEX = index;
	local itemData = ITEM_MAPPING[item_id]
	if not itemData then
		if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("onItem: could not find item mapping for id %s", item_id))
		end
		return
	end
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("onItem: code: %s, type %s", itemData[1], itemData[2]))
	end
	if not itemData[1] then
		return
	end
	local item = Tracker:FindObjectForCode(itemData[1])
	if item then
		if itemData[2] == "toggle" then
			item.Active = true
		elseif itemData[2] == "progressive" then
			local inc = 1
			if (itemData[3]) then
				inc = itemData[3]
			end
			item.CurrentStage = item.CurrentStage + inc
		elseif itemData[2] == "consumable" then
			local mult = 1
			if (itemData[3]) then
				mult = itemData[3]
			end
			item.AcquiredCount = item.AcquiredCount + (item.Increment * mult)
		elseif itemData[2] == "progressive_set" then
			if item.CurrentStage < itemData[3] then
				item.CurrentStage = itemData[3]
			end
		elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("onItem: unknown item type %s for code %s", itemData[2], itemData[1]))
		end
		if (AutoCollectLocationTable["AP"][itemData[1]]) then
			for _, autoCollectData in ipairs(AutoCollectLocationTable["AP"][itemData[1]]) do
				if (type(autoCollectData) == "function") then
					autoCollectData()
				else
					local toCollect = Tracker:FindObjectForCode(autoCollectData)
					if (toCollect) then
						if autoCollectData:sub(1, 1) == "@" then
							---@cast toCollect LocationSection
							toCollect.AvailableChestCount = toCollect.AvailableChestCount - 1
						else
							---@cast toCollect JsonItem
							toCollect.Active = true
						end
					end
				end
			end
		end
		local mDungeon = tonumber(itemData[1]:match("d(%d)_map"))
		local cDungeon = tonumber(itemData[1]:match("d(%d)_compass"))
		if mDungeon then
			RevealDungeon(mDungeon)
		elseif cDungeon then
			RevealEssence(cDungeon)
		elseif EssenceMapping[itemData[1]] then
			RevealEssence(EssenceMapping[itemData[1]])
		end
	elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("onItem: could not find object for code %s", itemData[1]))
	end
end

-- called when a location gets cleared
function OnLocation(location_id, location_name)
	if Tracker:FindObjectForCode(VersionMismatch).Active then
		return
	end
	IS_MANUAL_CLICK = false
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
			-- if (AutoCollectLocationTable["AP"][location]) then
			-- 	for _, autoTable in ipairs(AutoCollectLocationTable["AP"][location]) do
			-- 		local toCollect = Tracker:FindObjectForCode(autoTable)
			-- 		if (toCollect) then
			-- 			if autoTable:sub(1, 1) == "@" then
			-- 				---@cast toCollect LocationSection
			-- 				toCollect.AvailableChestCount = toCollect.AvailableChestCount - 1
			-- 			else
			-- 				---@cast toCollect JsonItem
			-- 				toCollect.Active = true
			-- 			end
			-- 		end
			-- 		Tracker:FindObjectForCode(location).AvailableChestCount = 0
			-- 	end
			-- end
			UpdateHints(location_id, Highlight.None)
		else
			print(string.format("onLocation: could not find object for code %s", location))
		end
	end

	IS_MANUAL_CLICK = true
end

function OnNotify(key, value, old_value)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onNotify: %s, %s, %s", key, dump(value), old_value))
	end

	if value == nil or value == old_value then
		return
	end

	if key == HINTS_ID and Highlight then
		for _, hint in ipairs(value) do
			if hint.finding_player == Archipelago.PlayerNumber then
				if not hint.found then
					UpdateHints(hint.location, PriorityToHighlight[hint.status])
				else
					UpdateHints(hint.location, Highlight.None)
				end
			end
		end
	elseif key == DATA_STORAGE_ID then
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
				Tracker:FindObjectForCode("@Tarm Ruins/Pedestal Sequence/Serenade the Scrub").AvailableChestCount = 0
			elseif (k == "Learned Lost Woods Sequence" and v) then
				for i, pair in ipairs(SLOT_DATA["lost_woods_main_sequence"]) do
					if (i < 4) then
						Tracker:FindObjectForCode("lost_woods_d_"..i).CurrentStage = 3 - pair[1]
					end
					Tracker:FindObjectForCode("lost_woods_"..i).CurrentStage = pair[2]
				end
				Tracker:FindObjectForCode("@Tarm Ruins/Lost Woods Sequence/Shield the Scrub").AvailableChestCount = 0
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
---@param locationID number
---@param status highlight
function UpdateHints(locationID, status)
	if not Highlight then
		return
	end
	local locations = LOCATION_MAPPING[locationID]
	-- print("Hint", dump(locations), status)
	for _, location in ipairs(locations) do
		local section = Tracker:FindObjectForCode(location)
		if section then
			---@cast section LocationSection
			IS_HIGHLIGHT_UPDATE = true
			section.Highlight = status
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
								if prevMap["loc"] then
									Tracker:FindObjectForCode(prevMap["loc"]).AvailableChestCount = 0
								end
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
								if roomMap["loc"] then
									Tracker:FindObjectForCode(roomMap["loc"]).AvailableChestCount = 0
								end
							end
						end
					end
				elseif roomMap["type"] == "SeeSeason" then
					Tracker:FindObjectForCode(roomMap["season"]).CurrentStage = Tracker:FindObjectForCode(roomMap["season_hidden"]).CurrentStage
				elseif roomMap["type"] == "Natzu" then
					Tracker:FindObjectForCode(Companion).CurrentStage = SLOT_DATA["options"]["animal_companion"]
				elseif roomMap["type"] == "Custom" then
					roomMap["function"]()
				end
			end
		end
	end
end

---@param location LocationSection
function ManualLocationHandler(location)
	if IS_HIGHLIGHT_UPDATE then
		IS_HIGHLIGHT_UPDATE = false
		return
	end
	if IS_MANUAL_CLICK then
		local manualStorageItem = Tracker:FindObjectForCode(ManualStorageCode)
		if not manualStorageItem then
			return
		end
		manualStorageItem = manualStorageItem.ItemState
		if not manualStorageItem then
			return
		end
		if Archipelago.PlayerNumber == -1 and ROOM_SEED ~= DEFAULT_SEED then
			-- seed is from previous connection
			ROOM_SEED = DEFAULT_SEED
			manualStorageItem.ManualLocations[ROOM_SEED] = {}
		end
		local fullID = location.FullID
		if not manualStorageItem.ManualLocations[ROOM_SEED] then
			manualStorageItem.ManualLocations[ROOM_SEED] = {}
		end
		if location.AvailableChestCount < location.ChestCount then
			-- add to list
			manualStorageItem.ManualLocations[ROOM_SEED][fullID] = location.AvailableChestCount
			if EventTable[location.FullID] then
				Tracker:FindObjectForCode(EventTable[location.FullID]).Active = true
			end
			if Highlight then
				location.Highlight = Highlight.None
			end
		else
			-- remove from list of set back to max chestcount
			manualStorageItem.ManualLocations[ROOM_SEED][fullID] = nil
			if EventTable[location.FullID] then
				Tracker:FindObjectForCode(EventTable[location.FullID]).Active = false
			end
			if Highlight then
				-- re-grab hints since it was cleared earlier
				Archipelago:Get({HINTS_ID})
			end
		end
	end
end

function OnVersionCheckChanged(code)
	if not LOADED then
		return
	end
	if Tracker:FindObjectForCode(VersionMismatch).Active then
		ScriptHost:AddOnLocationSectionChangedHandler("version mismatch ignore handler", OnIgnoreVersionMismatch)
		Tracker:AddLayouts("layouts/version_mismatch.json")
	else
		Tracker:AddLayouts("layouts/tracker_layouts.json")
		if IGNORE_VERSION then
			OnClear(SLOT_DATA)
		end
	end
end

---@param section LocationSection
function OnIgnoreVersionMismatch(section)
	if section.FullID == "Version Mismatch/Ignore One Time/" then
		Tracker:FindObjectForCode("@Version Mismatch/Ignore One Time/").AvailableChestCount = 1
		IGNORE_VERSION = true
		Tracker:FindObjectForCode(VersionMismatch).Active = false
		-- deprecated, change this to RemoveOnLocationSectionChangedHandler eventually
		ScriptHost:RemoveOnLocationSectionHandler("version mismatch ignore handler")
	end
end

---@param dungeon number
function RevealDungeon(dungeon)
	if (SLOT_DATA["options"]["show_dungeons_with_map"] == 1) then
		local hiddenStage = Tracker:FindObjectForCode("d"..dungeon.."_ent_selector_hidden").CurrentStage
		Tracker:FindObjectForCode("d"..dungeon.."_ent_selector").CurrentStage = hiddenStage
		-- clear the "enter dungeon" location
		if DungeonSetVars[hiddenStage] then
			Tracker:FindObjectForCode(DungeonSetVars[hiddenStage][3]).AvailableChestCount = 0
		end
	end
end

---@param dungeon number
function RevealEssence(dungeon, skipEntrance)
	if SLOT_DATA["options"]["shuffle_essences"] ~= 0 or SLOT_DATA["options"]["show_dungeons_with_essence"] == 0 or not EssenceTable[dungeon] then
		return
	end
	if EssencesInWorld[EssenceTable[dungeon][1]] then
		Tracker:FindObjectForCode(EssenceTable[dungeon][2]).Active = true
		if not skipEntrance then
			RevealDungeon(dungeon)
		end
	end
end

Archipelago:AddClearHandler("clear handler", OnClear)
if AUTOTRACKER_ENABLE_ITEM_TRACKING then
	Archipelago:AddItemHandler("item handler", OnItem)
end
if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
	Archipelago:AddLocationHandler("location handler", OnLocation)
end
Archipelago:AddSetReplyHandler("notify handler", OnNotify)
Archipelago:AddRetrievedHandler("notify launch handler", OnNotifyLaunch)
Archipelago:AddBouncedHandler("bounce handler", OnBounce)

ScriptHost:AddWatchForCode("version mismatch handler", VersionMismatch, OnVersionCheckChanged)