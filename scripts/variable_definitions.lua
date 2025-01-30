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
	[HoronShop1Price] = 0,
	[HoronShop2Price] = 0,
	[HoronShop3Price] = 0,
	[AdvanceShop1Price] = 0,
	[AdvanceShop2Price] = 0,
	[AdvanceShop3Price] = 0,
	[MemberShop1Price] = 0,
	[MemberShop2Price] = 0,
	[MemberShop3Price] = 0,
	[SyrupShop1Price] = 0,
	[SyrupShop2Price] = 0,
	[SyrupShop3Price] = 0,
	[SpoolSwampScrubPrice] = 0,
	[SamasaCaveScrubPrice] = 0,
	[D2ScrubPrice] = 0,
	[D4ScrubPrice] = 0,
	[SubrosianMarket2Price] = 0,
	[SubrosianMarket3Price] = 0,
	[SubrosianMarket4Price] = 0,
	[SubrosianMarket5Price] = 0
}
WildSeeds = {
	["Dancing Dragon Dungeon/Wild Ember Seeds/1F"] = EmberSeeds,
	["Unicorn's Cave/Armos Puzzle Room/Ember Seeds"] = EmberSeeds,
	["Explorer's Crypt/Wild Ember Seeds/1F"] = EmberSeeds,
	["Sword and Shield Maze/Wild Mystery Seeds/B1F"] = MysterySeeds
}
RegionToSeasonMapping = {
	["EYEGLASS_LAKE"] = "north_horon_season_hidden",
	["EASTERN_SUBURBS"] = "suburbs_season_hidden",
	["WOODS_OF_WINTER"] = "wow_season_hidden",
	["HOLODRUM_PLAIN"] = "plain_season_hidden",
	["SPOOL_SWAMP"] = "swamp_season_hidden",
	["SUNKEN_CITY"] = "sunken_season_hidden",
	["LOST_WOODS"] = "lost_woods_season_hidden",
	["TARM_RUINS"] = "tarm_ruins_season_hidden",
	["WESTERN_COAST"] = "coast_season_hidden",
	["TEMPLE_REMAINS"] = "remains_season_hidden",
	["HORON_VILLAGE"] = "horon_village_season_hidden"
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
PortalMapping = {
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
WildSeedLocationMapping = {
	[EmberSeeds] = {
		"@Dancing Dragon Dungeon/Wild Ember Seeds/1F",
		"@Unicorn's Cave/Armos Puzzle Room/Ember Seeds",
		"@Explorer's Crypt/Wild Ember Seeds/1F"
	},
	[MysterySeeds] = {"@Sword and Shield Maze/Wild Mystery Seeds/B1F"}
}

SeeSeasonVars = {
	{"see horon village", "horon_village_season", "@Horon Village/See the Season/Horon Village"},
	{"see north horon", "north_horon_season", "@North Horon/See the Season/North Horon"},
	{"see eastern suburbs", "suburbs_season", "@Eastern Suburbs/See the Season/Eastern Suburbs"},
	{"see woods of winter", "wow_season", "@Woods of Winter/See the Season/Woods of Winter"},
	{"see holodrum plain", "plain_season", "@Holodrum Plain/See the Season/Holodrum Plain"},
	{"see lost woods", "lost_woods_season", "@Lost Woods/See the Season/Lost Woods"},
	{"see tarm ruins", "tarm_ruins_season", "@Tarm Ruins/See the Season/Tarm Ruins"},
	{"see spool swamp", "swamp_season", "@Spool Swamp/See the Season/Spool Swamp"},
	{"see sunken city", "sunken_season", "@Sunken City/See the Season/Sunken City"},
	{"see western coast", "coast_season", "@Western Coast/See the Season/Western Coast"},
	{"see temple remains", "temple_season", "@Temple Remains/See the Season/Temple Remains"}
}

QualityToAccess = {
	[0] = 5, -- normal
	[1] = 6, -- progression
	[2] = 3, -- useful
	-- [3] = 0 -- trap?
}