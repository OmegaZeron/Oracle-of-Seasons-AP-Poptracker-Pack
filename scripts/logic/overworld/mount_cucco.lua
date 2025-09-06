LowerMtCucco:connect_one_way(SunkenCityFindSeason)
LowerMtCucco:connect_two_ways_entrance(SubrosiaVillagePortal, function()
	return Any(
		Has(ShufflePortalsOff),
		Has(CuccoLeadsToVillage),
		Has(VillageLeadsToCucco)
	)
end)
LowerMtCucco:connect_one_way(MtCuccoScrubLeft, function() return Has(Shield) end)
LowerMtCucco:connect_one_way(MtCuccoScrubRight, function() return Has(Shield) end)
LowerMtCucco:connect_one_way_entrance(CuccoRightMountain, function()
	return All(
		HasBracelet,
		Any(
			All(
				-- grab normally
				Any(
					Has(SunkenCitySpring),
					HasSpring
				),
				Any(
					Has(SpringBanana),
					CanDestroyFlower
				)
			),
			HardLogic -- cucco clip
		)
	)
end)
CuccoRightMountain:connect_one_way(BananaTree, function()
	return All(
		Any(
			Has(SunkenCitySpring),
			HasSpring
		),
		Any(
			All(
				HasFeather,
				CanSwordKill
			),
			AccessibilityLevel.Inspect
		)
	)
end)
CuccoRightMountain:connect_one_way(MtCuccoPlatformCave)
LowerMtCucco:connect_one_way_entrance(UpperMtCucco, function()
	return Any(
		Has(SunkenCitySpring),
		HasSpring
	)
end)
UpperMtCucco:connect_one_way_entrance(LowerMtCucco)
LowerMtCucco:connect_one_way(MtCuccoGasha, function()
	return All(
		CanPlantGasha,
		CanDestroyMushroom,
		Any(
			Has(SunkenCityAutumn),
			HasAutumn
		)
	)
end)
LowerMtCucco:connect_one_way(GoronPitsItem, function()
	return Any(
		Has(SpringBanana),
		Jump4,
		AccessibilityLevel.Inspect
	)
end)
LowerMtCucco:connect_one_way_entrance(CenterGoronMountain, function()
	return Any(
		Has(SpringBanana),
		HasShovel
	)
end)
LowerMtCucco:connect_one_way(MtCuccoLedge, function() return AccessibilityLevel.Inspect end)
UpperMtCucco:connect_one_way(MtCuccoLedge)
UpperMtCucco:connect_one_way_entrance(TalonCave, function()
	return Any(
		Has(SunkenCitySpring),
		Has(SunkenCitySummer),
		Has(SunkenCityAutumn),
		HasSpring,
		HasSummer,
		HasAutumn
	)
end)
TalonCave:connect_one_way_entrance(TalonReward, function()
	return Any(
		Has(Megaphone),
		AccessibilityLevel.Inspect
	)
end)
TalonCave:connect_one_way_entrance(TalonChest, function() return Has(Megaphone) end)
UpperMtCucco:connect_one_way(MtCuccoDiveSpot, function()
	return All(
		HasFlippers,
		Any(
			Has(SunkenCitySpring),
			Has(SunkenCitySummer),
			Has(SunkenCityAutumn),
			HasSpring,
			HasSummer,
			HasAutumn
		)
	)
end)
UpperMtCucco:connect_one_way_entrance(DragonKeyhole, function()
	return All(
		HasFeather,
		HasBracelet,
		HasWinter
	)
end)
DragonKeyhole:connect_one_way_entrance(DancingDragonDungeon, function()
	return All(
		Has(DragonKey),
		HasSummer
	)
end)
DancingDragonDungeon:connect_one_way_entrance(DragonKeyhole, function()
	return All(
		Has(SunkenCityWinter),
		HasFeather,
		HasBracelet
	)
end)
DancingDragonDungeon:connect_one_way(SunkenCityFindSeason)
DancingDragonDungeon:connect_one_way_entrance(UpperMtCucco)
DancingDragonDungeon:connect_two_ways_entrance(DancingFoyer, function()
	return Any(
		Has(ShuffleDungeonOff),
		Has(D4LeadsToD4)
	)
end)
LowerMtCucco:connect_one_way_entrance(SunkenCity, function() return Has(Flippers) end)

-- dungeon shuffle
DancingDragonDungeon:connect_two_ways_entrance(HerosCaveFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D4LeadsToD0)
	)
end)
DancingDragonDungeon:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D4LeadsToD1)
	)
end)
DancingDragonDungeon:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D4LeadsToD2)
	)
end)
DancingDragonDungeon:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D4LeadsToD3)
	)
end)
DancingDragonDungeon:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D4LeadsToD5)
	)
end)
DancingDragonDungeon:connect_one_way_entrance(AncientFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D4LeadsToD6)
	)
end)
DancingDragonDungeon:connect_one_way_entrance(CryptFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D4LeadsToD7)
	)
end)
DancingDragonDungeon:connect_one_way_entrance(MazeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D4LeadsToD8)
	)
end)

-- portal shuffle
LowerMtCucco:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(CuccoLeadsToSuburbs),
			Has(SuburbsLeadsToCucco)
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(CuccoLeadsToSwamp),
			Has(SwampLeadsToCucco)
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(CuccoLeadsToLake),
			Has(LakeLeadsToCucco)
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(CuccoLeadsToHoron),
			Has(HoronLeadsToCucco)
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(CuccoLeadsToRemains),
			Has(RemainsLeadsToCucco)
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(CuccoLeadsToUpperRemains),
			Has(UpperRemainsLeadsToCucco)
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(CuccoLeadsToMountain),
			Has(MountainLeadsToCucco)
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(CuccoLeadsToMarket),
			Has(MarketLeadsToCucco)
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(CuccoLeadsToFurnace),
			Has(FurnaceLeadsToCucco)
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(CuccoLeadsToPirates),
			Has(PiratesLeadsToCucco)
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(CuccoLeadsToVolcano),
			Has(VolcanoLeadsToCucco)
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(CuccoLeadsToD8),
			Has(D8LeadsToCucco)
		)
	)
end)