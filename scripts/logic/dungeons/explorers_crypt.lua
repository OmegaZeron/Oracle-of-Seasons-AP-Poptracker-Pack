-- 0 keys
CryptFoyer:connect_one_way(CryptWildEmbers, function()
	return All(
		CanDestroyRespawningBush,
		MediumLogic
	)
end)
CryptFoyer:connect_one_way(Crypt1FWizzrobeChest, function() return CanNormalKill(false, true, false) end)
CryptFoyer:connect_one_way_entrance(Crypt1FLeftOfPoe, CanBombWall)
Crypt1FLeftOfPoe:connect_one_way(Crypt1FLeftOfPoeChest)
-- poe skip method
Crypt1FLeftOfPoe:connect_one_way_entrance(CryptSurroundedByArmos, function()
	return All(
		HasFeather,
		HasBracelet,
		HasSatchel,
		HasPegasus,
		HellLogic
	)
end)
-- 1 key
-- foyer directly to poe because of possible poe skip messing up keys
CryptFoyer:connect_one_way_entrance(CryptFirstPoe, function()
	return All(
		D7KeyCount(1),
		CanShootLongTorches
	)
end)
-- kill poe method
CryptFirstPoe:connect_one_way_entrance(CryptSurroundedByArmos, function()
	return All(
		HasBracelet,
		Any(
			CanArmorKill,
			All(
				HasRod,
				MediumLogic
			),
			All(
				HasEmbers,
				Any(
					HasUpgradedSatchel,
					MediumLogic
				)
			)
		)
	)
end)
CryptSurroundedByArmos:connect_one_way(CryptZolTrampoline, function() return Has(Feather) end)
CryptSurroundedByArmos:connect_one_way_entrance(CryptArmosPuzzle, function()
	return Any(
		HasMagnetGlove,
		Jump3
	)
end)
CryptSurroundedByArmos:connect_one_way(CryptMagunesuReward, function() return Has(CaneOfSomaria) end)
CryptArmosPuzzle:connect_one_way(CryptArmosPuzzleReward)
CryptArmosPuzzle:connect_one_way_entrance(CryptMagunesu, function()
	return Any(
		Jump3,
		All(
			JumpLiquid2,
			HellLogic
		)
	)
end)
CryptMagunesu:connect_one_way(CryptMagunesuReward, function()
	return All(
		CanSwordKill,
		HasMagnetGlove
	)
end)
-- 2 keys
CryptSurroundedByArmos:connect_one_way_entrance(CryptPoeTrampoline, function()
	return Any(
		D7KeyCount(2),
		All(
			D7KeyCount(1),
			AccessibilityLevel.SequenceBreak
		)
	)
end)
CryptPoeTrampoline:connect_one_way(CryptQuicksandChest, function() return Has(Feather) end)
CryptPoeTrampoline:connect_one_way_entrance(CryptDarknutBridge, function()
	-- poe 2 skip
	return All(
		Has(SwimmersRing),
		JumpLiquid6,
		HasFlippers,
		HellLogic
	)
end)
-- 3 keys
CryptPoeTrampoline:connect_one_way_entrance(CryptPoe2, function()
	return All(
		Any(
			D7KeyCount(3),
			All(
				D7KeyCount(2),
				AccessibilityLevel.SequenceBreak
			)
		),
		CanUseSeeds,
		HasEmbers,
		Any(
			All(
				HasSatchel,
				HasPegasus
			),
			HardLogic
		)
	)
end)
CryptPoe2:connect_one_way_entrance(CryptDarknutBridge, function() return Has(Flippers) end)
CryptDarknutBridge:connect_one_way_entrance(CryptDarknutBridgeTrampolines, function()
	return Any(
		All(
			HasMagnetGlove,
			HasMagicBoomerang
		),
		All(
			HasFeather,
			HasMagnetGlove,
			HardLogic
		)
	)
end)
CryptDarknutBridge:connect_one_way_entrance(CryptPastDarknutBridge, function()
	return Any(
		Jump4,
		All(
			HasSlingshot,
			HasScents
		),
		UseEnergyRing,
		All(
			HasMagnetGlove,
			Any(
				CanArmorKill,
				HasShield,
				Any(
					HasTraversalBombchus,
					All(
						HasBombchus,
						AccessibilityLevel.SequenceBreak
					)
				),
				MediumLogic
			)
		)
	)
end)
CryptPastDarknutBridge:connect_one_way_entrance(CryptDarknutBridgeTrampolines, function()
	return Any(
		Jump3,
		All(
			HasFeather,
			HasMagnetGlove,
			Any(
				CanSwordKill,
				HasRod,
				HasBombs,
				HasBombchus
			)
		)
	)
end)
CryptDarknutBridgeTrampolines:connect_one_way_entrance(CryptFastPlatform, CanKillStalfos)
CryptFastPlatform:connect_one_way(CryptFastPlatformChest, function() return Has(Feather) end)
-- 4 keys
CryptDarknutBridge:connect_one_way_entrance(PoeSisters, function()
	return All(
		Any(
			D7KeyCount(4),
			All(
				D7KeyCount(3),
				AccessibilityLevel.SequenceBreak
			)
		),
		Any(
			-- HasSwitchHook,
			All(
				JumpLiquid3, -- not actually liquid, but diagonal pit
				Any(
					-- Moldorms
					CanArmorKill,
					All(
						Any(
							HasShovel,
							HasShield
						),
						MediumLogic
					)
				)
			)
		)
	)
end)
PoeSisters:connect_one_way_entrance(CryptStairMaze, function()
	return Any(
		CanArmorKill,
		All(
			Any(
				HasRod,
				All(
					CanUseSeeds,
					HasEmbers,
					Any(
						HasBombs,
						HasUpgradedSatchel,
						HardLogic
					)
				)
			),
			MediumLogic
		)
	)
end)
CryptStairMaze:connect_one_way(CryptStairMazeChest)
CryptStairMaze:connect_one_way_entrance(CryptWizzrobeStalfosRoom, function()
	return Any(
		HasMagnetGlove,
		All(
			Jump6,
			HardLogic
		)
	)
end)
CryptWizzrobeStalfosRoom:connect_one_way(CryptWizzrobeStalfosChest) -- no rules since you already require everything by this point
-- 5 keys
CryptFoyer:connect_one_way_entrance(Crypt1FKeyRoom, function()
	return Any(
		D7KeyCount(5),
		All(
			D7KeyCount(1),
			AccessibilityLevel.SequenceBreak
		)
	)
end)
Crypt1FKeyRoom:connect_one_way(Crypt1FKeyRoomChest, CanNormalKill)
CryptStairMaze:connect_one_way_entrance(CryptJumpingStalfos, function()
	return All(
		Any(
			D7KeyCount(5),
			All(
				D7KeyCount(4),
				AccessibilityLevel.SequenceBreak
			)
		),
		Any(
			Jump5,
			All(
				HasFeather,
				HardLogic
			)
		)
	)
end)
CryptJumpingStalfos:connect_one_way(CryptJumpingStalfosChest, CanKillStalfos)
CryptStairMaze:connect_one_way_entrance(Gleeok, HasD7BossKey)
Gleeok:connect_one_way(CryptEssence, CanSwordKill)