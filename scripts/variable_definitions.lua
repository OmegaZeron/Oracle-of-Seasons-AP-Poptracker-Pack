-- Globals
LOADED = false

EssenceKeys = {D1Essence, D2Essence, D3Essence, D4Essence, D5Essence, D6Essence, D7Essence, D8Essence}
GashaIDToLocation = {
	["Horon Village/Horon Village Gasha Spot/Near Mayor"] = HoronGasha,
	["North Horon/North Horon Gasha Spot/Near Impa"] = NorthHoronGasha,
	["North Horon/Eyeglass Lake Gasha Spot/Near D5"] = EyeglassGasha,
	["Western Coast/Western Coast Gasha Spot/Near Graveyard"] = WesternCoastGasha,
	["Eastern Suburbs/Eastern Suburbs Gasha Spot/Under Bushes"] = SuburbsGasha,
	["Holodrum Plain/Holodrum Plain Island Gasha Spot/Under Bushes"] = HolodrumPlainIsland,
	["Holodrum Plain/Lower Holodrum Plain Gasha Spot/Dig It Up"] = SouthHolodrumPlainGasha,
	["Holodrum Plain/Onox Gasha Spot/Dig It Up"] = OnoxGasha,
	["Spool Swamp/Spool Swamp North Gasha Spot/Near Keyhole"] = SwampNorthGashaSpot,
	["Spool Swamp/Spool Swamp South Gasha Spot/Near Portal"] = SwampSouthGashaSpot,
	["Sunken City/Sunken City Gasha Spot/Near Master Diver"] = SunkenGashaSpot,
	["Mount Cucco/Mount Cucco Gasha Spot/Behind Mushrooms"] = MtCuccoGasha,
	["Goron Mountain/Goron Mountain West Gasha Spot/Dig It Up"] = GoronGashaWest,
	["Goron Mountain/Goron Mountain East Gasha Spot/Under Rocks"] = GoronGashaEast,
	["Eastern Suburbs/Samasa Desert Gasha Spot/Surrounded by Cacti"] = SamasaDesertGasha,
	["Tarm Ruins/Tarm Ruins Gasha Spot/Dig It Up"] = TarmGasha
}

DataStorageLocationTable = {
	["Planted Mount Cucco Gasha Spot"] = "@Mount Cucco/Mount Cucco Gasha Spot/Behind Mushrooms",
	["Harvested Mount Cucco Gasha Spot"] = "@Mount Cucco/Mount Cucco Gasha Spot/Harvested",
	["Planted Tarm Ruins Gasha Spot"] = "@Tarm Ruins/Tarm Ruins Gasha Spot/Dig It Up",
	["Harvested Tarm Ruins Gasha Spot"] = "@Tarm Ruins/Tarm Ruins Gasha Spot/Harvested",
	["Planted Goron Mountain West Gasha Spot"] = "@Goron Mountain/Goron Mountain West Gasha Spot/Dig It Up",
	["Harvested Goron Mountain West Gasha Spot"] = "@Goron Mountain/Goron Mountain West Gasha Spot/Harvested",
	["Planted Goron Mountain East Gasha Spot"] = "@Goron Mountain/Goron Mountain East Gasha Spot/Under Rocks",
	["Harvested Goron Mountain East Gasha Spot"] = "@Goron Mountain/Goron Mountain East Gasha Spot/Harvested",
	["Planted Onox Gasha Spot"] = "@Holodrum Plain/Onox Gasha Spot/Dig It Up",
	["Harvested Onox Gasha Spot"] = "@Holodrum Plain/Onox Gasha Spot/Harvested",
	["Planted Sunken City Gasha Spot"] = "@Sunken City/Sunken City Gasha Spot/Near Master Diver",
	["Harvested Sunken City Gasha Spot"] = "@Sunken City/Sunken City Gasha Spot/Harvested",
	["Planted Holodrum Plain Island Gasha Spot"] = "@Holodrum Plain/Holodrum Plain Island Gasha Spot/Under Bushes",
	["Harvested Holodrum Plain Island Gasha Spot"] = "@Holodrum Plain/Holodrum Plain Island Gasha Spot/Harvested",
	["Planted Spool Swamp North Gasha Spot"] = "@Spool Swamp/Spool Swamp North Gasha Spot/Near Keyhole",
	["Harvested Spool Swamp North Gasha Spot"] = "@Spool Swamp/Spool Swamp North Gasha Spot/Harvested",
	["Planted Eyeglass Lake Gasha Spot"] = "@North Horon/Eyeglass Lake Gasha Spot/Near D5",
	["Harvested Eyeglass Lake Gasha Spot"] = "@North Horon/Eyeglass Lake Gasha Spot/Harvested",
	["Planted Lower Holodrum Plain Gasha Spot"] = "@Holodrum Plain/Lower Holodrum Plain Gasha Spot/Dig It Up",
	["Harvested Lower Holodrum Plain Gasha Spot"] = "@Holodrum Plain/Lower Holodrum Plain Gasha Spot/Harvested",
	["Planted North Horon Gasha Spot"] = "@North Horon/North Horon Gasha Spot/Near Impa",
	["Harvested North Horon Gasha Spot"] = "@North Horon/North Horon Gasha Spot/Harvested",
	["Planted Eastern Suburbs Gasha Spot"] = "@Eastern Suburbs/Eastern Suburbs Gasha Spot/Under Bushes",
	["Harvested Eastern Suburbs Gasha Spot"] = "@Eastern Suburbs/Eastern Suburbs Gasha Spot/Harvested",
	["Planted Spool Swamp South Gasha Spot"] = "@Spool Swamp/Spool Swamp South Gasha Spot/Near Portal",
	["Harvested Spool Swamp South Gasha Spot"] = "@Spool Swamp/Spool Swamp South Gasha Spot/Harvested",
	["Planted Samasa Desert Gasha Spot"] = "@Eastern Suburbs/Samasa Desert Gasha Spot/Surrounded by Cacti",
	["Harvested Samasa Desert Gasha Spot"] = "@Eastern Suburbs/Samasa Desert Gasha Spot/Harvested",
	["Planted Western Coast Gasha Spot"] = "@Western Coast/Western Coast Gasha Spot/Near Graveyard",
	["Harvested Western Coast Gasha Spot"] = "@Western Coast/Western Coast Gasha Spot/Harvested",
	["Planted Horon Village Gasha Spot"] = "@Horon Village/Horon Village Gasha Spot/Near Mayor",
	["Harvested Horon Village Gasha Spot"] = "@Horon Village/Horon Village Gasha Spot/Harvested",
}
DataStorageItemTable = {
	["Golden Octorock Beaten"] = GoldenOctorok,
	["Golden Moblin Beaten"] = GoldenMoblin,
	["Golden Darknut Beaten"] = GoldenDarknut,
	["Golden Lynel Beaten"] = GoldenLynel,
	["Obtained Bombs"] = Bombs,
	["Obtained Ember"] = EmberSeeds,
	["Obtained Scent"] = ScentSeeds,
	["Obtained Pegasus"] = PegasusSeeds,
	["Obtained Gale"] = GaleSeeds,
	["Obtained Mystery"] = MysterySeeds,
	["Blew Up Volcano"] = EventFireworks,
}

