-- 0 keys
AncientFoyer:connect_one_way_entrance(AncientRightOfSpinner, function()
	return Any(
		Has(Feather),
		Has(Bombs),
		HasSword(),
		HardLogic()
	)
end)
AncientRightOfSpinner:connect_one_way(AncientRupeeRoom, CanBombWall)
AncientRightOfSpinner:connect_one_way_entrance(AncientRopeSpinnerWest)
AncientRopeSpinnerWest:connect_one_way(AncientMagnetBallDrop, function()
	return Any(
		Jump4(),
		All(
			Has(Feather),
			Has(MagnetGlove)
		),
		All(
			Has(CaneOfSomaria),
			MediumLogic()
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
			MediumLogic()
		)
	)
end)
AncientSpinyTrampoline:connect_one_way_entrance(AncientIndyJones, function() return Has(Feather) end)
AncientIndyJones:connect_one_way_entrance(AncientVireDoorstep, CanKillStalfos)
-- 2 keys
AncientFoyer:connect_one_way_entrance(AncientRopeSpinnerWest, function()
	return All(
		Any(
			D6KeyCount(2),
			All(
				D6KeyCount(1),
				AccessibilityLevel.SequenceBreak
			)
		),
		Any(
			Has(MagnetGlove),
			Has(CaneOfSomaria)
		)
	)
end)
-- 3 keys
AncientFoyer:connect_one_way_entrance(AncientBeamosPlatforms, function()
	return Any(
		D6KeyCount(3),
		All(
			D6KeyCount(1),
			AccessibilityLevel.SequenceBreak
		)
	)
end)
AncientBeamosPlatforms:connect_one_way_entrance(Ancient2FGibdo)
Ancient2FGibdo:connect_one_way_entrance(AncientTrappedChest, CanBombWall)
AncientTrappedChest:connect_one_way_entrance(AncientArmosDarknutDrop, function() return Has(Feather) end)
AncientFoyer:connect_one_way(AncientNorthOfSpinnerChest, function()
	return All(
		CanDestroyCrystal(),
		Has(MagnetGlove),
		Has(Feather),
		Any(
			D6KeyCount(3),
			All(
				D6KeyCount(2),
				Any(
					CanBombWall(),
					CanReach(Vire)
				)
			),
			All(
				D6KeyCount(1),
				Any(
					All(
						CanBombWall(),
						CanReach(Vire)
					),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end, {Vire})
AncientVireDoorstep:connect_one_way_entrance(Vire, function()
	return All(
		-- only 1 key here because you can't do anything special by getting here
		-- other than opening the miniboss portal, which can get you to spinner north
		D6KeyCount(1),
		Any(
			Has(WoodSword),
			Has(FoolsOre)
		)
	)
end)
Vire:connect_one_way_entrance(AncientBossDoor, function()
	return All(
		Any(
			D6KeyCount(3),
			AccessibilityLevel.SequenceBreak
		),
		Has(Feather),
		Any(
			Has(MagnetGlove),
			All(
				MediumLogic(),
				Has(GaleSeeds),
				Any(
					Has(Slingshot),
					All(
						Has(SeedSatchel),
						HardLogic()
					)
				)
			)
		)
	)
end)
AncientBossDoor:connect_one_way_entrance(Manhandla, function()
	return All(
		HasD6BossKey(),
		Has(MagicBoomerang),
		Any(
			CanSwordKill(),
			Has(Slingshot) -- any seed works?
		)
	)
end)