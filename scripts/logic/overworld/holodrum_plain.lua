NorthHolodrumPlain:connect_one_way(Maple, CanMapleTrade)
NorthHolodrumPlain:connect_one_way(HolodrumPlainFindSeason)
NorthHolodrumPlain:connect_one_way(NorthHoronFindSeason)
-- items
NorthHolodrumPlain:connect_one_way(HolodrumPlainTree, function()
	return Any(
		CanHarvestSeeds(true),
		AccessibilityLevel.Inspect
	)
end)
NorthHolodrumPlain:connect_one_way(Blaino, CanFarmRupees)
NorthHolodrumPlain:connect_one_way(HolodrumPlainMushroomCave, function()
	return All(
		Flippers,
		Any(
			All(
				CanDestroyMushroom(true),
				Any(
					HolodrumPlainAutumn,
					Autumn
				)
			),
			CanDimitriClip
		)
	)
end)
NorthHolodrumPlain:connect_one_way(NorthHolodrumPlainOldMan, function()
	return All(
		CanBurnTrees,
		Any(
			HolodrumPlainSummer,
			Ricky,
			All(
				Summer,
				Any(
					Jump1(true),
					All(
						CanDestroyBushFlute(true),
						Flippers
					)
				)
			)
		)
	)
end)
NorthHolodrumPlain:connect_one_way(TreehouseOldMan, function()
	return All(
		Any(
			Flippers,
			Dimitri
		),
		HasEnoughEssencesForTreehouse
	)
end)
NorthHolodrumPlain:connect_one_way(UnderNatzuBridge, function() return Has(Flippers) end)
HolodrumPlainSign:connect_one_way(HolodrumPlainFloodedCave, function() return Has(Flippers) end)
SouthHolodrumPlain:connect_one_way(Maple, CanMapleTrade)
SouthHolodrumPlain:connect_one_way(MrsRuul, function() return Has(GhastlyDoll) end)
SouthHolodrumPlain:connect_one_way(SouthHolodrumPlainGasha, function()
	return All(
		CanPlantGasha,
		CanDestroyBush,
		Shovel
	)
end)
SouthHolodrumPlain:connect_one_way(SouthHolodrumPlainOldMan, CanBurnTrees)
NorthHolodrumPlain:connect_one_way(HolodrumPlainIsland, function()
	return All(
		CanPlantGasha,
		Any(
			Flippers,
			Dimitri
		),
		Any(
			CanDestroyBush,
			Dimitri
		)
	)
end)

-- exits
NorthHolodrumPlain:connect_two_ways_entrance(SouthHolodrumPlain, function()
	return Any(
		Jump1(true),
		HolodrumPlainWinter
	)
end)
NorthHolodrumPlain:connect_two_ways_entrance(HolodrumPlainSign, function()
	return Any(
		Flippers,
		Dimitri
	)
end)
NorthHolodrumPlain:connect_two_ways_entrance(SouthGoronMountain, function()
	return Any(
		Flippers,
		Dimitri
	)
end)
SouthHolodrumPlain:connect_one_way_entrance(HolodrumPlainSign, CanDestroyBushFlute)
HolodrumPlainSign:connect_one_way_entrance(SouthHolodrumPlain, function()
	return Any(
		CanDestroyBush,
		Dimitri
	)
end)
NorthHolodrumPlain:connect_one_way_entrance(UpperNorthHoron, function() return Has(Bracelet) end)
SouthHolodrumPlain:connect_one_way_entrance(NorthSpoolSwamp, function()
	return Any(
		HolodrumPlainSummer,
		Summer,
		Jump4,
		Ricky,
		Moosh
	)
end)
HolodrumPlainSign:connect_one_way_entrance(SouthSpoolSwamp, function()
	return Any(
		Flippers,
		Dimitri
	)
end)
NorthHolodrumPlain:connect_two_ways_entrance(SouthGoronMountain, function()
	return Any(
		Flippers,
		Dimitri
	)
end)
NorthHolodrumPlain:connect_two_ways_entrance(NatzuWest)
NorthHolodrumPlain:connect_one_way(OnoxGasha, function()
	return All(
		CanPlantGasha,
		Shovel
	)
end)
NorthHolodrumPlain:connect_two_ways_entrance(LowerTempleRemains, Jump3)
NorthHolodrumPlain:connect_one_way_entrance(OnoxCastle, CanGoal)