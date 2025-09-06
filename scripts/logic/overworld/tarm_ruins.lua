TarmEntrance:connect_one_way_entrance(NorthSpoolSwamp, function() return Tracker:FindObjectForCode(TarmGateSetting).CurrentStage == 0 end)
TarmEntrance:connect_one_way_entrance(TarmTreeStump, function()
	return All(
		Any(
			Has(LostWoodsWinter),
			HasWinter
		),
		Any(
			HasSpring,
			HasSummer,
			HasWinter
		),
		Any(
			Has(LostWoodsSummer),
			HasSummer,
			All(
				Any(
					Has(LostWoodsAutumn),
					HasAutumn
				),
				HasMagicBoomerang,
				Any(
					HasFeather,
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
		HasShield,
		HasAutumn,
		CanDestroyMushroom,
		Any(
			HasFlippers,
			JumpLiquid2
		)
	)
end)
TarmTreeStump:connect_one_way_entrance(LostWoods, function()
	return All(
		CanDestroyMushroom,
		HasAutumn
	)
end)
LostWoods:connect_one_way(GoldenLynelKill, function()
	return All(
		CanSwordKill,
		Any(
			Has(LostWoodsAutumn),
			HasAutumn
		),
		CanDestroyMushroom,
		HasWinter
	)
end)
LostWoods:connect_one_way_entrance(TarmEntrance, function()
	return All(
		Any(
			Has(LostWoodsAutumn),
			HasAutumn
		),
		CanDestroyMushroom,
		HasWinter
	)
end)
LostWoods:connect_one_way(TarmPedestalScrub, function()
	return All(
		Has(Phonograph),
		CanBurnTrees,
		Any(
			Has(LostWoodsSpring),
			Has(LostWoodsSummer),
			Has(LostWoodsAutumn),
			HasShovel,
			HasSpring,
			HasSummer,
			HasAutumn
		)
	)
end)
LostWoods:connect_one_way(TarmLostWoodsScrub, function()
	return All(
		Any(
			Has(LostWoodsAutumn),
			HasAutumn
		),
		CanReach(TarmTreeStump),
		Any(
			Jump3,
			HasFlippers
		),
		CanDestroyMushroom,
		HasShield
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
		HasShovel
	)
end)
TarmTree:connect_one_way(TarmMushroomTreeChest, function()
	return All(
		Any(
			Has(TarmRuinsAutumn),
			HasAutumn
		),
		CanBurnTrees,
		CanDestroyMushroom
	)
end)
TarmTree:connect_one_way(TarmOldMan, function()
	return All(
		Any(
			Has(TarmRuinsWinter),
			HasWinter
		),
		CanBurnTrees,
		Any(
			All(
				Any(
					Has(TarmRuinsSpring),
					HasSpring
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
			Has(TarmRuinsWinter),
			HasWinter
		),
		Any(
			HasShovel,
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
			Has(TarmRuinsSpring),
			HasSpring
		),
		CanDestroyFlower,
		CanBurnTrees
	)
end)
UpperTarm:connect_one_way_entrance(AncientRuins, function()
	return All(
		Any(
			Has(TarmRuinsSpring),
			HasSpring
		),
		CanDestroyFlower
	)
end)
AncientRuins:connect_one_way(TarmRuinsFindSeason)
AncientRuins:connect_one_way_entrance(UpperTarm, function()
	return All(
		Has(TarmRuinsSpring),
		CanDestroyFlower
	)
end)
AncientRuins:connect_two_ways_entrance(AncientFoyer, function()
	return Any(
		Has(ShuffleDungeonOff),
		Has(D6LeadsToD6)
	)
end)

-- dungeon shuffle
AncientRuins:connect_two_ways_entrance(HerosCaveFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD0)
	)
end)
AncientRuins:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD1)
	)
end)
AncientRuins:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD2)
	)
end)
AncientRuins:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD3)
	)
end)
AncientRuins:connect_one_way_entrance(DancingFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD4)
	)
end)
AncientRuins:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD5)
	)
end)
AncientRuins:connect_one_way_entrance(CryptFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD7)
	)
end)
AncientRuins:connect_one_way_entrance(MazeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD8)
	)
end)