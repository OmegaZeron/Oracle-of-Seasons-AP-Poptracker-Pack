-- lower
LowerNorthHoron:connect_one_way(NorthHoronFindSeason)
LowerEasternSuburbs:connect_one_way(Maple, CanMapleTrade)
-- standing items
LowerNorthHoron:connect_one_way(CatInTree, function() return Has(Fish) end)
LowerNorthHoron:connect_one_way(EyeglassPitsChest, function()
	return Any(
		Jump4,
		All(
			Feather,
			Any(
				All(
					CanDestroyBushFlute(true),
					Autumn
				),
				NorthHoronAutumn
			)
		)
	)
end)
LowerNorthHoron:connect_one_way(NorthHoronGasha, CanPlantGasha)

-- exits
LowerNorthHoron:connect_two_ways_entrance(UpperNorthHoron, CanDestroyBushFlute)
LowerNorthHoron:connect_one_way_entrance(HoronVillage)

-- upper
UpperNorthHoron:connect_one_way(NorthHoronFindSeason)
LowerEasternSuburbs:connect_one_way(Maple, CanMapleTrade)
-- malon
UpperNorthHoron:connect_two_ways_entrance(MalonHouse)
MalonHouse:connect_one_way(MalonTrade, function() return Has(Cuccodex) end)

-- old man
UpperNorthHoron:connect_one_way(NorthHoronOldMan, CanBurnTrees)

-- red ring old man
GnarledRootDoorstep:connect_one_way_entrance(RedRingOldMan, function()
	return Any(
		NorthHoronSummer,
		All(
			Summer,
			CanDestroyBushFlute
		)
	)
end)
RedRingOldMan:connect_one_way(RedRingOldManReward, AreEnoughGoldenBeastsSlain)

UpperNorthHoron:connect_two_ways_entrance(GnarledRootDoorstep, CanDestroyBushFlute)
GnarledRootDoorstep:connect_one_way_entrance(GnarledRootDungeon, function() return Has(GnarledKey) end)
GnarledRootDungeon:connect_one_way_entrance(GnarledRootDoorstep)
GnarledRootDungeon:connect_two_ways_entrance(GnarledFoyer, function()
	return Any(
		ShuffleDungeonOff,
		D1LeadsToD1
	)
end)

-- exits
UpperNorthHoron:connect_one_way_entrance(NorthHolodrumPlain, function() return Has(Bracelet) end)
GnarledRootDoorstep:connect_one_way_entrance(NorthHolodrumPlain, function()
	return Any(
		Dimitri,
		Flippers
	)
end)
GnarledRootDoorstep:connect_one_way_entrance(HolodrumPlainSign, function()
	return Any(
		Dimitri,
		Flippers
	)
end)
UpperNorthHoron:connect_one_way_entrance(EyeglassLake, function()
	return All(
		Any(
			NorthHoronSpring,
			NorthHoronAutumn,
			Spring,
			Autumn
		),
		Jump1(true),
		Any(
			Flippers,
			All(
				Dimitri,
				Bracelet,
				MediumLogic
			)
		)
	)
end)
UpperNorthHoron:connect_one_way_entrance(FrozenEyeglassLake, function()
	return All(
		Any(
			NorthHoronWinter,
			Winter
		),
		Jump1(true)
	)
end)
UpperNorthHoron:connect_one_way_entrance(DryEyeglassLake, function()
	return All(
		Any(
			NorthHoronSummer,
			Summer
		),
		Jump1(true)
	)
end)

-- eyeglass
-- normal
EyeglassLake:connect_one_way_entrance(UpperNorthHoron, function() return Has(Feather) end)
EyeglassLake:connect_one_way_entrance(EasternNorthHoron)
EyeglassLake:connect_one_way_entrance(EyeglassPortal)

-- frozen
FrozenEyeglassLake:connect_one_way_entrance(UpperNorthHoron, function() return Jump1(true) end)
FrozenEyeglassLake:connect_one_way_entrance(EasternNorthHoron)
FrozenEyeglassLake:connect_one_way_entrance(EyeglassPortal, function()
	return Any(
		Flippers,
		JumpLiquid5,
		Dimitri
	)
end)

-- dry
DryEyeglassLake:connect_one_way_entrance(DryEyeglassBombCave, BombPunchWall)
DryEyeglassBombCave:connect_one_way(DryEyeglassBombCaveChest, function() return Has(Flippers) end)
DryEyeglassLake:connect_one_way_entrance(UpperNorthHoron, function()
	return Jump1(true)
end)

-- portal
EyeglassPortal:connect_one_way_entrance(EastFurnace, function()
	return Any(
		ShufflePortalsOff,
		LakeLeadsToFurnace,
		FurnaceLeadsToLake
	)
end)
EyeglassPortal:connect_one_way_entrance(EyeglassLake, function()
	return All(
		Any(
			NorthHoronSpring,
			NorthHoronAutumn,
			Spring,
			Autumn
		),
		Flippers
	)
end)
EyeglassPortal:connect_one_way_entrance(FrozenEyeglassLake, function()
	return All(
		NorthHoronWinter,
		Any(
			Flippers,
			JumpLiquid5
		)
	)
end)

-- special connection from dry portal stairs warping all the way to pedestal
EyeglassPortal:connect_one_way_entrance(Pedestal, function()
	return All(
		NorthHoronSummer,
		HardLogic
	)
end)

