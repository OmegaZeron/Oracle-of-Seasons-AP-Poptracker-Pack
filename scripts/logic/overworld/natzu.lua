NatzuWest:connect_one_way(HolodrumPlainFindSeason)
NatzuWest:connect_one_way_entrance(NorthHolodrumPlain, function()
	return Any(
		Has(Flippers),
		Has(Feather)
	)
end)

-- ricky
NatzuWest:connect_two_ways_entrance(NatzuRickyWest, function() return Has(NatzuIsRicky) end)
NatzuRickyWest:connect_two_ways_entrance(NatzuRickyEast, Ricky)
NatzuRickyEast:connect_one_way_entrance(MoblinKeepBridge, Ricky)
-- currently unused
NatzuRickyEast:connect_one_way(NatzuScrub, function()
	return All(
		CanDestroyBush(true),
		CanUseSeeds() -- required?
	)
end)
NatzuRickyEast:connect_two_ways_entrance(SunkenDoorstep, function() return Has(NatzuIsRicky) end)
-- dimitri
NatzuWest:connect_two_ways_entrance(NatzuDimitriWest, function() return Has(NatzuIsDimitri) end)
NatzuDimitriWest:connect_two_ways_entrance(NatzuDimitriEast, function()
	return Any(
		Has(Flippers),
		Dimitri()
	)
end)
NatzuDimitriEast:connect_one_way_entrance(MoblinKeepBridge, function()
	return Any(
		Dimitri(),
		All(
			Has(SwimmersRing),
			Any(
				Has(Hard),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end)
-- currently unused
NatzuDimitriEast:connect_one_way(NatzuScrub, function()
	return All(
		Dimitri(),
		CanUseSeeds() -- required?
	)
end)
NatzuDimitriEast:connect_two_ways_entrance(SunkenDoorstep, function()
	return All(
		Has(NatzuIsDimitri),
		Has(Feather)
	)
end)
NatzuDimitriEast:connect_one_way_entrance(NatzuPlatformCave, JumpLiquid5)
-- moosh
NatzuWest:connect_two_ways_entrance(NatzuMooshWest, function() return Has(NatzuIsMoosh) end)
NatzuMooshWest:connect_two_ways_entrance(NatzuMooshEast, function()
	return Any(
		Moosh(),
		All(
			CanDestroyBush(),
			Jump3(),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end)
NatzuMooshEast:connect_one_way_entrance(MoblinKeepBridge, function()
	return Any(
		Moosh(),
		All(
			CanDestroyBush(),
			Jump3()
		)
	)
end)
-- currently unused
NatzuMooshEast:connect_one_way(NatzuScrub, function()
	return All(
		Any(
			Moosh(),
			All(
				CanDestroyBush(),
				Jump3(),
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		),
		CanUseSeeds() -- required?
	)
end)
NatzuMooshEast:connect_two_ways_entrance(SunkenDoorstep, function()
	return All(
		Has(NatzuIsMoosh),
		Any(
			Moosh(),
			JumpLiquid3()
		)
	)
end)
-- moblin keep
MoblinKeepBridge:connect_one_way_entrance(MoblinKeep, function()
	return Any(
		Has(Flippers),
		JumpLiquid4()
	)
end)
MoblinKeep:connect_one_way(GreatMoblinChest, function() return Has(Bracelet) end)
MoblinKeep:connect_one_way_entrance(SunkenDoorstep, function()
	return Any(
		CanWarp(),
		AccessibilityLevel.SequenceBreak
	)
end)

SunkenDoorstep:connect_one_way(EasternSuburbsFindSeason)
SunkenDoorstep:connect_one_way(SunkenCityFindSeason)
SunkenDoorstep:connect_one_way_entrance(UpperEasternSuburbs, function()
	return Any(
		Has(Spring),
		Has(EasternSuburbsSpring),
		Any(
			CanWarp(),
			AccessibilityLevel.SequenceBreak
		)
	)
end)
SunkenDoorstep:connect_two_ways_entrance(SunkenCity, function()
	return Any(
		Has(Feather),
		Has(Flippers),
		Dimitri(),
		Has(SunkenCityWinter)
	)
end)