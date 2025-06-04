-- 0 keys
UnicornFoyer:connect_one_way(UnicornChestLeftOfEntrance, function()
	return Any(
		Has(MagnetGlove),
		Has(Cape),
		All(
			HellLogic(),
			JumpLiquid3()
		)
	)
end)
UnicornFoyer:connect_one_way(UnicornSpiralChest, function()
	return Any(
		CanArmorKill(),
		Has(Shield),
		All(
			MediumLogic(),
			Has(Shovel)
		)
	)
end)
UnicornFoyer:connect_one_way_entrance(UnicornTerrace, function() return Has(MagnetGlove) end)
UnicornFoyer:connect_one_way_entrance(UnicornMinecarts, function()
	return Any(
		Has(Flippers),
		JumpLiquid2()
	)
end)
UnicornMinecarts:connect_one_way_entrance(UnicornUndergroundPipesRight)
UnicornUndergroundPipesRight:connect_two_ways_entrance(UnicornPotRoom, function()
	return Any(
		Has(Feather),
		All(
			CanUseSeeds(),
			Has(PegasusSeeds),
			HardLogic()
		)
	)
end)
UnicornPotRoom:connect_one_way(UnicornGibdoZolChest, CanNormalKill)
UnicornUndergroundPipesRight:connect_one_way_entrance(UnicornPreSyger, function()
	return Any(
		Has(MagnetGlove),
		Jump4()
	)
end)
UnicornPreSyger:connect_one_way(UnicornRightMinecartChest)
UnicornPotRoom:connect_two_ways_entrance(UnicornTerrace, function()
	return All(
		Has(Feather),
		CanBombWall()
	)
end)
UnicornTerrace:connect_one_way(UnicornArmosPuzzle, function()
	return Any(
		CanArmorKill(),
		Any(
			Has(Bombchus20),
			All(
				Has(Bombchus),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end)
UnicornArmosPuzzle:connect_one_way(UnicornArmosPuzzleEmbers, MediumLogic)
UnicornMinecarts:connect_one_way(UnicornMiddleMinecartChest, CanHitLeverFromMinecart)
UnicornMinecarts:connect_one_way(UnicornSpinnerChest, function()
	return Any(
		Has(MagnetGlove),
		Jump5()
	)
end)
UnicornMinecarts:connect_one_way_entrance(UnicornMinecartPushBlock, function()
	return All(
		CanHitLeverFromMinecart(),
		Any(
			CanArmorKill(),
			All(
				Has(MagnetGlove),
				MediumLogic()
			),
			Any(
				Has(Bombchus20),
				All(
					Has(Bombchus),
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
			Has(Flippers),
			All(
				Jump4(), -- is liquid, but diagonal makes this effectively a 4 pit for rules
				MediumLogic() -- force medium for lower path
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
		Has(MagnetGlove),
		CanReach(UnicornMinecartPushBlock),
		Any(
			CanSwordPunchKill(),
			All(
				Has(Feather),
				MediumLogic()
			),
			All(
				Has(CaneOfSomaria),
				Has(Feather),
				Has(SeedSatchel),
				Has(PegasusSeeds)
			)
		)
	)
end, {UnicornMinecartPushBlock})
UnicornPostSyger:connect_one_way_entrance(Digdogger, function()
	return All(
		Any(
			D5KeyCount(5),
			All(
				D5KeyCount(2),
				AccessibilityLevel.SequenceBreak
			)
		),
		Has(MagnetGlove),
		HasD5BossKey(),
		Any(
			Has(Feather),
			Any(
				Has(Medium),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end)
Digdogger:connect_one_way(UnicornEssence)