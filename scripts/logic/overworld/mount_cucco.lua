LowerMtCucco:connect_one_way(SunkenCityFindSeason)
LowerMtCucco:connect_two_ways_entrance(SubrosiaVillagePortal, function()
	return Any(
		ShufflePortalsOff,
		CuccoLeadsToVillage,
		VillageLeadsToCucco
	)
end)
LowerMtCucco:connect_one_way(MtCuccoScrubLeft, function() return Has(Shield) end)
LowerMtCucco:connect_one_way(MtCuccoScrubRight, function() return Has(Shield) end)
LowerMtCucco:connect_one_way_entrance(CuccoRightMountain, function()
	return All(
		Bracelet,
		Any(
			All(
				-- grab normally
				Any(
					SunkenCitySpring,
					Spring
				),
				Any(
					SpringBanana,
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
			SunkenCitySpring,
			Spring
		),
		Any(
			All(
				Feather,
				CanSwordKill
			),
			AccessibilityLevel.Inspect
		)
	)
end)
CuccoRightMountain:connect_one_way(MtCuccoPlatformCave)
LowerMtCucco:connect_one_way_entrance(UpperMtCucco, function()
	return Any(
		SunkenCitySpring,
		Spring
	)
end)
UpperMtCucco:connect_one_way_entrance(LowerMtCucco)
LowerMtCucco:connect_one_way(MtCuccoGasha, function()
	return All(
		CanPlantGasha,
		CanDestroyMushroom,
		Any(
			SunkenCityAutumn,
			Autumn
		)
	)
end)
LowerMtCucco:connect_one_way(GoronPitsItem, function()
	return Any(
		SpringBanana,
		Jump4,
		AccessibilityLevel.Inspect
	)
end)
LowerMtCucco:connect_one_way_entrance(CenterGoronMountain, function()
	return Any(
		SpringBanana,
		Shovel
	)
end)
LowerMtCucco:connect_one_way(MtCuccoLedge, function() return AccessibilityLevel.Inspect end)
UpperMtCucco:connect_one_way(MtCuccoLedge)
UpperMtCucco:connect_one_way_entrance(TalonCave, function()
	return Any(
		SunkenCitySpring,
		SunkenCitySummer,
		SunkenCityAutumn,
		Spring,
		Summer,
		Autumn
	)
end)
TalonCave:connect_one_way_entrance(TalonReward, function()
	return Any(
		Megaphone,
		AccessibilityLevel.Inspect
	)
end)
TalonCave:connect_one_way_entrance(TalonChest, function() return Has(Megaphone) end)
UpperMtCucco:connect_one_way(MtCuccoDiveSpot, function()
	return All(
		Flippers,
		Any(
			SunkenCitySpring,
			SunkenCitySummer,
			SunkenCityAutumn,
			Spring,
			Summer,
			Autumn
		)
	)
end)
UpperMtCucco:connect_one_way_entrance(DragonKeyhole, function()
	return All(
		Feather,
		Bracelet,
		Winter
	)
end)
DragonKeyhole:connect_one_way_entrance(DancingDragonDungeon, function()
	return All(
		DragonKey,
		Summer
	)
end)
DancingDragonDungeon:connect_one_way_entrance(DragonKeyhole, function()
	return All(
		SunkenCityWinter,
		Feather,
		Bracelet
	)
end)
DancingDragonDungeon:connect_one_way(SunkenCityFindSeason)
DancingDragonDungeon:connect_one_way_entrance(UpperMtCucco)
DancingDragonDungeon:connect_two_ways_entrance(DancingFoyer, function()
	return Any(
		ShuffleDungeonOff,
		D4LeadsToD4
	)
end)
LowerMtCucco:connect_one_way_entrance(SunkenCity, function() return Has(Flippers) end)

-- dungeon shuffle
DancingDragonDungeon:connect_two_ways_entrance(HerosCaveFoyer, function()
	return All(
		ShuffleDungeonOn,
		D4LeadsToD0
	)
end)
DancingDragonDungeon:connect_two_ways_entrance(LinkedCaveFoyer, function()
	return All(
		ShuffleDungeonOn,
		D4LeadsToLC
	)
end)
DancingDragonDungeon:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		ShuffleDungeonOn,
		D4LeadsToD1
	)
end)
DancingDragonDungeon:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D4LeadsToD2
	)
end)
DancingDragonDungeon:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		ShuffleDungeonOn,
		D4LeadsToD3
	)
end)
DancingDragonDungeon:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		ShuffleDungeonOn,
		D4LeadsToD5
	)
end)
DancingDragonDungeon:connect_one_way_entrance(AncientFoyer, function()
	return All(
		ShuffleDungeonOn,
		D4LeadsToD6
	)
end)
DancingDragonDungeon:connect_one_way_entrance(CryptFoyer, function()
	return All(
		ShuffleDungeonOn,
		D4LeadsToD7
	)
end)
DancingDragonDungeon:connect_one_way_entrance(MazeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D4LeadsToD8
	)
end)

-- portal shuffle
LowerMtCucco:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			CuccoLeadsToSuburbs,
			SuburbsLeadsToCucco
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			CuccoLeadsToSwamp,
			SwampLeadsToCucco
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			CuccoLeadsToLake,
			LakeLeadsToCucco
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			CuccoLeadsToHoron,
			HoronLeadsToCucco
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			CuccoLeadsToRemains,
			RemainsLeadsToCucco
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			CuccoLeadsToUpperRemains,
			UpperRemainsLeadsToCucco
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			CuccoLeadsToMountain,
			MountainLeadsToCucco
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			CuccoLeadsToMarket,
			MarketLeadsToCucco
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			CuccoLeadsToFurnace,
			FurnaceLeadsToCucco
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			CuccoLeadsToPirates,
			PiratesLeadsToCucco
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			CuccoLeadsToVolcano,
			VolcanoLeadsToCucco
		)
	)
end)
LowerMtCucco:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			CuccoLeadsToD8,
			D8LeadsToCucco
		)
	)
end)