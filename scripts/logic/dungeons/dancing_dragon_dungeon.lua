-- 0 keys
DancingFoyer:connect_one_way_entrance(DancingMinecart, function()
	return Any(
		Has(Flippers),
		Has(Cape)
	)
end)
DancingMinecart:connect_one_way(DancingPotPush, function()
	return All(
		Has(Bombs),
		Has(Bracelet)
	)
end)
DancingMinecart:connect_one_way_entrance(DancingAntiFairyMaze, function()
	return Any(
		CanHitLeverFromMinecart(),
		All(
			Has(Bracelet),
			Any(
				Has(Hard),
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
		Has(Bombs),
		Any(
			CanNormalKill(),
			All(
				Has(Bracelet),
				Any(
					IsMediumPlus(),
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
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		),
		Any(
			CanHitLeverFromMinecart(),
			All(
				Has(Bracelet),
				Any(
					Has(Hard),
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
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		),
		Jump2()
	)
end)
DancingMinecartTorches:connect_one_way(DancingTorchChest, function()
	return All(
		Has(Slingshot),
		Has(EmberSeeds)
	)
end)
DancingMinecartTorches:connect_one_way_entrance(Agunima)
Agunima:connect_one_way(DancingRegrowingEmbers, function()
	return All(
		CanDestroyRespawningBush(),
		Any(
			Has(Hard), -- medium?
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
DancingBranchingMinecart:connect_one_way(DancingPitRace, function() return D4KeyCount(5) end)
DancingBranchingMinecart:connect_one_way(DancingEyeDive, function()
	return All(
		D4KeyCount(5),
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
		D4KeyCount(5),
		Any(
			Has(Boomerang),
			Has(Slingshot),
			All(
				-- jump slash the lever
				Any(
					Has(Hard),
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
					Has(Hard),
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
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			),
			Any(
				Has(Slingshot),
				Any(
					Has(Hard),
					AccessibilityLevel.SequenceBreak
				)
			),
			Any(
				Has(EmberSeeds),
				Has(ScentSeeds)
			)
		),
		All(
			-- sword beams
			Any(
				IsMediumPlus(),
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
						IsMediumPlus(),
						AccessibilityLevel.SequenceBreak
					),
					Has(UpgradedSatchel),
					Has(MysterySeeds)
				)
			)
		)
	)
end)