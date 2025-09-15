SouthGoronMountain:connect_one_way(SunkenCityFindSeason)
SouthGoronMountain:connect_one_way(GoronGashaWest, function()
	return All(
		CanPlantGasha,
		Shovel
	)
end)
SouthGoronMountain:connect_one_way(GoronGashaEast, function()
	return All(
		CanPlantGasha,
		Bracelet
	)
end)
SouthGoronMountain:connect_two_ways_entrance(WestGoronMountain, function()
	return Any(
		Flippers,
		JumpLiquid4
	)
end)
SouthGoronMountain:connect_two_ways_entrance(LowerTempleRemains, Jump3)
WestGoronMountain:connect_one_way(GoronLavaChest, function()
	return All(
		CanBombWall,
		JumpLiquid3
	)
end)
WestGoronMountain:connect_one_way_entrance(Biggoron, function()
	return All(
		LavaSoup,
		Feather
	)
end)
Biggoron:connect_one_way(BiggoronSecret)
WestGoronMountain:connect_one_way(GoronMountainOldMan, CanBurnTrees)
WestGoronMountain:connect_two_ways_entrance(CenterGoronMountain, function() return Has(Bracelet) end)
CenterGoronMountain:connect_one_way(LonelyGoron, CanBombWall)
CenterGoronMountain:connect_one_way_entrance(LowerMtCucco, function() return Has(Shovel) end)

-- items
WestGoronMountain:connect_one_way(Maple, CanMapleTrade)
CenterGoronMountain:connect_one_way(Maple, CanMapleTrade)
SouthGoronMountain:connect_one_way(NatzuPlatformCave, function()
	return Any(
		Flippers,
		Dimitri
	)
end)