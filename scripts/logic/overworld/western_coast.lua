EastWesternCoast:connect_one_way(Maple, CanMapleTrade)
EastWesternCoast:connect_one_way(WesternCoastFindSeason)
EastWesternCoast:connect_one_way(BlackBeast, function()
	return All(
		CanShootLongTorches,
		MysterySeeds,
		CanArmorKill
	)
end)
EastWesternCoast:connect_one_way(GoldenDarknutKill, function()
	return All(
		WesternCoastSpring,
		Any(
			CanSwordKill,
			Dimitri
		)
	)
end)
EastWesternCoast:connect_one_way_entrance(HerosCave)
HerosCave:connect_two_ways_entrance(HerosCaveFoyer, function()
	return Any(
		ShuffleDungeonOff,
		D0LeadsToD0
	)
end)

EastWesternCoast:connect_one_way_entrance(HerosCaveLedge, function()
	return All(
		CanDestroyBushFlute(true),
		D0AltVanilla
	)
end)
HerosCaveLedge:connect_one_way_entrance(HerosCaveFoyer)
HerosCaveFoyer:connect_one_way(HerosCaveLedge, function() return Has(D0AltRemoved) end)
HerosCaveFoyer:connect_one_way_entrance(HerosCaveUnderground, function()
	return Any(
		CanNormalKill,
		All(
			Boomerang,
			MediumLogic
		)
	)
end)
HerosCaveFoyer:connect_one_way_entrance(HerosCavePostKey, function()
	return Any(
		D0SmallKey,
		D0MasterKey
	)
end)

EastWesternCoast:connect_one_way_entrance(HoronVillage)
EastWesternCoast:connect_two_ways_entrance(WestWesternCoast, function()
	return All(
		CanReach(Pirates),
		PolishedBell
	)
end, {Pirates})
WestWesternCoast:connect_one_way(WesternCoastChest)
WestWesternCoast:connect_one_way(WesternCoastGasha, CanPlantGasha)
WestWesternCoast:connect_one_way_entrance(WesternCoastOldMan, CanBurnTrees)
WestWesternCoast:connect_one_way_entrance(WesternCoastHouse)
WesternCoastHouse:connect_one_way(WesternCoastHouseChest)
WesternCoastHouse:connect_one_way_entrance(WesternCoastStump, function()
	return All(
		CanBombWall,
		Any(
			Feather,
			HardLogic
		)
	)
end)
WesternCoastStump:connect_one_way(GoldenDarknutKill, function()
	return All(
		CanReach(Pirates),
		PolishedBell,
		Spring,
		Any(
			CanSwordKill,
			Dimitri
		)
	)
end, {Pirates})
WestWesternCoast:connect_one_way_entrance(Graveyard, function()
	return Any(
		WesternCoastSummer,
		All(
			Summer,
			CanBombWall,
			Any(
				Feather,
				HardLogic
			)
		),
		All(
			Jump3,
			Any(
				WesternCoastSpring,
				All(
					Spring,
					CanBombWall,
					Any(
						Feather,
						HardLogic
					)
				)
			)
		)
	)
end)
WestWesternCoast:connect_one_way_entrance(GraveyardWinter, function()
	return All(
		Jump3,
		Any(
			WesternCoastWinter,
			All(
				Winter,
				CanBombWall,
				Any(
					Feather,
					HardLogic
				)
			)
		)
	)
end)
WestWesternCoast:connect_one_way_entrance(GraveyardAutumn, function()
	return All(
		Jump3,
		Any(
			WesternCoastAutumn,
			All(
				Autumn,
				CanBombWall,
				Any(
					Feather,
					HardLogic
				)
			)
		)
	)
end)
Graveyard:connect_one_way_entrance(ExplorersCrypt)
GraveyardAutumn:connect_one_way_entrance(ExplorersCrypt)
GraveyardAutumn:connect_one_way(GraveyardHP, function()
	return Any(
		CanDestroyMushroom,
		AccessibilityLevel.Inspect
	)
end)
Graveyard:connect_one_way(GraveyardHP, function() return AccessibilityLevel.Inspect end)
GraveyardWinter:connect_one_way(GraveyardHP, function() return AccessibilityLevel.Inspect end)
GraveyardWinter:connect_one_way_entrance(ExplorersCrypt, function() return Has(Shovel) end)
Graveyard:connect_one_way_entrance(WestWesternCoast)
GraveyardAutumn:connect_one_way_entrance(WestWesternCoast)
GraveyardWinter:connect_one_way_entrance(WestWesternCoast)
ExplorersCrypt:connect_one_way(GraveyardSecret, function() return Has(Shovel) end)

ExplorersCrypt:connect_one_way(WesternCoastFindSeason)
ExplorersCrypt:connect_one_way_entrance(Graveyard, function()
	return Any(
		WesternCoastSpring,
		WesternCoastSummer
	)
end)
ExplorersCrypt:connect_one_way_entrance(GraveyardAutumn, function()
	return Has(WesternCoastAutumn)
end)
ExplorersCrypt:connect_one_way_entrance(GraveyardWinter, function()
	return Has(WesternCoastWinter)
end)
ExplorersCrypt:connect_one_way_entrance(CryptFoyer, function()
	return Any(
		ShuffleDungeonOff,
		D7LeadsToD7
	)
end)

-- Dungeon shuffle
-- d0
HerosCave:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		ShuffleDungeonOn,
		D0LeadsToD1
	)
end)
HerosCave:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D0LeadsToD2
	)
end)
HerosCave:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		ShuffleDungeonOn,
		D0LeadsToD3
	)
end)
HerosCave:connect_one_way_entrance(DancingFoyer, function()
	return All(
		ShuffleDungeonOn,
		D0LeadsToD4
	)
end)
HerosCave:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		ShuffleDungeonOn,
		D0LeadsToD5
	)
end)
HerosCave:connect_one_way_entrance(AncientFoyer, function()
	return All(
		ShuffleDungeonOn,
		D0LeadsToD6
	)
end)
HerosCave:connect_one_way_entrance(CryptFoyer, function()
	return All(
		ShuffleDungeonOn,
		D0LeadsToD7
	)
end)
HerosCave:connect_one_way_entrance(MazeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D0LeadsToD8
	)
end)

-- d7
ExplorersCrypt:connect_two_ways_entrance(HerosCaveFoyer, function()
	return All(
		ShuffleDungeonOn,
		D7LeadsToD0
	)
end)
ExplorersCrypt:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		ShuffleDungeonOn,
		D7LeadsToD1
	)
end)
ExplorersCrypt:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D7LeadsToD2
	)
end)
ExplorersCrypt:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		ShuffleDungeonOn,
		D7LeadsToD3
	)
end)
ExplorersCrypt:connect_one_way_entrance(DancingFoyer, function()
	return All(
		ShuffleDungeonOn,
		D7LeadsToD4
	)
end)
ExplorersCrypt:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		ShuffleDungeonOn,
		D7LeadsToD5
	)
end)
ExplorersCrypt:connect_one_way_entrance(AncientFoyer, function()
	return All(
		ShuffleDungeonOn,
		D7LeadsToD6
	)
end)
ExplorersCrypt:connect_one_way_entrance(MazeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D7LeadsToD8
	)
end)