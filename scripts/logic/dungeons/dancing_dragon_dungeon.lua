-- 0 keys
DancingFoyer:connect_one_way_entrance(DancingMinecart, function()
	return Any(
		Cape,
		Flippers
	)
end)
DancingMinecart:connect_one_way(DancingPotPush, function()
	return All(
		CanBombWall,
		Bracelet
	)
end)
DancingMinecart:connect_one_way_entrance(DancingAntiFairyMaze, function()
	return Any(
		CanHitLeverFromMinecart,
		All(
			Bracelet,
			HardLogic
		)
	)
end)
DancingAntiFairyMaze:connect_one_way(DancingDarkRoomChest, function() return Has(Feather) end)
-- 1 key
DancingFoyer:connect_one_way_entrance(DancingSpikeTrap, function()
	return All(
		D4KeyCount(1),
		Any(
			Cape,
			All(
				Feather,
				Flippers
			)
		)
	)
end)
DancingSpikeTrap:connect_one_way(DancingWaterRing, function()
	return All(
		CanBombWall,
		Any(
			CanNormalKill,
			All(
				Bracelet,
				MediumLogic
			),
			All(
				HasRod,
				Any(
					Boomerang,
					SwitchHook
				)
			)
		)
	)
end)
DancingSpikeTrap:connect_one_way_entrance(DancingPostWaterRollers, function()
	return All(
		Feather,
		Any(
			Flippers,
			All(
				JumpLiquid6,
				HellLogic
			)
		)
	)
end)
DancingPostWaterRollers:connect_one_way(DancingPoolDrop, function()
	return All(
		Any(
			Flippers,
			MediumLogic -- collect item before it sinks
		),
		Any(
			CanNormalKill,
			All(
				Bracelet,
				MediumLogic
			)
		),
		Any(
			CanHitLeverFromMinecart,
			All(
				Bracelet,
				HardLogic
			)
		)
	)
end)
-- 2 keys
DancingPostWaterRollers:connect_one_way_entrance(DancingMinecartTorches, function()
	return All(
		D4KeyCount(2),
		Any(
			CanKillStalfos,
			All(
				Bracelet,
				MediumLogic
			)
		),
		Jump2
	)
end)
DancingMinecartTorches:connect_one_way(DancingScrub, function()
	return Any(
		HasRupees(ShopPrices[D4ScrubPrice]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom, HoronVillageOldMan, NorthHoronOldMan, SuburbsOldMan, NorthHolodrumPlainOldMan, SouthHolodrumPlainOldMan, GoronMountainOldMan, TarmOldMan, WesternCoastOldMan})
DancingMinecartTorches:connect_one_way(DancingTorchChest, function()
	return All(
		CanShootSeeds,
		EmberSeeds
	)
end)
DancingMinecartTorches:connect_one_way_entrance(Agunima)
Agunima:connect_one_way(DancingWildEmbers, function()
	return All(
		CanDestroyRespawningBush,
		MediumLogic
	)
end)
Agunima:connect_one_way_entrance(DancingBranchingMinecart, function()
	return All(
		CanArmorKill,
		CanUseSeeds,
		EmberSeeds
	)
end)
-- 5 keys
DancingBranchingMinecart:connect_one_way(DancingPitRace, function()
	return Any(
		D4KeyCount(5),
		All(
			D4KeyCount(3),
			AccessibilityLevel.SequenceBreak
		)
	)
end)
DancingBranchingMinecart:connect_one_way(DancingEyeDive, function()
	return All(
		Any(
			D4KeyCount(5),
			All(
				D4KeyCount(3),
				AccessibilityLevel.SequenceBreak
			)
		),
		Any(
			CanShootSeeds,
			MagicBoomerang
		),
		Jump2,
		Flippers
	)
end)
DancingBranchingMinecart:connect_one_way_entrance(DancingTorchPit, function()
	return All(
		Any(
			D4KeyCount(5),
			All(
				D4KeyCount(3),
				AccessibilityLevel.SequenceBreak
			)
		),
		Any(
			Boomerang,
			CanShootSeeds,
			SwitchHook,
			All(
				-- jump slash the lever
				Feather,
				HardLogic
			)
		)
	)
end)
DancingTorchPit:connect_one_way_entrance(DancingPotHeaven, function()
	return All(
		HasD4BossKey,
		Any(
			All(
				CanShootSeeds,
				EmberSeeds
			),
			Jump3,
			All(
				Feather,
				CanUseSeeds,
				EmberSeeds,
				HardLogic
			)
		)
	)
end)
DancingPotHeaven:connect_one_way_entrance(Gohma, function()
	return Any(
		All(
			-- don't break claw
			MediumLogic,
			Any(
				CanShootSeeds,
				HardLogic
			),
			All(
				CanUseSeeds,
				Any(
					EmberSeeds,
					ScentSeeds
				)
			)
		),
		All(
			-- sword beams
			Any(
				NobleSword,
				HasSwordBeams
			),
			MediumLogic
		),
		All(
			-- break claw
			CanSwordKill,
			CanUseSeeds,
			Any(
				EmberSeeds,
				ScentSeeds,
				All(
					HasUpgradedSatchel,
					MysterySeeds,
					MediumLogic
				)
			)
		)
	)
end)