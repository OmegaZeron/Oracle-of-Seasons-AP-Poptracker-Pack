-- mountain
SubrosiaMountainEast:connect_one_way_entrance(SuburbsPortal, function()
	return Any(
		ShufflePortalsOff,
		MountainLeadsToSuburbs,
		SuburbsLeadsToMountain
	)
end)
SubrosiaMountainEast:connect_two_ways_entrance(TempleOfSeasons)
SubrosiaMountainEast:connect_two_ways_entrance(SubrosiaMountainWest, function() return Has(Feather) end)
SubrosiaMountainEast:connect_two_ways_entrance(StrangeBrothers, JumpLiquid4)
SubrosiaMountainEast:connect_one_way(SubrosiaMountainMagnetDigSpot, function()
	return All(
		Feather,
		Shovel,
		Any(
			MagnetGlove,
			JumpLiquid3
		)
	)
end)
SubrosiaMountainEast:connect_one_way(SubrosianSecret, function()
	return All(
		Feather,
		MagicBoomerang
	)
end)
SubrosiaMountainEast:connect_one_way(SubrosiaMountainTempleDigSpot, function() return Has(Shovel) end)
SubrosiaMountainEast:connect_one_way(SmithyHardOre, function() return Has(HardOre) end)
SubrosiaMountainEast:connect_one_way(SmithyBell, function() return Has(RustyBell) end)
SubrosiaMountainEast:connect_one_way(SmithSecret, function() return Has(Shield) end)
SubrosiaMountainWest:connect_one_way(SubrosiaChef, function() return Has(IronPot) end)
SubrosiaMountainWest:connect_one_way_entrance(StrangeBrothers, function()
	-- H&S skip
	return All(
		Feather,
		PegasusSeeds,
		Satchel,
		Bombs,
		HellLogic
	)
end)
SubrosiaMountainWest:connect_one_way(SubrosiaMountainLockedChest, function() return Has(Ribbon) end)
SubrosiaMountainWest:connect_one_way(SubrosiaMountainWestDigSpot, function() return Has(Shovel) end)
SubrosiaMountainWest:connect_one_way(SubrosiaMountainSouthDigSpot, function() return Has(Shovel) end)
Volcano:connect_one_way_entrance(Fireworks, function() return Has(Bombs) end)
Volcano:connect_one_way_entrance(SubrosiaMountainWest, function()
	return All(
		Bracelet,
		JumpLiquid3
	)
end)
Volcano:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return Any(
		ShufflePortalsOff,
		VolcanoLeadsToRemains,
		RemainsLeadsToVolcano
	)
end)

-- temple
TempleOfSeasons:connect_one_way(TempleDigSpot, function() return Has(Shovel) end)
TempleOfSeasons:connect_one_way(TempleSecret)
TempleOfSeasons:connect_one_way(TempleWinterFairy, function()
	return Any(
		Feather,
		CanHitFarSwitch
	)
end)
TempleOfSeasons:connect_one_way_entrance(TempleAutumnEntrance, function()
	return All(
		BombFlower,
		Feather
	)
end)
TempleAutumnEntrance:connect_one_way(TempleAutumnFairy, function() return Has(Feather) end)
TempleOfSeasons:connect_two_ways_entrance(SubrosiaMarket, function() return Has(Feather) end)

-- market
SubrosiaMarket:connect_one_way_entrance(SubrosiaMountainEast, function() return Has(Ribbon) end)
SubrosiaMarket:connect_one_way_entrance(SpoolPortal, function()
	return Any(
		ShufflePortalsOff,
		MarketLeadsToSwamp,
		SwampLeadsToMarket
	)
end)
SubrosiaMarket:connect_one_way(SubrosiaMarket1, function()
	return Any(
		StarOre,
		AccessibilityLevel.Inspect
	)
end)
SubrosiaMarket:connect_one_way_entrance(MarketOrePurchases, function()
	return Any(
		HasOreChunks(ShopPrices[SubrosianMarketPrice]),
		AccessibilityLevel.Inspect
	)
end, {SubrosiaMountainEast})
MarketOrePurchases:connect_one_way(SubrosiaMarket2)
MarketOrePurchases:connect_one_way(SubrosiaMarket3)
MarketOrePurchases:connect_one_way(SubrosiaMarket4)
MarketOrePurchases:connect_one_way(SubrosiaMarket5)
SubrosiaMarket:connect_one_way(BeachDigSpot, function() return Has(Shovel) end)
SubrosiaMarket:connect_one_way_entrance(RosaDate, function() return Has(Ribbon) end)
RosaDate:connect_one_way(TempleSummerFairy, function() return Has(Bracelet) end)
SubrosiaMarket:connect_one_way(SubrosiaMarketUpperDigSpot, function() return Has(Shovel) end)
SubrosiaMarket:connect_one_way(SubrosiaMarketLowerDigSpot, function() return Has(Shovel) end)
SubrosiaMarket:connect_one_way_entrance(WestFurnace, function()
	return Any(
		JumpLiquid3,
		MagnetGlove
	)
end)

