ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/hint_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}
COLLECTED_HINTS = {}

function onClear(slot_data)
	print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
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
	-- reset items
	for _, v in pairs(ITEM_DISPLAY_MAPPING) do
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
		Archipelago:SetNotify({HINTS_ID})
		Archipelago:Get({HINTS_ID})
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
	if slot_data["warp_to_start"] then
		Tracker:FindObjectForCode("treewarp").CurrentStage = slot_data["warp_to_start"]
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
	
	if slot_data["animal_companion"] == "Ricky" then
		Tracker:FindObjectForCode("natzu_animal").CurrentStage = 0
	elseif slot_data["animal_companion"] == "Dimitri" then
		Tracker:FindObjectForCode("natzu_animal").CurrentStage = 1
	elseif slot_data["animal_companion"] == "Moosh" then
		Tracker:FindObjectForCode("natzu_animal").CurrentStage = 2
	end

	if slot_data["default_seasons_option"] == "vanilla" then
		Tracker:FindObjectForCode("default_seasons").CurrentStage = 0
	elseif slot_data["default_seasons_option"] == "randomized" then
		Tracker:FindObjectForCode("default_seasons").CurrentStage = 1
	elseif slot_data["default_seasons_option"] == "random_singularity" then
		Tracker:FindObjectForCode("default_seasons").CurrentStage = 2
	elseif slot_data["default_seasons_option"] == "spring_singularity" then
		Tracker:FindObjectForCode("default_seasons").CurrentStage = 3
	elseif slot_data["default_seasons_option"] == "summer_singularity" then
		Tracker:FindObjectForCode("default_seasons").CurrentStage = 4
	elseif slot_data["default_seasons_option"] == "autumn_singularity" then
		Tracker:FindObjectForCode("default_seasons").CurrentStage = 5
	elseif slot_data["default_seasons_option"] == "winter_singularity" then
		Tracker:FindObjectForCode("default_seasons").CurrentStage = 6
	end

	for region_name, season_id in pairs(slot_data["default_seasons"]) do

		if (region_name == "EYEGLASS_LAKE") then
			Tracker:FindObjectForCode("north_horon_season_hidden").CurrentStage = season_id
		end
		if (region_name == "EASTERN_SUBURBS") then
			Tracker:FindObjectForCode("suburbs_season_hidden").CurrentStage = season_id
		end
		if (region_name == "WOODS_OF_WINTER") then
			Tracker:FindObjectForCode("wow_season_hidden").CurrentStage = season_id
		end
		if (region_name == "HOLODRUM_PLAIN") then
			Tracker:FindObjectForCode("plain_season_hidden").CurrentStage = season_id
		end
		if (region_name == "SPOOL_SWAMP") then
			Tracker:FindObjectForCode("swamp_season_hidden").CurrentStage = season_id
		end
		if (region_name == "SUNKEN_CITY") then
			Tracker:FindObjectForCode("sunken_season_hidden").CurrentStage = season_id
		end
		if (region_name == "LOST_WOODS") then
			Tracker:FindObjectForCode("lost_woods_season_hidden").CurrentStage = season_id
		end
		if (region_name == "TARM_RUINS") then
			Tracker:FindObjectForCode("tarm_ruins_season_hidden").CurrentStage = season_id
		end
		if (region_name == "WESTERN_COAST") then
			Tracker:FindObjectForCode("coast_season_hidden").CurrentStage = season_id
		end
		if (region_name == "TEMPLE_REMAINS") then
			Tracker:FindObjectForCode("remains_season_hidden").CurrentStage = season_id
		end
		if (Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 and region_name == "HORON_VILLAGE") then
			Tracker:FindObjectForCode("horon_village_season_hidden").CurrentStage = season_id
		end
	end

	local portal_dictionary = {
		['eastern suburbs portal'] = {
			['volcanoes east portal'] = 1,
			['subrosia market portal'] = 2,
			['great furnace portal'] = 3,
			['strange brothers portal'] = 4,
			['house of pirates portal'] = 5,
			['volcanoes west portal'] = 6,
			['d8 entrance portal'] = 7,
			['spool swamp portal'] = 8,
			['eyeglass lake portal'] = 9,
			['mt. cucco portal'] = 12,
			['horon village portal'] = 11,
			['temple remains lower portal'] = 12,
			['temple remains upper portal'] = 13
		},
		['spool swamp portal'] = {
			['volcanoes east portal'] = 1,
			['subrosia market portal'] = 2,
			['great furnace portal'] = 3,
			['strange brothers portal'] = 4,
			['house of pirates portal'] = 5,
			['volcanoes west portal'] = 6,
			['d8 entrance portal'] = 7,
			['eastern suburbs portal'] = 8,
			['eyeglass lake portal'] = 9,
			['mt. cucco portal'] = 12,
			['horon village portal'] = 11,
			['temple remains lower portal'] = 12,
			['temple remains upper portal'] = 13
		},
		['eyeglass lake portal'] = {
			['volcanoes east portal'] = 1,
			['subrosia market portal'] = 2,
			['great furnace portal'] = 3,
			['strange brothers portal'] = 4,
			['house of pirates portal'] = 5,
			['volcanoes west portal'] = 6,
			['d8 entrance portal'] = 7,
			['eastern suburbs portal'] = 8,
			['spool swamp portal'] = 9,
			['mt. cucco portal'] = 12,
			['horon village portal'] = 11,
			['temple remains lower portal'] = 12,
			['temple remains upper portal'] = 13
		},
		['horon village portal'] = {
			['volcanoes east portal'] = 1,
			['subrosia market portal'] = 2,
			['great furnace portal'] = 3,
			['strange brothers portal'] = 4,
			['house of pirates portal'] = 5,
			['volcanoes west portal'] = 6,
			['d8 entrance portal'] = 7,
			['eastern suburbs portal'] = 8,
			['spool swamp portal'] = 9,
			['eyeglass lake portal'] = 10,
			['mt. cucco portal'] = 11,
			['temple remains lower portal'] = 12,
			['temple remains upper portal'] = 13
		},
		['mt. cucco portal'] = {
			['volcanoes east portal'] = 1,
			['subrosia market portal'] = 2,
			['great furnace portal'] = 3,
			['strange brothers portal'] = 4,
			['house of pirates portal'] = 5,
			['volcanoes west portal'] = 6,
			['d8 entrance portal'] = 7,
			['eastern suburbs portal'] = 8,
			['spool swamp portal'] = 9,
			['eyeglass lake portal'] = 10,
			['horon village portal'] = 11,
			['temple remains lower portal'] = 12,
			['temple remains upper portal'] = 13
		},
		['temple remains lower portal'] = {
			['volcanoes east portal'] = 1,
			['subrosia market portal'] = 2,
			['great furnace portal'] = 3,
			['strange brothers portal'] = 4,
			['house of pirates portal'] = 5,
			['volcanoes west portal'] = 6,
			['d8 entrance portal'] = 7,
			['eastern suburbs portal'] = 8,
			['spool swamp portal'] = 9,
			['eyeglass lake portal'] = 10,
			['mt. cucco portal'] = 11,
			['horon village portal'] = 12,
			['temple remains upper portal'] = 13
		},
		['temple remains upper portal'] = {
			['volcanoes east portal'] = 1,
			['subrosia market portal'] = 2,
			['great furnace portal'] = 3,
			['strange brothers portal'] = 4,
			['house of pirates portal'] = 5,
			['volcanoes west portal'] = 6,
			['d8 entrance portal'] = 7,
			['eastern suburbs portal'] = 8,
			['spool swamp portal'] = 9,
			['eyeglass lake portal'] = 10,
			['mt. cucco portal'] = 11,
			['horon village portal'] = 12,
			['temple remains lower portal'] = 13
		},
		['volcanoes east portal'] = {
			['subrosia market portal'] = 0,
			['great furnace portal'] = 1,
			['strange brothers portal'] = 2,
			['house of pirates portal'] = 3,
			['volcanoes west portal'] = 4,
			['d8 entrance portal'] = 5,
			['eastern suburbs portal'] = 7,
			['spool swamp portal'] = 8,
			['eyeglass lake portal'] = 9,
			['mt. cucco portal'] = 10,
			['horon village portal'] = 11,
			['temple remains lower portal'] = 12,
			['temple remains upper portal'] = 13
		},
		['subrosia market portal'] = {
			['volcanoes east portal'] = 0,
			['great furnace portal'] = 1,
			['strange brothers portal'] = 2,
			['house of pirates portal'] = 3,
			['volcanoes west portal'] = 4,
			['d8 entrance portal'] = 5,
			['eastern suburbs portal'] = 7,
			['spool swamp portal'] = 8,
			['eyeglass lake portal'] = 9,
			['mt. cucco portal'] = 10,
			['horon village portal'] = 11,
			['temple remains lower portal'] = 12,
			['temple remains upper portal'] = 13
		},
		['great furnace portal'] = {
			['volcanoes east portal'] = 0,
			['subrosia market portal'] = 1,
			['strange brothers portal'] = 2,
			['house of pirates portal'] = 3,
			['volcanoes west portal'] = 4,
			['d8 entrance portal'] = 5,
			['eastern suburbs portal'] = 7,
			['spool swamp portal'] = 8,
			['eyeglass lake portal'] = 9,
			['mt. cucco portal'] = 10,
			['horon village portal'] = 11,
			['temple remains lower portal'] = 12,
			['temple remains upper portal'] = 13
		},
		['strange brothers portal'] = {
			['volcanoes east portal'] = 0,
			['subrosia market portal'] = 1,
			['great furnace portal'] = 2,
			['house of pirates portal'] = 3,
			['volcanoes west portal'] = 4,
			['d8 entrance portal'] = 5,
			['eastern suburbs portal'] = 7,
			['spool swamp portal'] = 8,
			['eyeglass lake portal'] = 9,
			['mt. cucco portal'] = 10,
			['horon village portal'] = 11,
			['temple remains lower portal'] = 12,
			['temple remains upper portal'] = 13
		},
		['house of pirates portal'] = {
			['volcanoes east portal'] = 0,
			['subrosia market portal'] = 1,
			['great furnace portal'] = 2,
			['strange brothers portal'] = 3,
			['volcanoes west portal'] = 4,
			['d8 entrance portal'] = 5,
			['eastern suburbs portal'] = 7,
			['spool swamp portal'] = 8,
			['eyeglass lake portal'] = 9,
			['mt. cucco portal'] = 10,
			['horon village portal'] = 11,
			['temple remains lower portal'] = 12,
			['temple remains upper portal'] = 13
		},
		['volcanoes west portal'] = {
			['volcanoes east portal'] = 0,
			['subrosia market portal'] = 1,
			['great furnace portal'] = 2,
			['strange brothers portal'] = 3,
			['house of pirates portal'] = 4,
			['d8 entrance portal'] = 5,
			['eastern suburbs portal'] = 7,
			['spool swamp portal'] = 8,
			['eyeglass lake portal'] = 9,
			['mt. cucco portal'] = 10,
			['horon village portal'] = 11,
			['temple remains lower portal'] = 12,
			['temple remains upper portal'] = 13
		},
		['d8 entrance portal'] = {
			['volcanoes east portal'] = 0,
			['subrosia market portal'] = 1,
			['great furnace portal'] = 2,
			['strange brothers portal'] = 3,
			['house of pirates portal'] = 4,
			['volcanoes west portal'] = 5,
			['eastern suburbs portal'] = 7,
			['spool swamp portal'] = 8,
			['eyeglass lake portal'] = 9,
			['mt. cucco portal'] = 10,
			['horon village portal'] = 11,
			['temple remains lower portal'] = 12,
			['temple remains upper portal'] = 13
		}
	}
	local portal_mapping = {
		["eastern suburbs portal"] = "suburbs_portal_selector_hidden",
		["spool swamp portal"] = "swamp_portal_selector_hidden",
		["eyeglass lake portal"] = "lake_portal_selector_hidden",
		["mt. cucco portal"] = "mtcucco_portal_selector_hidden",
		["horon village portal"] = "horon_portal_selector_hidden",
		["temple remains lower portal"] = "remains_portal_selector_hidden",
		["temple remains upper portal"] = "upremains_portal_selector_hidden",
		["volcanoes east portal"] = "mountain_portal_selector_hidden",
		["subrosia market portal"] = "market_portal_selector_hidden",
		["great furnace portal"] = "furnace_portal_selector_hidden",
		["strange brothers portal"] = "village_portal_selector_hidden",
		["house of pirates portal"] = "pirates_portal_selector_hidden",
		["volcanoes west portal"] = "volcano_portal_selector_hidden",
		["d8 entrance portal"] = "d8_portal_selector_hidden"
	}
	for region_name, portal_name in pairs(slot_data["portal_connections"]) do
		Tracker:FindObjectForCode(portal_mapping[region_name]).CurrentStage = portal_dictionary[region_name][portal_name]
		Tracker:FindObjectForCode(portal_mapping[portal_name]).CurrentStage = portal_dictionary[portal_name][region_name]
	end

	local dungeon_dictionary = {
		['enter d0'] = 1,
		['enter d1'] = 2,
		['enter d2'] = 3,
		['enter d3'] = 4,
		['enter d4'] = 5,
		['enter d5'] = 6,
		['enter d6'] = 7,
		['enter d7'] = 8,
		['enter d8'] = 9
	}
	local dungeon_mapping = {
		["d0 entrance"] = "d0_ent_selector_hidden",
		["d1 entrance"] = "d1_ent_selector_hidden",
		["d2 entrance"] = "d2_ent_selector_hidden",
		["d3 entrance"] = "d3_ent_selector_hidden",
		["d4 entrance"] = "d4_ent_selector_hidden",
		["d5 entrance"] = "d5_ent_selector_hidden",
		["d6 entrance"] = "d6_ent_selector_hidden",
		["d7 entrance"] = "d7_ent_selector_hidden",
		["d8 entrance"] = "d8_ent_selector_hidden"
	}
	for region_name, dungeon_entrance in pairs(slot_data["dungeon_entrances"]) do
		Tracker:FindObjectForCode(dungeon_mapping[region_name]).CurrentStage = dungeon_dictionary[dungeon_entrance]
	end

	-- deterministic gasha locations
	if (slot_data["deterministic_gasha_locations"]) then
		Tracker:FindObjectForCode("gashareq").CurrentStage = slot_data["deterministic_gasha_locations"]
	end

	if (slot_data["starting_maps_compasses"] == 1) then
		for i=1, 8 do
			Tracker:FindObjectForCode("d"..i.."_map").Active = true
			Tracker:FindObjectForCode("d"..i.."_compass").Active = true
		end
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
	local v = ITEM_DISPLAY_MAPPING[item_name]
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
			end
		elseif v[2] == "consumable" then
			obj.AcquiredCount = obj.AcquiredCount + obj.Increment
			if (obj.AcquiredCount > obj.MaxCount) then
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
			local hintID = COLLECTED_HINTS[HINT_MAPPING[location_id]]
			if (hintID) then
				Tracker:FindObjectForCode(hintID).Active = false
				COLLECTED_HINTS[hintID] = nil
			end
			if location:sub(1, 1) == "@" then
				obj.AvailableChestCount = obj.AvailableChestCount - 1
			else
				obj.Active = true
			end
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
	-- print(string.format("called onNotify: %s, %s, %s", key, dump(value), old_value))
	if value ~= old_value and key == HINTS_ID then
		COLLECTED_HINTS = {}
		for _, hint in ipairs(value) do
			if not hint.found and hint.finding_player == Archipelago.PlayerNumber then
				updateHints(hint.location, hint.item_flags)
			end
		end
		Tracker:FindObjectForCode(HiddenGasha).Active = not Tracker:FindObjectForCode(HiddenGasha).Active
	end