EventTable = {
	["@Snake's Remains/Reach the Rupee Room/"] = EventSnakeRupees,
	["@Ancient Ruins/Reach the Rupee Room/1F"] = EventAncientRupees
}

DefaultAutoCollectLocationTable = {
	["Tarm Ruins/Lost Woods/Lost Woods: Pedestal Item"] = {"@Tarm Ruins/Pedestal Sequence/Serenade the Scrub"},
	["North Horon/Golden Beasts Reward/North Horon: Golden Beasts Old Man"] = {GoldenDarknut, GoldenLynel, GoldenOctorok, GoldenMoblin}
}

DefaultSeasons = {
	["north_horon_season"] = 3,
	["suburbs_season"] = 2,
	["wow_season"] = 1,
	["plain_season"] = 0,
	["swamp_season"] = 2,
	["sunken_season"] = 1,
	["lost_woods_season"] = 2,
	["tarm_ruins_season"] = 0,
	["coast_season"] = 3,
	["remains_season"] = 3,
	["horon_village_season"] = 4
}

AutoCollectLocationTable = {["Any"] = DefaultAutoCollectLocationTable}

CurrentTab = nil
CurrentRoom = nil
-- TODO fill this out when alt starting locations are added
-- used to automatically tab and see seasons when connecting to AP
StartLocationMapping = {
	[StartImpa] = 0x0B6
}

--- constructor for CurrentLocationMapping data
---@param tab table
---@return table
function Autotab(tab)
	return {["type"] = "Autotab", ["tab"] = tab}
end
--- constructor for CurrentLocationMapping data
---@param season string
---@param seasonHidden string
---@return table
function SeeSeason(season, seasonHidden)
	return {["type"] = "SeeSeason", ["season"] = season, ["season_hidden"] = seasonHidden}
end
--- constructor for CurrentLocationMapping data
---@param dungeon string
---@param loc string
---@return table
function DungeonEnt(dungeon, loc)
	return {["type"] = "DungeonEnt", ["dungeon"] = dungeon, ["loc"] = loc}
end
--- constructor for CurrentLocationMapping data
---@param dungeon string
---@param loc string?
---@return table
function DungeonIn(dungeon, loc)
	return {["type"] = "DungeonIn", ["dungeon"] = dungeon, ["loc"] = loc}
end
--- constructor for CurrentLocationMapping data
---@param portal string
---@param portalHidden string
---@return table
function Portal(portal, portalHidden)
	return {["type"] = "Portal", ["portal"] = portal, ["portal_hidden"] = portalHidden}
end
--- constructor for CurrentLocationMapping data
---@return table
function Natzu()
	return {["type"] = "Natzu"}
end
--- constructor for CurrentLocationMapping data
---@param func function
---@return table
function Custom(func)
	return {["type"] = "Custom", ["function"] = func}