-- village
SubrosiaVillagePortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOff,
			VillageLeadsToCucco,
			CuccoLeadsToVillage
		)
	)
end)
SubrosiaVillagePortal:connect_two_ways_entrance(StrangeBrothers, function() return Has(Feather) end)
StrangeBrothers:connect_one_way(VillagerGasha)
StrangeBrothers:connect_one_way(StrangeBrothersTreasure, function() return Has(Shovel) end)
StrangeBrothers:connect_one_way(TempleSpringFairy, function() return Has(Feather) end)
StrangeBrothers:connect_two_ways_entrance(SubrosiaWilds)
SubrosiaWilds:connect_one_way_entrance(SubrosiaWildsMagnet, function()
	return Any(
		Jump4,
		MagnetGlove
	)
end)
SubrosiaWildsMagnet:connect_one_way(WildsDigSpot, function() return Has(Shovel) end)
StrangeBrothers:connect_two_ways_entrance(Pirates, function() return Has(Feather) end)
StrangeBrothers:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Bracelet,
		Any(
			MagnetGlove,
			JumpLiquid2
		)
	)
end)

-- pirates
Pirates:connect_one_way(PirateSecret, function() return Has(PolishedBell) end)

-- furnace
EastFurnace:connect_one_way_entrance(EyeglassPortal, function()
	return Any(
		ShufflePortalsOff,
		FurnaceLeadsToLake,
		LakeLeadsToFurnace
	)
end)
EastFurnace:connect_one_way(GreatFurnace, function()
	return All(
		CanReach(TempleAutumnEntrance),
		RedOre,
		BlueOre
	)
end, {TempleAutumnEntrance})
EastFurnace:connect_one_way(SignGuy, function()
	return Any(
		SignGuyNone,
		DestroySigns
	)
end)
EastFurnace:connect_one_way(BombFlowerPickup, function()
	return All(
		Feather,
		Bracelet
	)
end)
EastFurnace:connect_one_way_entrance(WestFurnace, function()
	return Any(
		Feather,
		All(
			SwitchHook,
			MediumLogic
		)
	)
end)
WestFurnace:connect_one_way_entrance(EastFurnace, function() return Has(Feather) end)
WestFurnace:connect_one_way(FurnaceTerrace, function()
	return Any(
		Jump4,
		MagnetGlove,
		All(
			JumpLiquid3,
			HellLogic
		)
	)
end)
WestFurnace:connect_one_way_entrance(SubrosiaMarket, function()
	return Any(
		JumpLiquid3,
		MagnetGlove,
		All(
			Bracelet,
			Jump2
		)
	)
end)