end

function onNotifyLaunch(key, value)
	-- print(string.format("Hint: %s", dump(value)))
	if key == HINTS_ID then
		COLLECTED_HINTS = {}
		for _, hint in ipairs(value) do
			if not hint.found and hint.finding_player == Archipelago.PlayerNumber then
				updateHints(hint.location, hint.item_flags)
			elseif hint.found then
				clearHints(hint.location)
			end
		end
		Tracker:FindObjectForCode(HiddenGasha).Active = not Tracker:FindObjectForCode(HiddenGasha).Active
	end
end

function dump(o, depth)
	if depth == nil then
		depth = 0
	end
	if type(o) == 'table' then
		local tabs = ('\t'):rep(depth)
		local tabs2 = ('\t'):rep(depth + 1)
		local s = '{\n'
		for k, v in pairs(o) do
			if type(k) ~= 'number' then
				k = '"' .. k .. '"'
			end
			s = s .. tabs2 .. '[' .. k .. '] = ' .. dump(v, depth + 1) .. ',\n'
		end
		return s .. tabs .. '}'
	else
		return tostring(o)
	end
end

QUALITY_TO_ACCESS = {
	[0] = 5, -- normal
	[1] = 6, -- progression
	[2] = 3, -- useful
	-- [3] = 0 -- trap?
}
-- called when a location is hinted
function updateHints(locationID, quality)
	local item_codes = HINT_MAPPING[locationID]
	-- print("Hint", dump(item_codes), quality)
	for _, item_code in ipairs(item_codes) do
		if (QUALITY_TO_ACCESS[quality]) then
			COLLECTED_HINTS[item_code] = QUALITY_TO_ACCESS[quality]
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
function onBounce(json)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onBounce: %s", dump_table(json)))
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