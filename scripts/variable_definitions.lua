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

DataStorageTable = {
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

CurrentTab = nil
CurrentRoom = nil
-- TODO fill this out when alt starting locations are added
-- used to automatically tab and see seasons when connecting to AP
StartLocationMapping = {
	["impa's house"] = 0x0B6
}
CurrentLocationMapping = {
	-- North Horon
	[0x0B6] = {
		-- from HV
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "SeeSeason", ["season"] = NorthHoronSeason, ["season_hidden"] = NorthHoronSeasonHidden}
	},
	[0x096] = {
		-- D1
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "DungeonEnt", ["dungeon"] = "d1", ["loc"] = "@North Horon/Enter D0/Gnarled Root Dungeon"},
		{["type"] = "SeeSeason", ["season"] = NorthHoronSeason, ["season_hidden"] = NorthHoronSeasonHidden}
	},
	[0x097] = {{["type"] = "SeeSeason", ["season"] = NorthHoronSeason, ["season_hidden"] = NorthHoronSeasonHidden}}, -- from HP
	[0x0A6] = {{["type"] = "SeeSeason", ["season"] = NorthHoronSeason, ["season_hidden"] = NorthHoronSeasonHidden}}, -- red ring old man
	[0x08A] = {
		-- D5
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "DungeonEnt", ["dungeon"] = "d5", ["loc"] = "@North Horon/Enter D5/Unicorn's Cave"},
		{["type"] = "SeeSeason", ["season"] = NorthHoronSeason, ["season_hidden"] = NorthHoronSeasonHidden}
	},
	[0x0B9] = {
		-- lake portal
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "Portal", ["portal"] = EyeglassLakePortalSelector, ["portal_hidden"] = EyeglassLakePortalSelectorHidden},
		{["type"] = "SeeSeason", ["season"] = NorthHoronSeason, ["season_hidden"] = NorthHoronSeasonHidden}
	},
	[0x09A] = {
		-- suburbs portal
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "Portal", ["portal"] = EasternSuburbsPortalSelector, ["portal_hidden"] = EasternSuburbsPortalSelectorHidden},
		{["type"] = "SeeSeason", ["season"] = NorthHoronSeason, ["season_hidden"] = NorthHoronSeasonHidden}
	},

	-- Horon Village
	[0x0C6] = {{["type"] = "SeeSeason", ["season"] = HoronVillageSeason, ["season_hidden"] = HoronVillageSeasonHidden}}, -- from NH
	[0x0C5] = {{["type"] = "SeeSeason", ["season"] = HoronVillageSeason, ["season_hidden"] = HoronVillageSeasonHidden}}, -- from WC
	[0x0F7] = {{["type"] = "SeeSeason", ["season"] = HoronVillageSeason, ["season_hidden"] = HoronVillageSeasonHidden}}, -- Subrosia portal
	[0x0E9] = {{["type"] = "SeeSeason", ["season"] = HoronVillageSeason, ["season_hidden"] = HoronVillageSeasonHidden}}, -- from ES
	[0x3AB] = {
		-- Subrosia lever
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "Portal", ["portal"] = HoronVillagePortalSelector, ["portal_hidden"] = HoronVillagePortalSelectorHidden}
	},

	-- Western Coast
	[0x0C4] = {{["type"] = "SeeSeason", ["season"] = WesternCoastSeason, ["season_hidden"] = WesternCoastSeasonHidden}}, -- from HV
	[0x0D4] = {
		-- D0
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "DungeonEnt", ["dungeon"] = "d0", ["loc"] = "@Western Coast/Enter D0/Hero's Cave"},
		{["type"] = "SeeSeason", ["season"] = WesternCoastSeason, ["season_hidden"] = WesternCoastSeasonHidden}
	},
	[0x0D0] = {
		-- D7
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "DungeonEnt", ["dungeon"] = "d7", ["loc"] = "@Western Coast/Enter D7/Explorer's Crypt"},
		{["type"] = "SeeSeason", ["season"] = WesternCoastSeason, ["season_hidden"] = WesternCoastSeasonHidden}
	},
	[0x0E2] = {
		-- warp from turning in the pirate bell
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "SeeSeason", ["season"] = WesternCoastSeason, ["season_hidden"] = WesternCoastSeasonHidden}
	},

	-- Eastern Suburbs
	[0x0EA] = {{["type"] = "SeeSeason", ["season"] = EasternSuburbsSeason, ["season_hidden"] = EasternSuburbsSeasonHidden}}, -- from HV
	[0x09B] = {{["type"] = "SeeSeason", ["season"] = EasternSuburbsSeason, ["season_hidden"] = EasternSuburbsSeasonHidden}}, -- from Suburbs portal
	[0x07C] = {{["type"] = "SeeSeason", ["season"] = EasternSuburbsSeason, ["season_hidden"] = EasternSuburbsSeasonHidden}}, -- from Sunken/Moblin Road
	[0x08C] = {{["type"] = "SeeSeason", ["season"] = EasternSuburbsSeason, ["season_hidden"] = EasternSuburbsSeasonHidden}}, -- from D2
	[0x09D] = {{["type"] = "SeeSeason", ["season"] = EasternSuburbsSeason, ["season_hidden"] = EasternSuburbsSeasonHidden}}, -- from WoW tree
	[0x08F] = {{["type"] = "SeeSeason", ["season"] = EasternSuburbsSeason, ["season_hidden"] = EasternSuburbsSeasonHidden}}, -- from Holly

	-- Woods of Winter
	[0x09E] = {{["type"] = "SeeSeason", ["season"] = WoodsOfWinterSeason, ["season_hidden"] = WoodsOfWinterSeasonHidden}}, -- tree
	[0x08D] = {
		-- D2
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "DungeonEnt", ["dungeon"] = "d2", ["loc"] = "@Eastern Suburbs/Enter D2/Snake's Remains"},
		{["type"] = "SeeSeason", ["season"] = WoodsOfWinterSeason, ["season_hidden"] = WoodsOfWinterSeasonHidden}
	},
	[0x08E] = {
		-- D2 alt
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "SeeSeason", ["season"] = WoodsOfWinterSeason, ["season_hidden"] = WoodsOfWinterSeasonHidden}
	},
	[0x07E] = {{["type"] = "SeeSeason", ["season"] = WoodsOfWinterSeason, ["season_hidden"] = WoodsOfWinterSeasonHidden}}, -- from Sunken
	[0x07F] = {{["type"] = "SeeSeason", ["season"] = WoodsOfWinterSeason, ["season_hidden"] = WoodsOfWinterSeasonHidden}}, -- Holly

	-- Holodrum Plain
	[0x087] = {{["type"] = "SeeSeason", ["season"] = HolodrumPlainSeason, ["season_hidden"] = HolodrumPlainSeasonHidden}}, -- from NH
	[0x086] = {{["type"] = "SeeSeason", ["season"] = HolodrumPlainSeason, ["season_hidden"] = HolodrumPlainSeasonHidden}}, -- from D1 north
	[0x095] = {{["type"] = "SeeSeason", ["season"] = HolodrumPlainSeason, ["season_hidden"] = HolodrumPlainSeasonHidden}}, -- from D1 west
	[0x0A5] = {{["type"] = "SeeSeason", ["season"] = HolodrumPlainSeason, ["season_hidden"] = HolodrumPlainSeasonHidden}}, -- from red ring old man
	[0x0B3] = {{["type"] = "SeeSeason", ["season"] = HolodrumPlainSeason, ["season_hidden"] = HolodrumPlainSeasonHidden}}, -- from lower SS
	[0x093] = {{["type"] = "SeeSeason", ["season"] = HolodrumPlainSeason, ["season_hidden"] = HolodrumPlainSeasonHidden}}, -- from upper SS
	[0x045] = {{["type"] = "SeeSeason", ["season"] = HolodrumPlainSeason, ["season_hidden"] = HolodrumPlainSeasonHidden}}, -- from Onox
	[0x055] = {{["type"] = "SeeSeason", ["season"] = HolodrumPlainSeason, ["season_hidden"] = HolodrumPlainSeasonHidden}}, -- from natzu W
	[0x066] = {{["type"] = "SeeSeason", ["season"] = HolodrumPlainSeason, ["season_hidden"] = HolodrumPlainSeasonHidden}}, -- from natzu SW
	[0x068] = {{["type"] = "SeeSeason", ["season"] = HolodrumPlainSeason, ["season_hidden"] = HolodrumPlainSeasonHidden}}, -- from natzu SE

	-- Spool Swamp
	[0x083] = {{["type"] = "SeeSeason", ["season"] = SpoolSwampSeason, ["season_hidden"] = SpoolSwampSeasonHidden}}, -- from upper HP
	[0x073] = {{["type"] = "SeeSeason", ["season"] = SpoolSwampSeason, ["season_hidden"] = SpoolSwampSeasonHidden}}, -- from tarm
	[0x0B2] = {{["type"] = "SeeSeason", ["season"] = SpoolSwampSeason, ["season_hidden"] = SpoolSwampSeasonHidden}}, -- from lower HP
	[0x060] = {
		-- d3
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "DungeonEnt", ["dungeon"] = "d3", ["loc"] = "@Spool Swamp/Enter D3/Poison Moth's Lair"}
	},
	[0x0B0] = {
		-- portal
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "Portal", ["portal"] = SpoolSwampPortalSelector, ["portal_hidden"] = SpoolSwampPortalSelectorHidden},
		{["type"] = "SeeSeason", ["season"] = SpoolSwampSeason, ["season_hidden"] = SpoolSwampSeasonHidden}
	},

	-- Sunken City/Mt. Cucco
	[0x05D] = {{["type"] = "SeeSeason", ["season"] = SunkenCitySeason, ["season_hidden"] = SunkenCitySeasonHidden}}, -- from natzu
	[0x02B] = {{["type"] = "SeeSeason", ["season"] = SunkenCitySeason, ["season_hidden"] = SunkenCitySeasonHidden}}, -- from Goron Mountain
	[0x03B] = {{["type"] = "SeeSeason", ["season"] = SunkenCitySeason, ["season_hidden"] = SunkenCitySeasonHidden}}, -- lower gasha spot
	[0x01D] = {
		-- d4
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "DungeonEnt", ["dungeon"] = "d4", ["loc"] = "@Mount Cucco/Enter D4/Dancing Dragon Dungeon"},
		{["type"] = "SeeSeason", ["season"] = SunkenCitySeason, ["season_hidden"] = SunkenCitySeasonHidden}
	},
	[0x01E] = {
		-- portal
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "Portal", ["portal"] = MtCuccoPortalSelector, ["portal_hidden"] = MtCuccoPortalSelectorHidden},
		{["type"] = "SeeSeason", ["season"] = SunkenCitySeason, ["season_hidden"] = SunkenCitySeasonHidden}
	},

	-- Lost Woods
	[0x063] = {{["type"] = "SeeSeason", ["season"] = LostWoodsSeason, ["season_hidden"] = LostWoodsSeasonHidden}}, -- from SS
	[0x020] = {{["type"] = "SeeSeason", ["season"] = LostWoodsSeason, ["season_hidden"] = LostWoodsSeasonHidden}}, -- from tarm

	-- Tarm Ruins
	[0x010] = {{["type"] = "SeeSeason", ["season"] = TarmRuinsSeason, ["season_hidden"] = TarmRuinsSeasonHidden}}, -- from LW
	[0x000] = {
		-- d6
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "DungeonEnt", ["dungeon"] = "d6", ["loc"] = "@Tarm Ruins/Enter D6/Ancient Ruins"},
		{["type"] = "SeeSeason", ["season"] = TarmRuinsSeason, ["season_hidden"] = TarmRuinsSeasonHidden}
	},

	-- Temple Remains
	[0x035] = {{["type"] = "SeeSeason", ["season"] = TempleRemainsSeason, ["season_hidden"] = TempleRemainsSeasonHidden}}, -- from HP
	[0x037] = {{["type"] = "SeeSeason", ["season"] = TempleRemainsSeason, ["season_hidden"] = TempleRemainsSeasonHidden}}, -- from Goron Mountain
	[0x025] = {
		-- lower portal
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "Portal", ["portal"] = LowerRemainsPortalSelector, ["portal_hidden"] = LowerRemainsPortalSelectorHidden},
		{["type"] = "SeeSeason", ["season"] = TempleRemainsSeason, ["season_hidden"] = TempleRemainsSeasonHidden}
	},
	[0x004] = {{["type"] = "SeeSeason", ["season"] = TempleRemainsSeason, ["season_hidden"] = TempleRemainsSeasonHidden}}, -- upper remains
	[0x3A8] = {
		-- upper portal
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "Portal", ["portal"] = UpperRemainsPortalSelector, ["portal_hidden"] = UpperRemainsPortalSelectorHidden},
	},

	-- Subrosia
	[0x105] = {
		-- mountain
		{["type"] = "Autotab", ["tab"] = {"Subrosia"}},
		{["type"] = "Portal", ["portal"] = MountainPortalSelector, ["portal_hidden"] = MountainPortalSelectorHidden}
	},
	[0x157] = {
		-- market
		{["type"] = "Autotab", ["tab"] = {"Subrosia"}},
		{["type"] = "Portal", ["portal"] = MarketPortalSelector, ["portal_hidden"] = MarketPortalSelectorHidden}
	},
	[0x153] = {
		-- village
		{["type"] = "Autotab", ["tab"] = {"Subrosia"}},
		{["type"] = "Portal", ["portal"] = SubrosiaVillagePortalSelector, ["portal_hidden"] = SubrosiaVillagePortalSelectorHidden}
	},
	[0x172] = {
		-- pirates
		{["type"] = "Autotab", ["tab"] = {"Subrosia"}},
		{["type"] = "Portal", ["portal"] = PiratesPortalSelector, ["portal_hidden"] = PiratesPortalSelectorHidden}
	},
	[0x174] = {{["type"] = "Autotab", ["tab"] = {"Subrosia"}}}, -- from pirate ship
	[0x14A] = {
		-- furnace
		{["type"] = "Autotab", ["tab"] = {"Subrosia"}},
		{["type"] = "Portal", ["portal"] = FurnacePortalSelector, ["portal_hidden"] = FurnacePortalSelectorHidden}
	},
	[0x113] = {
		-- volcano
		{["type"] = "Autotab", ["tab"] = {"Subrosia"}},
		{["type"] = "Portal", ["portal"] = VolcanoPortalSelector, ["portal_hidden"] = VolcanoPortalSelectorHidden}
	},
	[0x120] = {
		-- d8 portal
		{["type"] = "Autotab", ["tab"] = {"Subrosia"}},
		{["type"] = "Portal", ["portal"] = D8PortalSelector, ["portal_hidden"] = D8PortalSelectorHidden}
	},
	[0x100] = {
		-- d8
		{["type"] = "Autotab", ["tab"] = {"Subrosia"}},
		{["type"] = "DungeonEnt", ["dungeon"] = "d8", ["loc"] = "@Subrosia/Enter D8/Sword and Shield Maze"}
	},

	-- D0
	[0x404] = {
		-- main entrance
		{["type"] = "Autotab", ["tab"] = {"Holodrum"}},
		{["type"] = "DungeonIn", ["dungeon"] = "d0"}
	},
	[0x406] = {{["type"] = "DungeonIn", ["dungeon"] = "d0"}}, -- sword chest
	-- D1
	[0x41C] = {
		{["type"] = "Autotab", ["tab"] = {"Gnarled Root Dungeon"}},
		{["type"] = "DungeonIn", ["dungeon"] = "d1"}
	},
	-- D2
	[0x439] = {
		-- main entrance
		{["type"] = "Autotab", ["tab"] = {"Snake's Remains", "Snake's Remains Front"}},
		{["type"] = "DungeonIn", ["dungeon"] = "d2"}
	},
	[0x437] = {{["type"] = "Autotab", ["tab"] = {"Snake's Remains", "Snake's Remains Front"}}}, -- alt entrance
	[0x433] = {{["type"] = "Autotab", ["tab"] = {"Snake's Remains", "Snake's Remains Front"}}}, -- bomb maze
	[0x432] = {{["type"] = "Autotab", ["tab"] = {"Snake's Remains", "Snake's Remains Front"}}}, -- cracked wall with ropes
	[0x421] = {{["type"] = "Autotab", ["tab"] = {"Snake's Remains", "Snake's Remains Back"}}}, -- Facade warp
	[0x61E] = {{["type"] = "Autotab", ["tab"] = {"Snake's Remains", "Snake's Remains Back"}}}, -- 2D section
	[0x42C] = {{["type"] = "DungeonIn", ["dungeon"] = "d2"}}, -- essence
	-- D3
	[0x44B] = {
		-- main entrance
		{["type"] = "Autotab", ["tab"] = {"Poison Moth's Lair", "Poison Moth's Lair B1F"}},
		{["type"] = "DungeonIn", ["dungeon"] = "d3"}
	},
	[0x441] = {{["type"] = "Autotab", ["tab"] = {"Poison Moth's Lair", "Poison Moth's Lair B1F"}}}, -- water room
	[0x452] = {{["type"] = "Autotab", ["tab"] = {"Poison Moth's Lair", "Poison Moth's Lair 1F"}}}, -- above water room
	[0x63B] = {{["type"] = "Autotab", ["tab"] = {"Poison Moth's Lair", "Poison Moth's Lair B1F"}}}, -- trampoline owl 2D section
	[0x43E] = {{["type"] = "Autotab", ["tab"] = {"Poison Moth's Lair", "Poison Moth's Lair 1F"}}}, -- trampoline owl
	[0x63D] = {{["type"] = "Autotab", ["tab"] = {"Poison Moth's Lair", "Poison Moth's Lair B1F"}}}, -- trampoline 2D section
	[0x43F] = {{["type"] = "Autotab", ["tab"] = {"Poison Moth's Lair", "Poison Moth's Lair 1F"}}}, -- trampoline
	[0x44A] = {{["type"] = "Autotab", ["tab"] = {"Poison Moth's Lair", "Poison Moth's Lair B1F"}}}, -- mimic room
	[0x459] = {{["type"] = "Autotab", ["tab"] = {"Poison Moth's Lair", "Poison Moth's Lair 1F"}}}, -- pol's voice room
	[0x448] = {{["type"] = "Autotab", ["tab"] = {"Poison Moth's Lair", "Poison Moth's Lair B1F"}}}, -- omuai
	[0x457] = {{["type"] = "Autotab", ["tab"] = {"Poison Moth's Lair", "Poison Moth's Lair 1F"}}}, -- peahat after omuai
	-- D4
	[0x481] = {
		-- main entrance
		{["type"] = "Autotab", ["tab"] = {"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 2F"}},
		{["type"] = "DungeonIn", ["dungeon"] = "d4"}
	},
	[0x479] = {{["type"] = "Autotab", ["tab"] = {"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 2F"}}}, -- left water stairs
	[0x466] = {{["type"] = "Autotab", ["tab"] = {"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 1F"}}}, -- antifairy wizzrobe maze
	[0x477] = {{["type"] = "Autotab", ["tab"] = {"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 2F"}}}, -- big jump owl
	[0x465] = {{["type"] = "Autotab", ["tab"] = {"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 1F"}}}, -- pre-minecart
	[0x46A] = {{["type"] = "Autotab", ["tab"] = {"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 1F"}}}, -- Agunima warp
	[0x469] = {{["type"] = "Autotab", ["tab"] = {"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 1F"}}}, -- beamos
	[0x461] = {{["type"] = "Autotab", ["tab"] = {"Dancing Dragon Dungeon", "Dancing Dragon Dungeon 2F"}}}, -- pre-gohma
	-- D5
	[0x4A7] = {
		{["type"] = "Autotab", ["tab"] = {"Unicorn's Cave"}},
		{["type"] = "DungeonIn", ["dungeon"] = "d5"}
	},
	-- D6
	[0x4BA] = {
		-- main entrance
		{["type"] = "Autotab", ["tab"] = {"Ancient Ruins", "Ancient Ruins 1F, 2F"}},
		{["type"] = "DungeonIn", ["dungeon"] = "d6"}
	},
	[0x4C2] = {{["type"] = "Autotab", ["tab"] = {"Ancient Ruins", "Ancient Ruins 1F, 2F"}}}, -- spiny beetle trampoline
	[0x4CC] = {{["type"] = "Autotab", ["tab"] = {"Ancient Ruins", "Ancient Ruins 3F, 4F, 5F"}}}, -- darknuts
	[0x4CF] = {{["type"] = "Autotab", ["tab"] = {"Ancient Ruins", "Ancient Ruins 3F, 4F, 5F"}}}, -- ball and chain trooper
	[0x4C6] = {{["type"] = "Autotab", ["tab"] = {"Ancient Ruins", "Ancient Ruins 1F, 2F"}}}, -- indy jones drop
	[0x4C5] = {{["type"] = "Autotab", ["tab"] = {"Ancient Ruins", "Ancient Ruins 1F, 2F"}}}, -- indy jones stairs
	[0x4CE] = {{["type"] = "Autotab", ["tab"] = {"Ancient Ruins", "Ancient Ruins 3F, 4F, 5F"}}}, -- hooded stalfos
	[0x4CB] = {{["type"] = "Autotab", ["tab"] = {"Ancient Ruins", "Ancient Ruins 3F, 4F, 5F"}}}, -- before Vire
	[0x4C8] = {{["type"] = "Autotab", ["tab"] = {"Ancient Ruins", "Ancient Ruins 3F, 4F, 5F"}}}, -- Vire warp
	[0x4C1] = {{["type"] = "Autotab", ["tab"] = {"Ancient Ruins", "Ancient Ruins 1F, 2F"}}}, -- below Vire
	-- D7
	[0x55B] = {
		-- main entrance
		{["type"] = "Autotab", ["tab"] = {"Explorer's Crypt", "Explorer's Crypt 1F, B1F"}},
		{["type"] = "DungeonIn", ["dungeon"] = "d7"}
	},
	[0x54A] = {{["type"] = "Autotab", ["tab"] = {"Explorer's Crypt", "Explorer's Crypt 1F, B1F"}}}, -- quicksand antifairy
	[0x539] = {{["type"] = "Autotab", ["tab"] = {"Explorer's Crypt", "Explorer's Crypt B2F"}}}, -- moving platform keese
	[0x547] = {{["type"] = "Autotab", ["tab"] = {"Explorer's Crypt", "Explorer's Crypt 1F, B1F"}}}, -- magnet chest
	[0x537] = {{["type"] = "Autotab", ["tab"] = {"Explorer's Crypt", "Explorer's Crypt B2F"}}}, -- magnunesu
	[0x54C] = {{["type"] = "Autotab", ["tab"] = {"Explorer's Crypt", "Explorer's Crypt 1F, B1F"}}}, -- poe 2 water room
	[0x543] = {{["type"] = "Autotab", ["tab"] = {"Explorer's Crypt", "Explorer's Crypt B2F"}}}, -- flying tile key block
	[0x542] = {{["type"] = "Autotab", ["tab"] = {"Explorer's Crypt", "Explorer's Crypt B2F"}}}, -- Poe Sisters warp
	-- D8
	[0x587] = {
		-- main entrance
		{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze 1F"}},
		{["type"] = "DungeonIn", ["dungeon"] = "d8"}
	},
	[0x577] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze 1F"}}}, -- green zol key block
	[0x55E] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze B1F"}}}, -- rope pots
	[0x563] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze B1F"}}}, -- big blade trap
	[0x75D] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze 1F"}}}, -- lava 2D section right
	[0x75C] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze 1F"}}}, -- lava 2D section left
	[0x569] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze B1F"}}}, -- lava roller
	[0x56E] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze B1F"}}}, -- magunesu and gels
	[0x58B] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze 1F"}}}, -- ice spike room
	[0x573] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze B1F"}}}, -- silent watch
	[0x58D] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze 1F"}}}, -- below armos chest
	[0x574] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze B1F"}}}, -- ball and chain trooper
	[0x58E] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze 1F"}}}, -- trapped by magnet ball
	[0x571] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze B1F"}}}, -- three eye owl
	[0x58C] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze 1F"}}}, -- bomb whisps
	[0x572] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze B1F"}}}, -- Frypolar warp
	[0x56C] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze B1F"}}}, -- after Frypolar
	[0x58A] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze 1F"}}}, -- after 7 torches
	[0x584] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze 1F"}}}, -- ice pickup room
	[0x589] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze 1F"}}}, -- SE ice drop
	[0x588] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze 1F"}}}, -- SW ice drop
	[0x583] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze 1F"}}}, -- beamos
	[0x56B] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze B1F"}}}, -- SE lava flow
	[0x568] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze B1F"}}}, -- lava trapped stairs
	[0x56A] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze B1F"}}}, -- SW lava flow
	[0x567] = {{["type"] = "Autotab", ["tab"] = {"Sword and Shield Maze", "Sword and Shield Maze B1F"}}}, -- stairs below beamos
}

