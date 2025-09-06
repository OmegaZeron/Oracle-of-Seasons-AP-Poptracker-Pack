-- lower suburbs
LowerEasternSuburbs:connect_one_way(EasternSuburbsFindSeason)
LowerEasternSuburbs:connect_one_way(HoronVillageFindSeason)
--standing items
LowerEasternSuburbs:connect_one_way(Maple, CanMapleTrade)
LowerEasternSuburbs:connect_one_way(WindmillHP, function()
	return Any(
		Has(EasternSuburbsWinter),
		HasWinter,
		CanDimitriClip,
		AccessibilityLevel.Inspect
	)
end)
LowerEasternSuburbs:connect_one_way(WindmillTrade, function() return Has(EngineGrease) end)
LowerEasternSuburbs:connect_one_way(SuburbsSpringCave, function()
	return All(
		HasBracelet,
		Any(
			Has(EasternSuburbsSpring),
			HasSpring
		),
		Any(
			HasMagnetGlove,
			Jump3
		)
	)
end)
LowerEasternSuburbs:connect_one_way(SuburbsGasha, CanPlantGasha)

-- exits
LowerEasternSuburbs:connect_one_way_entrance(HoronVillage, function()
	return All(
		CanUseSeeds,
		HasEmbers
	)
end)
LowerEasternSuburbs:connect_one_way_entrance(SamasaDesert, function() return CanReach(Pirates) end, {Pirates})
LowerEasternSuburbs:connect_two_ways_entrance(UpperEasternSuburbs, function()
	return All(
		Any(
			Has(EasternSuburbsSpring),
			Has(EasternSuburbsSummer),
			Has(EasternSuburbsAutumn),
			HasSpring,
			HasSummer,
			HasAutumn
		),
		Any(
			JumpLiquid1(true),
			HasFlippers,
			Dimitri
			-- HasSwitchHook
		)
	)
end)
LowerEasternSuburbs:connect_two_ways_entrance(UpperEasternSuburbsWinter, function()
	return Any(
		Has(EasternSuburbsWinter),
		HasWinter
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
SamasaDesert:connect_one_way(SamasaDesertChest, function() return Has(Flippers) end)
SamasaDesert:connect_one_way(SamasaDesertPit, function() return Has(Bracelet) end)
SamasaDesert:connect_one_way(SamasaDesertGasha, CanPlantGasha)
SamasaDesert:connect_one_way(SamasaScrub, function()
	return Any(
		HasRupees(ShopPrices[SamasaCaveScrubPrice]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom, HoronVillageOldMan, NorthHoronOldMan, SuburbsOldMan, NorthHolodrumPlainOldMan, SouthHolodrumPlainOldMan, GoronMountainOldMan, TarmOldMan, WesternCoastOldMan})

-- upper suburbs
UpperEasternSuburbs:connect_one_way(EasternSuburbsFindSeason)
UpperEasternSuburbs:connect_one_way(Maple, CanMapleTrade)
UpperEasternSuburbsWinter:connect_one_way(Maple, CanMapleTrade)
UpperEasternSuburbs:connect_one_way_entrance(UpperEasternSuburbsWinter, function() return Has(Winter) end)
UpperEasternSuburbsWinter:connect_one_way(EasternSuburbsFindSeason)
UpperEasternSuburbsWinter:connect_one_way_entrance(UpperEasternSuburbs, function()
	return Any(
		HasSpring,
		HasSummer,
		HasAutumn
	)
end)
UpperEasternSuburbs:connect_one_way_entrance(SunkenDoorstep, function()
	return Any(
		Has(EasternSuburbsSpring),
		HasSpring
	)
end)
UpperEasternSuburbsWinter:connect_one_way_entrance(MoblinRoad)
UpperEasternSuburbs:connect_one_way_entrance(WoodsOfWinter)
UpperEasternSuburbsWinter:connect_one_way_entrance(WoodsOfWinter, function()
	return Any(
		HasFeather,
		AnyFlute,
		HasShovel
	)
end)

-- woods of winter
MoblinRoad:connect_one_way(EasternSuburbsFindSeason)
MoblinRoad:connect_one_way(WoodsOfWinterFindSeason)
MoblinRoad:connect_one_way(Maple, CanMapleTrade)
MoblinRoad:connect_one_way_entrance(UpperEasternSuburbsWinter, function()
	return Any(
		Has(EasternSuburbsWinter),
		HasWinter
	)
end)
MoblinRoad:connect_one_way_entrance(MoblinRoadBombCave, function()
	return All(
		BombPunchWall,
		Any(
			Has(WoodsOfWinterSpring),
			Has(WoodsOfWinterSummer),
			Has(WoodsOfWinterAutumn),
			HasSpring,
			HasSummer,
			HasAutumn
		)
	)
end)
MoblinRoadBombCave:connect_one_way(MoblinRoadBombCaveChest, CanDestroyBush)
MoblinRoad:connect_two_ways_entrance(MoblinRoadWaterfallCaveChest, function()
	return Any(
		HasFlippers,
		JumpLiquid3
	)
end)
MoblinRoad:connect_one_way_entrance(Holly, function()
	return Any(
		Has(WoodsOfWinterWinter),
		HasWinter
	)
end)
MoblinRoad:connect_one_way(SuburbsOldMan, CanBurnTrees)
MoblinRoad:connect_one_way(SuburbsHP, function()
	return Any(
		HasFlippers,
		Dimitri,
		HasBracelet,
		HasFeather,
		AccessibilityLevel.Inspect
	)
end)
WoodsOfWinter:connect_one_way(EasternSuburbsFindSeason)
WoodsOfWinter:connect_one_way(WoodsOfWinterFindSeason)
WoodsOfWinter:connect_one_way_entrance(UpperEasternSuburbs, function()
	return Any(
		Has(EasternSuburbsSpring),
		Has(EasternSuburbsSummer),
		Has(EasternSuburbsAutumn)
	)
end)
WoodsOfWinter:connect_one_way_entrance(UpperEasternSuburbsWinter, function() return Has(EasternSuburbsWinter) end)
WoodsOfWinter:connect_one_way(WoodsOfWinterTree, function()
	return Any(
		CanHarvestSeeds(true),
		AccessibilityLevel.Inspect
	)
end)
WoodsOfWinter:connect_one_way(GoldenMoblinKill, function()
	return All(
		Any(
			Has(WoodsOfWinterAutumn),
			HasAutumn
		),
		Any(
			CanSwordKill,
			Dimitri,
			All(
				HasEmbers,
				CanUseSeeds,
				MediumLogic
			)
		)
	)
end)
WoodsOfWinter:connect_one_way_entrance(SnakesRemains, CanDestroyBushFlute)
SnakesRemains:connect_one_way(WoodsOfWinterFindSeason)
SnakesRemains:connect_one_way_entrance(WoodsOfWinter, CanDestroyBush)
SnakesRemains:connect_two_ways_entrance(SnakeFoyer, function()
	return Any(
		Has(ShuffleDungeonOff),
		Has(D2LeadsToD2)
	)
end)
WoodsOfWinter:connect_two_ways_entrance(UpperSnakesRemains, function() return Has(Bracelet) end)
UpperSnakesRemains:connect_two_ways_entrance(SnakeAltEntrance, function() return Has(D2AltVanilla) end)
WoodsOfWinter:connect_one_way_entrance(WoodsOfWinterMushroomCave, function()
	return Any(
		All(
			Any(
				Has(WoodsOfWinterAutumn),
				HasAutumn
			),
			CanDestroyMushroom(true)
		),
		CanDimitriClip
	)
end)
WoodsOfWinterMushroomCave:connect_one_way(WoodsOfWinterMushroomCaveChest, function()
	return Any(
		HasMagnetGlove,
		Jump4
	)
end)

-- dungeon shuffle
SnakesRemains:connect_two_ways_entrance(HerosCaveFoyer, function()
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