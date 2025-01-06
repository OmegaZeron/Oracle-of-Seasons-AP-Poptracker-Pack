-- 0 keys
UnicornFoyer:connect_one_way(UnicornChestLeftOfEntrance, function()
	return Any(
		Has(MagnetGlove),
		Jump4()
	)
end)
UnicornFoyer:connect_one_way(UnicornSpiralChest, function()
	return Any(
		CanArmorKill(),
		Has(Shield)
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
			Any(
				Has(Hard),
				AccessibilityLevel.SequenceBreak
			)
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
		Has(Bombs)
	)
end)
UnicornTerrace:connect_one_way(UnicornArmosPuzzle, CanArmorKill)
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
				Has(Shield),
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
-- 5 keys
UnicornPotRoom:connect_one_way(UnicornMagnetGloveChest, function()
	return All(
		D5KeyCount(5),
		Any(
			Has(Flippers),
			JumpLiquid5(),
			All(
				JumpLiquid3(),
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
UnicornPreSyger:connect_one_way_entrance(Syger, function()
	return D5KeyCount(5)
end)
Syger:connect_one_way_entrance(UnicornPostSyger, CanArmorKill)
UnicornPostSyger:connect_one_way(UnicornTreadmillBasement, function()
	return All(
		Has(MagnetGlove),
		CanReach(UnicornMinecartPushBlock),
		Any(
			CanSwordPunchKill(),
			All(
				Has(Feather),
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end, {UnicornMinecartPushBlock})
UnicornPostSyger:connect_one_way_entrance(Digdogger, function()
	return All(
		Has(MagnetGlove),
		Has(D5BossKey),
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