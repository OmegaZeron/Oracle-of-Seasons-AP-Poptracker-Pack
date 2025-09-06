-- 0 keys
DancingFoyer:connect_one_way_entrance(DancingMinecart, function()
	return Any(
		Has(Cape),
		HasFlippers
	)
end)
DancingMinecart:connect_one_way(DancingPotPush, function()
	return All(
		CanBombWall,
		HasBracelet
	)
end)
DancingMinecart:connect_one_way_entrance(DancingAntiFairyMaze, function()
	return Any(
		CanHitLeverFromMinecart,
		All(
			HasBracelet,
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
			Has(Cape),
			All(
				HasFeather,
				HasFlippers
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
				HasBracelet,
				MediumLogic
			)
		)
	)
end)
DancingSpikeTrap:connect_one_way_entrance(DancingPostWaterRollers, function()
	return All(
		HasFeather,
		Any(
			HasFlippers,
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
			HasFlippers,
			MediumLogic -- collect item before it sinks
		),
		Any(
			CanNormalKill,
			All(
				HasBracelet,
				MediumLogic
			)
		),
		Any(
			CanHitLeverFromMinecart,
			All(
				HasBracelet,
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
				HasBracelet,
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
		HasSlingshot,
		HasEmbers
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
		HasEmbers
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
			HasSlingshot,
			HasMagicBoomerang
		),
		Jump2,
		HasFlippers
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
			HasBoomerang,
			HasSlingshot,
			All(
				-- jump slash the lever
				HasFeather,
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
				HasSlingshot,
				HasEmbers
			),
			Jump3,
			All(
				HasFeather,
				CanUseSeeds,
				HasEmbers,
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
				HasSlingshot,
				HardLogic
			),
			All(
				CanUseSeeds,
				Any(
					HasEmbers,
					HasScents
				)
			)
		),
		All(
			-- sword beams
			Any(
				Has(NobleSword),
				UseEnergyRing
			),
			MediumLogic
		),
		All(
			-- break claw
			CanSwordKill,
			CanUseSeeds,
			Any(
				HasEmbers,
				HasScents,
				All(
					HasSatchel,
					Any(
						HasUpgradedSatchel,
						AccessibilityLevel.SequenceBreak
					),
					HasMysteries,
					MediumLogic
				)
			)
		)
	)
end)