-- 0 keys
SnakeFoyer:connect_one_way(SnakeLeftRopeDrop, function()
	return Any(
		CanNormalKill,
		SwitchHook
	)
end)
SnakeFoyer:connect_one_way_entrance(SnakeAngryTorches, CanLightTorches)
SnakeAngryTorches:connect_one_way(SnakeRightRopeChest, function()
	return Any(
		CanNormalKill,
		SwitchHook
	)
end)
SnakeAngryTorches:connect_one_way_entrance(SnakeFoyer)
SnakeAngryTorches:connect_one_way_entrance(SnakeMoblinRopeFight)
SnakeMoblinRopeFight:connect_one_way_entrance(SnakeAngryTorches, CanNormalKill)
SnakeMoblinRopeFight:connect_one_way_entrance(SnakeRupeeRoom, CanBombWall)
SnakeMoblinRopeFight:connect_one_way_entrance(SnakeBladeTraps, CanNormalKill)
SnakeBladeTraps:connect_one_way_entrance(SnakeMoblinRopeFight)
SnakeBladeTraps:connect_two_ways_entrance(SnakeAltEntrance, function() return Has(Bracelet) end)
SnakeAltEntrance:connect_one_way(SnakeScrub, function()
	return Any(
		HasRupees(ShopPrices[D2ScrubPrice]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom, HoronVillageOldMan, NorthHoronOldMan, SuburbsOldMan, NorthHolodrumPlainOldMan, SouthHolodrumPlainOldMan, GoronMountainOldMan, TarmOldMan, WesternCoastOldMan})
SnakeAltEntrance:connect_one_way(SnakeBombPuzzle, function()
	return All(
		CanDestroyBush,
		Any(
			Bombs,
			All(
				Any(
					Bombchus50,
					All(
						Bombchus,
						AccessibilityLevel.SequenceBreak
					)
				),
				Satchel,
				PegasusSeeds,
				MediumLogic
			)
		)
	)
end)
SnakeBladeTraps:connect_one_way_entrance(SnakeBombBlockStairs, CanBombWall)
SnakeBombBlockStairs:connect_one_way_entrance(FacadeDoorstep, function() return Has(Bracelet) end)
-- 2 keys
FacadeDoorstep:connect_one_way_entrance(Facade, function()
	return All(
		Any(
			D2KeyCount(2),
			All(
				D2KeyCount(1),
				AccessibilityLevel.SequenceBreak
			)
		),
		Any(
			Bombs,
			Bombchus
		)
	)
end)
Facade:connect_one_way_entrance(SnakeFoyer)
Facade:connect_one_way_entrance(KingDodongo, function()
	return All(
		HasD2BossKey,
		Bracelet,
		Bombs
	)
end)

-- 3 keys
SnakeMoblinRopeFight:connect_one_way_entrance(SnakeHardhats, function()
	return Any(
		D2KeyCount(3),
		All(
			D2KeyCount(1),
			AccessibilityLevel.SequenceBreak
		)
	)
end)
SnakeHardhats:connect_one_way(SnakeHardhatChest, CanDestroyPot)
SnakeHardhats:connect_one_way(SnakeWildBombs, function()
	return All(
		CanDestroyRespawningBush,
		MediumLogic
	)
end)
SnakeHardhats:connect_one_way_entrance(SnakeBombMoblins, function()
	return All(
		-- hardhats
		Any(
			CanSwordKill,
			Boomerang,
			CanKillWithPit,
			SwitchHook,
			All(
				HasUpgradedSatchel,
				Any(
					CanShootSeeds,
					HardLogic
				),
				Any(
					ScentSeeds,
					GaleSeeds,
					MysterySeeds
				),
				MediumLogic
			),
			All(
				Shovel,
				HardLogic
			)
		),
		-- moblins
		Any(
			CanSwordKill,
			Bombs, -- regrowing bushes are right there
			CanShootSeedsCombat,
			All(
				CanNormalKill(true),
				Any(
					Feather,
					All(
						SwitchHook,
						MediumLogic
					)
				)
			),
			All(
				Any(
					CanBurnTrees,
					CanPunch,
					CaneOfSomaria
				),
				HardLogic
			)
		)
	)
end)
Facade:connect_one_way(SnakeTerrace, function()
	return Any(
		D2KeyCount(3),
		All(
			D2KeyCount(2),
			AccessibilityLevel.SequenceBreak
		)
	)
end)