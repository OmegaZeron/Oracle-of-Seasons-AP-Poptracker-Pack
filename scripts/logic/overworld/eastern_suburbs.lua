-- lower suburbs
LowerEasternSuburbs:connect_one_way(EasternSuburbsFindSeason)
LowerEasternSuburbs:connect_one_way(HoronVillageFindSeason)
--standing items
LowerEasternSuburbs:connect_one_way(Maple, CanMapleTrade)
LowerEasternSuburbs:connect_one_way(WindmillHP, function()
	return Any(
		EasternSuburbsWinter,
		Winter,
		CanDimitriClip,
		AccessibilityLevel.Inspect
	)
end)
LowerEasternSuburbs:connect_one_way(WindmillTrade, function() return Has(EngineGrease) end)
LowerEasternSuburbs:connect_one_way(SuburbsSpringCave, function()
	return All(
		Bracelet,
		Any(
			EasternSuburbsSpring,
			Spring
		),
		Any(
			MagnetGlove,
			Jump3
		)
	)
end)
LowerEasternSuburbs:connect_one_way(SuburbsGasha, CanPlantGasha)

-- exits
LowerEasternSuburbs:connect_one_way_entrance(HoronVillage, function()
	return All(
		CanUseSeeds,
		EmberSeeds
	)
end)
LowerEasternSuburbs:connect_one_way_entrance(SamasaDesert, function() return CanReach(Pirates) end, {Pirates})
LowerEasternSuburbs:connect_two_ways_entrance(UpperEasternSuburbs, function()
	return All(
		Any(
			EasternSuburbsSpring,
			EasternSuburbsSummer,
			EasternSuburbsAutumn,
			Spring,
			Summer,
			Autumn
		),
		Any(
			JumpLiquid1(true),
			Flippers,
			Dimitri,
			SwitchHook
		)
	)
end)
LowerEasternSuburbs:connect_two_ways_entrance(UpperEasternSuburbsWinter, function()
	return Any(
		EasternSuburbsWinter,
		Winter
	)
end)
LowerEasternSuburbs:connect_one_way_entrance(SuburbsPortal, CanDestroyBushFlute)
SuburbsPortal:connect_two_ways_entrance(SubrosiaMountainEast, function()
	return Any(
		ShufflePortalsOff,
		SuburbsLeadsToMountain,
		MountainLeadsToSuburbs
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
SamasaDesert:connect_two_ways_entrance(LinkedCave, function() return Has(LinkedCaveDesert) end)
SamasaDesert:connect_one_way_entrance(LinkedCaveLedge, function()
	return All(
		LinkedCaveDesert,
		LCAltVanilla,
		CanDestroyBushFlute(true)
	)
end)

-- upper suburbs
UpperEasternSuburbs:connect_one_way(EasternSuburbsFindSeason)
UpperEasternSuburbs:connect_one_way(Maple, CanMapleTrade)
UpperEasternSuburbsWinter:connect_one_way(Maple, CanMapleTrade)
UpperEasternSuburbs:connect_one_way_entrance(UpperEasternSuburbsWinter, function() return Has(Winter) end)
UpperEasternSuburbsWinter:connect_one_way(EasternSuburbsFindSeason)
UpperEasternSuburbsWinter:connect_one_way_entrance(UpperEasternSuburbs, function()
	return Any(
		Spring,
		Summer,
		Autumn
	)
end)
UpperEasternSuburbs:connect_one_way_entrance(SunkenDoorstep, function()
	return Any(
		EasternSuburbsSpring,
		Spring
	)
end)
UpperEasternSuburbsWinter:connect_one_way_entrance(MoblinRoad)
UpperEasternSuburbs:connect_one_way_entrance(WoodsOfWinter)
UpperEasternSuburbsWinter:connect_one_way_entrance(WoodsOfWinter, function()
	return Any(
		Feather,
		AnyFlute,
		Shovel,
		All(
			SwitchHook,
			MediumLogic
		)
	)
end)

-- woods of winter
MoblinRoad:connect_one_way(EasternSuburbsFindSeason)
MoblinRoad:connect_one_way(WoodsOfWinterFindSeason)
MoblinRoad:connect_one_way(Maple, CanMapleTrade)
MoblinRoad:connect_one_way_entrance(UpperEasternSuburbsWinter, function()
	return Any(
		EasternSuburbsWinter,
		Winter
	)
end)
MoblinRoad:connect_one_way_entrance(MoblinRoadBombCave, function()
	return All(
		BombPunchWall,
		Any(
			WoodsOfWinterSpring,
			WoodsOfWinterSummer,
			WoodsOfWinterAutumn,
			Spring,
			Summer,
			Autumn
		)
	)
end)
MoblinRoadBombCave:connect_one_way(MoblinRoadBombCaveChest, CanDestroyBush)
MoblinRoad:connect_two_ways_entrance(MoblinRoadWaterfallCaveChest, function()
	return Any(
		Flippers,
		JumpLiquid3
	)
end)
MoblinRoad:connect_one_way_entrance(Holly, function()
	return Any(
		WoodsOfWinterWinter,
		Winter
	)
end)
MoblinRoad:connect_one_way(SuburbsOldMan, CanBurnTrees)
MoblinRoad:connect_one_way(SuburbsHP, function()
	return Any(
		Flippers,
		Dimitri,
		Bracelet,
		Feather,
		AccessibilityLevel.Inspect
	)
end)
WoodsOfWinter:connect_one_way(EasternSuburbsFindSeason)
WoodsOfWinter:connect_one_way(WoodsOfWinterFindSeason)
WoodsOfWinter:connect_one_way_entrance(UpperEasternSuburbs, function()
	return Any(
		EasternSuburbsSpring,
		EasternSuburbsSummer,
		EasternSuburbsAutumn
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
			WoodsOfWinterAutumn,
			Autumn
		),
		Any(
			CanSwordKill,
			Dimitri,
			All(
				EmberSeeds,
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
		ShuffleDungeonOff,
		D2LeadsToD2
	)
end)
WoodsOfWinter:connect_two_ways_entrance(UpperSnakesRemains, function() return Has(Bracelet) end)
UpperSnakesRemains:connect_two_ways_entrance(SnakeAltEntrance, function() return Has(D2AltVanilla) end)
WoodsOfWinter:connect_one_way_entrance(WoodsOfWinterMushroomCave, function()
	return Any(
		All(
			CanDestroyMushroom(true),
			Any(
				WoodsOfWinterAutumn,
				Autumn
			)
		),
		CanDimitriClip
	)
end)
WoodsOfWinterMushroomCave:connect_one_way(WoodsOfWinterMushroomCaveChest, function()
	return Any(
		MagnetGlove,
		Jump4
	)
end)

-- dungeon shuffle
SnakesRemains:connect_two_ways_entrance(HerosCaveFoyer, function()
	return All(
		ShuffleDungeonOn,
		D2LeadsToD0
	)
end)
SnakesRemains:connect_two_ways_entrance(LinkedCaveFoyer, function()
	return All(
		ShuffleDungeonOn,
		D2LeadsToLC
	)
end)
SnakesRemains:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		ShuffleDungeonOn,
		D2LeadsToD1
	)
end)
SnakesRemains:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		ShuffleDungeonOn,
		D2LeadsToD3
	)
