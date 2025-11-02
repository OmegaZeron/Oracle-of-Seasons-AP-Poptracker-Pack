-- 0 keys
MazeFoyer:connect_one_way(MazeEyeDrop, function()
	return All(
		CanDestroyPot,
		Any(
			CanShootSeeds,
			All(
				Feather,
				CanUseSeeds,
				HasContactSeeds,
				MediumLogic
			)
		)
	)
end)
MazeFoyer:connect_one_way(MazeThreeEyeChest, function()
	return All(
		Feather,
		Any(
			HyperSlingshot,
			All(
				SeedSatchel,
				HasContactSeeds,
				HellLogic
			),
			All(
				CanShootSeeds,
				Any(
					HasContactSeeds,
					PegasusSeeds
				),
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
			MagnetGlove
		)
	)
end)
-- 1 key
MazeHardhats:connect_one_way_entrance(MazeBigBladeTrap, function()
	return All(
		D8KeyCount(1),
		Any(
			Cape,
			All(
				Feather,
				Satchel,
				PegasusSeeds,
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
			HyperSlingshot,
			All(
				SeedSatchel,
				HasContactSeeds,
				HellLogic
			),
			All(
				Any(
					All(
						SeedShooter,
						HardLogic
					),
					All(
						Slingshot,
						HellLogic
					)
				),
				Any(
					HasContactSeeds,
					PegasusSeeds
				)
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
		HyperSlingshot,
		EmberSeeds,
		Any(
			All(
				-- throw ice
				MysterySeeds,
				Bracelet
			),
			All(
				-- upgraded embers
				UpgradedSatchel,
				EmberSeeds,
				MediumLogic
			),
			All(
				-- embers
				EmberSeeds,
				HardLogic
			)
		)
	)
end)
MazeIcePuzzle:connect_one_way_entrance(MazeTerrace, function()
	return Any(
		Jump6,
		MagicBoomerang
	)
end)
MazeIcePuzzle:connect_one_way(MazeSparkPots, function()
	return All(
		SwitchHook,
		Medium
	)
end)
-- 4 keys
MazeIcePuzzle:connect_one_way_entrance(MazeNevermeltIce, function() return D8KeyCount(4) end)
MazeNevermeltIce:connect_one_way(MazeGhostArmos, CanBombWall)
MazeNevermeltIce:connect_one_way(MazeSELavaChest, function() return Has(Bracelet) end)
MazeNevermeltIce:connect_one_way(MazeSparkPots, function()
	return All(
		Bracelet,
		CanTriggerLever
	)
end)
-- 6 keys
MazeNevermeltIce:connect_one_way_entrance(MazeNWIceDrop, function()
	return All(
		D8KeyCount(6),
		Bracelet
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