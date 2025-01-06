-- lower suburbs
--standing items
LowerEasternSuburbs:connect_one_way(WindmillHP, function()
	return Any(
		Has(EasternSuburbsWinter),
		Has(Winter)
	)
end)
LowerEasternSuburbs:connect_one_way(WindmillTrade, function()
	return Has(EngineGrease)
end)
LowerEasternSuburbs:connect_one_way(SuburbsSpringCave, function()
	return All(
		Has(Bracelet),
		Any(
			Has(Spring),
			Has(EasternSuburbsSpring)
		),
		Any(
			Has(MagnetGlove),
			Jump3()
		)
	)
end)
LowerEasternSuburbs:connect_one_way(SuburbsGasha, function()
	return All(
		CanPlantGasha(),
		CanDestroyBushFlute()
	)
end)

-- exits
LowerEasternSuburbs:connect_one_way_entrance(HoronVillage, function()
	return All(
		CanUseSeeds(),
		Has(EmberSeeds)
	)
end)
LowerEasternSuburbs:connect_one_way_entrance(SamasaDesert, function() return CanReach(Pirates) end, {Pirates})
LowerEasternSuburbs:connect_two_ways_entrance(UpperEasternSuburbs, function()
	return Any(
		Has(Feather),
		Has(Flippers),
		Dimitri(),
		Ricky()
	)
end)
LowerEasternSuburbs:connect_two_ways_entrance(UpperEasternSuburbsWinter, function()
	return Any(
		Has(Winter),
		Has(EasternSuburbsWinter)
	)
end)
LowerEasternSuburbs:connect_one_way_entrance(SuburbsPortal, CanDestroyBushFlute)
SuburbsPortal:connect_two_ways_entrance(SubrosiaMountainEast, function()
	return Any(
		Has(ShufflePortalsOff),
		Has(SuburbsLeadsToMountain),
		Has(MountainLeadsToSuburbs)
	)
end)
SuburbsPortal:connect_one_way_entrance(LowerEasternSuburbs, CanDestroyBush)

-- samasa desert
SamasaDesert:connect_one_way(SamasaDesertChest, function()
	return Has(Flippers)
end)
SamasaDesert:connect_one_way(SamasaDesertPit, function()
	return Has(Bracelet)
end)
SamasaDesert:connect_one_way(SamasaDesertGasha, CanPlantGasha)

-- upper suburbs
UpperEasternSuburbs:connect_one_way_entrance(UpperEasternSuburbsWinter, function()
	return Has(Winter)
end)
UpperEasternSuburbsWinter:connect_one_way_entrance(UpperEasternSuburbs, function()
	return Any(
		Has(Spring),
		Has(Summer),
		Has(Autumn)
	)
end)
UpperEasternSuburbs:connect_one_way_entrance(SunkenDoorstep, function()
	return Any(
		Has(Spring),
		Has(EasternSuburbsSpring)
	)
end)
UpperEasternSuburbsWinter:connect_one_way_entrance(MoblinRoad)
UpperEasternSuburbs:connect_one_way_entrance(WoodsOfWinter)
UpperEasternSuburbsWinter:connect_one_way_entrance(WoodsOfWinter, function()
	return Any(
		Has(Feather),
		AnyFlute()
	)
end)

