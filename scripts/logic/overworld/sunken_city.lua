-- items
SunkenCity:connect_one_way(SunkenTree, function()
	return Any(
		CanHarvestSeeds(true),
		AccessibilityLevel.Inspect
	)
end)
SunkenCity:connect_one_way(SunkenSummerCave, function()
	return All(
		HasFlippers,
		Any(
			Has(SunkenCitySummer),
			HasSummer
		),
		CanDestroyBush
	)
end)
SunkenCity:connect_one_way(SunkenVaseTrade, function() return Has(GoronVase) end)
SunkenDimitri:connect_one_way(SunkenTree, function()
	-- may not actually have Dimitri's flute, but can use him after saving to get the seeds
	return All(
		CanUseSeeds,
		MediumLogic
	)
end)
SunkenDimitri:connect_one_way(MasterChallenge, function()
	return All(
		HasSword,
		Any(
			HasFlippers,
			HasFeather
		)
	)
end)
SunkenDimitri:connect_one_way(MasterDiver, function() return Has(MastersPlaque) end)
SunkenDimitri:connect_one_way(SunkenMasterDiverChest)
SunkenCity:connect_one_way(SunkenGashaSpot, function()
	return All(
		CanPlantGasha,
		HasFlippers,
		Any(
			Has(SunkenCitySummer),
			HasSummer
		)
	)
end)
SunkenDimitri:connect_one_way(SunkenGashaSpot, CanPlantGasha)
SunkenCity:connect_one_way(DiverSecret, function()
	return All(
		HasFlippers,
		Any(
			CanSwordKill,
			MediumLogic
		)
	)
end)

-- exits
SunkenCity:connect_one_way_entrance(SunkenDimitri, function()
	return Any(
		Dimitri,
		HasBombs
	)
end)
SunkenCity:connect_one_way_entrance(Syrup, function()
	return All(
		Has(Mushroom),
		Any(
			Has(SunkenCityWinter),
			All(
				HasWinter,
				Any(
					HasFlippers,
					Dimitri,
					HasBombs
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
		HasFlippers,
		Any(
			Has(SunkenCitySummer),
			HasSummer
		)
	)
end)
SunkenCity:connect_one_way_entrance(MoblinRoadWaterfallCaveChest, function()
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