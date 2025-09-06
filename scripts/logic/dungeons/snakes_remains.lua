-- 0 keys
SnakeFoyer:connect_one_way(SnakeLeftRopeDrop, CanNormalKill)
SnakeFoyer:connect_one_way_entrance(SnakeAngryTorches, CanLightTorches)
SnakeAngryTorches:connect_one_way(SnakeRightRopeChest, CanNormalKill)
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
			HasBombs,
			All(
				Any(
					HasCombatBombchus,
					All(
						HasBombchus,
						AccessibilityLevel.SequenceBreak
					)
				),
				HasSatchel,
				HasPegasus,
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
		HasBombs
	)
end)
Facade:connect_one_way_entrance(SnakeFoyer)
Facade:connect_one_way_entrance(KingDodongo, function()
	return All(
		HasD2BossKey,
		HasBracelet,
		HasBombs
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
			HasBoomerang,
			CanKillWithPit,
			All(
				HasUpgradedSatchel,
				Any(
					HasSlingshot,
					All(
						HasSatchel,
						HardLogic
					)
				),
				Any(
					HasScents,
					HasGales,
					HasMysteries
				),
				MediumLogic
			),
			All(
				HasShovel,
				HardLogic
			)
		),
		-- moblins
		Any(
			CanSwordKill,
			HasBombs, -- regrowing bushes are right there
			CanShootSeedsCombat,
			All(
				HasFeather,
				CanKillWithPit
			),
			All(
				Any(
					All(
						CanUseSeeds,
						HasEmbers
					),
					CanPunch
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