-- d8
SwordAndShieldMaze:connect_one_way_entrance(MazeFoyer, function()
	return Any(
		ShuffleDungeonOff,
		D8LeadsToD8
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return Any(
		ShufflePortalsOff,
		D8LeadsToUpperRemains,
		UpperRemainsLeadsToD8
	)
end)

-- dungeon shuffle
SwordAndShieldMaze:connect_two_ways_entrance(HerosCaveFoyer, function()
	return All(
		ShuffleDungeonOn,
		D8LeadsToD0
	)
end)
SwordAndShieldMaze:connect_two_ways_entrance(LinkedCaveFoyer, function()
	return All(
		ShuffleDungeonOn,
		D8LeadsToLC
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		ShuffleDungeonOn,
		D8LeadsToD1
	)
end)
SwordAndShieldMaze:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		ShuffleDungeonOn,
		D8LeadsToD2
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		ShuffleDungeonOn,
		D8LeadsToD3
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(DancingFoyer, function()
	return All(
		ShuffleDungeonOn,
		D8LeadsToD4
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		ShuffleDungeonOn,
		D8LeadsToD5
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(AncientFoyer, function()
	return All(
		ShuffleDungeonOn,
		D8LeadsToD6
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(CryptFoyer, function()
	return All(
		ShuffleDungeonOn,
		D8LeadsToD7
	)
end)

-- portal shuffle
-- mountain
SubrosiaMountainEast:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MountainLeadsToSuburbs,
			SuburbsLeadsToMountain
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MountainLeadsToSwamp,
			SwampLeadsToMountain
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MountainLeadsToLake,
			LakeLeadsToMountain
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MountainLeadsToCucco,
			CuccoLeadsToMountain
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MountainLeadsToHoron,
			HoronLeadsToMountain
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MountainLeadsToRemains,
			RemainsLeadsToMountain
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MountainLeadsToUpperRemains,
			UpperRemainsLeadsToMountain
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MountainLeadsToMarket,
			MarketLeadsToMountain
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MountainLeadsToFurnace,
			FurnaceLeadsToMountain
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MountainLeadsToVillage,
			VillageLeadsToMountain
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MountainLeadsToPirates,
			PiratesLeadsToMountain
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MountainLeadsToVolcano,
			VolcanoLeadsToMountain
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MountainLeadsToD8,
			D8LeadsToMountain
		)
	)
end)

-- market
SubrosiaMarket:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MarketLeadsToSuburbs,
			SuburbsLeadsToMarket
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MarketLeadsToSwamp,
			SwampLeadsToMarket
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MarketLeadsToLake,
			LakeLeadsToMarket
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MarketLeadsToCucco,
			CuccoLeadsToMarket
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MarketLeadsToHoron,
			HoronLeadsToMarket
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MarketLeadsToRemains,
			RemainsLeadsToMarket
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MarketLeadsToUpperRemains,
			UpperRemainsLeadsToMarket
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MarketLeadsToMountain,
			MountainLeadsToMarket
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MarketLeadsToFurnace,
			FurnaceLeadsToMarket
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MarketLeadsToVillage,
			VillageLeadsToMarket
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MarketLeadsToPirates,
			PiratesLeadsToMarket
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MarketLeadsToVolcano,
			VolcanoLeadsToMarket
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			MarketLeadsToD8,
			D8LeadsToMarket
		)
	)
end)

-- furnace
EastFurnace:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			FurnaceLeadsToSuburbs,
			SuburbsLeadsToFurnace
		)
	)
end)
EastFurnace:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			FurnaceLeadsToSwamp,
			SwampLeadsToFurnace
		)
	)
end)
EastFurnace:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			FurnaceLeadsToLake,
			LakeLeadsToFurnace
		)
	)
end)
EastFurnace:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			FurnaceLeadsToCucco,
			CuccoLeadsToFurnace
		)
	)
end)
EastFurnace:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			FurnaceLeadsToHoron,
			HoronLeadsToFurnace
		)
	)
end)
EastFurnace:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			FurnaceLeadsToRemains,
			RemainsLeadsToFurnace
		)
	)
end)
EastFurnace:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			FurnaceLeadsToUpperRemains,
			UpperRemainsLeadsToFurnace
		)
	)
end)
EastFurnace:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			FurnaceLeadsToMountain,
			MountainLeadsToFurnace
		)
	)
end)
EastFurnace:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			FurnaceLeadsToMarket,
			MarketLeadsToFurnace
		)
	)
end)
EastFurnace:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			FurnaceLeadsToVillage,
			VillageLeadsToFurnace
		)
	)
end)
EastFurnace:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			FurnaceLeadsToPirates,
			PiratesLeadsToFurnace
		)
	)
end)
EastFurnace:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			FurnaceLeadsToVolcano,
			VolcanoLeadsToFurnace
		)
	)
end)
EastFurnace:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			FurnaceLeadsToD8,
			D8LeadsToFurnace
		)
	)
end)

-- village
SubrosiaVillagePortal:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VillageLeadsToSuburbs,
			SuburbsLeadsToVillage
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VillageLeadsToSwamp,
			SwampLeadsToVillage
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VillageLeadsToLake,
			LakeLeadsToVillage
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VillageLeadsToCucco,
			CuccoLeadsToVillage
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VillageLeadsToHoron,
			HoronLeadsToVillage
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VillageLeadsToRemains,
			RemainsLeadsToVillage
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VillageLeadsToUpperRemains,
			UpperRemainsLeadsToVillage
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VillageLeadsToMountain,
			MountainLeadsToVillage
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VillageLeadsToMarket,
			MarketLeadsToVillage
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VillageLeadsToFurnace,
			FurnaceLeadsToVillage
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VillageLeadsToPirates,
			PiratesLeadsToVillage
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VillageLeadsToVolcano,
			VolcanoLeadsToVillage
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VillageLeadsToD8,
			D8LeadsToVillage
		)
	)
