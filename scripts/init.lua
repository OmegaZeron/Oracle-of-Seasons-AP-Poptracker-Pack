if (PopVersion >= "0.30.4") then
	Tracker.AllowDeferredLogicUpdate = true
end
ScriptHost:LoadScript("scripts/logic/definition_helper.lua")
ScriptHost:LoadScript("scripts/logic/logic.lua")
ScriptHost:LoadScript("scripts/logic/location_definitions.lua")
ScriptHost:LoadScript("scripts/variable_definitions.lua")
ScriptHost:LoadScript("scripts/logic/logic_helper.lua")
ScriptHost:LoadScript("scripts/utils.lua")
ScriptHost:LoadScript("scripts/autotracking.lua")
ScriptHost:LoadScript("scripts/locations.lua")

Tracker:AddItems("items/items.json")
Tracker:AddItems("items/hints.json")

Tracker:AddItems("items/pack_settings.json")
Tracker:AddItems("items/labels.json")
Tracker:AddMaps("maps/maps.json")

Tracker:AddLayouts("layouts/item_grids.json")
Tracker:AddLayouts("layouts/tracker_layouts.json")
Tracker:AddLayouts("layouts/broadcast.json")

if (Tracker.ActiveVariantUID:find("withouthint")) then
	Tracker:FindObjectForCode("showhints").CurrentStage = 0
end

StartLocation = OoSLocation.New("StartLocation")
StartLocation:connect_one_way_entrance(LowerNorthHoron)

StateChange()