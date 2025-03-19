NatzuWest:connect_one_way(HolodrumPlainFindSeason)

-- ricky
NatzuWest:connect_two_ways_entrance(NatzuRickyWest, function() return Has(NatzuIsRicky) end)
NatzuRickyWest:connect_two_ways_entrance(NatzuRickyEast, Ricky)
NatzuRickyEast:connect_one_way_entrance(MoblinKeepBridge)
NatzuRickyEast:connect_one_way(NatzuScrub, function() return CanDestroyBush(true) end)
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
			Has(Flippers),
			Has(SwimmersRing),
			Any(
				MediumLogic(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end)
NatzuDimitriEast:connect_one_way(NatzuScrub, Dimitri)
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
				MediumLogic(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end)
NatzuMooshWest:connect_one_way(NatzuScrub, function()
	return Any(
		Moosh(),
		JumpLiquid4(),
		All(
			Jump4(),
			CanDestroyBush(true)
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
NatzuMooshEast:connect_two_ways_entrance(SunkenDoorstep, function()
	return All(
		Has(NatzuIsMoosh),
		Any(
			Moosh(),
			JumpLiquid3()
		)
	)
end)
NatzuScrub:connect_one_way(DekuSecret, function()
	return All(
		CanUseSeeds(),
		Has(EmberSeeds),
		Has(ScentSeeds),
		Has(PegasusSeeds),
		Has(GaleSeeds),
		Has(MysterySeeds)
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
MoblinKeep:connect_one_way_entrance(SunkenDoorstep)

SunkenDoorstep:connect_one_way(EasternSuburbsFindSeason)
SunkenDoorstep:connect_one_way(SunkenCityFindSeason)
SunkenDoorstep:connect_one_way_entrance(UpperEasternSuburbs)
SunkenDoorstep:connect_two_ways_entrance(SunkenCity, function()
	return Any(
		Has(Feather),
		Has(Flippers),
		Dimitri(),
		Has(SunkenCityWinter)
	)
end)