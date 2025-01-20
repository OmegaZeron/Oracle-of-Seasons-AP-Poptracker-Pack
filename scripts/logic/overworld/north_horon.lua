-- lower
-- standing items
LowerNorthHoron:connect_one_way(CatInTree, function()
	return Has(Fish)
end)
LowerNorthHoron:connect_one_way(EyeglassPitsChest, function()
	return Any(
		Jump4(),
		All(
			Has(Feather),
			Any(
				All(
					Has(Autumn),
					CanReach(UpperNorthHoron)
				),
				Has(NorthHoronAutumn)
			)
		)
	)
end, {UpperNorthHoron})
LowerNorthHoron:connect_one_way(NorthHoronGasha, CanPlantGasha)

-- exits
LowerNorthHoron:connect_two_ways_entrance(UpperNorthHoron, CanDestroyBushFlute)
LowerNorthHoron:connect_one_way_entrance(HoronVillage)

-- upper
-- malon
UpperNorthHoron:connect_two_ways_entrance(MalonHouse)
MalonHouse:connect_one_way(MalonTrade, function()
	return Has(Cuccodex)
end)

-- old man
UpperNorthHoron:connect_one_way(NorthHoronOldMan, CanBurnTrees)

-- red ring old man
GnarledRootDoorstep:connect_one_way_entrance(RedRingOldMan, function()
	return Any(
		Has(NorthHoronSummer),
		Has(Summer)
	)
end)
RedRingOldMan:connect_one_way(RedRingOldManReward, AreEnoughGoldenBeastsSlain)

UpperNorthHoron:connect_two_ways_entrance(GnarledRootDoorstep, CanDestroyBushFlute)
GnarledRootDoorstep:connect_one_way_entrance(GnarledRootDungeon, function() return Has(GnarledKey) end)
GnarledRootDungeon:connect_one_way_entrance(GnarledRootDoorstep)
GnarledRootDungeon:connect_two_ways_entrance(GnarledFoyer, function()
	return Any(
		Has(ShuffleDungeonOff),
		Has(D1LeadsToD1)
	)
end)

-- exits
UpperNorthHoron:connect_one_way_entrance(NorthHolodrumPlain, function() return Has(Bracelet) end)
GnarledRootDoorstep:connect_one_way_entrance(NorthHolodrumPlain, function()
	return Any(
		Dimitri(),
		Has(Flippers)
	)
end)
GnarledRootDoorstep:connect_one_way_entrance(HolodrumPlainSign, function()
	return Any(
		Dimitri(),
		Has(Flippers)
	)
end)
UpperNorthHoron:connect_one_way_entrance(EyeglassLake, function()
	return All(
		Any(
			Has(Spring),
			Has(NorthHoronSpring),
			Has(Autumn),
			Has(NorthHoronAutumn)
		),
		Has(Feather),
		Any(
			Has(Flippers),
			All(
				IsMediumPlus(),
				Dimitri(),
				Has(Bracelet)
			)
		)
	)
end)
UpperNorthHoron:connect_one_way_entrance(FrozenEyeglassLake, function()
	return All(
		Any(
			Has(Winter),
			Has(NorthHoronWinter)
		),
		Has(Feather)
	)
end)
UpperNorthHoron:connect_one_way_entrance(DryEyeglassLake, function()
	return All(
		Any(
			Has(Summer),
			Has(NorthHoronSummer)
		),
		Any(
			Has(Feather),
			Moosh(),
			Ricky()
		)
	)
end)

-- eyeglass
-- normal
EyeglassLake:connect_one_way_entrance(UpperNorthHoron, function()
	return Has(Feather)
end)
EyeglassLake:connect_one_way_entrance(EasternNorthHoron)
EyeglassLake:connect_one_way_entrance(EyeglassPortal)

-- frozen
FrozenEyeglassLake:connect_one_way_entrance(UpperNorthHoron, function()
	return Any(
		Has(Feather),
		Ricky(),
		Moosh()
	)
end)
FrozenEyeglassLake:connect_one_way_entrance(EasternNorthHoron)
FrozenEyeglassLake:connect_one_way_entrance(EyeglassPortal, function()
	return Any(
		Has(Flippers),
		All(
			Dimitri(),
			Any(
				Has(Bracelet),
				CanReach(EasternNorthHoron)
			)
		)
	)
end, {EasternNorthHoron})

-- dry
DryEyeglassLake:connect_one_way_entrance(DryEyeglassBombCave, BombPunchWall)
DryEyeglassBombCave:connect_one_way(DryEyeglassBombCaveChest, function()
	return Has(Flippers)
end)
DryEyeglassLake:connect_one_way_entrance(UpperNorthHoron, function()
	return Any(
		Has(Feather),
		Ricky(),
		Moosh()
	)
end)

