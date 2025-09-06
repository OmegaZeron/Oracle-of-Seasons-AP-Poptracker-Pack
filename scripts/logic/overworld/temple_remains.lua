LowerTempleRemains:connect_one_way(Maple, CanMapleTrade)
LowerTempleRemains:connect_one_way(TempleRemainsFindSeason)
LowerTempleRemains:connect_one_way_entrance(TempleRemainsStump, function()
	return All(
		HasFeather,
		Any(
			CanReach(Fireworks),
			All(
				CanDestroyBush,
				Any(
					All(
						-- spring
						Any(
							Has(TempleRemainsSpring),
							HasSpring
						),
						CanDestroyFlower,
						Jump6
					),
					All(
						-- summer
						Any(
							Has(TempleRemainsSummer),
							HasSummer
						),
						Jump6
					),
					All(
						-- autumn
						Any(
							Has(TempleRemainsAutumn),
							HasAutumn
						)
					),
					All(
						-- winter
						Any(
							Has(TempleRemainsWinter),
							HasWinter
						),
						HasShovel,
						Jump6
					)
				)
			)
		)
	)
end, {Fireworks})
TempleRemainsStump:connect_one_way_entrance(LowerTempleRemains, function()
	return All(
		HasFeather,
		Any(
			CanReach(Fireworks),
			All(
				-- spring
				Any(
					Has(TempleRemainsSpring),
					HasSpring
				),
				CanDestroyFlower,
				CanDestroyBush,
				Jump6
			),
			All(
				-- summer
				Any(
					Has(TempleRemainsSummer),
					HasSummer
				),
				CanDestroyBush,
				Jump6
			),
			All(
				-- autumn
				Any(
					Has(TempleRemainsAutumn),
					HasAutumn
				),
				CanDestroyBush
			),
			Any(
				-- winter
				Has(TempleRemainsWinter),
				HasWinter
			)
		)
	)
end, {Fireworks})
LowerTempleRemains:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		CanReach(Fireworks),
		HasFeather
	)
end, {Fireworks})
TempleRemainsStump:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		HasFeather,
		Any(
			CanReach(Fireworks),
			HasWinter
		)
	)
end, {Fireworks})
TempleRemainsLowerPortal:connect_one_way(TempleRemainsFindSeason)
TempleRemainsLowerPortal:connect_two_ways_entrance(Volcano, function()
	return Any(
		Has(ShufflePortalsOff),
		Has(RemainsLeadsToVolcano),
		Has(VolcanoLeadsToRemains)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(LowerTempleRemains)
LowerTempleRemains:connect_one_way(TempleRemainsBombCave, function()
	return All(
		CanReach(Fireworks),
		JumpLiquid2
	)
end, {Fireworks})
LowerTempleRemains:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		CanReach(Fireworks),
		Any(
			Has(TempleRemainsSummer),
			HasSummer
		),
		JumpLiquid2,
		Any(
			Jump6,
			HasMagnetGlove
		)
	)
end, {Fireworks})
TempleRemainsUpperPortal:connect_one_way(TempleRemainsFindSeason)
TempleRemainsUpperPortal:connect_one_way_entrance(LowerTempleRemains, function()
	return All(
		CanReach(Fireworks),
		HasFeather
	)
end, {Fireworks})
TempleRemainsUpperPortal:connect_one_way_entrance(TempleRemainsStump, function() return Has(Feather) end)
TempleRemainsUpperPortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		HasFeather,
		Any(
			Has(TempleRemainsWinter),
			CanReach(Fireworks)
		)
	)
end, {Fireworks})
TempleRemainsUpperPortal:connect_two_ways_entrance(SwordAndShieldMaze, function()
	return Any(
		Has(ShufflePortalsOff),
		Has(UpperRemainsLeadsToD8),
		Has(D8LeadsToUpperRemains)
	)
end)

-- portal shuffle
TempleRemainsLowerPortal:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(RemainsLeadsToSuburbs),
			Has(SuburbsLeadsToRemains)
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(RemainsLeadsToSwamp),
			Has(SwampLeadsToRemains)
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(RemainsLeadsToLake),
			Has(LakeLeadsToRemains)
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(RemainsLeadsToCucco),
			Has(CuccoLeadsToRemains)
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(RemainsLeadsToHoron),
			Has(HoronLeadsToRemains)
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(RemainsLeadsToUpperRemains),
			Has(UpperRemainsLeadsToRemains)
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(RemainsLeadsToMountain),
			Has(MountainLeadsToRemains)
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(RemainsLeadsToMarket),
			Has(MarketLeadsToRemains)
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(RemainsLeadsToFurnace),
			Has(FurnaceLeadsToRemains)
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(RemainsLeadsToVillage),
			Has(VillageLeadsToRemains)
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(RemainsLeadsToPirates),
			Has(PiratesLeadsToRemains)
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(RemainsLeadsToVolcano),
			Has(VolcanoLeadsToRemains)
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(RemainsLeadsToD8),
			Has(D8LeadsToRemains)
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(UpperRemainsLeadsToSuburbs),
			Has(SuburbsLeadsToUpperRemains)
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(UpperRemainsLeadsToSwamp),
			Has(SwampLeadsToUpperRemains)
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(UpperRemainsLeadsToLake),
			Has(LakeLeadsToUpperRemains)
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(UpperRemainsLeadsToCucco),
			Has(CuccoLeadsToUpperRemains)
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(UpperRemainsLeadsToHoron),
			Has(HoronLeadsToUpperRemains)
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(UpperRemainsLeadsToRemains),
			Has(RemainsLeadsToUpperRemains)
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(UpperRemainsLeadsToMountain),
			Has(MountainLeadsToUpperRemains)
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(UpperRemainsLeadsToMarket),
			Has(MarketLeadsToUpperRemains)
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(UpperRemainsLeadsToFurnace),
			Has(FurnaceLeadsToUpperRemains)
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(UpperRemainsLeadsToVillage),
			Has(VillageLeadsToUpperRemains)
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(UpperRemainsLeadsToPirates),
			Has(PiratesLeadsToUpperRemains)
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(UpperRemainsLeadsToVolcano),
			Has(VolcanoLeadsToUpperRemains)
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(UpperRemainsLeadsToD8),
			Has(D8LeadsToUpperRemains)
		)
	)
end)