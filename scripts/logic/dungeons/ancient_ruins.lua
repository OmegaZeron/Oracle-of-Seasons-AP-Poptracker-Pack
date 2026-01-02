-- 0 keys
AncientFoyer:connect_one_way_entrance(AncientRightOfSpinner, function()
	return Any(
		Feather,
		Bombs,
		HasAnySword,
		HardLogic
	)
end)
AncientRightOfSpinner:connect_one_way(AncientRupeeRoom, CanBombWall)
AncientRightOfSpinner:connect_one_way_entrance(AncientRopeSpinnerWest)
AncientRopeSpinnerWest:connect_one_way(AncientMagnetBallDrop, function()
	return Any(
		Jump4,
		All(
			Feather,
			MagnetGlove
		),
		All(
			CaneOfSomaria,
			MediumLogic
		)
	)
end)
AncientRopeSpinnerWest:connect_one_way_entrance(AncientArrowTrap, function()
	return All(
		CanDestroyCrystal,
		Any(
			MagicBoomerang,
			All(
				SeedShooter,
				HardLogic
			)
		)
	)
end)
AncientArrowTrap:connect_one_way_entrance(AncientSpinyTrampoline, function()
	return All(
		Any(
			MagicBoomerang,
			All(
				SeedShooter,
				WoodSword,
				SeedSatchel,
				PegasusSeeds,
				HellLogic
			),
			All(
				Bombchus20,
				HardLogic
			)
		),
		CanBurnTrees,
		Any(
			MediumLogic,
			CanShootSeeds
		)
	)
end)
AncientSpinyTrampoline:connect_one_way_entrance(AncientIndyJones, function() return Has(Feather) end)
AncientIndyJones:connect_one_way_entrance(AncientVireDoorstep, CanKillStalfos)
-- 2 keys
AncientFoyer:connect_one_way_entrance(AncientRopeSpinnerWest, function()
	return All(
		D6KeyCount(2, 1),
		Any(
			MagnetGlove,
			CaneOfSomaria
		)
	)
end)
-- 3 keys
AncientFoyer:connect_one_way_entrance(AncientBeamosPlatforms, function() return D6KeyCount(3, 1) end)
AncientBeamosPlatforms:connect_one_way_entrance(Ancient2FGibdo)
Ancient2FGibdo:connect_one_way_entrance(AncientTrappedChest, CanBombWall)
AncientTrappedChest:connect_one_way_entrance(AncientArmosDarknutDrop, function() return Has(Feather) end)
AncientFoyer:connect_one_way(AncientNorthOfSpinnerChest, function()
	return All(
		CanDestroyCrystal,
		Any(
			MagnetGlove,
			All(
				CaneOfSomaria,
				HardLogic
			)
		),
		Any(
			Feather,
			MediumLogic
		),
		Any(
			D6KeyCount(3),
			All(
				D6KeyCount(2),
				Any(
					All(
						CanBombWall,
						Feather
					),
					CanSwordKill,
					All(
						Bombs40,
						MediumLogic
					),
					All(
						ExpertsRing,
						MediumLogic
					)
				)
			),
			All(
				D6KeyCount(1),
				CanBombWall,
				Feather,
				Any(
					CanSwordKill,
					All(
						Bombs40,
						MediumLogic
					),
					All(
						ExpertsRing,
						MediumLogic
					),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
AncientVireDoorstep:connect_one_way_entrance(Vire, function()
	return All(
		-- only 1 key here because you can't do anything special by getting here
		-- other than opening the miniboss portal, which can get you to spinner north
		D6KeyCount(1),
		Any(
			FoolsOre,
			WoodSword
		)
	)
end)
Vire:connect_one_way_entrance(AncientBossDoor, function()
	return All(
		Any(
			D6KeyCount(3),
			AccessibilityLevel.SequenceBreak
		),
		Feather,
		Any(
			MagnetGlove,
			All(
				GaleSeeds,
				Any(
					CanShootSeeds,
					All(
						Satchel,
						HardLogic
					)
				),
				MediumLogic
			)
		)
	)
end)
AncientBossDoor:connect_one_way_entrance(Manhandla, function()
	return All(
		HasD6BossKey,
		MagicBoomerang,
		Any(
			CanSwordKill,
			CanShootSeeds -- any seed works?
		)
	)
end)