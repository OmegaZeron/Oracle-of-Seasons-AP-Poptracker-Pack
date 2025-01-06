-- items
NorthHolodrumPlain:connect_one_way(HolodrumPlainTree, function() return CanHarvestSeeds(true) end)
NorthHolodrumPlain:connect_one_way(Blaino, function() return CanFarmRupees(true) end, {SubrosiaMountainEast})
NorthHolodrumPlain:connect_one_way(HolodrumPlainMushroomCave, function()
	return All(
		Has(Flippers),
		CanDestroyMushroom(true),
		Any(
			Has(HolodrumPlainAutumn),
			All(
				Has(Autumn),
				CanReach(SouthHolodrumPlain)
			)
		)
	)
end, {SouthHolodrumPlain})
NorthHolodrumPlain:connect_one_way(NorthHolodrumPlainOldMan, function()
	return All(
		CanBurnTrees(),
		Any(
			Has(HolodrumPlainSummer),
			All(
				Has(Summer),
				CanReach(SouthHolodrumPlain),
				Any(
					AnyFlute(),
					Has(Feather),
					Has(Flippers)
				)
			)
		)
	)
end, {SouthHolodrumPlain})
NorthHolodrumPlain:connect_one_way(TreehouseOldMan, function()
	return All(
		Any(
			Has(Flippers),
			Dimitri()
		),
		HasEnoughEssencesForTreehouse()
	)
end)
NorthHolodrumPlain:connect_one_way(UnderNatzuBridge, function() return Has(Flippers) end)
HolodrumPlainSign:connect_one_way(HolodrumPlainFloodedCave, function() return Has(Flippers) end)
SouthHolodrumPlain:connect_one_way(MrsRuul, function() return Has(GhastlyDoll) end)
SouthHolodrumPlain:connect_one_way(SouthHolodrumPlainGasha, function()
	return All(
		CanPlantGasha(),
		CanDestroyBush(),
		Has(Shovel)
	)
end)
SouthHolodrumPlain:connect_one_way(SouthHolodrumPlainOldMan, CanBurnTrees)
NorthHolodrumPlain:connect_one_way(HolodrumPlainIsland, function()
	return All(
		CanPlantGasha(),
		Any(
			Has(Flippers),
			Dimitri()
		),
		Any(
			CanDestroyBush(),
			Dimitri()
		)
	)
end)

-- exits
NorthHolodrumPlain:connect_two_ways_entrance(SouthHolodrumPlain, function()
	return Any(
		Has(Feather),
		Ricky(),
		Moosh(),
		Has(HolodrumPlainWinter)
	)
end)
NorthHolodrumPlain:connect_two_ways_entrance(HolodrumPlainSign, function()
	return Any(
		Has(Flippers),
		Dimitri()
	)
end)
NorthHolodrumPlain:connect_two_ways_entrance(SouthGoronMountain, function()
	return Any(
		Has(Flippers),
		Dimitri()
	)
end)
SouthHolodrumPlain:connect_one_way_entrance(HolodrumPlainSign, CanDestroyBushFlute)
HolodrumPlainSign:connect_one_way_entrance(SouthHolodrumPlain, function()
	return Any(
		CanDestroyBush(),
		Dimitri()
	)
end)
NorthHolodrumPlain:connect_one_way_entrance(UpperNorthHoron, function() return Has(Bracelet) end)
SouthHolodrumPlain:connect_one_way_entrance(NorthSpoolSwamp, function()
	return Any(
		Has(HolodrumPlainSummer),
		Has(Summer),
		Jump4(),
		Ricky(),
		Moosh()
	)
end)
HolodrumPlainSign:connect_one_way_entrance(SouthSpoolSwamp, function()
	return Any(
		Has(Flippers),
		Dimitri()
	)
end)
NorthHolodrumPlain:connect_two_ways_entrance(SouthGoronMountain, function()
	return Any(
		Has(Flippers),
		Dimitri()
	)
end)
NorthHolodrumPlain:connect_one_way_entrance(NatzuWest, function()
	return Any(
		Has(Flippers),
		Has(Feather),
		Ricky(),
		Moosh()
	)
end)
NorthHolodrumPlain:connect_one_way(OnoxGasha, function()
	return All(
		CanPlantGasha(),
		Has(Shovel)
	)
end)
NorthHolodrumPlain:connect_two_ways_entrance(LowerTempleRemains, Jump3)
NorthHolodrumPlain:connect_one_way_entrance(OnoxCastle, CanGoal)