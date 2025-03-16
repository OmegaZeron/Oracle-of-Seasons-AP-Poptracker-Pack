HoronVillage:connect_one_way(HoronVillageFindSeason)
-- standing items
HoronVillage:connect_one_way(HoronMushroomChest, function()
	return All(
		CanDestroyMushroom(true),
		Any(
			Has(Autumn),
			Has(HoronVillageAutumn),
			Has(HoronChaoticSeasons)
		)
	)
end)
HoronVillage:connect_one_way(HoronTree, function()
	return Any(
		CanHarvestSeeds(true),
		AccessibilityLevel.Inspect
	)
end)
HoronVillage:connect_one_way(HoronTreeHP, function()
	return Any(
		All(
			CanUseSeeds(),
			Has(EmberSeeds)
		),
		AccessibilityLevel.Inspect
	)
end)
HoronVillage:connect_one_way(HoronGasha, CanPlantGasha)

-- mayor
HoronVillage:connect_two_ways_entrance(MayorHouse)
MayorHouse:connect_one_way(MayorsGift)
MayorHouse:connect_one_way(MayorSecret)
MayorHouse:connect_one_way(MayorBombWall, CanBombWall)

-- vasu
HoronVillage:connect_two_ways_entrance(Vasu)
Vasu:connect_one_way(VasuGift)

-- shop
HoronVillage:connect_two_ways_entrance(HoronShop)
HoronShop:connect_one_way(HoronShop1, function()
	return Any(
		HasRupees(ShopPrices[HoronShopPrice]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})
HoronShop:connect_one_way(HoronShop2, function()
	return Any(
		HasRupees(ShopPrices[HoronShopPrice]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})
HoronShop:connect_one_way(HoronShop3, function()
	return Any(
		HasRupees(ShopPrices[HoronShopPrice]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})
HoronShop:connect_one_way_entrance(MemberShop, function() return Has(MembersCard) end)
MemberShop:connect_one_way(MembersShop1, function()
	return Any(
		All(
			Has(MembersCard),
			HasRupees(ShopPrices[MemberShopPrice])
		),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})
MemberShop:connect_one_way(MembersShop2, function()
	return Any(
		All(
			Has(MembersCard),
			HasRupees(ShopPrices[MemberShopPrice])
		),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})
MemberShop:connect_one_way(MembersShop3, function()
	return Any(
		All(
			Has(MembersCard),
			HasRupees(ShopPrices[MemberShopPrice])
		),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})
HoronShop:connect_one_way_entrance(AdvanceShop)
AdvanceShop:connect_one_way(AdvanceShop1, function()
	return Any(
		HasRupees(ShopPrices[AdvanceShopPrice]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})
AdvanceShop:connect_one_way(AdvanceShop2, function()
	return Any(
		HasRupees(ShopPrices[AdvanceShopPrice]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})
AdvanceShop:connect_one_way(AdvanceShop3, function()
	return Any(
		HasRupees(ShopPrices[AdvanceShopPrice]),
		AccessibilityLevel.Inspect
	)
end, {SnakeRupeeRoom, AncientRupeeRoom})

-- clock shop
HoronVillage:connect_two_ways_entrance(ClockShop)
ClockShop:connect_one_way(ClockShopTrade, function() return Has(WoodenBird) end)
HoronVillage:connect_one_way(ClockShopSecret, function()
	return All(
		Has(Shovel),
		Any(
			Has(NobleSword),
			Has(FoolsOre),
			All(
				Has(WoodSword),
				Any(
					MediumLogic(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)

-- dr left
HoronVillage:connect_two_ways_entrance(DrLeft)
DrLeft:connect_one_way(DrLeftReward, CanLightTorches)
DrLeft:connect_one_way_entrance(DrLeftBackyard, CanBombWall)
DrLeftBackyard:connect_one_way(DrLeftBackyardChest, function()
	return Any(
		Has(Flippers),
		JumpLiquid2(),
		Has(Winter),
		Has(HoronChaoticSeasons),
		Has(HoronVillageWinter)
	)
end)

-- old man
HoronVillage:connect_one_way(HoronVillageOldMan, CanBurnTrees)

-- maku tree
HoronVillage:connect_one_way_entrance(MakuTree, function() return Has(WoodSword) end)
MakuTree:connect_one_way(MakuTreeGift)
MakuTree:connect_one_way(MakuTreeReward1, function() return Has(Essences, 3) end)
MakuTree:connect_one_way(MakuTreeReward2, function() return Has(Essences, 5) end)
MakuTree:connect_one_way(MakuTreeReward3, function() return Has(Essences, 7) end)
MakuTree:connect_one_way(MakuSeed, HasEnoughEssencesForGoal)

-- portal
HoronVillage:connect_two_ways_entrance(HoronPortalStairs)
HoronPortalStairs:connect_one_way_entrance(HoronPortal, function()
	return Any(
		Jump6(),
		Has(MagicBoomerang)
	)
end)
HoronPortal:connect_one_way_entrance(HoronPortalStairs, function()
	return Any(
		Jump6(),
		CanTriggerLever()
	)
end)
HoronPortal:connect_two_ways_entrance(Pirates, function()
	return Any(
		Has(ShufflePortalsOff),
		Has(HoronLeadsToPirates),
		Has(PiratesLeadsToHoron)
	)
end)

--exits
HoronVillage:connect_one_way_entrance(EastWesternCoast)
HoronVillage:connect_one_way_entrance(LowerNorthHoron)
HoronVillage:connect_one_way_entrance(LowerEasternSuburbs, function()
	return All(
		CanUseSeeds(),
		Has(EmberSeeds)
	)
end)

-- portal shuffle
HoronPortal:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(HoronLeadsToSuburbs),
			Has(SuburbsLeadsToHoron)
		)
	)
end)
HoronPortal:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(HoronLeadsToSwamp),
			Has(SwampLeadsToHoron)
		)
	)
end)
HoronPortal:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(HoronLeadsToLake),
			Has(LakeLeadsToHoron)
		)
	)
end)
HoronPortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(HoronLeadsToCucco),
			Has(CuccoLeadsToHoron)
		)
	)
end)
HoronPortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(HoronLeadsToRemains),
			Has(RemainsLeadsToHoron)
		)
	)
end)
HoronPortal:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(HoronLeadsToUpperRemains),
			Has(UpperRemainsLeadsToHoron)
		)
	)
end)
HoronPortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(HoronLeadsToMountain),
			Has(MountainLeadsToHoron)
		)
	)
end)
HoronPortal:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(HoronLeadsToMarket),
			Has(MarketLeadsToHoron)
		)
	)
end)
HoronPortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(HoronLeadsToFurnace),
			Has(FurnaceLeadsToHoron)
		)
	)
end)
HoronPortal:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(HoronLeadsToVillage),
			Has(VillageLeadsToHoron)
		)
	)
end)
HoronPortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(HoronLeadsToVolcano),
			Has(VolcanoLeadsToHoron)
		)
	)
end)
HoronPortal:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(HoronLeadsToD8),
			Has(D8LeadsToHoron)
		)
	)
end)