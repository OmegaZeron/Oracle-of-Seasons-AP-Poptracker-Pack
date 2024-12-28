-- 0 keys
MazeFoyer:connect_one_way(MazeEyeDrop, function()
	return All(
		CanDestroyPot(),
		Any(
			Has(Slingshot),
			All(
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				),
				Has(Feather),
				CanUseSeeds(),
				HasContactSeeds()
			)
		)
	)
end)
MazeFoyer:connect_one_way(MazeThreeEyeChest, function()
	return All(
		Has(Feather),
		Any(
			Has(HyperSlingshot),
			All(
				Any(
					Has(Hard),
					AccessibilityLevel.SequenceBreak
				),
				CanUseSeeds(),
				HasContactSeeds()
			)
		)
	)
end)
MazeFoyer:connect_one_way_entrance(MazeHardhats, CanSwordKill)
MazeHardhats:connect_one_way(MazeHardhatDrop, function()
	return Any(
		CanGaleKill(),
		All(
			Has(Bombs),
			Has(MagnetGlove)
		)
	)
end)
-- 1 key
MazeHardhats:connect_one_way_entrance(MazeBigBladeTrap, function()
	return All(
		D8KeyCount(1),
		Any(
			Has(Cape),
			All(
				Any(
					Has(Hard),
					AccessibilityLevel.SequenceBreak
				),
				Has(Feather),
				Has(SeedSatchel),
				Has(PegasusSeeds)
			)
		)
	)
end)
-- 2 keys
MazeBigBladeTrap:connect_one_way_entrance(MazeSpinner, function() return D8KeyCount(2) end)
MazeSpinner:connect_one_way_entrance(MazeArmosChest, function() return Has(MagnetGlove) end)
MazeArmosChest:connect_one_way_entrance(MazeThreeEyeOwl, function() return Has(MagnetGlove) end)
MazeThreeEyeOwl:connect_one_way(MazeThreeEyeBombChest, function()
	return All(
		Has(Bombs),
		Any(
			Has(HyperSlingshot),
			All(
				Any(
					Has(Hard),
					AccessibilityLevel.SequenceBreak
				),
				CanUseSeeds(),
				HasContactSeeds()
			)
		)
	)
end)
-- 3 keys
MazeThreeEyeOwl:connect_one_way_entrance(Frypolar, function() return D8KeyCount(3) end)
Frypolar:connect_one_way_entrance(MazeNineTorches, function()
	return Any(
		All(
			Has(Slingshot),
			Has(MysterySeeds)
		),
		All(
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			),
			Has(UpgradedSatchel),
			Has(EmberSeeds)
		),
		All(
			Any(
				Has(Hard),
				AccessibilityLevel.SequenceBreak
			),
			CanUseSeeds(),
			Has(EmberSeeds)
		)
	)
end)
MazeNineTorches:connect_one_way_entrance(MazeIcePuzzle, function()
	return All(
		Has(HyperSlingshot),
		Has(EmberSeeds)
	)
end)
MazeIcePuzzle:connect_one_way_entrance(MazeTerrace, function()
	return Any(
		Jump6(),
		Has(MagicBoomerang)
	)
end)
-- 4 keys
MazeIcePuzzle:connect_one_way_entrance(MazeNevermeltIce, function() return D8KeyCount(4) end)
MazeNevermeltIce:connect_one_way(MazeGhostArmos, function() return Has(Bombs) end)
MazeNevermeltIce:connect_one_way(MazeSELavaChest, function() return Has(Bracelet) end)
MazeNevermeltIce:connect_one_way(MazeSparkPots, function()
	return All(
		Has(Bracelet),
		CanTriggerLever()
	)
end)
-- 6 keys
MazeNevermeltIce:connect_one_way_entrance(MazeNWIceDrop, function()
	return All(
		D8KeyCount(6),
		Has(Bracelet)
	)
end)
-- 7 keys
MazeNWIceDrop:connect_one_way_entrance(MazeMedusaDoorstep, function() return D8KeyCount(7) end)
MazeMedusaDoorstep:connect_one_way_entrance(MedusaHead, function()
	return All(
		Has(D8BossKey),
		CanSwordKill()
	)
end)