-- 0 keys
AncientFoyer:connect_one_way_entrance(AncientRightOfSpinner, function()
	return Any(
		HasFeather,
		HasBombs,
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
			HasFeather,
			HasMagnetGlove
		),
		All(
			HasCane,
			MediumLogic
		)
	)
end)
AncientRopeSpinnerWest:connect_one_way_entrance(AncientArrowTrap, function()
	return All(
		HasMagicBoomerang,
		CanDestroyCrystal
	)
end)
AncientArrowTrap:connect_one_way_entrance(AncientSpinyTrampoline, function()
	return All(
		CanBurnTrees,
		Any(
			HasSlingshot,
			MediumLogic
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
			HasMagnetGlove,
			HasCane
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
		CanDestroyCrystal,
		HasMagnetGlove,
		Any(
			HasFeather,
			MediumLogic
		),
		Any(
			D6KeyCount(3),
			All(
				D6KeyCount(2),
				Any(
					All(
						CanBombWall,
						HasFeather
					),
					CanSwordKill,
					All(
						HasCombatBombs,
						MediumLogic
					),
					All(
						HasGoodPunch,
						MediumLogic
					)
				)
			),
			All(
				D6KeyCount(1),
				CanBombWall,
				HasFeather,
				Any(
					CanSwordKill,
					All(
						HasCombatBombs,
						MediumLogic
					),
					All(
						HasGoodPunch,
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
			Has(FoolsOre),
			HasSword
		)
	)
end)
Vire:connect_one_way_entrance(AncientBossDoor, function()
	return All(
		Any(
			D6KeyCount(3),
			AccessibilityLevel.SequenceBreak
		),
		HasFeather,
		Any(
			HasMagnetGlove,
			All(
				HasGales,
				Any(
					HasSlingshot,
					All(
						HasSatchel,
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
		HasMagicBoomerang,
		Any(
			CanSwordKill,
			HasSlingshot -- any seed works?
		)
	)
end)