-- 0 keys
UnicornFoyer:connect_one_way(UnicornChestLeftOfEntrance, function()
	return Any(
		Cape,
		MagnetGlove,
		All(
			JumpLiquid3,
			HellLogic
		)
	)
end)
UnicornFoyer:connect_one_way(UnicornSpiralChest, function()
	return All(
		CanKillMoldorm(true),
		CanNormalKill(true)
	)
end)
UnicornFoyer:connect_one_way_entrance(UnicornTerrace, function() return Has(MagnetGlove) end)
UnicornFoyer:connect_one_way_entrance(UnicornMinecarts, function()
	return Any(
		Flippers,
		JumpLiquid2
	)
end)
UnicornMinecarts:connect_one_way_entrance(UnicornUndergroundPipesRight)
UnicornUndergroundPipesRight:connect_two_ways_entrance(UnicornPotRoom, function()
	return Any(
		Feather,
		All(
			CanUseSeeds,
			PegasusSeeds,
			HardLogic
		)
	)
end)
UnicornPotRoom:connect_one_way(UnicornGibdoZolChest, CanNormalKill)
UnicornUndergroundPipesRight:connect_one_way_entrance(UnicornPreSyger, function()
	return Any(
		MagnetGlove,
		Jump4
	)
end)
UnicornPreSyger:connect_one_way(UnicornRightMinecartChest)
UnicornPotRoom:connect_two_ways_entrance(UnicornTerrace, function()
	return All(
		Feather,
		CanBombWall
	)
end)
UnicornTerrace:connect_one_way(UnicornArmosPuzzle, function()
	return All(
		CanKillMoldorm,
		CanNormalKill
	)
end)
UnicornArmosPuzzle:connect_one_way(UnicornArmosPuzzleEmbers, MediumLogic)
UnicornMinecarts:connect_one_way(UnicornMiddleMinecartChest, CanHitLeverFromMinecart)
UnicornMinecarts:connect_one_way(UnicornSpinnerChest, function()
	return Any(
		MagnetGlove,
		Jump5,
		All(
			LongHook,
			MediumLogic
		),
		All(
			SwitchHook,
			HellLogic
		)
	)
end)
UnicornMinecarts:connect_one_way_entrance(UnicornMinecartPushBlock, function()
	return All(
		CanHitLeverFromMinecart,
		Any(
			CanArmorKill(true, true),
			All(
				MagnetGlove,
				MediumLogic
			)
		)
	)
end)
-- 5 keys
UnicornPotRoom:connect_one_way(UnicornMagnetGloveChest, function()
	return All(
		D5KeyCount(5, 1),
		Any(
			Flippers,
			All(
				Jump4, -- is liquid, but diagonal makes this effectively a 4 pit for rules
				MediumLogic -- force medium for lower path
			)
		)
	)
end)
UnicornPreSyger:connect_one_way_entrance(Syger, function() return D5KeyCount(5, 1) end)
Syger:connect_one_way_entrance(UnicornPostSyger, CanArmorKill)
UnicornPostSyger:connect_one_way(UnicornTreadmillBasement, function()
	return All(
		D5KeyCount(5, 3),
		Any(
			CanReach(UnicornMinecartPushBlock),
			CaneOfSomaria
		),
		MagnetGlove,
		Any(
			CanSwordPunchKill,
			All(
				Feather,
				MediumLogic
			),
			All(
				CaneOfSomaria,
				Feather,
				Satchel,
				PegasusSeeds
			)
		)
	)
end, {UnicornMinecartPushBlock})
UnicornPostSyger:connect_one_way_entrance(Digdogger, function()
	return All(
		HasD5BossKey,
		D5KeyCount(5, 2),
		MagnetGlove,
		Any(
			Feather,
			MediumLogic
		)
	)
end)
Digdogger:connect_one_way(UnicornEssence)