end
CurrentLocationMapping = {
	-- North Horon
	[0x0B6] = {
		-- from HV
		Autotab({"Holodrum"}),
		SeeSeason(NorthHoronSeason, NorthHoronSeasonHidden)
	},
	[0x096] = {
		-- D1
		Autotab({"Holodrum"}),
		DungeonEnt("d1", "@North Horon/Enter D1/Gnarled Root Dungeon"),
		SeeSeason(NorthHoronSeason, NorthHoronSeasonHidden)
	},
	[0x097] = {SeeSeason(NorthHoronSeason, NorthHoronSeasonHidden)}, -- from HP
	[0x0A6] = {SeeSeason(NorthHoronSeason, NorthHoronSeasonHidden)}, -- red ring old man
	[0x08A] = {
		-- D5
		Autotab({"Holodrum"}),
		DungeonEnt("d5", "@North Horon/Enter D5/Unicorn's Cave"),
		SeeSeason(NorthHoronSeason, NorthHoronSeasonHidden)
	},
	[0x0B9] = {
		-- lake portal
		Autotab({"Holodrum"}),
		Portal(EyeglassLakePortalSelector, EyeglassLakePortalSelectorHidden),
		SeeSeason(NorthHoronSeason, NorthHoronSeasonHidden)
	},
	[0x09A] = {
		-- suburbs portal
		Autotab({"Holodrum"}),
		Portal(EasternSuburbsPortalSelector, EasternSuburbsPortalSelectorHidden),
		SeeSeason(NorthHoronSeason, NorthHoronSeasonHidden)
	},

	-- Horon Village
	[0x0C6] = {SeeSeason(HoronVillageSeason, HoronVillageSeasonHidden)}, -- from NH
	[0x0C5] = {SeeSeason(HoronVillageSeason, HoronVillageSeasonHidden)}, -- from WC
	[0x0F7] = {SeeSeason(HoronVillageSeason, HoronVillageSeasonHidden)}, -- Subrosia portal
	[0x0E9] = {SeeSeason(HoronVillageSeason, HoronVillageSeasonHidden)}, -- from ES
	[0x3AB] = {
		-- Subrosia lever
		Autotab({"Holodrum"}),
		Portal(HoronVillagePortalSelector, HoronVillagePortalSelectorHidden)
	},

	-- Western Coast
	[0x0C4] = {SeeSeason(WesternCoastSeason, WesternCoastSeasonHidden)}, -- from HV
	[0x0D4] = {
		-- D0
		Autotab({"Holodrum"}),
		DungeonEnt("d0", "@Western Coast/Enter D0/Hero's Cave"),
		SeeSeason(WesternCoastSeason, WesternCoastSeasonHidden)
	},
	[0x0D0] = {
		-- D7
		Autotab({"Holodrum"}),
		DungeonEnt("d7", "@Western Coast/Enter D7/Explorer's Crypt"),
		SeeSeason(WesternCoastSeason, WesternCoastSeasonHidden)
	},
	[0x0E2] = {
		-- warp from turning in the pirate bell
		Autotab({"Holodrum"}),
		SeeSeason(WesternCoastSeason, WesternCoastSeasonHidden)
	},

	-- Eastern Suburbs
	[0x0EA] = {SeeSeason(EasternSuburbsSeason, EasternSuburbsSeasonHidden)}, -- from HV
	[0x09B] = {SeeSeason(EasternSuburbsSeason, EasternSuburbsSeasonHidden)}, -- from Suburbs portal
	[0x07C] = {
		-- from Sunken/Moblin Road
		SeeSeason(EasternSuburbsSeason, EasternSuburbsSeasonHidden),
		Autotab({"Holodrum"})
	},
	[0x08C] = {SeeSeason(EasternSuburbsSeason, EasternSuburbsSeasonHidden)}, -- from D2
	[0x09D] = {SeeSeason(EasternSuburbsSeason, EasternSuburbsSeasonHidden)}, -- from WoW tree
	[0x08F] = {SeeSeason(EasternSuburbsSeason, EasternSuburbsSeasonHidden)}, -- from Holly

	[0x0CF] = {
		-- Samasa Desert entrance to Linked Cave
		Autotab({"Holodrum"}),
		DungeonEnt("lc", "@Western Coast/Enter D0 (Linked)/Hero's Cave (Linked)")
	},

	-- Woods of Winter
	[0x09E] = {SeeSeason(WoodsOfWinterSeason, WoodsOfWinterSeasonHidden)}, -- tree
	[0x08D] = {
		-- D2
		Autotab({"Holodrum"}),
		DungeonEnt("d2", "@Eastern Suburbs/Enter D2/Snake's Remains"),
		SeeSeason(WoodsOfWinterSeason, WoodsOfWinterSeasonHidden)
	},
	[0x08E] = {
		-- D2 alt
		Autotab({"Holodrum"}),
		SeeSeason(WoodsOfWinterSeason, WoodsOfWinterSeasonHidden)
	},
	[0x07D] = {SeeSeason(WoodsOfWinterSeason, WoodsOfWinterSeasonHidden)}, -- bomb cave
	[0x07E] = {SeeSeason(WoodsOfWinterSeason, WoodsOfWinterSeasonHidden)}, -- from Sunken
	[0x07F] = {SeeSeason(WoodsOfWinterSeason, WoodsOfWinterSeasonHidden)}, -- Holly

	-- Holodrum Plain
	[0x087] = {SeeSeason(HolodrumPlainSeason, HolodrumPlainSeasonHidden)}, -- from NH
	[0x086] = {SeeSeason(HolodrumPlainSeason, HolodrumPlainSeasonHidden)}, -- from D1 north
	[0x095] = {SeeSeason(HolodrumPlainSeason, HolodrumPlainSeasonHidden)}, -- from D1 west
	[0x0A5] = {SeeSeason(HolodrumPlainSeason, HolodrumPlainSeasonHidden)}, -- from red ring old man
	[0x0B3] = {SeeSeason(HolodrumPlainSeason, HolodrumPlainSeasonHidden)}, -- from lower SS
	[0x093] = {SeeSeason(HolodrumPlainSeason, HolodrumPlainSeasonHidden)}, -- from upper SS
	[0x045] = {SeeSeason(HolodrumPlainSeason, HolodrumPlainSeasonHidden)}, -- from Onox
	[0x055] = {
		-- from natzu W
		SeeSeason(HolodrumPlainSeason, HolodrumPlainSeasonHidden),
		Autotab({"Holodrum"})
	},
	[0x066] = {
		-- from natzu SW
		SeeSeason(HolodrumPlainSeason, HolodrumPlainSeasonHidden),
		Autotab({"Holodrum"})
	},
	[0x068] = {
		-- from natzu SE
		SeeSeason(HolodrumPlainSeason, HolodrumPlainSeasonHidden),
		Autotab({"Holodrum"})
	},

	-- Spool Swamp
	[0x083] = {SeeSeason(SpoolSwampSeason, SpoolSwampSeasonHidden)}, -- from upper HP
	[0x073] = {SeeSeason(SpoolSwampSeason, SpoolSwampSeasonHidden)}, -- from tarm
	[0x0B2] = {SeeSeason(SpoolSwampSeason, SpoolSwampSeasonHidden)}, -- from lower HP
	[0x060] = {
		-- d3
		Autotab({"Holodrum"}),
		DungeonEnt("d3", "@Spool Swamp/Enter D3/Poison Moth's Lair")
	},
	[0x0B0] = {
		-- portal
		Autotab({"Holodrum"}),
		Portal(SpoolSwampPortalSelector, SpoolSwampPortalSelectorHidden),
		SeeSeason(SpoolSwampSeason, SpoolSwampSeasonHidden)
	},

	-- Natzu
	[0x048] = {
		-- from Goron Mountain
		Autotab({"Holodrum", "Natzu"}),
		Natzu()
	},
	[0x04C] = {
		-- from Sunken
		Autotab({"Holodrum", "Natzu"}),
		Natzu()
	},
	[0x056] = {
		-- from Holodrum Plain West
		Autotab({"Holodrum", "Natzu"}),
		Natzu()
	},
	[0x058] = {
		-- from Holodrum Plain East
		Autotab({"Holodrum", "Natzu"}),
		Natzu()
	},
	[0x07A] = {
		-- from Moblin Keep
		Autotab({"Holodrum", "Natzu"}),
		Natzu()
	},

	-- Goron Mountain
	[0x038] = {Autotab({"Holodrum"})}, -- from Natzu

	-- Sunken City/Mt. Cucco
	[0x05D] = {
		-- from natzu
		SeeSeason(SunkenCitySeason, SunkenCitySeasonHidden),
		Autotab({"Holodrum"})
	},
	[0x02B] = {SeeSeason(SunkenCitySeason, SunkenCitySeasonHidden)}, -- from Goron Mountain
	[0x03B] = {SeeSeason(SunkenCitySeason, SunkenCitySeasonHidden)}, -- lower gasha spot
	[0x01D] = {
		-- d4
		Autotab({"Holodrum"}),
		DungeonEnt("d4", "@Mount Cucco/Enter D4/Dancing Dragon Dungeon"),
		SeeSeason(SunkenCitySeason, SunkenCitySeasonHidden)
	},
	[0x01E] = {
		-- portal
		Autotab({"Holodrum"}),
		Portal(MtCuccoPortalSelector, MtCuccoPortalSelectorHidden),
		SeeSeason(SunkenCitySeason, SunkenCitySeasonHidden)
	},

	-- Lost Woods
	[0x063] = {SeeSeason(LostWoodsSeason, LostWoodsSeasonHidden)}, -- from SS
	[0x020] = {SeeSeason(LostWoodsSeason, LostWoodsSeasonHidden)}, -- from tarm
	[0x040] = {SeeSeason(LostWoodsSeason, LostWoodsSeasonHidden)}, -- from pedestal

	-- Tarm Ruins
	[0x010] = {
		-- from Lost Woods
		SeeSeason(TarmRuinsSeason, TarmRuinsSeasonHidden),
		Custom(function()
			Tracker:FindObjectForCode("@Tarm Ruins/Lost Woods Sequence/Shield the Scrub").AvailableChestCount = 0
		end)
	},
	[0x000] = {
		-- d6
		Autotab({"Holodrum"}),
		DungeonEnt("d6", "@Tarm Ruins/Enter D6/Ancient Ruins"),
		SeeSeason(TarmRuinsSeason, TarmRuinsSeasonHidden)
	},

	-- Temple Remains
	[0x035] = {SeeSeason(TempleRemainsSeason, TempleRemainsSeasonHidden)}, -- from HP
	[0x037] = {SeeSeason(TempleRemainsSeason, TempleRemainsSeasonHidden)}, -- from Goron Mountain
	[0x025] = {
		-- lower portal
		Autotab({"Holodrum"}),
		Portal(LowerRemainsPortalSelector, LowerRemainsPortalSelectorHidden),
		SeeSeason(TempleRemainsSeason, TempleRemainsSeasonHidden)
	},
	[0x004] = {SeeSeason(TempleRemainsSeason, TempleRemainsSeasonHidden)}, -- upper remains
	[0x3A8] = {
		-- upper portal
		Autotab({"Holodrum"}),
		Portal(UpperRemainsPortalSelector, UpperRemainsPortalSelectorHidden),
	},

	-- Subrosia
	[0x105] = {
		-- mountain
		Autotab({"Subrosia"}),
		Portal(MountainPortalSelector, MountainPortalSelectorHidden)
	},
	[0x157] = {
		-- market
		Autotab({"Subrosia"}),
		Portal(MarketPortalSelector, MarketPortalSelectorHidden)
	},
	[0x153] = {
		-- village
		Autotab({"Subrosia"}),
		Portal(SubrosiaVillagePortalSelector, SubrosiaVillagePortalSelectorHidden)
	},
	[0x172] = {
		-- pirates
		Autotab({"Subrosia"}),
		Portal(PiratesPortalSelector, PiratesPortalSelectorHidden)
	},
	[0x174] = {Autotab({"Subrosia"})}, -- from pirate ship
	[0x14A] = {
		-- furnace
		Autotab({"Subrosia"}),
		Portal(FurnacePortalSelector, FurnacePortalSelectorHidden)
	},
	[0x113] = {
		-- volcano
		Autotab({"Subrosia"}),
		Portal(VolcanoPortalSelector, VolcanoPortalSelectorHidden)
	},
	[0x120] = {
		-- d8 portal
		Autotab({"Subrosia"}),
		Portal(D8PortalSelector, D8PortalSelectorHidden)
	},
	[0x100] = {
		-- d8
		Autotab({"Subrosia"}),
		DungeonEnt("d8", "@Subrosia/Enter D8/Sword and Shield Maze")
	},

	-- D0
	[0x404] = {
		-- main entrance
		Autotab({"Hero's Cave"}),
		DungeonIn("d0", "@Hero's Cave/Exit the Dungeon/")
	},
	[0x405] = {Autotab({"Hero's Cave"})}, -- alt entrance
	[0x406] = {DungeonIn("d0", "@Hero's Cave/Exit the Dungeon/")}, -- sword chest
	-- Linked Cave
	[0x530] = {
		-- main entrance
		Autotab({"Hero's Cave (Linked)"}),
		DungeonIn("lc", "@Hero's Cave (Linked)/Exit the Dungeon/")
	},
	[0x52C] = {Autotab({"Hero's Cave (Linked)"})}, -- alt entrance
	[0x534] = {DungeonIn("lc", "@Hero's Cave (Linked)/Exit the Dungeon/")},
	-- D1
	[0x41C] = {
		Autotab({"Gnarled Root Dungeon"}),
		DungeonIn("d1")
	},
	-- D2
	[0x439] = {
		-- main entrance
		Autotab({"Snake's Remains", "Snake's Remains Front"}),
		DungeonIn("d2", "@Snake's Remains/Exit the Dungeon/")
	},
	-- rupee room
	[0x42E] = {Custom(function()
		Tracker:FindObjectForCode(EventSnakeRupees).Active = true
		Tracker:FindObjectForCode("@Snake's Remains/Reach the Rupee Room/").AvailableChestCount = 0
	end)},
	[0x437] = {Autotab({"Snake's Remains", "Snake's Remains Front"})}, -- alt entrance
	[0x433] = {Autotab({"Snake's Remains", "Snake's Remains Front"})}, -- bomb maze
	[0x432] = {Autotab({"Snake's Remains", "Snake's Remains Front"})}, -- cracked wall with ropes
	[0x421] = {Autotab({"Snake's Remains", "Snake's Remains Back"})}, -- Facade warp
	[0x61E] = {Autotab({"Snake's Remains", "Snake's Remains Back"})}, -- 2D section
	[0x42C] = {DungeonIn("d2")}, -- essence
	-- D3
	[0x44B] = {
		-- main entrance
		Autotab({"Poison Moth's Lair", "Poison Moth's Lair B1F"}),
		DungeonIn("d3")
	},
	[0x441] = {Autotab({"Poison Moth's Lair", "Poison Moth's Lair B1F"})}, -- water room
	[0x452] = {Autotab({"Poison Moth's Lair", "Poison Moth's Lair 1F"})}, -- above water room
	[0x63B] = {Autotab({"Poison Moth's Lair", "Poison Moth's Lair B1F"})}, -- trampoline owl 2D section
	[0x43E] = {Autotab({"Poison Moth's Lair", "Poison Moth's Lair 1F"})}, -- trampoline owl
	[0x63D] = {Autotab({"Poison Moth's Lair", "Poison Moth's Lair B1F"})}, -- trampoline 2D section
	[0x43F] = {Autotab({"Poison Moth's Lair", "Poison Moth's Lair 1F"})}, -- trampoline
	[0x44A] = {Autotab({"Poison Moth's Lair", "Poison Moth's Lair B1F"})}, -- mimic room
	[0x459] = {Autotab({"Poison Moth's Lair", "Poison Moth's Lair 1F"})}, -- pol's voice room
	[0x448] = {Autotab({"Poison Moth's Lair", "Poison Moth's Lair B1F"})}, -- omuai
	[0x457] = {Autotab({"Poison Moth's Lair", "Poison Moth's Lair 1F"})}, -- peahat after omuai
	[0x453] = {Autotab({"Poison Moth's Lair", "Poison Moth's Lair 1F"})}, -- mothula
	[0x443] = {Autotab({"Poison Moth's Lair", "Poison Moth's Lair B1F"})}, -- essence
	-- D4
	[0x481] = {
		-- main entrance
		Autotab({"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 2F"}),
		DungeonIn("d4")
	},
	[0x479] = {Autotab({"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 2F"})}, -- left water stairs
	[0x466] = {Autotab({"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 1F"})}, -- antifairy wizzrobe maze
	[0x477] = {Autotab({"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 2F"})}, -- big jump owl
	[0x465] = {Autotab({"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 1F"})}, -- pre-minecart
	[0x46A] = {Autotab({"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 1F"})}, -- Agunima warp
	[0x469] = {Autotab({"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 1F"})}, -- beamos
	[0x461] = {Autotab({"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 2F"})}, -- pre-gohma
	-- D5
	[0x4A7] = {
		Autotab({"Unicorn's Cave"}),
		DungeonIn("d5")
	},
	-- D6
	[0x4BA] = {
		-- main entrance
		Autotab({"Ancient Ruins", "Ancient Ruins 1F, 2F"}),
		DungeonIn("d6")
	},
	-- rupee room
	[0x4BB] = {Custom(function()
		Tracker:FindObjectForCode(EventAncientRupees).Active = true
		Tracker:FindObjectForCode("@Ancient Ruins/Reach the Rupee Room/1F").AvailableChestCount = 0
	end)},
	[0x4C2] = {Autotab({"Ancient Ruins", "Ancient Ruins 1F, 2F"})}, -- spiny beetle trampoline
	[0x4CC] = {Autotab({"Ancient Ruins", "Ancient Ruins 3F, 4F, 5F"})}, -- darknuts
	[0x4CF] = {Autotab({"Ancient Ruins", "Ancient Ruins 3F, 4F, 5F"})}, -- ball and chain trooper
	[0x4C6] = {Autotab({"Ancient Ruins", "Ancient Ruins 1F, 2F"})}, -- indy jones drop
	[0x4C5] = {Autotab({"Ancient Ruins", "Ancient Ruins 1F, 2F"})}, -- indy jones stairs
	[0x4CE] = {Autotab({"Ancient Ruins", "Ancient Ruins 3F, 4F, 5F"})}, -- hooded stalfos
	[0x4CB] = {Autotab({"Ancient Ruins", "Ancient Ruins 3F, 4F, 5F"})}, -- before Vire
	[0x4C8] = {Autotab({"Ancient Ruins", "Ancient Ruins 3F, 4F, 5F"})}, -- Vire warp
	[0x4C1] = {Autotab({"Ancient Ruins", "Ancient Ruins 1F, 2F"})}, -- below Vire
	-- D7
	[0x55B] = {
		-- main entrance
		Autotab({"Explorer's Crypt", "Explorer's Crypt 1F, B1F"}),
		DungeonIn("d7")
	},
	[0x54A] = {Autotab({"Explorer's Crypt", "Explorer's Crypt 1F, B1F"})}, -- quicksand antifairy
	[0x539] = {Autotab({"Explorer's Crypt", "Explorer's Crypt B2F"})}, -- moving platform keese
	[0x547] = {Autotab({"Explorer's Crypt", "Explorer's Crypt 1F, B1F"})}, -- magnet chest
	[0x537] = {Autotab({"Explorer's Crypt", "Explorer's Crypt B2F"})}, -- magnunesu
	[0x54C] = {Autotab({"Explorer's Crypt", "Explorer's Crypt 1F, B1F"})}, -- poe 2 water room
	[0x543] = {Autotab({"Explorer's Crypt", "Explorer's Crypt B2F"})}, -- flying tile key block
	[0x542] = {Autotab({"Explorer's Crypt", "Explorer's Crypt B2F"})}, -- Poe Sisters warp
	-- D8
	[0x587] = {
		-- main entrance
		Autotab({"Sword and Shield Maze", "Sword and Shield Maze 1F"}),
		DungeonIn("d8")
	},
	[0x577] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze 1F"})}, -- green zol key block
	[0x55E] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze B1F"})}, -- rope pots
	[0x563] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze B1F"})}, -- big blade trap
	[0x75D] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze 1F"})}, -- lava 2D section right
	[0x75C] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze 1F"})}, -- lava 2D section left
	[0x569] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze B1F"})}, -- lava roller
	[0x56E] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze B1F"})}, -- magunesu and gels
	[0x58B] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze 1F"})}, -- ice spike room
	[0x573] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze B1F"})}, -- silent watch
	[0x58D] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze 1F"})}, -- below armos chest
	[0x574] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze B1F"})}, -- ball and chain trooper
	[0x58E] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze 1F"})}, -- trapped by magnet ball
	[0x571] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze B1F"})}, -- three eye owl
	[0x58C] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze 1F"})}, -- bomb whisps
	[0x572] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze B1F"})}, -- Frypolar warp
	[0x56C] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze B1F"})}, -- after Frypolar
	[0x58A] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze 1F"})}, -- after 7 torches
	[0x584] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze 1F"})}, -- ice pickup room
	[0x589] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze 1F"})}, -- SE ice drop
	[0x588] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze 1F"})}, -- SW ice drop
	[0x583] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze 1F"})}, -- beamos
	[0x56B] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze B1F"})}, -- SE lava flow
	[0x568] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze B1F"})}, -- lava trapped stairs
	[0x56A] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze B1F"})}, -- SW lava flow
	[0x567] = {Autotab({"Sword and Shield Maze", "Sword and Shield Maze B1F"})}, -- stairs below beamos
}

