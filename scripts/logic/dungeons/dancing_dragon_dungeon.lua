-- 0 keys
DancingFoyer:connect_one_way_entrance(DancingMinecart, function()
	return Any(
		Has(Flippers),
		Has(Cape)
	)
end)
DancingMinecart:connect_one_way(DancingPotPush, function()
	return All(
		CanBombWall(),
		Has(Bracelet)
	)
end)
DancingMinecart:connect_one_way_entrance(DancingAntiFairyMaze, function()
	return Any(
		CanHitLeverFromMinecart(),
		All(
			Has(Bracelet),
			Any(
				HardLogic(),
				AccessibilityLevel.SequenceBreak
			)
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
				Has(Feather),
				Has(Flippers)
			)
		)
	)
end)
DancingSpikeTrap:connect_one_way(DancingWaterRing, function()
	return All(
		CanBombWall(),
		Any(
			CanNormalKill(),
			All(
				Has(Bracelet),
				Any(
					MediumLogic(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
DancingSpikeTrap:connect_one_way_entrance(DancingPostWaterRollers, function()
	return All(
		Has(Flippers),
		Has(Feather)
	)
end)
DancingPostWaterRollers:connect_one_way(DancingPoolDrop, function()
	return All(
		Has(Flippers),
		Any(
			CanNormalKill(),
			All(
				Has(Bracelet),
				Any(
					MediumLogic(),
					AccessibilityLevel.SequenceBreak
				)
			)
		),
		Any(
			CanHitLeverFromMinecart(),
			All(
				Has(Bracelet),
				Any(
					HardLogic(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
-- 2 keys
DancingPostWaterRollers:connect_one_way_entrance(DancingMinecartTorches, function()
	return All(
		D4KeyCount(2),
		Any(
			CanKillStalfos(),
			All(
				Has(Bracelet),
				Any(
					MediumLogic(),
					AccessibilityLevel.SequenceBreak
				)
			)
		),
		Jump2()
	)
end)
DancingMinecartTorches:connect_one_way(DancingScrub, function()
	return Any(
		HasRupees(ShopPrices[D4ScrubPrice]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})
DancingMinecartTorches:connect_one_way(DancingTorchChest, function()
	return All(
		Has(Slingshot),
		Has(EmberSeeds)
	)
end)
DancingMinecartTorches:connect_one_way_entrance(Agunima)
Agunima:connect_one_way(DancingWildEmbers, function()
	return All(
		CanDestroyRespawningBush(),
		Any(
			MediumLogic(),
			AccessibilityLevel.SequenceBreak
		)
	)
end)
Agunima:connect_one_way_entrance(DancingBranchingMinecart, function()
	return All(
		CanArmorKill(),
		CanUseSeeds(),
		Has(EmberSeeds)
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
			Has(Slingshot),
			Has(MagicBoomerang)
		),
		Jump2(),
		Has(Flippers)
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
			Has(Boomerang),
			Has(Slingshot),
			All(
				-- jump slash the lever
				Has(Feather),
				Any(
					HardLogic(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
DancingTorchPit:connect_one_way_entrance(DancingPotHeaven, function()
	return All(
		Has(D4BossKey),
		Any(
			All(
				Has(Slingshot),
				Has(EmberSeeds)
			),
			Jump3(),
			All(
				Has(Feather),
				CanUseSeeds(),
				Has(EmberSeeds),
				Any(
					HardLogic(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
DancingPotHeaven:connect_one_way_entrance(Gohma, function()
	return Any(
		All(
			-- don't break claw
			Any(
				MediumLogic(),
				AccessibilityLevel.SequenceBreak
			),
			Any(
				Has(Slingshot),
				Any(
					HardLogic(),
					AccessibilityLevel.SequenceBreak
				)
			),
			All(
				CanUseSeeds(),
				Any(
					Has(EmberSeeds),
					Has(ScentSeeds)
				)
			)
		),
		All(
			-- sword beams
			Any(
				MediumLogic(),
				AccessibilityLevel.SequenceBreak
			),
			Any(
				Has(NobleSword),
				All(
					Has(WoodSword),
					Has(EnergyRing)
				)
			)
		),
		All(
			-- break claw
			CanSwordKill(),
			CanUseSeeds(),
			Any(
				Has(EmberSeeds),
				Has(ScentSeeds),
				All(
					Any(
						MediumLogic(),
						AccessibilityLevel.SequenceBreak
					),
					Has(SeedSatchel),
					Any(
						Has(UpgradedSatchel),
						AccessibilityLevel.SequenceBreak
					),
					Has(MysterySeeds)
				)
			)
		)
	)
end)