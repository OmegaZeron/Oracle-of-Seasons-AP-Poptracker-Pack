TarmEntrance:connect_one_way_entrance(NorthSpoolSwamp, function() return Tracker:FindObjectForCode(TarmGateSetting).CurrentStage == 0 end)
TarmEntrance:connect_one_way_entrance(TarmTreeStump, function()
	return All(
		Any(
			LostWoodsWinter,
			Winter
		),
		Any(
			Spring,
			Summer,
			Winter
		),
		Any(
			LostWoodsSummer,
			Summer,
			All(
				Any(
					LostWoodsAutumn,
					Autumn
				),
				MagicBoomerang,
				Any(
					Feather,
					HardLogic
				),
				MediumLogic
			)
		)
	)
end)
TarmTreeStump:connect_one_way(Maple, CanMapleTrade)
TarmTreeStump:connect_one_way(GoldenLynelKill, CanSwordKill)
TarmTreeStump:connect_one_way(TarmLostWoodsScrub, function()
	return All(
		Shield,
		Autumn,
		CanDestroyMushroom,
		Any(
			Flippers,
			JumpLiquid2
		)
	)
end)
TarmTreeStump:connect_one_way_entrance(LostWoods, function()
	return All(
		CanDestroyMushroom,
		Autumn
	)
end)
LostWoods:connect_one_way(GoldenLynelKill, function()
	return All(
		CanSwordKill,
		Any(
			LostWoodsAutumn,
			Autumn
		),
		CanDestroyMushroom,
		Winter
	)
end)
LostWoods:connect_one_way_entrance(TarmEntrance, function()
	return All(
		Any(
			LostWoodsAutumn,
			Autumn
		),
		CanDestroyMushroom,
		Winter
	)
end)
LostWoods:connect_one_way(TarmPedestalScrub, function()
	return All(
		Phonograph,
		CanBurnTrees,
		Any(
			LostWoodsSpring,
			LostWoodsSummer,
			LostWoodsAutumn,
			Shovel,
			Spring,
			Summer,
			Autumn
		)
	)
end)
LostWoods:connect_one_way(TarmLostWoodsScrub, function()
	return All(
		Any(
			LostWoodsAutumn,
			Autumn
		),
		CanReach(TarmTreeStump),
		Any(
			Jump3,
			Flippers
		),
		CanDestroyMushroom,
		Shield
	)
end, {TarmTreeStump})
LostWoods:connect_one_way(Pedestal, CanPedestal)
Pedestal:connect_one_way_entrance(LostWoods)
-- special case to get to D6 using default seasons
Pedestal:connect_one_way_entrance(TarmTree, function()
	return Any(
		CanLostWoods,
		All(
			CanLostWoods(true),
			MediumLogic
		)
	)
end, {TarmPedestalScrub})
TarmTree:connect_one_way(TarmSeedTree, function()
	return Any(
		CanHarvestSeeds(true),
		AccessibilityLevel.Inspect
	)
end)
LostWoods:connect_one_way_entrance(TarmTree, CanLostWoods)
-- special case to get to pedestal using default seasons
TarmTree:connect_one_way(Pedestal, function()
	return Any(
		CanPedestal,
		All(
			CanPedestal(true),
			MediumLogic
		)
	)
end, {TarmLostWoodsScrub})
TarmTree:connect_one_way_entrance(LostWoods)
TarmTree:connect_one_way(LostWoodsFindSeason)
TarmTree:connect_one_way(TarmRuinsFindSeason)
TarmTree:connect_one_way(TarmGasha, function()
	return All(
		CanPlantGasha,
		Shovel
	)
end)
TarmTree:connect_one_way(TarmMushroomTreeChest, function()
	return All(
		Any(
			TarmRuinsAutumn,
			Autumn
		),
		CanBurnTrees,
		CanDestroyMushroom
	)
end)
TarmTree:connect_one_way(TarmOldMan, function()
	return All(
		Any(
			TarmRuinsWinter,
			Winter
		),
		CanBurnTrees,
		Any(
			All(
				Any(
					TarmRuinsSpring,
					Spring
				),
				CanDestroyFlower
			),
			All(
				CanReach(RoosterAdventure),
				GetCuccos()["tarm"][2] > 0
			)
		)
	)
end, {RoosterAdventure})
TarmTree:connect_one_way_entrance(UpperTarm, function()
	return All(
		Any(
			TarmRuinsWinter,
			Winter
		),
		Any(
			Shovel,
			CanBurnTrees,
			All(
				CanReach(RoosterAdventure),
				GetCuccos()["tarm"][1] > 0
			)
		)
	)
end, {RoosterAdventure})
UpperTarm:connect_one_way(Maple, CanMapleTrade)
UpperTarm:connect_one_way_entrance(TarmTree)
UpperTarm:connect_one_way(TarmOldMan, function()
	return All(
		Any(
			TarmRuinsSpring,
			Spring
		),
		CanDestroyFlower,
		CanBurnTrees
	)
end)
UpperTarm:connect_one_way_entrance(AncientRuins, function()
	return All(
		Any(
			TarmRuinsSpring,
			Spring
		),
		CanDestroyFlower
	)
end)
AncientRuins:connect_one_way(TarmRuinsFindSeason)
AncientRuins:connect_one_way_entrance(UpperTarm, function()
	return All(
		TarmRuinsSpring,
		CanDestroyFlower
	)
end)
AncientRuins:connect_two_ways_entrance(AncientFoyer, function()
	return Any(
		ShuffleDungeonOff,
		D6LeadsToD6
	)
end)

-- dungeon shuffle
AncientRuins:connect_two_ways_entrance(HerosCaveFoyer, function()
	return All(
		ShuffleDungeonOn,
		D6LeadsToD0
	)
end)
AncientRuins:connect_two_ways_entrance(LinkedCaveFoyer, function()
	return All(
		ShuffleDungeonOn,
		D6LeadsToLC
	)
end)
AncientRuins:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		ShuffleDungeonOn,
		D6LeadsToD1
	)
end)
AncientRuins:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D6LeadsToD2
	)
end)
AncientRuins:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		ShuffleDungeonOn,
		D6LeadsToD3
	)
end)
AncientRuins:connect_one_way_entrance(DancingFoyer, function()
	return All(
		ShuffleDungeonOn,
		D6LeadsToD4
	)
end)
AncientRuins:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		ShuffleDungeonOn,
		D6LeadsToD5
	)
end)
AncientRuins:connect_one_way_entrance(CryptFoyer, function()
	return All(
		ShuffleDungeonOn,
		D6LeadsToD7
	)
end)
AncientRuins:connect_one_way_entrance(MazeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D6LeadsToD8
	)
end)