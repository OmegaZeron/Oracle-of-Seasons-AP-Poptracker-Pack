-- 0 keys
MazeFoyer:connect_one_way(MazeEyeDrop, function()
	return All(
		CanDestroyPot,
		Any(
			HasSlingshot,
			All(
				HasFeather,
				CanUseSeeds,
				HasContactSeeds,
				MediumLogic
			)
		)
	)
end)
MazeFoyer:connect_one_way(MazeThreeEyeChest, function()
	return All(
		HasFeather,
		Any(
			HasHSS,
			All(
				CanUseSeeds,
				HasContactSeeds,
				HellLogic
			)
		)
	)
end)
MazeFoyer:connect_one_way_entrance(MazeHardhats, CanSwordKill)
MazeHardhats:connect_one_way(MazeHardhatDrop, function()
	return Any(
		CanGaleKill,
		All(
			CanBombWall,
			HasMagnetGlove
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
				HasFeather,
				HasSatchel,
				HasPegasus,
				HardLogic
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
		CanBombWall,
		Any(
			HasHSS,
			All(
				CanUseSeeds,
				HasContactSeeds,
				HellLogic
			)
		)
	)
end)
-- 3 keys
MazeThreeEyeOwl:connect_one_way_entrance(Frypolar, function() return D8KeyCount(3) end)
Frypolar:connect_one_way(MazeWildMysteries, function()
	return All(
		CanDestroyRespawningBush,
		MediumLogic
	)
end)
Frypolar:connect_one_way_entrance(MazeIcePuzzle, function()
	return All(
		HasHSS,
		HasEmbers,
		Any(
			All(
				-- throw ice
				HasMysteries,
				HasBracelet
			),
			All(
				-- upgraded embers
				HasUpgradedSatchel,
				HasEmbers,
				MediumLogic
			),
			All(
				-- embers
				HasEmbers,
				HardLogic
			)
		)
	)
end)
MazeIcePuzzle:connect_one_way_entrance(MazeTerrace, function()
	return Any(
		Jump6,
		HasMagicBoomerang
	)
end)
-- 4 keys
MazeIcePuzzle:connect_one_way_entrance(MazeNevermeltIce, function() return D8KeyCount(4) end)
MazeNevermeltIce:connect_one_way(MazeGhostArmos, CanBombWall)
MazeNevermeltIce:connect_one_way(MazeSELavaChest, function() return Has(Bracelet) end)
MazeNevermeltIce:connect_one_way(MazeSparkPots, function()
	return All(
		HasBracelet,
		CanTriggerLever
	)
end)
-- 6 keys
MazeNevermeltIce:connect_one_way_entrance(MazeNWIceDrop, function()
	return All(
		D8KeyCount(6),
		HasBracelet
	)
end)
-- 7 keys
MazeNWIceDrop:connect_one_way_entrance(MazeMedusaDoorstep, function() return D8KeyCount(7) end)
MazeMedusaDoorstep:connect_one_way_entrance(MedusaHead, function()
	return All(
		HasD8BossKey,
		CanSwordKill
	)
end)