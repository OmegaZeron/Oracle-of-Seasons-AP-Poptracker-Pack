-- base
HerosCaveLedge:connect_one_way_entrance(HerosCaveFoyer)
HerosCaveFoyer:connect_one_way(HerosCaveLedge, function() return Has(D0AltRemoved) end)
HerosCaveFoyer:connect_one_way_entrance(HerosCaveUnderground, function()
	return Any(
		CanNormalKill,
		Boomerang,
		SwitchHook
	)
end)
HerosCaveFoyer:connect_one_way_entrance(HerosCavePostKey, function()
	return Any(
		D0SmallKey,
		D0MasterKey
	)
end)

-- linked
LinkedCaveLedge:connect_one_way_entrance(LinkedCaveFoyer)
LinkedCaveFoyer:connect_one_way(LinkedCaveLedge, function() return Has(LCAltRemoved) end)
LinkedCaveFoyer:connect_one_way_entrance(LinkedCaveF1Chest, function() return Has(Bracelet) end)
LinkedCaveF1Chest:connect_one_way_entrance(LinkedCaveF2Keydrop, Jump2)
LinkedCaveF2Keydrop:connect_one_way_entrance(LinkedCaveF2Chest, function() return LCKeyCount(1) end)
LinkedCaveF2Chest:connect_one_way(LinkedCaveF3TorchKeyDrop, function()
	return All(
		Any(
			Flippers,
			All(
				JumpLiquid5,
				Any(
					NobleSword,
					BiggoronSword
				),
				HellLogic
			)
		),
		CanLightTorches
	)
end)
LinkedCaveF2Chest:connect_one_way_entrance(LinkedCaveF3FloodedRoom, function()
	return All(
		LCKeyCount(2),
		Flippers,
		CanShootSeeds,
		CanLightTorches
	)
end)
LinkedCaveF3FloodedRoom:connect_one_way(LinkedCaveF3FloodedKeydrop, function()
	return Any(
		CanNormalKill,
		SwitchHook
	)
end)
LinkedCaveF3FloodedRoom:connect_one_way_entrance(LinkedCaveF3Chest, function()
	return All(
		LCKeyCount(3),
		CanBombWall
	)
end)
LinkedCaveF3Chest:connect_one_way_entrance(LinkedCaveF4Chest, function() return Has(MagnetGlove) end)
LinkedCaveF4Chest:connect_one_way(LinkedCaveF5Gauntlet, function()
	return All(
		Jump3,
		Any(
			All(
				Any(
					HasAnySword,
					FoolsOre
				),
				CanKillSpinyBeetle,
				Any(
					AnyFlute,
					Bombs40,
					All(
						Bombs,
						AccessibilityLevel.SequenceBreak
					),
					Bombchus20,
					All(
						Bombchus,
						AccessibilityLevel.SequenceBreak
					)
				)
			),
			All(
				-- Use the cane press a button at the same time Link is on the button to skip the lowest wave
				-- Counting starts at the top and goes clockwise, waves are:
				-- 0- Spiked Beetle
				-- 1- Gibdo
				-- 2- Arrow Darknut
				-- 3- Magunesu
				-- 4- Lynel
				-- 5- Iron Mask
				-- 6- Pol's Voice
				-- 7- Stalfos
				-- We need to fight at least 5 of these 8 waves, minimal requirement is oos_can_kill_normal_enemy_no_cane
				-- Waves 1, 5 and 7 can be beaten by it
				-- oos_can_kill_armored_enemy can clear waves 2 and 4, skipping 0, 3 and 6
				-- Otherwise, since we know we have embers already, we can also beat 4, but we need more seeds
				-- (only the seeds aren't in oos_can_kill_armored_enemy)
				-- Skip waves 0, 3 and 6 while finishing the waves 1, 5 and 7 with embers
				-- Now there are two waves left, 4 and 2, which can be beaten by cane
				-- A route can be wave 4 -> wave 5 (skip 3) -> wave 7 (skip 6) -> wave 1 (skip 0) -> wave 2
				-- (With enough bombs left, it's probably easier to switch wave 6 and wave 4 as lynels hurt a lot)

				CaneOfSomaria,
				Any(
					CanArmorKill(false, true),
					UpgradedSatchel,
					All(
						Satchel,
						AccessibilityLevel.SequenceBreak
					)
				),
				HardLogic
			)
		)
	)
end)
LinkedCaveF4Chest:connect_one_way(LinkedCaveF5BoomerangMaze, function()
	return All(
		LCKeyCount(4),
		Any(
			MagicBoomerang,
			Bombchus20,
			All(
				Bombchus,
				AccessibilityLevel.SequenceBreak
			),
			All(
				HasAnySword,
				MediumLogic
			)
		),
		Jump3
	)
end)
LinkedCaveF4Chest:connect_one_way(LinkedCaveFinalChest, function()
	return All(
		LCKeyCount(5),
		HasRupees(80),
		Jump3,
		Any(
			CanCompleteLinkedPuzzle,
			AccessibilityLevel.SequenceBreak
		)
	)
end)