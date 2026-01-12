NorthSpoolSwamp:connect_one_way(Maple, CanMapleTrade)
NorthSpoolSwamp:connect_one_way(SpoolSwampFindSeason)
SouthSpoolSwamp:connect_one_way(SpoolSwampFindSeason)
-- items
NorthSpoolSwamp:connect_one_way(SwampTree, function()
	return Any(
		CanHarvestSeeds(true),
		AccessibilityLevel.Inspect
	)
end)
NorthSpoolSwamp:connect_one_way(SwampVasuDigSpot, function()
	return All(
		SpoolSwampSummer,
		Shovel
	)
end)
SpoolSwampStump:connect_one_way(SwampVasuDigSpot, function()
	return All(
		Summer,
		Shovel
	)
end)

-- exits
NorthSpoolSwamp:connect_one_way(LostWoodsFindSeason)
NorthSpoolSwamp:connect_one_way_entrance(TarmEntrance, CanEnterTarm)
NorthSpoolSwamp:connect_one_way_entrance(FloodgateKeeper)
FloodgateKeeper:connect_one_way_entrance(FloodgateLever, function()
	return Any(
		CanTriggerLever,
		All(
			Bracelet,
			HardLogic
		)
	)
end)
FloodgateLever:connect_one_way_entrance(FloodgateKeyhole, function()
	return All(
		Bracelet,
		Any(
			Flippers,
			Feather,
			All(
				Satchel,
				PegasusSeeds
			),
			CaneOfSomaria
		)
	)
end)
FloodgateKeyhole:connect_one_way(SwampScrub, function()
	return Any(
		HasRupees(ShopPrices[SpoolSwampScrubPrice]),
		AccessibilityLevel.Inspect
	)
end)
FloodgateKeyhole:connect_one_way(SwampNorthGashaSpot, CanPlantGasha)
FloodgateKeyhole:connect_one_way_entrance(SpoolSwampStump, function() return Has(FloodgateKey) end)
SpoolSwampStump:connect_one_way_entrance(PoisonMothLair, function()
	return Any(
		SpoolSwampSummer,
		Summer
	)
end)
PoisonMothLair:connect_two_ways_entrance(PoisonFoyer, function()
	return Any(
		ShuffleDungeonOff,
		D3LeadsToD3
	)
end)
SpoolSwampStump:connect_one_way_entrance(MiddleSpoolSwamp, function()
	return Any(
		SpoolSwampSummer,
		SpoolSwampAutumn,
		SpoolSwampWinter,
		Summer,
		Autumn,
		Winter,
		Flippers,
		Dimitri
	)
end)
MiddleSpoolSwamp:connect_one_way_entrance(SwampSouthGashaArea, Ricky)
SwampSouthGashaArea:connect_one_way_entrance(MiddleSpoolSwamp, function()
	return Any(
		Ricky,
		All(
			Feather,
			Any(
				MagicBoomerang,
				All(
					Any(
						HasAnySword,
						All(
							CanShootSeeds,
							EmberSeeds
						),
						All(
							HasBombs(2),
							HardLogic
						)
					),
					MediumLogic
				)
			)
		)
	)
end)
SwampSouthGashaArea:connect_two_ways_entrance(SpoolPortal, function() return Has(Bracelet) end)
SpoolPortal:connect_one_way(SpoolSwampFindSeason)
SpoolPortal:connect_two_ways_entrance(SubrosiaMarket, function()
	return Any(
		ShufflePortalsOff,
		SwampLeadsToMarket,
		MarketLeadsToSwamp
	)
end)
MiddleSpoolSwamp:connect_two_ways_entrance(SouthSpoolSwamp, function()
	return Any(
		Jump2,
		Moosh,
		Dimitri,
		Flippers
	)
end)
SouthSpoolSwamp:connect_one_way(Maple, CanMapleTrade)

-- make sure you can go directly from the stump to south, or default season
-- just because you can reach the stump doesn't mean you can also get there
-- ex. only access to gasha section is through subrosia
SouthSpoolSwamp:connect_one_way_entrance(SpringSpoolSwamp, function() return Has(SpoolSwampSpring) end)
SpoolSwampStump:connect_one_way_entrance(SpringSpoolSwamp, function()
	return All(
		Spring,
		Any(
			Flippers,
			Dimitri
		),
		Any(
			Ricky,
			Moosh,
			Jump2
		)
	)
end)
SouthSpoolSwamp:connect_one_way_entrance(SummerSpoolSwamp, function() return Has(SpoolSwampSummer) end)
SpoolSwampStump:connect_one_way_entrance(SummerSpoolSwamp, function()
	return All(
		Summer,
		Any(
			Flippers,
			AnyFlute,
			Jump2
		)
	)
end)
SouthSpoolSwamp:connect_one_way_entrance(AutumnSpoolSwamp, function() return Has(SpoolSwampAutumn) end)
SpoolSwampStump:connect_one_way_entrance(AutumnSpoolSwamp, function()
	return All(
		Autumn,
		Any(
			Flippers,
			AnyFlute,
			Jump2
		)
	)
end)
SouthSpoolSwamp:connect_one_way_entrance(WinterSpoolSwamp, function() return Has(SpoolSwampWinter) end)
SpoolSwampStump:connect_one_way_entrance(WinterSpoolSwamp, function()
	return All(
		Winter,
		Any(
			Flippers,
			AnyFlute,
			Jump2
		)
	)
end)

SummerSpoolSwamp:connect_one_way(GoldenOctorokKill, function()
	return Any(
		CanSwordKill,
		Dimitri
	)
end)

