LowerTempleRemains:connect_one_way(Maple, CanMapleTrade)
LowerTempleRemains:connect_one_way(TempleRemainsFindSeason)
LowerTempleRemains:connect_one_way_entrance(TempleRemainsStump, function()
	return All(
		Feather,
		Any(
			EventFireworks,
			All(
				CanDestroyBush,
				Any(
					All(
						-- spring
						Any(
							TempleRemainsSpring,
							Spring
						),
						CanDestroyFlower,
						Jump6
					),
					All(
						-- summer
						Any(
							TempleRemainsSummer,
							Summer
						),
						Jump6
					),
					All(
						-- autumn
						Any(
							TempleRemainsAutumn,
							Autumn
						)
					),
					All(
						-- winter
						Any(
							TempleRemainsWinter,
							Winter
						),
						Shovel,
						Jump6
					)
				)
			)
		)
	)
end)
TempleRemainsStump:connect_one_way_entrance(LowerTempleRemains, function()
	return All(
		Feather,
		Any(
			EventFireworks,
			All(
				-- spring
				Any(
					TempleRemainsSpring,
					Spring
				),
				CanDestroyFlower,
				CanDestroyBush,
				Jump6
			),
			All(
				-- summer
				Any(
					TempleRemainsSummer,
					Summer
				),
				CanDestroyBush,
				Jump6
			),
			All(
				-- autumn
				Any(
					TempleRemainsAutumn,
					Autumn
				),
				CanDestroyBush
			),
			Any(
				-- winter
				TempleRemainsWinter,
				Winter
			)
		)
	)
end)
LowerTempleRemains:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		EventFireworks,
		Feather
	)
end)
TempleRemainsStump:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Feather,
		Any(
			EventFireworks,
			Winter
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way(TempleRemainsFindSeason)
TempleRemainsLowerPortal:connect_two_ways_entrance(Volcano, function()
	return Any(
		ShufflePortalsOff,
		RemainsLeadsToVolcano,
		VolcanoLeadsToRemains
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(LowerTempleRemains)
LowerTempleRemains:connect_one_way(TempleRemainsBombCave, function()
	return All(
		EventFireworks,
		JumpLiquid2
	)
end)
LowerTempleRemains:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		EventFireworks,
		Any(
			TempleRemainsSummer,
			Summer
		),
		JumpLiquid2,
		Any(
			Jump6,
			MagnetGlove
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way(TempleRemainsFindSeason)
TempleRemainsUpperPortal:connect_one_way_entrance(LowerTempleRemains, function()
	return All(
		EventFireworks,
		Feather
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(TempleRemainsStump, function() return Has(Feather) end)
TempleRemainsUpperPortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Feather,
		Any(
			TempleRemainsWinter,
			EventFireworks
		)
	)
end)
TempleRemainsUpperPortal:connect_two_ways_entrance(SwordAndShieldMaze, function()
	return Any(
		ShufflePortalsOff,
		UpperRemainsLeadsToD8,
		D8LeadsToUpperRemains
	)
end)

-- portal shuffle
TempleRemainsLowerPortal:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			RemainsLeadsToSuburbs,
			SuburbsLeadsToRemains
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			RemainsLeadsToSwamp,
			SwampLeadsToRemains
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			RemainsLeadsToLake,
			LakeLeadsToRemains
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			RemainsLeadsToCucco,
			CuccoLeadsToRemains
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			RemainsLeadsToHoron,
			HoronLeadsToRemains
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			RemainsLeadsToUpperRemains,
			UpperRemainsLeadsToRemains
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			RemainsLeadsToMountain,
			MountainLeadsToRemains
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			RemainsLeadsToMarket,
			MarketLeadsToRemains
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			RemainsLeadsToFurnace,
			FurnaceLeadsToRemains
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			RemainsLeadsToVillage,
			VillageLeadsToRemains
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			RemainsLeadsToPirates,
			PiratesLeadsToRemains
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			RemainsLeadsToVolcano,
			VolcanoLeadsToRemains
		)
	)
end)
TempleRemainsLowerPortal:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			RemainsLeadsToD8,
			D8LeadsToRemains
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			UpperRemainsLeadsToSuburbs,
			SuburbsLeadsToUpperRemains
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			UpperRemainsLeadsToSwamp,
			SwampLeadsToUpperRemains
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			UpperRemainsLeadsToLake,
			LakeLeadsToUpperRemains
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			UpperRemainsLeadsToCucco,
			CuccoLeadsToUpperRemains
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			UpperRemainsLeadsToHoron,
			HoronLeadsToUpperRemains
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			UpperRemainsLeadsToRemains,
			RemainsLeadsToUpperRemains
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			UpperRemainsLeadsToMountain,
			MountainLeadsToUpperRemains
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			UpperRemainsLeadsToMarket,
			MarketLeadsToUpperRemains
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			UpperRemainsLeadsToFurnace,
			FurnaceLeadsToUpperRemains
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			UpperRemainsLeadsToVillage,
			VillageLeadsToUpperRemains
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			UpperRemainsLeadsToPirates,
			PiratesLeadsToUpperRemains
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			UpperRemainsLeadsToVolcano,
			VolcanoLeadsToUpperRemains
		)
	)
end)
TempleRemainsUpperPortal:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			UpperRemainsLeadsToD8,
			D8LeadsToUpperRemains
		)
	)
end)