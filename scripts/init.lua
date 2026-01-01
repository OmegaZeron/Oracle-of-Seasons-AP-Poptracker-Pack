if (PopVersion >= "0.30.4") then
	Tracker.AllowDeferredLogicUpdate = true
end
require("scripts.utils")
require("scripts.logic.definition_helper")
require("scripts.logic.logic")
require("scripts.logic.location_definitions")
require("scripts.variable_definitions")
require("scripts.logic.logic_helper")
require("scripts.autotracking")
require("scripts.locations")

Tracker:AddItems("items/items.json")

Tracker:AddItems("items/pack_settings.json")
Tracker:AddItems("items/labels.json")
Tracker:AddMaps("maps/maps.json")

Tracker:AddLayouts("layouts/item_grids.json")
Tracker:AddLayouts("layouts/tracker_layouts.json")
Tracker:AddLayouts("layouts/broadcast.json")

require("scripts.autotracking.manual_override")
CreateLuaManualLocationStorage(ManualStorageCode)
ScriptHost:AddOnLocationSectionChangedHandler("manual location handler", ManualLocationHandler)

StateChange()