SpringSpoolSwamp:connect_one_way_entrance(SouthSpoolSwamp)
SummerSpoolSwamp:connect_one_way_entrance(SouthSpoolSwamp)
AutumnSpoolSwamp:connect_one_way_entrance(SouthSpoolSwamp)
WinterSpoolSwamp:connect_one_way_entrance(SouthSpoolSwamp)
SpringSpoolSwamp:connect_one_way_entrance(SwampSouthGashaArea, function() return CanDestroyFlower(true) end)
SummerSpoolSwamp:connect_one_way_entrance(SwampSouthGashaArea)
AutumnSpoolSwamp:connect_one_way_entrance(SwampSouthGashaArea)
WinterSpoolSwamp:connect_one_way_entrance(SwampSouthGashaArea, function()
	return Any(
		Shovel,
		AnyFlute
	)
end)
SwampSouthGashaArea:connect_one_way(SwampSouthGashaSpot, function()
	return All(
		Bracelet,
		CanPlantGasha
	)
end)
SwampSouthGashaArea:connect_one_way_entrance(SpringSpoolSwamp, function()
	return All(
		CanDestroyFlower(true),
		SpoolSwampSpring
	)
end)
SwampSouthGashaArea:connect_one_way_entrance(SummerSpoolSwamp, function() return Has(SpoolSwampSummer) end)
SwampSouthGashaArea:connect_one_way_entrance(AutumnSpoolSwamp, function() return Has(SpoolSwampAutumn) end)
SwampSouthGashaArea:connect_one_way_entrance(WinterSpoolSwamp, function()
	return All(
		SpoolSwampWinter,
		Any(
			Shovel,
			AnyFlute
		)
	)
end)
SpringSpoolSwamp:connect_one_way(SwampFloodedHP, function()
	return Any(
		Flippers,
		Dimitri,
		AccessibilityLevel.Inspect
	)
end)
SummerSpoolSwamp:connect_one_way(SwampFloodedHP, function() return AccessibilityLevel.Inspect end)
AutumnSpoolSwamp:connect_one_way(SwampFloodedHP, function() return AccessibilityLevel.Inspect end)
WinterSpoolSwamp:connect_one_way(SwampFloodedHP, function() return AccessibilityLevel.Inspect end)
WinterSpoolSwamp:connect_one_way(SwampBombCave, function()
	return All(
		Any(
			Shovel,
			AnyFlute
		),
		BombPunchWall
	)
end)

-- dungeon shuffle
PoisonMothLair:connect_one_way_entrance(HerosCaveFoyer, function()
	return All(
		ShuffleDungeonOn,
		D3LeadsToD0
	)
end)
-- exit from alt entrance
HerosCaveFoyer:connect_one_way_entrance(NorthSpoolSwamp, function()
	return All(
		ShuffleDungeonOn,
		D3LeadsToD0,
		Flippers
	)
end)
PoisonMothLair:connect_one_way_entrance(LinkedCaveFoyer, function()
	return All(
		ShuffleDungeonOn,
		D3LeadsToLC
	)
end)
-- exit from alt entrance
LinkedCaveFoyer:connect_one_way_entrance(NorthSpoolSwamp, function()
	return All(
		ShuffleDungeonOn,
		D3LeadsToLC,
		Flippers
	)
end)
PoisonMothLair:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		ShuffleDungeonOn,
		D3LeadsToD1
	)
end)
PoisonMothLair:connect_one_way_entrance(SnakeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D3LeadsToD2
	)
end)
-- exit from alt entrance
SnakeFoyer:connect_one_way_entrance(NorthSpoolSwamp, function()
	return All(
		ShuffleDungeonOn,
		D3LeadsToD2,
		Flippers
	)
end)
PoisonMothLair:connect_one_way_entrance(DancingFoyer, function()
	return All(
		ShuffleDungeonOn,
		D3LeadsToD4
	)
end)
PoisonMothLair:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		ShuffleDungeonOn,
		D3LeadsToD5
	)
end)
PoisonMothLair:connect_one_way_entrance(AncientFoyer, function()
	return All(
		ShuffleDungeonOn,
		D3LeadsToD6
	)
end)
PoisonMothLair:connect_one_way_entrance(CryptFoyer, function()
	return All(
		ShuffleDungeonOn,
		D3LeadsToD7
	)
end)
PoisonMothLair:connect_one_way_entrance(MazeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D3LeadsToD8
	)
end)

-- portal shuffle
SpoolPortal:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SwampLeadsToSuburbs,
			SuburbsLeadsToSwamp
		)
	)
end)
SpoolPortal:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SwampLeadsToLake,
			LakeLeadsToSwamp
		)
	)
end)
SpoolPortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SwampLeadsToCucco,
			CuccoLeadsToSwamp
		)
	)
end)
SpoolPortal:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SwampLeadsToHoron,
			HoronLeadsToSwamp
		)
	)
end)
SpoolPortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SwampLeadsToRemains,
			RemainsLeadsToSwamp
		)
	)
end)
SpoolPortal:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SwampLeadsToUpperRemains,
			UpperRemainsLeadsToSwamp
		)
	)
end)
SpoolPortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SwampLeadsToMountain,
			MountainLeadsToSwamp
		)
	)
end)
SpoolPortal:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SwampLeadsToMarket,
			MarketLeadsToSwamp
		)
	)
end)
SpoolPortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SwampLeadsToFurnace,
			FurnaceLeadsToSwamp
		)
	)
end)
SpoolPortal:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SwampLeadsToVillage,
			VillageLeadsToSwamp
		)
	)
end)
SpoolPortal:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SwampLeadsToPirates,
			PiratesLeadsToSwamp
		)
	)
end)
SpoolPortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SwampLeadsToVolcano,
			VolcanoLeadsToSwamp
		)
	)
end)
SpoolPortal:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			SwampLeadsToD8,
			D8LeadsToSwamp
		)
	)
end)