-- items
SunkenCity:connect_one_way(SunkenTree, function() return CanHarvestSeeds(true) end)
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
		CanHarvestSeeds(),
		Any(
			IsMediumPlus(),
			AccessibilityLevel.SequenceBreak
		)
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
					CanReach(SunkenDimitri)
				)
			)
		)
	)
end, {SunkenDimitri})
Syrup:connect_one_way(Syrup1, function()
	return Any(
		HasRupees(ShopPrices[SyrupShop1Price]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})
Syrup:connect_one_way(Syrup2, function()
	return Any(
		HasRupees(ShopPrices[SyrupShop2Price]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})
Syrup:connect_one_way(Syrup3, function()
	return Any(
		HasRupees(ShopPrices[SyrupShop3Price]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})
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