-- eastern
EasternNorthHoron:connect_one_way(Maple, CanMapleTrade)
EasternNorthHoron:connect_one_way(EyeglassGasha, function()
	return All(
		Shovel,
		CanPlantGasha
	)
end)
EasternNorthHoron:connect_one_way_entrance(EyeglassLake, function()
	return All(
		Any(
			NorthHoronSpring,
			NorthHoronAutumn,
			Spring,
			Autumn
		),
		Any(
			Flippers,
			Dimitri
		)
	)
end)
EasternNorthHoron:connect_one_way_entrance(FrozenEyeglassLake, function()
	return Any(
		NorthHoronWinter,
		Winter
	)
end)
EasternNorthHoron:connect_one_way_entrance(DryEyeglassLake, function()
	return All(
		Flippers,
		Any(
			NorthHoronSummer,
			Summer
		)
	)
end)
EasternNorthHoron:connect_one_way_entrance(DryEyeglassHiddenStairs, function()
	return All(
		Summer,
		Bracelet
	)
end)
DryEyeglassHiddenStairs:connect_one_way(DryEyeglassHiddenStairsChest)
EasternNorthHoron:connect_one_way_entrance(UnicornCave, function()
	return All(
		CanDestroyMushroom(true),
		Autumn
	)
end)
-- special cases to handle default autumn
UpperNorthHoron:connect_one_way_entrance(UnicornCave, function()
	return All(
		Jump1(true),
		CanDestroyMushroom(true),
		NorthHoronAutumn,
		Any(
			Flippers,
			All(
				Dimitri,
				Bracelet,
				MediumLogic
			),
			All(
				Dimitri,
				Winter
			)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(UnicornCave, function()
	return All(
		CanDestroyMushroom(true),
		NorthHoronAutumn,
		Flippers
	)
end)
UnicornCave:connect_one_way_entrance(DryEyeglassHiddenStairs, function()
	return All(
		Jump1(true),
		NorthHoronSummer,
		Bracelet
	)
end)
UnicornCave:connect_one_way_entrance(EasternNorthHoron, function()
	return Any(
		Jump1(true),
		All(
			NorthHoronAutumn,
			CanDestroyMushroom
		)
	)
end)
UnicornCave:connect_one_way_entrance(UnicornFoyer, function()
	return Any(
		ShuffleDungeonOff,
		D5LeadsToD5
	)
end)

-- Dungeon shuffle
-- d1
GnarledRootDungeon:connect_two_ways_entrance(HerosCaveFoyer, function()
	return All(
		ShuffleDungeonOn,
		D1LeadsToD0
	)
end)
GnarledRootDungeon:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D1LeadsToD2
	)
end)
GnarledRootDungeon:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		ShuffleDungeonOn,
		D1LeadsToD3
	)
end)
GnarledRootDungeon:connect_one_way_entrance(DancingFoyer, function()
	return All(
		ShuffleDungeonOn,
		D1LeadsToD4
	)
end)
GnarledRootDungeon:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		ShuffleDungeonOn,
		D1LeadsToD5
	)
end)
GnarledRootDungeon:connect_one_way_entrance(AncientFoyer, function()
	return All(
		ShuffleDungeonOn,
		D1LeadsToD6
	)
end)
GnarledRootDungeon:connect_one_way_entrance(CryptFoyer, function()
	return All(
		ShuffleDungeonOn,
		D1LeadsToD7
	)
end)
GnarledRootDungeon:connect_one_way_entrance(MazeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D1LeadsToD8
	)
end)

-- d5
UnicornCave:connect_two_ways_entrance(HerosCaveFoyer, function()
	return All(
		ShuffleDungeonOn,
		D5LeadsToD0
	)
end)
UnicornCave:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		ShuffleDungeonOn,
		D5LeadsToD1
	)
end)
UnicornCave:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D5LeadsToD2
	)
end)
UnicornCave:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		ShuffleDungeonOn,
		D5LeadsToD3
	)
end)
UnicornCave:connect_one_way_entrance(DancingFoyer, function()
	return All(
		ShuffleDungeonOn,
		D5LeadsToD4
	)
end)
UnicornCave:connect_one_way_entrance(AncientFoyer, function()
	return All(
		ShuffleDungeonOn,
		D5LeadsToD6
	)
end)
UnicornCave:connect_one_way_entrance(CryptFoyer, function()
	return All(
		ShuffleDungeonOn,
		D5LeadsToD7
	)
end)
UnicornCave:connect_one_way_entrance(MazeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D5LeadsToD8
	)
end)

-- portal shuffle
EyeglassPortal:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			LakeLeadsToSuburbs,
			SuburbsLeadsToLake
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			LakeLeadsToSwamp,
			SwampLeadsToLake
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			LakeLeadsToCucco,
			CuccoLeadsToLake
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			LakeLeadsToHoron,
			HoronLeadsToLake
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			LakeLeadsToRemains,
			RemainsLeadsToLake
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			LakeLeadsToUpperRemains,
			UpperRemainsLeadsToLake
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			LakeLeadsToMountain,
			MountainLeadsToLake
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			LakeLeadsToMarket,
			MarketLeadsToLake
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			LakeLeadsToFurnace,
			FurnaceLeadsToLake
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			LakeLeadsToVillage,
			VillageLeadsToLake
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			LakeLeadsToPirates,
			PiratesLeadsToLake
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			LakeLeadsToVolcano,
			VolcanoLeadsToLake
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			LakeLeadsToD8,
			D8LeadsToLake
		)
	)
end)