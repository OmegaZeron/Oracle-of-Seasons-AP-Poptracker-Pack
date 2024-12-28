-- 0 keys
CryptFoyer:connect_one_way(Crypt1FWizzrobeChest, CanNormalKill)
CryptFoyer:connect_one_way_entrance(Crypt1FLeftOfPoe, function() return Has(Bombs) end)
Crypt1FLeftOfPoe:connect_one_way(Crypt1FLeftOfPoeChest)
-- 1 key
-- foyer directly to poe because of possible poe skip messing up keys
CryptFoyer:connect_one_way_entrance(CryptFirstPoe, function()
	return All(
		D7KeyCount(1),
		CanShootLongTorches()
	)
end)
-- kill poe method
CryptFirstPoe:connect_one_way_entrance(CryptSurroundedByArmos, function()
	return All(
		Has(Bracelet),
		Any(
			CanArmorKill(),
			HasRod(),
			CanShootLongTorches()
		)
	)
end)
-- poe skip method
Crypt1FLeftOfPoe:connect_one_way_entrance(CryptSurroundedByArmos, function()
	return All(
		Has(Feather),
		Has(Bracelet),
		Has(SeedSatchel),
		Has(PegasusSeeds),
		Any(
			Has(Hard),
			AccessibilityLevel.SequenceBreak
		)
	)
end)
CryptSurroundedByArmos:connect_one_way(CryptZolTrampoline, function() return Has(Feather) end)
CryptSurroundedByArmos:connect_one_way_entrance(CryptArmosPuzzle, function()
	return Any(
		Has(MagnetGlove),
		Jump3()
	)
end)
CryptArmosPuzzle:connect_one_way(CryptArmosPuzzleReward)
CryptArmosPuzzle:connect_one_way_entrance(CryptMagunesu, Jump3)
CryptMagunesu:connect_one_way(CryptMagunesuReward, function()
	return All(
		CanSwordKill(),
		Has(MagnetGlove)
	)
end)
-- 2 keys
CryptSurroundedByArmos:connect_one_way_entrance(CryptPoeTrampoline, function() return D7KeyCount(2) end)
CryptPoeTrampoline:connect_one_way(CryptQuicksandChest, function() return Has(Feather) end)
-- 3 keys
CryptPoeTrampoline:connect_one_way_entrance(CryptPoe2, function()
	return All(
		D7KeyCount(3),
		CanUseSeeds(),
		Has(EmberSeeds),
		Any(
			Has(PegasusSeeds),
			Has(Hard),
			AccessibilityLevel.SequenceBreak
		)
	)
end)
CryptPoe2:connect_one_way_entrance(CryptDarknutBridge, function() return Has(Flippers) end)
CryptDarknutBridge:connect_one_way_entrance(CryptDarknutBridgeTrampolines, function()
	return Any(
		All(
			Has(MagnetGlove),
			Has(MagicBoomerang)
		),
		All(
			Has(Feather),
			Has(MagnetGlove),
			Any(
				Has(Hard),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end)
CryptDarknutBridge:connect_one_way_entrance(CryptPastDarknutBridge, function()
	return Any(
		Jump4(),
		All(
			Has(Slingshot),
			Has(ScentSeeds)
		),
		All(
			Has(WoodSword),
			Has(EnergyRing)
		),
		All(
			Has(MagnetGlove),
			Any(
				Any(
					CanArmorKill(),
					Has(Shield),
					IsMediumPlus()
				),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end)
CryptPastDarknutBridge:connect_one_way_entrance(CryptDarknutBridgeTrampolines, function()
	return Any(
		Jump3(),
		All(
			Has(Feather),
			Has(MagnetGlove),
			Any(
				CanSwordKill(),
				HasRod(),
				Has(Bombs)
			)
		)
	)
end)
CryptDarknutBridgeTrampolines:connect_one_way_entrance(CryptFastPlatform, CanKillStalfos)
CryptFastPlatform:connect_one_way(CryptFastPlatformChest, function() return Has(Feather) end)
-- 4 keys
CryptDarknutBridge:connect_one_way_entrance(CryptPrePoeSisters, function()
	return All(
		D7KeyCount(4),
		CanArmorKill(),
		JumpLiquid3() -- not actually liquid, but diagonal pit
	)
end)
CryptPrePoeSisters:connect_one_way_entrance(PoeSisters) -- no rules since you already require everything by this point. will change with cross items
PoeSisters:connect_one_way_entrance(CryptStairMaze) -- no rules since you already require everything by this point
CryptStairMaze:connect_one_way(CryptStairMazeChest)
CryptStairMaze:connect_one_way_entrance(CryptWizzrobeStalfosRoom, function()
	return Any(
		Has(MagnetGlove),
		All(
			Jump6(),
			Any(
				Has(Hard),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end)
CryptWizzrobeStalfosRoom:connect_one_way(CryptWizzrobeStalfosChest) -- no rules since you already require everything by this point
-- 5 keys
CryptFoyer:connect_one_way_entrance(Crypt1FKeyRoom, function() return Has(D7SmallKey, 5) or Has(D7MasterKey) end)
Crypt1FKeyRoom:connect_one_way(Crypt1FKeyRoomChest, CanNormalKill)
CryptStairMaze:connect_one_way_entrance(CryptJumpingStalfos, function()
	return All(
		D7KeyCount(5),
		Any(
			Jump5(),
			All(
				Has(Feather),
				Any(
					Has(Hard),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
CryptJumpingStalfos:connect_one_way(CryptJumpingStalfosChest, CanKillStalfos)
CryptStairMaze:connect_one_way_entrance(Gleeok, function()
	return Has(D7BossKey)
end)
Gleeok:connect_one_way(CryptEssence, CanSwordKill)