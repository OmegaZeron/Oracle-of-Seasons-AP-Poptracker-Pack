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
		Has(Shovel),
		Has(SpoolSwampSummer)
	)
end)
SpoolSwampStump:connect_one_way(SwampVasuDigSpot, function()
	return All(
		Has(Summer),
		Has(Shovel)
	)
end)

-- exits
NorthSpoolSwamp:connect_one_way(LostWoodsFindSeason)
NorthSpoolSwamp:connect_one_way_entrance(TarmEntrance, CanEnterTarm)
NorthSpoolSwamp:connect_one_way_entrance(FloodgateKeeper)
FloodgateKeeper:connect_one_way_entrance(FloodgateLever, function()
	return Any(
		CanTriggerLever(),
		All(
			Has(Bracelet),
			HardLogic()
		)
	)
end)
FloodgateLever:connect_one_way_entrance(FloodgateKeyhole, function()
	return All(
		Has(Bracelet),
		Any(
			Has(Flippers),
			Has(Feather),
			All(
				CanUseSeeds(),
				Has(PegasusSeeds)
			),
			Has(CaneOfSomaria)
		)
	)
end)
FloodgateKeyhole:connect_one_way(SwampScrub, function()
	return Any(
		HasRupees(ShopPrices[SpoolSwampScrubPrice]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})
FloodgateKeyhole:connect_one_way(SwampNorthGashaSpot, CanPlantGasha)
FloodgateKeyhole:connect_one_way_entrance(SpoolSwampStump, function() return Has(FloodgateKey) end)
SpoolSwampStump:connect_one_way_entrance(PoisonMothLair, function()
	return Any(
		Has(Summer),
		Has(SpoolSwampSummer)
	)
end)
PoisonMothLair:connect_two_ways_entrance(PoisonFoyer, function()
	return Any(
		Has(ShuffleDungeonOff),
		Has(D3LeadsToD3)
	)
end)
SpoolSwampStump:connect_one_way_entrance(MiddleSpoolSwamp, function()
	return Any(
		Has(SpoolSwampSummer),
		Has(SpoolSwampAutumn),
		Has(SpoolSwampWinter),
		Has(Summer),
		Has(Autumn),
		Has(Winter),
		Has(Flippers),
		Dimitri()
	)
end)
MiddleSpoolSwamp:connect_one_way_entrance(SwampSouthGashaArea, Ricky)
SwampSouthGashaArea:connect_one_way_entrance(MiddleSpoolSwamp, function()
	return Any(
		Ricky(),
		All(
			Has(Feather),
			Any(
				Has(MagicBoomerang),
				All(
					MediumLogic(),
					Any(
						HasSword(),
						All(
							Has(Slingshot),
							Has(EmberSeeds)
						),
						All(
							Has(Bombs),
							All(
								Has(Bombs20),
								AccessibilityLevel.SequenceBreak
							),
							HardLogic()
						)
					)
				)
			)
		)
	)
end)
SwampSouthGashaArea:connect_two_ways_entrance(SpoolPortal, function() return Has(Bracelet) end)
SpoolPortal:connect_one_way(SpoolSwampFindSeason)
SpoolPortal:connect_two_ways_entrance(SubrosiaMarket, function()
	return Any(
		Has(ShufflePortalsOff),
		Has(SwampLeadsToMarket),
		Has(MarketLeadsToSwamp)
	)
end)
MiddleSpoolSwamp:connect_two_ways_entrance(SouthSpoolSwamp, function()
	return Any(
		Jump2(),
		Moosh(),
		Dimitri(),
		Has(Flippers)
	)
end)
SouthSpoolSwamp:connect_one_way(Maple, CanMapleTrade)

-- make sure you can go directly from the stump to south, or default season
-- just because you can reach the stump doesn't mean you can also get there
-- ex. only access to gasha section is through subrosia
SouthSpoolSwamp:connect_one_way_entrance(SpringSpoolSwamp, function() return Has(SpoolSwampSpring) end)
SpoolSwampStump:connect_one_way_entrance(SpringSpoolSwamp, function()
	return All(
		Has(Spring),
		Any(
			Has(Flippers),
			Dimitri()
		),
		Any(
			Ricky(),
			Moosh(),
			Jump2()
		)
	)
end)
SouthSpoolSwamp:connect_one_way_entrance(SummerSpoolSwamp, function() return Has(SpoolSwampSummer) end)
SpoolSwampStump:connect_one_way_entrance(SummerSpoolSwamp, function()
	return All(
		Has(Summer),
		Any(
			Has(Flippers),
			AnyFlute(),
			Jump2()
		)
	)
end)
SouthSpoolSwamp:connect_one_way_entrance(AutumnSpoolSwamp, function() return Has(SpoolSwampAutumn) end)
SpoolSwampStump:connect_one_way_entrance(AutumnSpoolSwamp, function()
	return All(
		Has(Autumn),
		Any(
			Has(Flippers),
			AnyFlute(),
			Jump2()
		)
	)
end)
SouthSpoolSwamp:connect_one_way_entrance(WinterSpoolSwamp, function() return Has(SpoolSwampWinter) end)
SpoolSwampStump:connect_one_way_entrance(WinterSpoolSwamp, function()
	return All(
		Has(Winter),
		Any(
			Has(Flippers),
			AnyFlute(),
			Jump2()
		)
	)
end)

SummerSpoolSwamp:connect_one_way(GoldenOctorokKill, CanSwordKill)

SpringSpoolSwamp:connect_one_way_entrance(SouthSpoolSwamp)
SummerSpoolSwamp:connect_one_way_entrance(SouthSpoolSwamp)
AutumnSpoolSwamp:connect_one_way_entrance(SouthSpoolSwamp)
WinterSpoolSwamp:connect_one_way_entrance(SouthSpoolSwamp)
SpringSpoolSwamp:connect_one_way_entrance(SwampSouthGashaArea, CanDestroyFlower)
SummerSpoolSwamp:connect_one_way_entrance(SwampSouthGashaArea)
AutumnSpoolSwamp:connect_one_way_entrance(SwampSouthGashaArea)
WinterSpoolSwamp:connect_one_way_entrance(SwampSouthGashaArea, function()
	return Any(
		Has(Shovel),
		AnyFlute()
	)
end)
SwampSouthGashaArea:connect_one_way(SwampSouthGashaSpot, function()
	return All(
		CanPlantGasha(),
		Has(Bracelet)
	)
end)
SwampSouthGashaArea:connect_one_way_entrance(SpringSpoolSwamp, function()
	return All(
		Has(SpoolSwampSpring),
		CanDestroyFlower()
	)
end)
SwampSouthGashaArea:connect_one_way_entrance(SummerSpoolSwamp, function() return Has(SpoolSwampSummer) end)
SwampSouthGashaArea:connect_one_way_entrance(AutumnSpoolSwamp, function() return Has(SpoolSwampAutumn) end)
SwampSouthGashaArea:connect_one_way_entrance(WinterSpoolSwamp, function()
	return All(
		Has(SpoolSwampWinter),
		Any(
			Has(Shovel),
			AnyFlute()
		)
	)
end)
SpringSpoolSwamp:connect_one_way(SwampFloodedHP, function()
	return Any(
		Has(Flippers),
		Dimitri(),
		AccessibilityLevel.Inspect
	)
end)
WinterSpoolSwamp:connect_one_way(SwampBombCave, function()
	return All(
		Any(
			Has(Shovel),
			AnyFlute()
		),
		BombPunchWall()
	)
end)

-- dungeon shuffle
PoisonMothLair:connect_one_way_entrance(HerosCaveFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D3LeadsToD0),
		Has(D0AltRemoved) -- randomizer prevents this connection, since you could drown forever on exit
	)
