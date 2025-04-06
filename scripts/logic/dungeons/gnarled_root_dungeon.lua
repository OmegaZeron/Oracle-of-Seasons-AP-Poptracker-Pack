-- 0 keys
GnarledFoyer:connect_one_way(GnarledRightStalfosChest, CanKillStalfos)
GnarledRightStalfosChest:connect_one_way_entrance(GnarledFloormasters, CanLightTorches)
GnarledFloormasters:connect_one_way(GnarledFloormasterChest)
GnarledFloormasters:connect_one_way_entrance(Aquamentus, function() return Has(D1BossKey) end)
Aquamentus:connect_one_way(GnarledEssence, CanArmorKill)
-- 1 key
GnarledFoyer:connect_one_way_entrance(GnarledLeftStalfos, function() return D1KeyCount(1) end)
GnarledLeftStalfos:connect_one_way(GnarledLeftStalfosChest, CanKillStalfos)
GnarledLeftStalfos:connect_one_way_entrance(GnarledZolRoom, CanKillStalfos)
GnarledZolRoom:connect_one_way_entrance(GnarledGoriyaRoom, CanLightTorches)
GnarledGoriyaRoom:connect_one_way(GnarledGoriyaChest, CanNormalKill)
GnarledZolRoom:connect_one_way_entrance(GnarledPushBlocks, function()
	return Any(
		CanNormalKill(),
		All(
			Has(Bracelet),
			HardLogic()
		)
	)
end)
GnarledZolRoom:connect_one_way(GnarledLeverChest)
GnarledZolRoom:connect_one_way_entrance(GnarledMinecartChest, function()
	return Any(
		CanTriggerLever(),
		All(
			Has(Bracelet),
			HardLogic()
		)
	)
end)
GnarledMinecartChest:connect_one_way(GnarledSpinningBladeChest)
-- 2 keys
GnarledMinecartChest:connect_one_way_entrance(GoriyaBros, function()
	return All(
		CanBombWall(),
		D1KeyCount(2)
	)
end)
GoriyaBros:connect_one_way(GnarledPostGoriyaBros, CanArmorKill)