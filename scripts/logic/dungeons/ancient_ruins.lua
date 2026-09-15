-- 0 keys
AncientFoyer:connect_one_way_entrance(AncientRightOfSpinner, function()
	return Any(
		Feather,
		HasAnySword,
		HasBombsForTiles,
		All(
			ExpertsRing,
			MediumLogic
		),
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
		CanBreakCrystal,
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
				CanRun,
				HellLogic
			),
			All(
				HasBombchusToFight,
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
		HasKeys(D6SmallKey, D6MasterKey, 2, 1),
		Any(
			MagnetGlove,
			CaneOfSomaria
		)
	)
end)
-- 3 keys
AncientFoyer:connect_one_way_entrance(AncientBeamosPlatforms, function() return HasKeys(D6SmallKey, D6MasterKey, 3, 1) end)
AncientBeamosPlatforms:connect_one_way_entrance(Ancient2FGibdo)
Ancient2FGibdo:connect_one_way_entrance(AncientTrappedChest, CanBombWall)
AncientTrappedChest:connect_one_way_entrance(AncientArmosDarknutDrop, function() return Has(Feather) end)
AncientFoyer:connect_one_way(AncientNorthOfSpinnerChest, function()
	return All(
		CanBreakCrystal,
		Any(
			MagnetGlove,
			All(
				CaneOfSomaria, -- clip into the blocks
				HardLogic
			)
		),
		Any(
			Feather,
			MediumLogic -- i-frame through the spikes
		),
		Any(
			HasKeys(D6SmallKey, D6MasterKey, 3),
			All(
				HasKeys(D6SmallKey, D6MasterKey, 2),
				Any(
					All(
						-- beamos room
						CanBombWall,
						Feather
					),
					-- fight vire for miniboss warp
					All(
						HasHeartsByDifficulty(4, 3),
						Any(
							CanSwordKill,
							All(
								HasBombsToFight,
								MediumLogic
							),
							All(
								ExpertsRing,
								MediumLogic
							)
						)
					)
				)
			),
			All(
				HasKeys(D6SmallKey, D6MasterKey, 1),
				-- beamos room
				CanBombWall,
				Feather,
				-- fight vire for miniboss warp
				HasHeartsByDifficulty(4, 3),
				Any(
					CanSwordKill,
					All(
						HasBombsToFight,
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
		HasKeys(D6SmallKey, D6MasterKey, 3, 1),
		HasHeartsByDifficulty(4, 3),
		Any(
			CanSwordKill,
			All(
				HasBombsToFight,
				MediumLogic
			),
			All(
				ExpertsRing,
				MediumLogic
			)
		)
	)
end)
Vire:connect_one_way_entrance(AncientBossDoor, function()
	return All(
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
		),
		Any(
			All(
				TossRing,
				HasAnySword,
				HasBombsForTiles,
				HardLogic
			),
			Boomerang,
			SwitchHook,
			CanShootSeeds,
			HasBombchusForTiles
		),
		Feather
	)
end)
AncientBossDoor:connect_one_way_entrance(AncientBoss, function()
	return All(
		HasD6BossKey,
		BossLogic[6]
	)
end)