end)
PoisonMothLair:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D3LeadsToD1)
	)
end)
PoisonMothLair:connect_one_way_entrance(SnakeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D3LeadsToD2),
		Has(D2AltRemoved) -- randomizer prevents this connection, since you could drown forever on exit
	)
end)
PoisonMothLair:connect_one_way_entrance(DancingFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D3LeadsToD4)
	)
end)
PoisonMothLair:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D3LeadsToD5)
	)
end)
PoisonMothLair:connect_one_way_entrance(AncientFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D3LeadsToD6)
	)
end)
PoisonMothLair:connect_one_way_entrance(CryptFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D3LeadsToD7)
	)
end)
PoisonMothLair:connect_one_way_entrance(MazeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D3LeadsToD8)
	)
end)

-- portal shuffle
SpoolPortal:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SwampLeadsToSuburbs),
			Has(SuburbsLeadsToSwamp)
		)
	)
end)
SpoolPortal:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SwampLeadsToLake),
			Has(LakeLeadsToSwamp)
		)
	)
end)
SpoolPortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SwampLeadsToCucco),
			Has(CuccoLeadsToSwamp)
		)
	)
end)
SpoolPortal:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SwampLeadsToHoron),
			Has(HoronLeadsToSwamp)
		)
	)
end)
SpoolPortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SwampLeadsToRemains),
			Has(RemainsLeadsToSwamp)
		)
	)
end)
SpoolPortal:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SwampLeadsToUpperRemains),
			Has(UpperRemainsLeadsToSwamp)
		)
	)
end)
SpoolPortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SwampLeadsToMountain),
			Has(MountainLeadsToSwamp)
		)
	)
end)
SpoolPortal:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SwampLeadsToMarket),
			Has(MarketLeadsToSwamp)
		)
	)
end)
SpoolPortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SwampLeadsToFurnace),
			Has(FurnaceLeadsToSwamp)
		)
	)
end)
SpoolPortal:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SwampLeadsToVillage),
			Has(VillageLeadsToSwamp)
		)
	)
end)
SpoolPortal:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SwampLeadsToPirates),
			Has(PiratesLeadsToSwamp)
		)
	)
end)
SpoolPortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SwampLeadsToVolcano),
			Has(VolcanoLeadsToSwamp)
		)
	)
end)
SpoolPortal:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(SwampLeadsToD8),
			Has(D8LeadsToSwamp)
		)
	)
end)