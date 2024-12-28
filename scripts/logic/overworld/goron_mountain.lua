SouthGoronMountain:connect_one_way(GoronGashaWest, function()
	return All(
		CanPlantGasha(),
		Has(Shovel)
	)
end)
SouthGoronMountain:connect_one_way(GoronGashaEast, function()
	return All(
		CanPlantGasha(),
		Has(Bracelet)
	)
end)
SouthGoronMountain:connect_two_ways_entrance(WestGoronMountain, function()
	return Any(
		Has(Flippers),
		JumpLiquid4()
	)
end)
SouthGoronMountain:connect_two_ways_entrance(LowerTempleRemains, Jump3)
WestGoronMountain:connect_one_way(GoronLavaChest, function()
	return All(
		Has(Bombs),
		JumpLiquid3()
	)
end)
WestGoronMountain:connect_one_way(Biggoron, function()
	return All(
		Has(Feather),
		Has(LavaSoup)
	)
end)
WestGoronMountain:connect_one_way(GoronMountainOldMan, CanBurnTrees)
WestGoronMountain:connect_two_ways_entrance(CenterGoronMountain, function() return Has(Bracelet) end)
CenterGoronMountain:connect_one_way(LonelyGoron, function() return Has(Bombs) end)
CenterGoronMountain:connect_one_way_entrance(LowerMtCucco, function() return Has(Shovel) end)

-- items
SouthGoronMountain:connect_one_way(NatzuPlatformCave, function()
	return Any(
		Has(Flippers),
		Dimitri()
	)
end)