JewelKeys = {RoundJewel, SquareJewel, PyramidJewel, XJewel}
LostWoodsDefault = {3, 2, 0, 1}

-- ShopPrices = {
-- 	[HoronShop1Price] = 20,
-- 	[HoronShop2Price] = 30,
-- 	[HoronShop3Price] = 150,
-- 	[AdvanceShop1Price] = 100,
-- 	[AdvanceShop2Price] = 100,
-- 	[AdvanceShop3Price] = 100,
-- 	[MemberShop1Price] = 300,
-- 	[MemberShop2Price] = 300,
-- 	[MemberShop3Price] = 200,
-- 	[SyrupShop1Price] = 100,
-- 	[SyrupShop2Price] = 300,
-- 	[SyrupShop3Price] = 300,
-- 	[SpoolSwampScrubPrice] = 100,
-- 	[SamasaCaveScrubPrice] = 100,
-- 	[D2ScrubPrice] = 30,
-- 	[D4ScrubPrice] = 20,
-- 	[SubrosianMarket2Price] = 30,
-- 	[SubrosianMarket3Price] = 40,
-- 	[SubrosianMarket4Price] = 50,
-- 	[SubrosianMarket5Price] = 60
-- }
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
		['mt. cucco portal'] = 12,
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
		['mt. cucco portal'] = 12,
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
		['mt. cucco portal'] = 12,
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
	["d0 entrance"] = 1,
	["d1 entrance"] = 2,
	["d2 entrance"] = 3,
	["d3 entrance"] = 4,
	["d4 entrance"] = 5,
	["d5 entrance"] = 6,
	["d6 entrance"] = 7,
	["d7 entrance"] = 8,
	["d8 entrance"] = 9
}
DungeonMapping = {
	["enter d0"] = "d0_ent_selector_hidden",
	["enter d1"] = "d1_ent_selector_hidden",
	["enter d2"] = "d2_ent_selector_hidden",
	["enter d3"] = "d3_ent_selector_hidden",
	["enter d4"] = "d4_ent_selector_hidden",
	["enter d5"] = "d5_ent_selector_hidden",
	["enter d6"] = "d6_ent_selector_hidden",
	["enter d7"] = "d7_ent_selector_hidden",
	["enter d8"] = "d8_ent_selector_hidden"
}
SeedMapping = {
	["Ember Seeds"] = EmberSeeds,
	["Mystery Seeds"] = MysterySeeds,
	["Scent Seeds"] = ScentSeeds,
	["Pegasus Seeds"] = PegasusSeeds,
	["Gale Seeds"] = GaleSeeds
}
WildItemLocationMapping = {
	[EmberSeeds] = {
		"@Dancing Dragon Dungeon/Wild Ember Seeds/1F",
		"@Unicorn's Cave/Armos Puzzle Room/Ember Seeds",
		"@Explorer's Crypt/Wild Ember Seeds/1F"
	},
	[MysterySeeds] = {"@Sword and Shield Maze/Wild Mystery Seeds/B1F"},
	[Bombs] = {"@Snake's Remains/Wild Bombs/"}
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

QualityToAccess = {
	[0] = 5, -- normal
	[1] = 6, -- progression
	[2] = 3, -- useful
	-- [3] = 0 -- trap?
}