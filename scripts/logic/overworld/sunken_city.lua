-- items
SunkenCity:connect_one_way(SunkenTree, function()
	return Any(
		CanHarvestSeeds(true),
		AccessibilityLevel.Inspect
	)
end)
SunkenCity:connect_one_way(SunkenSummerCave, function()
	return All(
		Flippers,
		Any(
			SunkenCitySummer,
			Summer
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
		WoodSword,
		Any(
			Flippers,
			Feather
		)
	)
end)
SunkenDimitri:connect_one_way(MasterDiver, function() return Has(MastersPlaque) end)
SunkenDimitri:connect_one_way(SunkenMasterDiverChest)
SunkenCity:connect_one_way(SunkenGashaSpot, function()
	return All(
		CanPlantGasha,
		Flippers,
		Any(
			SunkenCitySummer,
			Summer
		)
	)
end)
SunkenDimitri:connect_one_way(SunkenGashaSpot, CanPlantGasha)
SunkenCity:connect_one_way(DiverSecret, function()
	return All(
		Flippers,
		Any(
			All(
				SwimmersRing,
				MediumLogic
			),
			CanSwordKill,
			HardLogic
		)
	)
end)

-- exits
SunkenCity:connect_one_way_entrance(SunkenDimitri, function()
	return Any(
		Dimitri,
		Bombs
	)
end)
SunkenCity:connect_one_way_entrance(Syrup, function()
	return All(
		Mushroom,
		Any(
			SunkenCityWinter,
			All(
				Winter,
				Any(
					Flippers,
					Dimitri,
					Bombs
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
end)
SunkenCity:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Flippers,
		Any(
			SunkenCitySummer,
			Summer
		)
	)
end)
SunkenCity:connect_one_way_entrance(MoblinRoadWaterfallCaveChest, function()
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