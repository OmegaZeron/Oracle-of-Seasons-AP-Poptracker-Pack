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
		HasFlippers,
		Dimitri
	)
end)
NatzuDimitriEast:connect_one_way_entrance(MoblinKeepBridge, function()
	return Any(
		Dimitri,
		All(
			Has(SwimmersRing),
			HasFlippers,
			MediumLogic
		)
	)
end)
MoblinKeepBridge:connect_one_way_entrance(NatzuDimitriEast, function()
	return Any(
		Dimitri,
		HasFlippers
	)
end)
NatzuDimitriEast:connect_one_way(NatzuScrub, Dimitri)
NatzuDimitriEast:connect_two_ways_entrance(SunkenDoorstep, function()
	return All(
		Has(NatzuIsDimitri),
		HasFeather
	)
end)
NatzuDimitriEast:connect_one_way_entrance(NatzuPlatformCave, JumpLiquid5)
-- moosh
NatzuWest:connect_two_ways_entrance(NatzuMooshWest, function() return Has(NatzuIsMoosh) end)
NatzuMooshWest:connect_two_ways_entrance(NatzuMooshEast, function()
	return Any(
		Moosh,
		All(
			CanDestroyBush,
			Jump3,
			MediumLogic
		)
	)
end)
NatzuMooshWest:connect_one_way(NatzuScrub, function()
	return Any(
		Moosh,
		JumpLiquid4,
		All(
			CanDestroyBush(true),
			Jump4
		)
	)
end)
NatzuMooshEast:connect_one_way_entrance(MoblinKeepBridge, function()
	return Any(
		Moosh,
		All(
			CanDestroyBush,
			Jump3
		)
	)
end)
NatzuMooshEast:connect_two_ways_entrance(SunkenDoorstep, function()
	return All(
		Has(NatzuIsMoosh),
		Any(
			Moosh,
			JumpLiquid3
		)
	)
end)
NatzuScrub:connect_one_way(DekuSecret, function()
	return All(
		CanUseSeeds,
		HasEmbers,
		HasScents,
		HasPegasus,
		HasGales,
		HasMysteries
	)
end)
-- moblin keep
MoblinKeepBridge:connect_two_ways_entrance(MoblinKeep, function()
	return Any(
		HasFlippers,
		JumpLiquid4
	)
end)
MoblinKeep:connect_one_way(GreatMoblinChest, function() return Has(Bracelet) end)
MoblinKeep:connect_one_way_entrance(SunkenDoorstep)
SunkenDoorstep:connect_one_way_entrance(MoblinKeep, CanDimitriClip)
SunkenDoorstep:connect_one_way(EasternSuburbsFindSeason)
SunkenDoorstep:connect_one_way(SunkenCityFindSeason)
SunkenDoorstep:connect_one_way_entrance(UpperEasternSuburbs, function()
	return Any(
		Has(EasternSuburbsSpring),
		Has(EasternSuburbsSummer),
		Has(EasternSuburbsAutumn)
	)
end)
SunkenDoorstep:connect_one_way_entrance(UpperEasternSuburbsWinter, function() return Has(EasternSuburbsWinter) end)
SunkenDoorstep:connect_two_ways_entrance(SunkenCity, function()
	return Any(
		Has(SunkenCityWinter),
		HasFeather,
		HasFlippers,
		Dimitri
	)
end)