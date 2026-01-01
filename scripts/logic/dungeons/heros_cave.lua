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
LinkedCaveF3FloodedRoom:connect_one_way_entrance(LinkedCaveF3Chest, CanBombWall)
LinkedCaveF3Chest:connect_one_way_entrance(LinkedCaveF4Chest, function() return Has(MagnetGlove) end)
LinkedCaveF4Chest:connect_one_way(LinkedCaveF5Gauntlet, function()
	return All(
		Any(
			HasAnySword,
			FoolsOre
		),
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
		),
		Jump3,
		CanKillSpinyBeetle
	)
end)
LinkedCaveF4Chest:connect_one_way(LinkedCaveF5BoomerangMaze, function()
	return All(
		LCKeyCount(3),
		Any(
			MagicBoomerang,
			Bombchus20
		),
		Jump3
	)
end)
LinkedCaveF4Chest:connect_one_way(LinkedCaveFinalChest, function()
	return All(
		LCKeyCount(4),
		HasRupees(80),
		Jump3,
		Any(
			CanCompleteLinkedPuzzle,
			AccessibilityLevel.SequenceBreak
		)
	)
end, {SnakeRupeeRoom, AncientRupeeRoom, HoronVillageOldMan, NorthHoronOldMan, SuburbsOldMan, NorthHolodrumPlainOldMan, SouthHolodrumPlainOldMan, GoronMountainOldMan, TarmOldMan, WesternCoastOldMan})