JewelKeys = {RoundJewel, SquareJewel, PyramidJewel, XJewel}
LostWoodsDefault = {3, 2, 0, 1}

-- With no AP connection, we can't tell how shop logic works, so default to just "CanFarm"
ShopPrices = {
	[HoronShopPrice] = 0,
	[AdvanceShopPrice] = 0,
	[MemberShopPrice] = 0,
	[SyrupShopPrice] = 0,
	[SpoolSwampScrubPrice] = 0,
	[SamasaCaveScrubPrice] = 0,
	[D2ScrubPrice] = 0,
	[D4ScrubPrice] = 0,
	[SubrosianMarketPrice] = 0,
}
OldMenValues = {
	[OldManHoron] = {0, EventHoronOldMan},
	[OldManD1] = {0, EventNorthHoronOldMan},
	[OldManHolly] = {0, EventSuburbsOldMan},
	[OldManBlaino] = {0, EventNorthHolPlainOldMan},
	[OldManRuul] = {0, EventSouthHolPlainOldMan},
	[OldManGoron] = {0, EventGoronOldMan},
	[OldManD6] = {0, EventTarmOldMan},
	[OldManWestCoast] = {0, EventCoastOldMan}
}
WildItems = {
	["Dancing Dragon Dungeon/Wild Ember Seeds/1F"] = EmberSeeds,
	["Unicorn's Cave/Armos Puzzle Room/Ember Seeds"] = EmberSeeds,
	["Explorer's Crypt/Wild Ember Seeds/1F"] = EmberSeeds,
	["Sword and Shield Maze/Wild Mystery Seeds/B1F"] = MysterySeeds,
	["Snake's Remains/Wild Bombs/"] = Bombs
}
RegionToSeasonMapping = {
	["EYEGLASS_LAKE"] = NorthHoronSeasonHidden,
	["EASTERN_SUBURBS"] = EasternSuburbsSeasonHidden,
	["WOODS_OF_WINTER"] = WoodsOfWinterSeasonHidden,
	["HOLODRUM_PLAIN"] = HolodrumPlainSeasonHidden,
	["SPOOL_SWAMP"] = SpoolSwampSeasonHidden,
	["SUNKEN_CITY"] = SunkenCitySeasonHidden,
	["LOST_WOODS"] = LostWoodsSeasonHidden,
	["TARM_RUINS"] = TarmRuinsSeasonHidden,
	["WESTERN_COAST"] = WesternCoastSeasonHidden,
	["TEMPLE_REMAINS"] = TempleRemainsSeasonHidden,
	["HORON_VILLAGE"] = HoronVillageSeasonHidden
}
DefaultSeasonOptionMapping = {
	["vanilla"] = 0,
	["randomized"] = 1,
	["random_singularity"] = 2,
	["spring_singularity"] = 3,
	["summer_singularity"] = 4,
	["autumn_singularity"] = 5,
	["winter_singularity"] = 6
}
---@enum linkedCave
LinkedEnum = {
	Disabled = 0x00, -- 0b0000
	Samasa = 0x01, -- 0b0001
	NoAltEnt = 0x02, -- 0b0010
}
-- value is the stage of the setting
LinkedCaveMapping = {
	[LinkedEnum.Disabled] = 0,
	[LinkedEnum.Samasa] = 1,
	[LinkedEnum.NoAltEnt] = 1,
}
PortalDictionary = {
	['eastern suburbs portal'] = {
		['unknown'] = 0,
		['volcanoes east portal'] = 1,
		['subrosia market portal'] = 2,
		['great furnace portal'] = 3,
		['strange brothers portal'] = 4,
		['house of pirates portal'] = 5,
		['volcanoes west portal'] = 6,
		['d8 entrance portal'] = 7,
		['spool swamp portal'] = 8,
		['eyeglass lake portal'] = 9,
		['mt. cucco portal'] = 10,
		['horon village portal'] = 11,
		['temple remains lower portal'] = 12,
		['temple remains upper portal'] = 13
	},
	['spool swamp portal'] = {
		['unknown'] = 0,
		['volcanoes east portal'] = 1,
		['subrosia market portal'] = 2,
		['great furnace portal'] = 3,
		['strange brothers portal'] = 4,
		['house of pirates portal'] = 5,
		['volcanoes west portal'] = 6,
		['d8 entrance portal'] = 7,
		['eastern suburbs portal'] = 8,
		['eyeglass lake portal'] = 9,
		['mt. cucco portal'] = 10,
		['horon village portal'] = 11,
		['temple remains lower portal'] = 12,
		['temple remains upper portal'] = 13
	},
	['eyeglass lake portal'] = {
		['unknown'] = 0,
		['volcanoes east portal'] = 1,
		['subrosia market portal'] = 2,
		['great furnace portal'] = 3,
		['strange brothers portal'] = 4,
		['house of pirates portal'] = 5,
		['volcanoes west portal'] = 6,
		['d8 entrance portal'] = 7,
		['eastern suburbs portal'] = 8,
		['spool swamp portal'] = 9,
		['mt. cucco portal'] = 10,
		['horon village portal'] = 11,
		['temple remains lower portal'] = 12,
		['temple remains upper portal'] = 13
	},
	['horon village portal'] = {
		['unknown'] = 0,
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
		['unknown'] = 0,
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
		['unknown'] = 0,
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
		['unknown'] = 0,
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
		['unknown'] = 6,
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
		['unknown'] = 6,
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
		['unknown'] = 6,
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
		['unknown'] = 6,
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
		['unknown'] = 6,
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
		['unknown'] = 6,
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
		['unknown'] = 6,
		['eastern suburbs portal'] = 7,
		['spool swamp portal'] = 8,
		['eyeglass lake portal'] = 9,
		['mt. cucco portal'] = 10,
		['horon village portal'] = 11,
		['temple remains lower portal'] = 12,
		['temple remains upper portal'] = 13
	}
}
PortalMapping = {
	["eastern suburbs portal"] = EasternSuburbsPortalSelectorHidden,
	["spool swamp portal"] = SpoolSwampPortalSelectorHidden,
	["eyeglass lake portal"] = EyeglassLakePortalSelectorHidden,
	["mt. cucco portal"] = MtCuccoPortalSelectorHidden,
	["horon village portal"] = HoronVillagePortalSelectorHidden,
	["temple remains lower portal"] = LowerRemainsPortalSelectorHidden,
	["temple remains upper portal"] = UpperRemainsPortalSelectorHidden,
	["volcanoes east portal"] = MountainPortalSelectorHidden,
	["subrosia market portal"] = MarketPortalSelectorHidden,
	["great furnace portal"] = FurnacePortalSelectorHidden,
	["strange brothers portal"] = SubrosiaVillagePortalSelectorHidden,
	["house of pirates portal"] = PiratesPortalSelectorHidden,
	["volcanoes west portal"] = VolcanoPortalSelectorHidden,
	["d8 entrance portal"] = D8PortalSelectorHidden
}
DungeonDictionary = {
	["d0"] = 1,
	["d11"] = 2,
	["d1"] = 3,
	["d2"] = 4,
	["d3"] = 5,
	["d4"] = 6,
	["d5"] = 7,
	["d6"] = 8,
	["d7"] = 9,
	["d8"] = 10
}
DungeonList = {"d0","lc","d1","d2","d3","d4","d5","d6","d7","d8"}
DungeonMapping = {
	["d0"] = "d0_ent_selector_hidden",
	["d11"] = "lc_ent_selector_hidden",
	["d1"] = "d1_ent_selector_hidden",
	["d2"] = "d2_ent_selector_hidden",
	["d3"] = "d3_ent_selector_hidden",
	["d4"] = "d4_ent_selector_hidden",
	["d5"] = "d5_ent_selector_hidden",
	["d6"] = "d6_ent_selector_hidden",
	["d7"] = "d7_ent_selector_hidden",
	["d8"] = "d8_ent_selector_hidden"
}
EssencesInWorld = {
	["Fertile Soil"] = false,
	["Gift of Time"] = false,
	["Bright Sun"] = false,
	["Soothing Rain"] = false,
	["Nurturing Warmth"] = false,
	["Blowing Wind"] = false,
	["Seed of Life"] = false,
	["Changing Seasons"] = false
}
EssenceTable = {
	{"Fertile Soil", "d1_label"},
	{"Gift of Time", "d2_label"},
	{"Bright Sun", "d3_label"},
	{"Soothing Rain", "d4_label"},
	{"Nurturing Warmth", "d5_label"},
	{"Blowing Wind", "d6_label"},
	{"Seed of Life", "d7_label"},
	{"Changing Seasons", "d8_label"}
}
EssenceMapping = {
	[D1Essence] = 1,
	[D2Essence] = 2,
	[D3Essence] = 3,
	[D4Essence] = 4,
	[D5Essence] = 5,
	[D6Essence] = 6,
	[D7Essence] = 7,
	[D8Essence] = 8
}
SeedMapping = {
	[0] = EmberSeeds,
	[1] = ScentSeeds,
	[2] = PegasusSeeds,
	[3] = GaleSeeds,
	[4] = MysterySeeds
}