end)
SnakesRemains:connect_one_way_entrance(DancingFoyer, function()
	return All(
		ShuffleDungeonOn,
		D2LeadsToD4
	)
end)
SnakesRemains:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		ShuffleDungeonOn,
		D2LeadsToD5
	)
end)
SnakesRemains:connect_one_way_entrance(AncientFoyer, function()
	return All(
		ShuffleDungeonOn,
		D2LeadsToD6
	)
end)
SnakesRemains:connect_one_way_entrance(CryptFoyer, function()
	return All(
		ShuffleDungeonOn,
		D2LeadsToD7
	)
end)
SnakesRemains:connect_one_way_entrance(MazeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D2LeadsToD8
	)
end)

-- portal shuffle
SuburbsPortal:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SuburbsLeadsToSwamp,
			SwampLeadsToSuburbs
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SuburbsLeadsToLake,
			LakeLeadsToSuburbs
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SuburbsLeadsToCucco,
			CuccoLeadsToSuburbs
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SuburbsLeadsToHoron,
			HoronLeadsToSuburbs
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SuburbsLeadsToRemains,
			RemainsLeadsToSuburbs
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SuburbsLeadsToUpperRemains,
			UpperRemainsLeadsToSuburbs
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SuburbsLeadsToMountain,
			MountainLeadsToSuburbs
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SuburbsLeadsToMarket,
			MarketLeadsToSuburbs
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SuburbsLeadsToFurnace,
			FurnaceLeadsToSuburbs
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SuburbsLeadsToVillage,
			VillageLeadsToSuburbs
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SuburbsLeadsToPirates,
			PiratesLeadsToSuburbs
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SuburbsLeadsToVolcano,
			VolcanoLeadsToSuburbs
		)
	)
end)
SuburbsPortal:connect_one_way_entrance(SwordAndShieldMaze, function()
return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SuburbsLeadsToD8,
			D8LeadsToSuburbs
		)
	)
end)