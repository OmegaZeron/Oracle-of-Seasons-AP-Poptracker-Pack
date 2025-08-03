-- items
SunkenCity:connect_one_way(SunkenTree, function()
	return Any(
		CanHarvestSeeds(true),
		AccessibilityLevel.Inspect
	)
end)
SunkenCity:connect_one_way(SunkenSummerCave, function()
	return All(
		Has(Flippers),
		Any(
			Has(SunkenCitySummer),
			Has(Summer)
		),
		CanDestroyBush()
	)
end)
SunkenCity:connect_one_way(SunkenVaseTrade, function() return Has(GoronVase) end)
SunkenDimitri:connect_one_way(SunkenTree, function()
	-- may not actually have Dimitri's flute, but can use him after saving to get the seeds
	return All(
		CanUseSeeds(),
		MediumLogic()
	)
end)
SunkenDimitri:connect_one_way(MasterChallenge, function()
	return All(
		Has(WoodSword),
		Any(
			Has(Flippers),
			Has(Feather)
		)
	)
end)
SunkenDimitri:connect_one_way(MasterDiver, function() return Has(MastersPlaque) end)
SunkenDimitri:connect_one_way(SunkenMasterDiverChest)
SunkenCity:connect_one_way(SunkenGashaSpot, function()
	return All(
		CanPlantGasha(),
		Has(Flippers),
		Any(
			Has(SunkenCitySummer),
			Has(Summer)
		)
	)
end)
SunkenDimitri:connect_one_way(SunkenGashaSpot, CanPlantGasha)
SunkenCity:connect_one_way(DiverSecret, function()
	return All(
		Has(Flippers),
		Any(
			CanSwordKill(),
			MediumLogic()
		)
	)
end)

-- exits
SunkenCity:connect_one_way_entrance(SunkenDimitri, function()
	return Any(
		Dimitri(),
		Has(Bombs)
	)
end)
SunkenCity:connect_one_way_entrance(Syrup, function()
	return All(
		Has(Mushroom),
		Any(
			Has(SunkenCityWinter),
			All(
				Has(Winter),
				Any(
					Has(Flippers),
					Dimitri(),
					Has(Bombs)
				)
			)
		)
	)
end)
Syrup:connect_one_way_entrance(SyrupShop, function()
	return Any(
		HasRupees(ShopPrices[SyrupShopPrice]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom, HoronVillageOldMan, NorthHoronOldMan, SuburbsOldMan, NorthHolodrumPlainOldMan, SouthHolodrumPlainOldMan, GoronMountainOldMan, TarmOldMan, WesternCoastOldMan})
SunkenCity:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Has(Flippers),
		Any(
			Has(Summer),
			Has(SunkenCitySummer)
		)
	)
end)
SunkenCity:connect_one_way_entrance(MoblinRoadWaterfallCaveChest, function()
	return All(
		Has(Flippers),
		Any(
			Has(Spring),
			Has(Summer),
			Has(Autumn),
			Has(SunkenCitySpring),
			Has(SunkenCitySummer),
			Has(SunkenCityAutumn)
		)
	)
end)