-- 0 keys
AncientFoyer:connect_one_way_entrance(AncientRightOfSpinner, function()
	return Any(
		Has(Feather),
		Has(Bombs),
		HasSword(),
		Any(
			Has(Hard),
			AccessibilityLevel.SequenceBreak
		)
	)
end)
AncientRightOfSpinner:connect_one_way_entrance(AncientRopeSpinnerWest)
AncientRopeSpinnerWest:connect_one_way(AncientMagnetBallDrop, function()
	return Any(
		Jump4(),
		All(
			Has(Feather),
			Has(MagnetGlove)
		)
	)
end)
AncientRopeSpinnerWest:connect_one_way_entrance(AncientArrowTrap, function()
	return All(
		Has(MagicBoomerang),
		CanDestroyCrystal()
	)
end)
AncientArrowTrap:connect_one_way_entrance(AncientSpinyTrampoline, function()
	return All(
		CanBurnTrees(),
		Any(
			Has(Slingshot),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end)
AncientSpinyTrampoline:connect_one_way_entrance(AncientIndyJones, function() return Has(Feather) end)
AncientIndyJones:connect_one_way_entrance(AncientVireDoorstep, CanKillStalfos)
-- 2 keys
AncientFoyer:connect_one_way_entrance(AncientRopeSpinnerWest, function()
	return All(
		D6KeyCount(2),
		Has(MagnetGlove)
	)
end)
-- 3 keys
AncientFoyer:connect_one_way_entrance(AncientBeamosPlatforms, function() return D6KeyCount(3) end)
AncientBeamosPlatforms:connect_one_way_entrance(Ancient2FGibdo)
Ancient2FGibdo:connect_one_way_entrance(AncientTrappedChest, function() return Has(Bombs) end)
AncientTrappedChest:connect_one_way_entrance(AncientArmosDarknutDrop, function() return Has(Feather) end)
AncientFoyer:connect_one_way(AncientNorthOfSpinnerChest, function()
	return All(
		CanDestroyCrystal(),
		Has(MagnetGlove),
		Any(
			D6KeyCount(3),
			All(
				D6KeyCount(2),
				Has(Feather),
				Has(Bombs)
			)
		)
	)
end)
AncientVireDoorstep:connect_one_way_entrance(Vire, function()
	return All(
		D6KeyCount(3),
		Any(
			Has(WoodSword),
			Has(FoolsOre)
		)
	)
end)
Vire:connect_one_way_entrance(AncientBossDoor, function()
	return All(
		Has(Feather),
		Any(
			Has(MagnetGlove),
			All(
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				),
				Has(GaleSeeds),
				Any(
					Has(Slingshot),
					All(
						Has(SeedSatchel),
						Any(
							Has(Hard),
							AccessibilityLevel.SequenceBreak
						)
					)
				)
			)
		)
	)
end)
AncientBossDoor:connect_one_way_entrance(Manhandla, function()
	return All(
		Has(D6BossKey),
		Has(MagicBoomerang),
		Any(
			CanSwordKill(),
			Has(Slingshot) -- any seed works?
		)
	)
end)