end)

-- pirates
Pirates:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			PiratesLeadsToSuburbs,
			SuburbsLeadsToPirates
		)
	)
end)
Pirates:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			PiratesLeadsToSwamp,
			SwampLeadsToPirates
		)
	)
end)
Pirates:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			PiratesLeadsToLake,
			LakeLeadsToPirates
		)
	)
end)
Pirates:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			PiratesLeadsToCucco,
			CuccoLeadsToPirates
		)
	)
end)
Pirates:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			PiratesLeadsToHoron,
			HoronLeadsToPirates
		)
	)
end)
Pirates:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			PiratesLeadsToRemains,
			RemainsLeadsToPirates
		)
	)
end)
Pirates:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			PiratesLeadsToUpperRemains,
			UpperRemainsLeadsToPirates
		)
	)
end)
Pirates:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			PiratesLeadsToMountain,
			MountainLeadsToPirates
		)
	)
end)
Pirates:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			PiratesLeadsToMarket,
			MarketLeadsToPirates
		)
	)
end)
Pirates:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			PiratesLeadsToFurnace,
			FurnaceLeadsToPirates
		)
	)
end)
Pirates:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			PiratesLeadsToVillage,
			VillageLeadsToPirates
		)
	)
end)
Pirates:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			PiratesLeadsToVolcano,
			VolcanoLeadsToPirates
		)
	)
end)
Pirates:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			PiratesLeadsToD8,
			D8LeadsToPirates
		)
	)
end)

-- volcano
Volcano:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VolcanoLeadsToSuburbs,
			SuburbsLeadsToVolcano
		)
	)
end)
Volcano:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VolcanoLeadsToSwamp,
			SwampLeadsToVolcano
		)
	)
end)
Volcano:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VolcanoLeadsToLake,
			LakeLeadsToVolcano
		)
	)
end)
Volcano:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VolcanoLeadsToCucco,
			CuccoLeadsToVolcano
		)
	)
end)
Volcano:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VolcanoLeadsToHoron,
			HoronLeadsToVolcano
		)
	)
end)
Volcano:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VolcanoLeadsToRemains,
			RemainsLeadsToVolcano
		)
	)
end)
Volcano:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VolcanoLeadsToUpperRemains,
			UpperRemainsLeadsToVolcano
		)
	)
end)
Volcano:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VolcanoLeadsToMountain,
			MountainLeadsToVolcano
		)
	)
end)
Volcano:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VolcanoLeadsToMarket,
			MarketLeadsToVolcano
		)
	)
end)
Volcano:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VolcanoLeadsToFurnace,
			FurnaceLeadsToVolcano
		)
	)
end)
Volcano:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VolcanoLeadsToVillage,
			VillageLeadsToVolcano
		)
	)
end)
Volcano:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VolcanoLeadsToPirates,
			PiratesLeadsToVolcano
		)
	)
end)
Volcano:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			VolcanoLeadsToD8,
			D8LeadsToVolcano
		)
	)
end)

-- d8
SwordAndShieldMaze:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			D8LeadsToSuburbs,
			SuburbsLeadsToD8
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			D8LeadsToSwamp,
			SwampLeadsToD8
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(EyeglassPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			D8LeadsToLake,
			LakeLeadsToD8
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			D8LeadsToCucco,
			CuccoLeadsToD8
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			D8LeadsToHoron,
			HoronLeadsToD8
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			D8LeadsToRemains,
			RemainsLeadsToD8
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			D8LeadsToUpperRemains,
			UpperRemainsLeadsToD8
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			D8LeadsToMountain,
			MountainLeadsToD8
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			D8LeadsToMarket,
			MarketLeadsToD8
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			D8LeadsToFurnace,
			FurnaceLeadsToD8
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			D8LeadsToVillage,
			VillageLeadsToD8
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			D8LeadsToPirates,
			PiratesLeadsToD8
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			ShufflePortalsOn,
			ShufflePortalsOutward
		),
		Any(
			D8LeadsToVolcano,
			VolcanoLeadsToD8
		)
	)
end)