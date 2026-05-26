DragonKeyhole:connect_one_way_entrance(RoosterAdventure, function()
	return All(
		GaleSeeds,
		Satchel,
		Any(
			SpringBanana,
			Shovel
		),
		HellLogic
	)
end)
RoosterAdventure:connect_one_way_entrance(LowerMtCucco, function() return GetCuccos(RoosterArea.MtCucco, 0, 0, 0) end)
RoosterAdventure:connect_one_way_entrance(MoblinKeep, function()
	return Any(
		All(
			GetCuccos(RoosterArea.Sunken, 1, 1, 0),
			NatzuIsRicky
		),
		All(
			GetCuccos(RoosterArea.Horon, 1, 1, 0),
			Any(
				AnyFlute,
				All(
					NatzuIsMoosh,
					Jump3
				)
			)
		)
	)
end)
RoosterAdventure:connect_one_way_entrance(SunkenCity, function() return GetCuccos(RoosterArea.Sunken, 0, 0, 0) end)
RoosterAdventure:connect_one_way(SunkenGashaSpot, function()
	return All(
		GetCuccos(RoosterArea.Sunken, 1, 0, 1),
		Any(
			SunkenCityWinter,
			Winter
		),
		CanPlantGasha
	)
end)
RoosterAdventure:connect_one_way_entrance(Syrup, function()
	return All(
		GetCuccos(RoosterArea.Sunken, 1, 0, 1),
		Mushroom
	)
end)

RoosterAdventure:connect_one_way_entrance(LowerEasternSuburbs, function() return GetCuccos(RoosterArea.Suburbs, 0, 0, 0) end)
RoosterAdventure:connect_one_way(SuburbsSpringCave, function()
	return All(
		GetCuccos(RoosterArea.Suburbs, 1, 0, 1),
		Any(
			EasternSuburbsSpring,
			Spring
		),
		Any(
			MagnetGlove,
			Jump3
		)
	)
end)
RoosterAdventure:connect_one_way(WindmillHP, function() return GetCuccos(RoosterArea.Suburbs, 1, 1, 0) end)
RoosterAdventure:connect_one_way(SamasaDesertChest, function()
	return All(
		GetCuccos(RoosterArea.Suburbs, 1, 1, 0),
		CanReach(Pirates)
	)
end, {Pirates})
RoosterAdventure:connect_one_way_entrance(MoblinRoad, function() return GetCuccos(RoosterArea.MoblinRoad, 0, 0, 0) end)
RoosterAdventure:connect_one_way(Holly, function() return GetCuccos(RoosterArea.MoblinRoad, 1, 1, 0) end)
RoosterAdventure:connect_one_way(HoronTreeHP, function() return GetCuccos(RoosterArea.Horon, 1, 1, 0) end)
RoosterAdventure:connect_one_way(GraveyardHP, function()
	return All(
		GetCuccos(RoosterArea.Horon, 1, 1, 0),
		CanReach(Pirates),
		PolishedBell,
		WesternCoastSummer
	)
end, {Pirates})
RoosterAdventure:connect_one_way_entrance(NorthSpoolSwamp, function() return GetCuccos(RoosterArea.Swamp, 0, 0, 0) end)
RoosterAdventure:connect_one_way(TarmLostWoodsScrub, function()
	return All(
		GetCuccos(RoosterArea.Swamp, 1, 1, 0),
		CanEnterTarm(),
		Any(
			CanReach(TarmTreeStump),
			LostWoodsSummer,
			Summer
		)
	)
end, {TarmTreeStump})
RoosterAdventure:connect_one_way(SpoolWinterCave, function()
	return Any(
		All(
			GetCuccos(RoosterArea.Horon, 0, 0, 0),
			Any(
				Flippers,
				Dimitri
			)
		),
		All(
			GetCuccos(RoosterArea.Swamp, 0, 0, 0),
			FloodgateKey,
			Any(
				SpoolSwampSummer,
				SpoolSwampAutumn,
				SpoolSwampWinter,
				Summer,
				Autumn,
				Winter
			)
		)
	)
end)
RoosterAdventure:connect_one_way_entrance(TempleRemainsStump, function()
	return All(
		GetCuccos(RoosterArea.MtCucco, 0, 0, 0),
		Jump3,
		Any(
			TempleRemainsSummer,
			Summer,
			All(
				Any(
					TempleRemainsWinter,
					Winter
				),
				Shovel
			),
			All(
				Any(
					TempleRemainsSpring,
					Spring
				),
				CanBreakFlowers
			)
		)
	)
end)
RoosterAdventure:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		EventFireworks,
		GetCuccos(RoosterArea.MtCucco, 1, 1, 0),
		Jump3,
		Any(
			MagnetGlove,
			Jump6
		)
	)
end)