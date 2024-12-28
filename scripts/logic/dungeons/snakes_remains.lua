-- 0 keys
SnakeFoyer:connect_one_way(SnakeLeftRopeDrop, CanNormalKill)
SnakeFoyer:connect_one_way_entrance(SnakeAngryTorches, CanLightTorches)
SnakeAngryTorches:connect_one_way(SnakeRightRopeChest, CanNormalKill)
SnakeAngryTorches:connect_one_way_entrance(SnakeFoyer, function()
	return Any(
		CanLightTorches(),
		CanWarp()
	)
end)
SnakeAngryTorches:connect_one_way_entrance(SnakeMoblinRopeFight)
SnakeMoblinRopeFight:connect_one_way_entrance(SnakeAngryTorches, CanNormalKill)
SnakeMoblinRopeFight:connect_one_way_entrance(SnakeRupeeRoom, function() return Has(Bombs) end)
SnakeMoblinRopeFight:connect_one_way_entrance(SnakeBladeTraps, CanNormalKill)
SnakeBladeTraps:connect_one_way_entrance(SnakeMoblinRopeFight)
SnakeBladeTraps:connect_two_ways_entrance(SnakeAltEntrance, function() return Has(Bracelet) end)
SnakeAltEntrance:connect_one_way(SnakeBombPuzzle, function()
	return All(
		Has(D2AltRemoved),
		CanDestroyBush(),
		Has(Bombs)
	)
end)
SnakeBladeTraps:connect_one_way_entrance(SnakeBombBlockStairs, function() return Has(Bombs) end)
SnakeBombBlockStairs:connect_one_way_entrance(FacadeDoorstep, function() return Has(Bracelet) end)
--two keys
FacadeDoorstep:connect_one_way_entrance(Facade, function()
	return All(
		D2KeyCount(2),
		Has(Bombs)
	)
end)
Facade:connect_one_way_entrance(KingDodongo, function()
	return All(
		Has(Bracelet),
		Has(Bombs),
		Has(D2BossKey)
	)
end)

-- 3 keys
SnakeMoblinRopeFight:connect_one_way_entrance(SnakeHardhats, function()
	return All(
		D2KeyCount(3)
	)
end)
SnakeHardhats:connect_one_way(SnakeHardhatChest, CanDestroyPot)
SnakeHardhats:connect_one_way_entrance(SnakeBombMoblins, function()
	return All(
		Any(
			CanSwordKill(),
			Has(Boomerang),
			CanKillWithPit(),
			All(
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				),
				Any(
					Has(Slingshot),
					All(
						Has(SeedSatchel),
						Any(
							Has(Hard),
							AccessibilityLevel.SequenceBreak
						)
					)
				),
				Any(
					Has(ScentSeeds),
					Has(GaleSeeds)
				)
			),
			All(
				Has(Shovel),
				Any(
					Has(Hard),
					AccessibilityLevel.SequenceBreak
				)
			)
		),
		Any(
			CanSwordKill(),
			CanShootSeedsCombat(),
			All(
				Has(Feather),
				CanKillWithPit()
			),
			All(
				Any(
					Has(Hard),
					AccessibilityLevel.SequenceBreak
				),
				Any(
					All(
						CanUseSeeds(),
						Has(EmberSeeds)
					),
					CanPunch()
				)
			)
		)
	)
end)
Facade:connect_one_way(SnakeTerrace, function() return D2KeyCount(3) end)