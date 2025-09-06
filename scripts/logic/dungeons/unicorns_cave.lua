-- 0 keys
UnicornFoyer:connect_one_way(UnicornChestLeftOfEntrance, function()
	return Any(
		Has(Cape),
		HasMagnetGlove,
		All(
			JumpLiquid3,
			HellLogic
		)
	)
end)
UnicornFoyer:connect_one_way(UnicornSpiralChest, function()
	return Any(
		CanArmorKill,
		HasShield,
		All(
			HasShovel,
			MediumLogic
		)
	)
end)
UnicornFoyer:connect_one_way_entrance(UnicornTerrace, function() return Has(MagnetGlove) end)
UnicornFoyer:connect_one_way_entrance(UnicornMinecarts, function()
	return Any(
		HasFlippers,
		JumpLiquid2
	)
end)
UnicornMinecarts:connect_one_way_entrance(UnicornUndergroundPipesRight)
UnicornUndergroundPipesRight:connect_two_ways_entrance(UnicornPotRoom, function()
	return Any(
		HasFeather,
		All(
			CanUseSeeds,
			HasPegasus,
			HardLogic
		)
	)
end)
UnicornPotRoom:connect_one_way(UnicornGibdoZolChest, CanNormalKill)
UnicornUndergroundPipesRight:connect_one_way_entrance(UnicornPreSyger, function()
	return Any(
		HasMagnetGlove,
		Jump4
	)
end)
UnicornPreSyger:connect_one_way(UnicornRightMinecartChest)
UnicornPotRoom:connect_two_ways_entrance(UnicornTerrace, function()
	return All(
		HasFeather,
		CanBombWall
	)
end)
UnicornTerrace:connect_one_way(UnicornArmosPuzzle, function()
	return Any(
		CanArmorKill,
		Any(
			HasTraversalBombchus,
			All(
				HasBombchus,
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end)
UnicornArmosPuzzle:connect_one_way(UnicornArmosPuzzleEmbers, MediumLogic)
UnicornMinecarts:connect_one_way(UnicornMiddleMinecartChest, CanHitLeverFromMinecart)
UnicornMinecarts:connect_one_way(UnicornSpinnerChest, function()
	return Any(
		HasMagnetGlove,
		Jump5
	)
end)
UnicornMinecarts:connect_one_way_entrance(UnicornMinecartPushBlock, function()
	return All(
		CanHitLeverFromMinecart,
		Any(
			CanArmorKill,
			All(
				HasMagnetGlove,
				MediumLogic
			),
			Any(
				HasTraversalBombchus,
				All(
					HasBombchus,
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
-- 5 keys
UnicornPotRoom:connect_one_way(UnicornMagnetGloveChest, function()
	return All(
		Any(
			D5KeyCount(5),
			All(
				D5KeyCount(1),
				AccessibilityLevel.SequenceBreak
			)
		),
		Any(
			HasFlippers,
			All(
				Jump4, -- is liquid, but diagonal makes this effectively a 4 pit for rules
				MediumLogic -- force medium for lower path
			)
		)
	)
end)
UnicornPreSyger:connect_one_way_entrance(Syger, function()
	return Any(
		D5KeyCount(5),
		All(
			D5KeyCount(1),
			AccessibilityLevel.SequenceBreak
		)
	)
end)
Syger:connect_one_way_entrance(UnicornPostSyger, CanArmorKill)
UnicornPostSyger:connect_one_way(UnicornTreadmillBasement, function()
	return All(
		Any(
			D5KeyCount(5),
			All(
				D5KeyCount(3),
				AccessibilityLevel.SequenceBreak
			)
		),
		CanReach(UnicornMinecartPushBlock),
		HasMagnetGlove,
		Any(
			CanSwordPunchKill,
			All(
				HasFeather,
				MediumLogic
			),
			All(
				HasCane,
				HasFeather,
				HasSatchel,
				HasPegasus
			)
		)
	)
end, {UnicornMinecartPushBlock})
UnicornPostSyger:connect_one_way_entrance(Digdogger, function()
	return All(
		HasD5BossKey,
		Any(
			D5KeyCount(5),
			All(
				D5KeyCount(2),
				AccessibilityLevel.SequenceBreak
			)
		),
		HasMagnetGlove,
		Any(
			HasFeather,
			MediumLogic
		)
	)
end)
Digdogger:connect_one_way(UnicornEssence)