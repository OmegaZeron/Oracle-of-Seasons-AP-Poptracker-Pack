HoronVillage:connect_one_way(HoronVillageFindSeason)
-- standing items
HoronVillage:connect_one_way(HoronMushroomChest, function()
	return Any(
		All(
			CanDestroyMushroom(true),
			Any(
				HoronVillageAutumn,
				HoronChaoticSeasons,
				Autumn
			)
		),
		CanDimitriClip
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
		CanBurnTrees,
		CanDimitriClip,
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
HoronVillage:connect_one_way_entrance(HoronShop, function()
	return Any(
		HasRupees(ShopPrices[HoronShopPrice]),
		AccessibilityLevel.Inspect
	)
end)
HoronVillage:connect_one_way_entrance(MemberShop, function()
	return All(
		MembersCard,
		Any(
			HasRupees(ShopPrices[MemberShopPrice]),
			AccessibilityLevel.Inspect
		)
	)
end)
HoronVillage:connect_one_way_entrance(AdvanceShop, function()
	return Any(
		HasRupees(ShopPrices[AdvanceShopPrice]),
		AccessibilityLevel.Inspect
	)
end)

-- clock shop
HoronVillage:connect_two_ways_entrance(ClockShop)
ClockShop:connect_one_way(ClockShopTrade, function() return Has(WoodenBird) end)
HoronVillage:connect_one_way(ClockShopSecret, function()
	return All(
		Shovel,
		Any(
			NobleSword,
			BiggoronSword,
			FoolsOre,
			All(
				WoodSword,
				MediumLogic
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
		HoronChaoticSeasons,
		HoronVillageWinter,
		Flippers,
		JumpLiquid2,
		Winter
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
		Jump6,
		MagicBoomerang
	)
end)
HoronPortal:connect_one_way_entrance(HoronPortalStairs, function()
	return Any(
		Jump6,
		CanTriggerLever
	)
end)
HoronPortal:connect_two_ways_entrance(Pirates, function()
	return Any(
		ShufflePortalsOff,
		HoronLeadsToPirates,
		PiratesLeadsToHoron
	)
end)

--exits
HoronVillage:connect_one_way_entrance(EastWesternCoast)
HoronVillage:connect_one_way_entrance(LowerNorthHoron)
HoronVillage:connect_one_way_entrance(LowerEasternSuburbs, CanBurnTrees)

-- portal shuffle
HoronPortal:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			HoronLeadsToSuburbs,
			SuburbsLeadsToHoron
		)
	)
end)
HoronPortal:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			HoronLeadsToSwamp,
			SwampLeadsToHoron
		)
	)
end)
HoronPortal:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			HoronLeadsToLake,
			LakeLeadsToHoron
		)
	)
end)
HoronPortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			HoronLeadsToCucco,
			CuccoLeadsToHoron
		)
	)
end)
HoronPortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			HoronLeadsToRemains,
			RemainsLeadsToHoron
		)
	)
end)
HoronPortal:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			HoronLeadsToUpperRemains,
			UpperRemainsLeadsToHoron
		)
	)
end)
HoronPortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			HoronLeadsToMountain,
			MountainLeadsToHoron
		)
	)
end)
HoronPortal:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			HoronLeadsToMarket,
			MarketLeadsToHoron
		)
	)
end)
HoronPortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			HoronLeadsToFurnace,
			FurnaceLeadsToHoron
		)
	)
end)
HoronPortal:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			HoronLeadsToVillage,
			VillageLeadsToHoron
		)
	)
end)
HoronPortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			HoronLeadsToVolcano,
			VolcanoLeadsToHoron
		)
	)
end)
HoronPortal:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			HoronLeadsToD8,
			D8LeadsToHoron
		)
	)
end)