-- woods of winter
MoblinRoad:connect_one_way_entrance(UpperEasternSuburbsWinter, function()
	return Any(
		Has(Winter),
		Has(EasternSuburbsWinter)
	)
end)
MoblinRoad:connect_one_way_entrance(MoblinRoadBombCave, function()
	return All(
		BombPunchWall(),
		Any(
			Has(Spring),
			Has(Summer),
			Has(Autumn),
			Has(WoodsOfWinterSpring),
			Has(WoodsOfWinterSummer),
			Has(WoodsOfWinterAutumn)
		)
	)
end)
MoblinRoadBombCave:connect_one_way(MoblinRoadBombCaveChest, CanDestroyBush)
MoblinRoad:connect_two_ways_entrance(MoblinRoadWaterfallCaveChest, function()
	return Any(
		Has(Flippers),
		JumpLiquid3()
	)
end)
MoblinRoad:connect_one_way_entrance(Holly, function()
	return Any(
		Has(Winter),
		Has(WoodsOfWinterWinter)
	)
end)
MoblinRoad:connect_one_way(SuburbsOldMan, function()
	return CanUseSeeds() and Has(EmberSeeds)
end)
MoblinRoad:connect_one_way(SuburbsHP, function()
	return Any(
		Has(Flippers),
		Dimitri(),
		Has(Bracelet),
		Has(Feather)
	)
end)
WoodsOfWinter:connect_one_way_entrance(UpperEasternSuburbs, function()
	return Any(
		Has(EasternSuburbsSpring),
		Has(EasternSuburbsSummer),
		Has(EasternSuburbsAutumn)
	)
end)
WoodsOfWinter:connect_one_way_entrance(UpperEasternSuburbsWinter, function() return Has(EasternSuburbsWinter) end)
WoodsOfWinter:connect_one_way(WoodsOfWinterTree, function() return CanHarvestSeeds(true) end)
WoodsOfWinter:connect_one_way(GoldenMoblinKill, function()
	return All(
		Any(
			Has(Autumn),
			Has(WoodsOfWinterAutumn)
		),
		Any(
			CanSwordPunchKill(),
			All(
				Has(EmberSeeds),
				CanUseSeeds(),
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
WoodsOfWinter:connect_one_way_entrance(SnakesRemains, CanDestroyBushFlute)
SnakesRemains:connect_one_way_entrance(WoodsOfWinter, CanDestroyBush)
SnakesRemains:connect_two_ways_entrance(SnakeFoyer, function()
	return Any(
		Has(ShuffleDungeonOff),
		Has(D2LeadsToD2)
	)
end)
WoodsOfWinter:connect_two_ways_entrance(UpperSnakesRemains, function() return Has(Bracelet) end)
UpperSnakesRemains:connect_two_ways_entrance(SnakeAltEntrance, function() return Has(D2AltVanilla) end)
UpperSnakesRemains:connect_one_way_entrance(SnakeBombPuzzle, function() return Has(D2AltVanilla) end)
WoodsOfWinter:connect_one_way_entrance(WoodsOfWinterMushroomCave, function()
	return All(
		Any(
			Has(Autumn),
			Has(WoodsOfWinterAutumn)
		),
		CanDestroyMushroom(true)
	)
end)
WoodsOfWinterMushroomCave:connect_one_way(WoodsOfWinterMushroomCaveChest, function()
	return Any(
		Has(MagnetGlove),
		Jump4()
	)
end)

-- dungeon shuffle
SnakesRemains:connect_one_way_entrance(HerosCaveFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D2LeadsToD0)
	)
end)
SnakesRemains:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D2LeadsToD1)
	)
end)
SnakesRemains:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D2LeadsToD3)
	)
end)
SnakesRemains:connect_one_way_entrance(DancingFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D2LeadsToD4)
	)
end)
SnakesRemains:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D2LeadsToD5)
	)
end)
SnakesRemains:connect_one_way_entrance(AncientFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D2LeadsToD6)
	)
end)
SnakesRemains:connect_one_way_entrance(CryptFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D2LeadsToD7)
	)
end)
SnakesRemains:connect_one_way_entrance(MazeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D2LeadsToD8)
	)
end)

-- portal shuffle
SuburbsPortal:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SuburbsLeadsToSwamp),
			Has(SwampLeadsToSuburbs)
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SuburbsLeadsToLake),
			Has(LakeLeadsToSuburbs)
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SuburbsLeadsToCucco),
			Has(CuccoLeadsToSuburbs)
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SuburbsLeadsToHoron),
			Has(HoronLeadsToSuburbs)
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SuburbsLeadsToRemains),
			Has(RemainsLeadsToSuburbs)
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SuburbsLeadsToUpperRemains),
			Has(UpperRemainsLeadsToSuburbs)
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SuburbsLeadsToMountain),
			Has(MountainLeadsToSuburbs)
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SuburbsLeadsToMarket),
			Has(MarketLeadsToSuburbs)
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SuburbsLeadsToFurnace),
			Has(FurnaceLeadsToSuburbs)
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SuburbsLeadsToVillage),
			Has(VillageLeadsToSuburbs)
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SuburbsLeadsToPirates),
			Has(PiratesLeadsToSuburbs)
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SuburbsLeadsToVolcano),
			Has(VolcanoLeadsToSuburbs)
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(SwordAndShieldMaze, function()
return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SuburbsLeadsToD8),
			Has(D8LeadsToSuburbs)
		)
	)
end)