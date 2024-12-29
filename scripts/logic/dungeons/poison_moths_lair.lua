-- 0 keys
PoisonFoyer:connect_one_way_entrance(PoisonCentral, function()
	return Any(
		CanKillSpinyBeetle(),
		All(
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			),
			CanFlipBeetle(),
			Has(Bracelet)
		)
	)
end)
PoisonCentral:connect_two_ways_entrance(PoisonWaterRoom, function() return Has(Feather) end)
PoisonWaterRoom:connect_one_way(PoisonWaterChest)
PoisonCentral:connect_two_ways_entrance(PoisonPols, function() return Has(Bracelet) end)
PoisonCentral:connect_two_ways_entrance(PoisonTrampolineOwl, function() return Has(Feather) end)
PoisonTrampolineOwl:connect_one_way(PoisonTrampolineOwlChest)
PoisonCentral:connect_one_way(PoisonZolChest, function() return Has(Feather) end)
PoisonPols:connect_two_ways_entrance(PoisonWaterRoom)
PoisonPols:connect_one_way(PoisonRollerChest, function() return Has(Bracelet) end)
PoisonPols:connect_one_way_entrance(PoisonOmuaiDoorstep, function() return Has(Feather) end)
PoisonPols:connect_one_way(PoisonTerraceChest, function() return Has(Feather) end)
PoisonPols:connect_one_way(PoisonMoldormChest, CanArmorKill)
PoisonPols:connect_one_way(PoisonBombWallChest, function() return Has(Bombs) end)
-- 2 keys
PoisonWaterRoom:connect_one_way_entrance(PoisonMimicChest, function()
	return All(
		D3KeyCount(2),
		CanNormalKill()
	)
end)
PoisonOmuaiDoorstep:connect_one_way_entrance(Omuai, function()
	return All(
		D3KeyCount(2),
		Has(Bracelet),
		CanArmorKill()
	)
end)
Omuai:connect_one_way(PoisonBladeTrapChest, function()
	return Any(
		Has(Feather),
		Any(
			Has(Hard),
			AccessibilityLevel.SequenceBreak
		)
	)
end)
Omuai:connect_one_way_entrance(Mothula, function()
	return All(
		Has(D3BossKey),
		CanNormalKill()
	)
end)
Mothula:connect_one_way(PoisonEssence)