EastWesternCoast:connect_one_way(BlackBeast, function()
	return All(
		CanShootLongTorches(),
		Has(MysterySeeds),
		CanArmorKill()
	)
end)
EastWesternCoast:connect_one_way(GoldenDarknutKill, function()
	return All(
		Any(
			Has(WesternCoastSpring),
			All(
				CanReach(WesternCoastStump),
				Has(Spring),
				Has(PolishedBell),
				CanReach(Pirates)
			)
		),
		CanArmorKill()
	)
end, {WesternCoastStump, Pirates})
EastWesternCoast:connect_one_way_entrance(HerosCave)
HerosCave:connect_two_ways_entrance(HerosCaveFoyer, function()
	return Any(
		Has(ShuffleDungeonOff),
		Has(D0LeadsToD0)
	)
end)

EastWesternCoast:connect_one_way_entrance(HerosCaveLedge, function()
	return All(
		Has(D0AltVanilla),
		CanDestroyBushFlute()
	)
end)
HerosCaveLedge:connect_one_way_entrance(HerosCaveFoyer)
HerosCaveFoyer:connect_one_way(HerosCaveLedge, function()
	return Has(D0AltRemoved)
end)
HerosCaveFoyer:connect_one_way_entrance(HerosCaveUnderground, function()
	return Any(
		CanNormalKill(),
		All(
			Has(Boomerang),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end)
HerosCaveFoyer:connect_one_way_entrance(HerosCavePostKey, function()
	return Any(
		Has(D0SmallKey),
		Has(D0MasterKey)
	)
end)

EastWesternCoast:connect_one_way_entrance(HoronVillage)
EastWesternCoast:connect_one_way_entrance(WestWesternCoast, function()
	return All(
		CanReach(Pirates),
		Has(PolishedBell)
	)
end, {Pirates})
WestWesternCoast:connect_one_way(WesternCoastChest)
WestWesternCoast:connect_one_way(WesternCoastGasha, CanPlantGasha)
WestWesternCoast:connect_one_way_entrance(WesternCoastOldMan, CanBurnTrees)
WestWesternCoast:connect_one_way_entrance(WesternCoastHouse)
WesternCoastHouse:connect_one_way(WesternCoastHouseChest)
WesternCoastHouse:connect_one_way_entrance(WesternCoastStump, function()
	return All(
		Any(
			Has(Bombs),
			Has(Bombchus)
		),
		Any(
			Has(Feather),
			Any(
				Has(Hard),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end)
WestWesternCoast:connect_one_way_entrance(Graveyard, function()
	return Any(
		Has(WesternCoastSummer),
		All(
			Has(Summer),
			CanReach(WesternCoastStump)
		),
		All(
			Jump3(),
			Any(
				Has(WesternCoastSpring),
				All(
					Has(Spring),
					CanReach(WesternCoastStump)
				)
			)
		)
	)
end, {WesternCoastStump})
WestWesternCoast:connect_one_way_entrance(GraveyardWinter, function()
	return All(
		Jump3(),
		Any(
			Has(WesternCoastWinter),
			All(
				Has(Winter),
				CanReach(WesternCoastStump)
			)
		)
	)
end, {WesternCoastStump})
WestWesternCoast:connect_one_way_entrance(GraveyardAutumn, function()
	return All(
		Jump3(),
		Any(
			Has(WesternCoastAutumn),
			All(
				Has(Autumn),
				CanReach(WesternCoastStump)
			)
		)
	)
end, {WesternCoastStump})
Graveyard:connect_one_way_entrance(ExplorersCrypt)
GraveyardAutumn:connect_one_way_entrance(ExplorersCrypt)
GraveyardAutumn:connect_one_way(GraveyardHP, function()
	return Any(
		CanDestroyMushroom(),
		AccessibilityLevel.Inspect
	)
end)
Graveyard:connect_one_way(GraveyardHP, function() return AccessibilityLevel.Inspect end)
GraveyardWinter:connect_one_way(GraveyardHP, function() return AccessibilityLevel.Inspect end)
GraveyardWinter:connect_one_way_entrance(ExplorersCrypt, function() return Has(Shovel) end)
Graveyard:connect_one_way_entrance(WestWesternCoast)
GraveyardAutumn:connect_one_way_entrance(WestWesternCoast)
GraveyardWinter:connect_one_way_entrance(WestWesternCoast)

ExplorersCrypt:connect_one_way_entrance(Graveyard, function()
	return Any(
		Has(WesternCoastSpring),
		Has(WesternCoastSummer)
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
		Has(ShuffleDungeonOff),
		Has(D7LeadsToD7)
	)
end)

-- Dungeon shuffle
-- d0
EastWesternCoast:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D0LeadsToD1)
	)
end)
EastWesternCoast:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D0LeadsToD2)
	)
end)
EastWesternCoast:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D0LeadsToD3)
	)
end)
EastWesternCoast:connect_one_way_entrance(DancingFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D0LeadsToD4)
	)
end)
EastWesternCoast:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D0LeadsToD5)
	)
end)
EastWesternCoast:connect_one_way_entrance(AncientFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D0LeadsToD6)
	)
end)
EastWesternCoast:connect_one_way_entrance(CryptFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D0LeadsToD7)
	)
end)
EastWesternCoast:connect_one_way_entrance(MazeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D0LeadsToD8)
	)
end)
-- OoL setup for d0 alt entrance. This is never in logic due to potential softlock
HerosCaveFoyer:connect_one_way_entrance(GnarledRootDungeon, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D1LeadsToD0),
		AccessibilityLevel.SequenceBreak
	)
end)
HerosCaveFoyer:connect_two_ways_entrance(SnakesRemains, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D2LeadsToD0),
		AccessibilityLevel.SequenceBreak
	)
end)
-- d3 is never linked because of infinite drowning
HerosCaveFoyer:connect_one_way_entrance(DancingDragonDungeon, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D4LeadsToD0),
		AccessibilityLevel.SequenceBreak
	)
end)
HerosCaveFoyer:connect_one_way_entrance(UnicornCave, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D5LeadsToD0),
		AccessibilityLevel.SequenceBreak
	)
end)
HerosCaveFoyer:connect_one_way_entrance(AncientRuins, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD0),
		AccessibilityLevel.SequenceBreak
	)
end)
HerosCaveFoyer:connect_one_way_entrance(ExplorersCrypt, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D7LeadsToD0),
		AccessibilityLevel.SequenceBreak
	)
end)
HerosCaveFoyer:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D8LeadsToD0),
		AccessibilityLevel.SequenceBreak
	)
end)

-- d7
ExplorersCrypt:connect_one_way_entrance(HerosCaveFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D7LeadsToD0)
	)
end)
ExplorersCrypt:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D7LeadsToD1)
	)
end)
ExplorersCrypt:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D7LeadsToD2)
	)
end)
ExplorersCrypt:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D7LeadsToD3)
	)
end)
ExplorersCrypt:connect_one_way_entrance(DancingFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D7LeadsToD4)
	)
end)
ExplorersCrypt:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D7LeadsToD5)
	)
end)
ExplorersCrypt:connect_one_way_entrance(AncientFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D7LeadsToD6)
	)
end)
ExplorersCrypt:connect_one_way_entrance(MazeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D7LeadsToD8)
	)
end)