-- portal
EyeglassPortal:connect_one_way_entrance(EastFurnace, function()
	return Any(
		Has(ShufflePortalsOff),
		Has(LakeLeadsToFurnace),
		Has(FurnaceLeadsToLake)
	)
end)
EyeglassPortal:connect_one_way_entrance(EyeglassLake, function()
	return All(
		Any(
			Has(Spring),
			Has(NorthHoronSpring),
			Has(Autumn),
			Has(NorthHoronAutumn)
		),
		Has(Flippers)
	)
end)
EyeglassPortal:connect_one_way_entrance(FrozenEyeglassLake, function()
	return All(
		Has(NorthHoronWinter),
		Any(
			Has(Flippers),
			JumpLiquid5()
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(DryEyeglassLake, function()
	return Has(NorthHoronSummer)
end)

-- eastern
EasternNorthHoron:connect_one_way(EyeglassGasha, function()
	return All(
		CanPlantGasha(),
		Has(Shovel)
	)
end)
EasternNorthHoron:connect_one_way_entrance(EyeglassLake, function()
	return All(
		Any(
			Has(Spring),
			Has(NorthHoronSpring),
			Has(Autumn),
			Has(NorthHoronAutumn)
		),
		Any(
			Has(Flippers),
			Dimitri()
		)
	)
end)
EasternNorthHoron:connect_one_way_entrance(FrozenEyeglassLake, function()
	return Any(
		Has(Winter),
		Has(NorthHoronWinter)
	)
end)
EasternNorthHoron:connect_one_way_entrance(DryEyeglassLake, function()
	return All(
		Any(
			Has(Summer),
			Has(NorthHoronSummer)
		),
		Has(Flippers)
	)
end)
EasternNorthHoron:connect_one_way_entrance(DryEyeglassHiddenStairs, function()
	return All(
		Has(Summer),
		Has(Bracelet)
	)
end)
DryEyeglassHiddenStairs:connect_one_way(DryEyeglassHiddenStairsChest)
EasternNorthHoron:connect_one_way_entrance(UnicornCave, function()
	return All(
		Has(Autumn),
		CanDestroyMushroom(true)
	)
end)
-- special cases to handle default autumn
UpperNorthHoron:connect_one_way_entrance(UnicornCave, function()
	return All(
		Has(NorthHoronAutumn),
		Has(Feather),
		CanDestroyMushroom(true),
		Any(
			Has(Flippers),
			All(
				IsMediumPlus(),
				Dimitri(),
				Has(Bracelet)
			)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(UnicornCave, function()
	return All(
		Has(NorthHoronAutumn),
		Has(Flippers),
		CanDestroyMushroom(true)
	)
end)
UnicornCave:connect_one_way_entrance(DryEyeglassHiddenStairs, function()
	return All(
		Has(NorthHoronSummer),
		Has(Bracelet)
	)
end)
UnicornCave:connect_one_way_entrance(EasternNorthHoron, function()
	return Any(
		CanWarp(),
		All(
			Has(Feather),
			Has(Autumn),
			CanDestroyMushroom(true)
		)
	)
end)
UnicornCave:connect_one_way_entrance(UnicornFoyer, function()
	return Any(
		Has(ShuffleDungeonOff),
		Has(D5LeadsToD5)
	)
end)

-- Dungeon shuffle
-- d1
GnarledRootDungeon:connect_one_way_entrance(HerosCaveFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D1LeadsToD0)
	)
end)
GnarledRootDungeon:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D1LeadsToD2)
	)
end)
GnarledRootDungeon:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D1LeadsToD3)
	)
end)
GnarledRootDungeon:connect_one_way_entrance(DancingFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D1LeadsToD4)
	)
end)
GnarledRootDungeon:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D1LeadsToD5)
	)
end)
GnarledRootDungeon:connect_one_way_entrance(AncientFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D1LeadsToD6)
	)
end)
GnarledRootDungeon:connect_one_way_entrance(CryptFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D1LeadsToD7)
	)
end)
GnarledRootDungeon:connect_one_way_entrance(MazeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D1LeadsToD8)
	)
end)

-- d5
UnicornCave:connect_one_way_entrance(HerosCaveFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D5LeadsToD0)
	)
end)
UnicornCave:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D5LeadsToD1)
	)
end)
UnicornCave:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D5LeadsToD2)
	)
end)
UnicornCave:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D5LeadsToD3)
	)
end)
UnicornCave:connect_one_way_entrance(DancingFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D5LeadsToD4)
	)
end)
UnicornCave:connect_one_way_entrance(AncientFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D5LeadsToD6)
	)
end)
UnicornCave:connect_one_way_entrance(CryptFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D5LeadsToD7)
	)
end)
UnicornCave:connect_one_way_entrance(MazeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D5LeadsToD8)
	)
end)

-- portal shuffle
EyeglassPortal:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(LakeLeadsToSuburbs),
			Has(SuburbsLeadsToLake)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(LakeLeadsToSwamp),
			Has(SwampLeadsToLake)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(LakeLeadsToCucco),
			Has(CuccoLeadsToLake)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(LakeLeadsToHoron),
			Has(HoronLeadsToLake)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(LakeLeadsToRemains),
			Has(RemainsLeadsToLake)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(LakeLeadsToUpperRemains),
			Has(UpperRemainsLeadsToLake)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(LakeLeadsToMountain),
			Has(MountainLeadsToLake)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(LakeLeadsToMarket),
			Has(MarketLeadsToLake)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(LakeLeadsToFurnace),
			Has(FurnaceLeadsToLake)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(LakeLeadsToVillage),
			Has(VillageLeadsToLake)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(LakeLeadsToPirates),
			Has(PiratesLeadsToLake)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(LakeLeadsToVolcano),
			Has(VolcanoLeadsToLake)
		)
	)
end)
EyeglassPortal:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(LakeLeadsToD8),
			Has(D8LeadsToLake)
		)
	)
end)