IndexToSeason = {
	[0] = Spring,
	[1] = Summer,
	[2] = Autumn,
	[3] = Winter,
	[4] = UnknownSeason
}

SeeSeasonVars = {
	{"see horon village", HoronVillageSeason, "@Horon Village/See the Season/Horon Village"},
	{"see north horon", NorthHoronSeason, "@North Horon/See the Season/North Horon"},
	{"see eastern suburbs", EasternSuburbsSeason, "@Eastern Suburbs/See the Season/Eastern Suburbs"},
	{"see woods of winter", WoodsOfWinterSeason, "@Woods of Winter/See the Season/Woods of Winter"},
	{"see holodrum plain", HolodrumPlainSeason, "@Holodrum Plain/See the Season/Holodrum Plain"},
	{"see lost woods", LostWoodsSeason, "@Lost Woods/See the Season/Lost Woods"},
	{"see tarm ruins", TarmRuinsSeason, "@Tarm Ruins/See the Season/Tarm Ruins"},
	{"see spool swamp", SpoolSwampSeason, "@Spool Swamp/See the Season/Spool Swamp"},
	{"see sunken city", SunkenCitySeason, "@Sunken City/See the Season/Sunken City"},
	{"see western coast", WesternCoastSeason, "@Western Coast/See the Season/Western Coast"},
	{"see temple remains", TempleRemainsSeason, "@Temple Remains/See the Season/Temple Remains"}
}
DungeonSetVars = {
	{"d0 entrance selector", D0EntranceSelector, "@Western Coast/Enter D0/Hero's Cave"},
	{"lc entrance selector", LCEntranceSelector, "@Western Coast/Enter D0 (Linked)/Hero's Cave (Linked)"},
	{"d1 entrance selector", D1EntranceSelector, "@North Horon/Enter D1/Gnarled Root Dungeon"},
	{"d2 entrance selector", D2EntranceSelector, "@Eastern Suburbs/Enter D2/Snake's Remains"},
	{"d3 entrance selector", D3EntranceSelector, "@Spool Swamp/Enter D3/Poison Moth's Lair"},
	{"d4 entrance selector", D4EntranceSelector, "@Mount Cucco/Enter D4/Dancing Dragon Dungeon"},
	{"d5 entrance selector", D5EntranceSelector, "@North Horon/Enter D5/Unicorn's Cave"},
	{"d6 entrance selector", D6EntranceSelector, "@Tarm Ruins/Enter D6/Ancient Ruins"},
	{"d7 entrance selector", D7EntranceSelector, "@Western Coast/Enter D7/Explorer's Crypt"},
	{"d8 entrance selector", D8EntranceSelector, "@Subrosia/Enter D8/Sword and Shield Maze"}
}
PortalSetVars = {
	{"eastern suburbs portal", EasternSuburbsPortalSelector, "@Eastern Suburbs/Eastern Suburbs Portal/"},
	{"spool swamp portal", SpoolSwampPortalSelector, "@Spool Swamp/Spool Swamp Portal/"},
	{"eyeglass lake portal", EyeglassLakePortalSelector, "@North Horon/Eyeglass Lake Portal/"},
	{"mt. cucco portal", MtCuccoPortalSelector, "@Mount Cucco/Mt. Cucco Portal/"},
	{"horon village portal", HoronVillagePortalSelector, "@Horon Village/Horon Portal/"},
	{"temple remains lower portal", LowerRemainsPortalSelector, "@Temple Remains/Temple Remains Lower Portal/"},
	{"temple remains upper portal", UpperRemainsPortalSelector, "@Temple Remains/Temple Remains Upper Portal/"},
	{"volcanoes east portal", MountainPortalSelector, "@Subrosia/Subrosian Mountain Portal/"},
	{"subrosia market portal", MarketPortalSelector, "@Subrosia/Subrosian Market Portal/"},
	{"great furnace portal", FurnacePortalSelector, "@Subrosia/Furnace Portal/"},
	{"strange brothers portal", SubrosiaVillagePortalSelector, "@Subrosia/Subrosian Village Portal/"},
	{"house of pirates portal", PiratesPortalSelector, "@Subrosia/Pirate Portal/"},
	{"volcanoes west portal", VolcanoPortalSelector, "@Subrosia/Subrosian Volcano Portal/"},
	{"d8 entrance portal", D8PortalSelector, "@Subrosia/D8 Portal/"}
}

if Highlight then
	PriorityToHighlight = {
		[0] = Highlight.Unspecified,
		[10] = Highlight.NoPriority,
		[20] = Highlight.Avoid,
		[30] = Highlight.Priority,
		[40] = Highlight.None -- found
	}
end