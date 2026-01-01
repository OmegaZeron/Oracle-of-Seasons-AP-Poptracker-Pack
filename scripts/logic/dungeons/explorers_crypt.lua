-- 0 keys
CryptFoyer:connect_one_way(CryptWildEmbers, function()
	return All(
		CanDestroyRespawningBush,
		MediumLogic
	)
end)
CryptFoyer:connect_one_way(Crypt1FWizzrobeChest, CanNormalKill)
CryptFoyer:connect_one_way_entrance(Crypt1FLeftOfPoe, CanBombWall)
Crypt1FLeftOfPoe:connect_one_way(Crypt1FLeftOfPoeChest)
-- poe skip method
Crypt1FLeftOfPoe:connect_one_way_entrance(CryptSurroundedByArmos, function()
	return All(
		Feather,
		Bracelet,
		Satchel,
		PegasusSeeds,
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
		Bracelet,
		Any(
			CanArmorKill,
			All(
				HasRod,
				MediumLogic
			),
			All(
				EmberSeeds,
				Any(
					UpgradedSatchel,
					MediumLogic
				)
			)
		)
	)
end)
CryptSurroundedByArmos:connect_one_way(CryptZolTrampoline, function() return Has(Feather) end)
CryptSurroundedByArmos:connect_one_way_entrance(CryptArmosPuzzle, function()
	return Any(
		MagnetGlove,
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
		MagnetGlove
	)
end)
-- 2 keys
CryptSurroundedByArmos:connect_one_way_entrance(CryptPoeTrampoline, function() return D7KeyCount(2, 1) end)
CryptPoeTrampoline:connect_one_way(CryptQuicksandChest, function() return Has(Feather) end)
CryptPoeTrampoline:connect_one_way_entrance(CryptDarknutBridge, function()
	-- poe 2 skip
	return All(
		SwimmersRing,
		JumpLiquid6,
		Flippers,
		HellLogic
	)
end)
-- 3 keys
CryptPoeTrampoline:connect_one_way_entrance(CryptPoe2, function()
	return All(
		D7KeyCount(3, 2),
		CanUseSeeds,
		EmberSeeds,
		Any(
			All(
				Satchel,
				PegasusSeeds
			),
			HardLogic
		)
	)
end)
CryptPoe2:connect_one_way_entrance(CryptDarknutBridge, function() return Has(Flippers) end)
CryptDarknutBridge:connect_one_way_entrance(CryptDarknutBridgeTrampolines, function()
	return Any(
		All(
			MagnetGlove,
			MagicBoomerang
		),
		All(
			Feather,
			MagnetGlove,
			HardLogic
		)
	)
end)
CryptDarknutBridge:connect_one_way_entrance(CryptPastDarknutBridge, function()
	return Any(
		Jump4,
		TightSwitchHook,
		All(
			CanShootSeeds,
			ScentSeeds
		),
		HasSwordBeams,
		All(
			MagnetGlove,
			Any(
				CanArmorKill(true, true),
				Shield,
				MediumLogic
			)
		),
		All(
			MagnetGlove,
			MediumLogic
		)
	)
end)
CryptPastDarknutBridge:connect_one_way_entrance(CryptDarknutBridgeTrampolines, function()
	return Any(
		Jump3,
		All(
			Feather,
			MagnetGlove,
			Any(
				CanSwordKill,
				HasRod,
				Bombs,
				Bombchus40,
				All(
					Bombchus,
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
CryptDarknutBridgeTrampolines:connect_one_way_entrance(CryptFastPlatform, CanKillStalfos)
CryptFastPlatform:connect_one_way(CryptFastPlatformChest, function() return Has(Feather) end)
-- 4 keys
CryptDarknutBridge:connect_one_way_entrance(PoeSisters, function()
	return All(
		D7KeyCount(4, 3),
		Jump3,
		Any(
			All(
				Any(
					CanKillMoldorm,
					All(
						CanKillMoldorm(true),
						MediumLogic
					)
				),
				JumpLiquid3 -- not actually liquid, but diagonal pit
			),
			All(
				SwitchHook,
				MediumLogic
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
					EmberSeeds,
					Any(
						Bombs,
						UpgradedSatchel,
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
		MagnetGlove,
		All(
			Jump6,
			HardLogic
		)
	)
end)
CryptWizzrobeStalfosRoom:connect_one_way(CryptWizzrobeStalfosChest) -- no rules since you already require everything by this point
-- 5 keys
CryptFoyer:connect_one_way_entrance(Crypt1FKeyRoom, function() return D7KeyCount(5, 1) end)
Crypt1FKeyRoom:connect_one_way(Crypt1FKeyRoomChest, CanNormalKill)
CryptStairMaze:connect_one_way_entrance(CryptJumpingStalfos, function()
	return All(
		D7KeyCount(5, 4),
		Any(
			Jump5,
			All(
				Feather,
				HardLogic
			)
		)
	)
end)
CryptJumpingStalfos:connect_one_way(CryptJumpingStalfosChest, CanKillStalfos)
CryptStairMaze:connect_one_way_entrance(Gleeok, HasD7BossKey)
Gleeok:connect_one_way(CryptEssence, CanSwordKill)
