-- mountain
SubrosiaMountainEast:connect_one_way_entrance(SuburbsPortal, function()
	return Any(
		Has(ShufflePortalsOff),
		Has(MountainLeadsToSuburbs),
		Has(SuburbsLeadsToMountain)
	)
end)
SubrosiaMountainEast:connect_two_ways_entrance(TempleOfSeasons)
SubrosiaMountainEast:connect_two_ways_entrance(SubrosiaMountainWest, function() return Has(Feather) end)
SubrosiaMountainEast:connect_two_ways_entrance(StrangeBrothers, JumpLiquid5)
SubrosiaMountainEast:connect_one_way(SubrosiaMountainMagnetDigSpot, function() return Has(Shovel) end)
SubrosiaMountainEast:connect_one_way(SubrosiaMountainTempleDigSpot, function() return Has(Shovel) end)
SubrosiaMountainEast:connect_one_way(SmithyHardOre, function() return Has(HardOre) end)
SubrosiaMountainEast:connect_one_way(SmithyBell, function() return Has(RustyBell) end)
SubrosiaMountainWest:connect_one_way(SubrosiaChef, function() return Has(IronPot) end)
SubrosiaMountainWest:connect_two_ways_entrance(SubrosiaWilds, JumpLiquid5)
SubrosiaMountainWest:connect_one_way(SubrosiaMountainLockedChest, function() return CanReach(RosaDate) end, {RosaDate})
SubrosiaMountainWest:connect_one_way(SubrosiaMountainWestDigSpot, function() return Has(Shovel) end)
SubrosiaMountainWest:connect_one_way(SubrosiaMountainSouthDigSpot, function() return Has(Shovel) end)
Volcano:connect_one_way_entrance(Fireworks, function() return Has(Bombs) end)
Volcano:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return Any(
		Has(ShufflePortalsOff),
		Has(VolcanoLeadsToRemains),
		Has(RemainsLeadsToVolcano)
	)
end)

-- temple
TempleOfSeasons:connect_one_way(TempleDigSpot, function() return Has(Shovel) end)
TempleOfSeasons:connect_one_way(TempleWinterFairy, function()
    return Any(
        Has(Feather),
        CanHitFarSwitch()
    )
end)
TempleOfSeasons:connect_one_way(TempleSummerFairy, function()
    return All(
        Has(Bracelet),
        CanReach(RosaDate)
    )
end, {RosaDate})
TempleOfSeasons:connect_one_way_entrance(TempleAutumnEntrance, function()
    return All(
		Has(Feather),
		Has(BombFlower)
	)
end)
TempleAutumnEntrance:connect_one_way(TempleAutumnFairy, function() return Has(Feather) end)
TempleOfSeasons:connect_two_ways_entrance(SubrosiaMarket, function() return Has(Feather) end)

-- market
SubrosiaMarket:connect_one_way_entrance(SpoolPortal, function()
	return Any(
		Has(ShufflePortalsOff),
		Has(MarketLeadsToSwamp),
		Has(SwampLeadsToMarket)
	)
end)
SubrosiaMarket:connect_one_way(SubrosiaMarket1, function()
	return Any(
		Has(StarOre),
		AccessibilityLevel.Inspect
	)
end)
SubrosiaMarket:connect_one_way(SubrosiaMarket2, CanFarmOreChunks, {SubrosiaMountainEast})
SubrosiaMarket:connect_one_way(SubrosiaMarket3, CanFarmOreChunks, {SubrosiaMountainEast})
SubrosiaMarket:connect_one_way(SubrosiaMarket4, CanFarmOreChunks, {SubrosiaMountainEast})
SubrosiaMarket:connect_one_way(SubrosiaMarket5, CanFarmOreChunks, {SubrosiaMountainEast})
SubrosiaMarket:connect_one_way(BeachDigSpot, function() return Has(Shovel) end)
SubrosiaMarket:connect_one_way_entrance(RosaDate, function() return Has(Ribbon) end)
SubrosiaMarket:connect_one_way(SubrosiaMarketUpperDigSpot, function() return Has(Shovel) end)
SubrosiaMarket:connect_one_way(SubrosiaMarketLowerDigSpot, function() return Has(Shovel) end)
SubrosiaMarket:connect_one_way_entrance(WestFurnace, function()
    return Any(
        JumpLiquid3(),
        Has(MagnetGlove)
    )
end)

-- village
SubrosiaVillagePortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOff),
            Has(VillageLeadsToCucco),
            Has(CuccoLeadsToVillage)
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
        Jump4(),
        Has(MagnetGlove)
    )
end)
SubrosiaWildsMagnet:connect_one_way(WildsDigSpot, function() return Has(Shovel) end)
StrangeBrothers:connect_two_ways_entrance(Pirates, function() return Has(Feather) end)
StrangeBrothers:connect_one_way_entrance(SubrosiaMarket, function()
    return All(
        Has(Bracelet),
        Any(
            Has(MagnetGlove),
            JumpLiquid2()
        )
    )
end)

-- furnace
EastFurnace:connect_one_way_entrance(EyeglassPortal, function()
	return Any(
		Has(ShufflePortalsOff),
		Has(FurnaceLeadsToLake),
		Has(LakeLeadsToFurnace)
	)
end)
EastFurnace:connect_one_way(GreatFurnace, function()
    return All(
        Has(RedOre),
        Has(BlueOre),
		CanReach(TempleAutumnEntrance)
    )
end, {TempleAutumnEntrance})
EastFurnace:connect_one_way(SignGuy, function()
	return Any(
		DestroySigns(),
		Has(SignGuyNone)
	)
end)
EastFurnace:connect_one_way(BombFlowerPickup, function()
    return All(
        Has(Feather),
        Has(Bracelet)
    )
end)
EastFurnace:connect_two_ways_entrance(WestFurnace, function() return Has(Feather) end)
WestFurnace:connect_one_way(FurnaceTerrace, function()
    return Any(
        Jump4(),
        Has(MagnetGlove)
    )
end)
WestFurnace:connect_one_way_entrance(SubrosiaMarket, function()
    return Any(
        JumpLiquid3(),
        Has(MagnetGlove),
        All(
            Has(Bracelet),
            Jump2()
        )
    )
end)

-- d8
SwordAndShieldMaze:connect_one_way_entrance(MazeFoyer, function()
	return Any(
		Has(ShuffleDungeonOff),
		Has(D8LeadsToD8)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return Any(
		Has(ShufflePortalsOff),
		Has(D8LeadsToUpperRemains),
		Has(UpperRemainsLeadsToD8)
	)
end)

-- dungeon shuffle
SwordAndShieldMaze:connect_one_way_entrance(HerosCaveFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D8LeadsToD0)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D8LeadsToD1)
	)
end)
SwordAndShieldMaze:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D8LeadsToD2)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D8LeadsToD3)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(DancingFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D8LeadsToD4)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D8LeadsToD5)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(AncientFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D8LeadsToD6)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(CryptFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D8LeadsToD7)
	)
end)

-- portal shuffle
-- mountain
SubrosiaMountainEast:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MountainLeadsToSuburbs),
			Has(SuburbsLeadsToMountain)
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MountainLeadsToSwamp),
			Has(SwampLeadsToMountain)
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(EyeglassPortal, function()
    return All(
        Any(
            Has(ShufflePortalsOn),
            Has(ShufflePortalsOutward)
        ),
        Any(
            Has(MountainLeadsToLake),
            Has(LakeLeadsToMountain)
        )
    )
end)
SubrosiaMountainEast:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MountainLeadsToCucco),
			Has(CuccoLeadsToMountain)
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MountainLeadsToHoron),
			Has(HoronLeadsToMountain)
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MountainLeadsToRemains),
			Has(RemainsLeadsToMountain)
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MountainLeadsToUpperRemains),
			Has(UpperRemainsLeadsToMountain)
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MountainLeadsToMarket),
			Has(MarketLeadsToMountain)
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MountainLeadsToFurnace),
			Has(FurnaceLeadsToMountain)
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MountainLeadsToVillage),
			Has(VillageLeadsToMountain)
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MountainLeadsToPirates),
			Has(PiratesLeadsToMountain)
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MountainLeadsToVolcano),
			Has(VolcanoLeadsToMountain)
		)
	)
end)
SubrosiaMountainEast:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MountainLeadsToD8),
			Has(D8LeadsToMountain)
		)
	)
end)

-- market
SubrosiaMarket:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MarketLeadsToSuburbs),
			Has(SuburbsLeadsToMarket)
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MarketLeadsToSwamp),
			Has(SwampLeadsToMarket)
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(EyeglassPortal, function()
    return All(
        Any(
            Has(ShufflePortalsOn),
            Has(ShufflePortalsOutward)
        ),
        Any(
            Has(MarketLeadsToLake),
            Has(LakeLeadsToMarket)
        )
    )
end)
SubrosiaMarket:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MarketLeadsToCucco),
			Has(CuccoLeadsToMarket)
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MarketLeadsToHoron),
			Has(HoronLeadsToMarket)
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MarketLeadsToRemains),
			Has(RemainsLeadsToMarket)
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MarketLeadsToUpperRemains),
			Has(UpperRemainsLeadsToMarket)
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MarketLeadsToMountain),
			Has(MountainLeadsToMarket)
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MarketLeadsToFurnace),
			Has(FurnaceLeadsToMarket)
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MarketLeadsToVillage),
			Has(VillageLeadsToMarket)
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MarketLeadsToPirates),
			Has(PiratesLeadsToMarket)
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MarketLeadsToVolcano),
			Has(VolcanoLeadsToMarket)
		)
	)
end)
SubrosiaMarket:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(MarketLeadsToD8),
			Has(D8LeadsToMarket)
		)
	)
end)

-- furnace
EastFurnace:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(FurnaceLeadsToSuburbs),
			Has(SuburbsLeadsToFurnace)
		)
	)
end)
EastFurnace:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(FurnaceLeadsToSwamp),
			Has(SwampLeadsToFurnace)
		)
	)
end)
EastFurnace:connect_one_way_entrance(EyeglassPortal, function()
    return All(
        Any(
            Has(ShufflePortalsOn),
            Has(ShufflePortalsOutward)
        ),
        Any(
            Has(FurnaceLeadsToLake),
            Has(LakeLeadsToFurnace)
        )
    )
end)
EastFurnace:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(FurnaceLeadsToCucco),
			Has(CuccoLeadsToFurnace)
		)
	)
end)
EastFurnace:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(FurnaceLeadsToHoron),
			Has(HoronLeadsToFurnace)
		)
	)
end)
EastFurnace:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(FurnaceLeadsToRemains),
			Has(RemainsLeadsToFurnace)
		)
	)
end)
EastFurnace:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(FurnaceLeadsToUpperRemains),
			Has(UpperRemainsLeadsToFurnace)
		)
	)
end)
EastFurnace:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(FurnaceLeadsToMountain),
			Has(MountainLeadsToFurnace)
		)
	)
end)
EastFurnace:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(FurnaceLeadsToMarket),
			Has(MarketLeadsToFurnace)
		)
	)
end)
EastFurnace:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(FurnaceLeadsToVillage),
			Has(VillageLeadsToFurnace)
		)
	)
end)
EastFurnace:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(FurnaceLeadsToPirates),
			Has(PiratesLeadsToFurnace)
		)
	)
end)
EastFurnace:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(FurnaceLeadsToVolcano),
			Has(VolcanoLeadsToFurnace)
		)
	)
end)
EastFurnace:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(FurnaceLeadsToD8),
			Has(D8LeadsToFurnace)
		)
	)
end)

-- village
SubrosiaVillagePortal:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VillageLeadsToSuburbs),
			Has(SuburbsLeadsToVillage)
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VillageLeadsToSwamp),
			Has(SwampLeadsToVillage)
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(EyeglassPortal, function()
    return All(
        Any(
            Has(ShufflePortalsOn),
            Has(ShufflePortalsOutward)
        ),
        Any(
            Has(VillageLeadsToLake),
            Has(LakeLeadsToVillage)
        )
    )
end)
SubrosiaVillagePortal:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VillageLeadsToCucco),
			Has(CuccoLeadsToVillage)
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VillageLeadsToHoron),
			Has(HoronLeadsToVillage)
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VillageLeadsToRemains),
			Has(RemainsLeadsToVillage)
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VillageLeadsToUpperRemains),
			Has(UpperRemainsLeadsToVillage)
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VillageLeadsToMountain),
			Has(MountainLeadsToVillage)
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(SubrosiaMarket, function()
    return All(
        Any(
            Has(ShufflePortalsOn),
            Has(ShufflePortalsOutward)
        ),
        Any(
            Has(VillageLeadsToMarket),
            Has(MarketLeadsToVillage)
        )
    )
end)
SubrosiaVillagePortal:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VillageLeadsToFurnace),
			Has(FurnaceLeadsToVillage)
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VillageLeadsToPirates),
			Has(PiratesLeadsToVillage)
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VillageLeadsToVolcano),
			Has(VolcanoLeadsToVillage)
		)
	)
end)
SubrosiaVillagePortal:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VillageLeadsToD8),
			Has(D8LeadsToVillage)
		)
	)
end)

-- pirates
Pirates:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(PiratesLeadsToSuburbs),
			Has(SuburbsLeadsToPirates)
		)
	)
end)
Pirates:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(PiratesLeadsToSwamp),
			Has(SwampLeadsToPirates)
		)
	)
end)
Pirates:connect_one_way_entrance(EyeglassPortal, function()
    return All(
        Any(
            Has(ShufflePortalsOn),
            Has(ShufflePortalsOutward)
        ),
        Any(
            Has(PiratesLeadsToLake),
            Has(LakeLeadsToPirates)
        )
    )
end)
Pirates:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(PiratesLeadsToCucco),
			Has(CuccoLeadsToPirates)
		)
	)
end)
Pirates:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(PiratesLeadsToHoron),
			Has(HoronLeadsToPirates)
		)
	)
end)
Pirates:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(PiratesLeadsToRemains),
			Has(RemainsLeadsToPirates)
		)
	)
end)
Pirates:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(PiratesLeadsToUpperRemains),
			Has(UpperRemainsLeadsToPirates)
		)
	)
end)
Pirates:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(PiratesLeadsToMountain),
			Has(MountainLeadsToPirates)
		)
	)
end)
Pirates:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(PiratesLeadsToMarket),
			Has(MarketLeadsToPirates)
		)
	)
end)
Pirates:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(PiratesLeadsToFurnace),
			Has(FurnaceLeadsToPirates)
		)
	)
end)
Pirates:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(PiratesLeadsToVillage),
			Has(VillageLeadsToPirates)
		)
	)
end)
Pirates:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(PiratesLeadsToVolcano),
			Has(VolcanoLeadsToPirates)
		)
	)
end)
Pirates:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(PiratesLeadsToD8),
			Has(D8LeadsToPirates)
		)
	)
end)

-- volcano
Volcano:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VolcanoLeadsToSuburbs),
			Has(SuburbsLeadsToVolcano)
		)
	)
end)
Volcano:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VolcanoLeadsToSwamp),
			Has(SwampLeadsToVolcano)
		)
	)
end)
Volcano:connect_one_way_entrance(EyeglassPortal, function()
    return All(
        Any(
            Has(ShufflePortalsOn),
            Has(ShufflePortalsOutward)
        ),
        Any(
            Has(VolcanoLeadsToLake),
            Has(LakeLeadsToVolcano)
        )
    )
end)
Volcano:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VolcanoLeadsToCucco),
			Has(CuccoLeadsToVolcano)
		)
	)
end)
Volcano:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VolcanoLeadsToHoron),
			Has(HoronLeadsToVolcano)
		)
	)
end)
Volcano:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VolcanoLeadsToRemains),
			Has(RemainsLeadsToVolcano)
		)
	)
end)
Volcano:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VolcanoLeadsToUpperRemains),
			Has(UpperRemainsLeadsToVolcano)
		)
	)
end)
Volcano:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VolcanoLeadsToMountain),
			Has(MountainLeadsToVolcano)
		)
	)
end)
Volcano:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VolcanoLeadsToMarket),
			Has(MarketLeadsToVolcano)
		)
	)
end)
Volcano:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VolcanoLeadsToFurnace),
			Has(FurnaceLeadsToVolcano)
		)
	)
end)
Volcano:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VolcanoLeadsToVillage),
			Has(VillageLeadsToVolcano)
		)
	)
end)
Volcano:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VolcanoLeadsToPirates),
			Has(PiratesLeadsToVolcano)
		)
	)
end)
Volcano:connect_one_way_entrance(SwordAndShieldMaze, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(VolcanoLeadsToD8),
			Has(D8LeadsToVolcano)
		)
	)
end)

-- d8
SwordAndShieldMaze:connect_one_way_entrance(SuburbsPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(D8LeadsToSuburbs),
			Has(SuburbsLeadsToD8)
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(SpoolPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(D8LeadsToSwamp),
			Has(SwampLeadsToD8)
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(EyeglassPortal, function()
    return All(
        Any(
            Has(ShufflePortalsOn),
            Has(ShufflePortalsOutward)
        ),
        Any(
            Has(D8LeadsToLake),
            Has(LakeLeadsToD8)
        )
    )
end)
SwordAndShieldMaze:connect_one_way_entrance(LowerMtCucco, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(D8LeadsToCucco),
			Has(CuccoLeadsToD8)
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(HoronPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(D8LeadsToHoron),
			Has(HoronLeadsToD8)
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(TempleRemainsLowerPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(D8LeadsToRemains),
			Has(RemainsLeadsToD8)
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(TempleRemainsUpperPortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(D8LeadsToUpperRemains),
			Has(UpperRemainsLeadsToD8)
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(SubrosiaMountainEast, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(D8LeadsToMountain),
			Has(MountainLeadsToD8)
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(SubrosiaMarket, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(D8LeadsToMarket),
			Has(MarketLeadsToD8)
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(EastFurnace, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(D8LeadsToFurnace),
			Has(FurnaceLeadsToD8)
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(SubrosiaVillagePortal, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(D8LeadsToVillage),
			Has(VillageLeadsToD8)
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(Pirates, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(D8LeadsToPirates),
			Has(PiratesLeadsToD8)
		)
	)
end)
SwordAndShieldMaze:connect_one_way_entrance(Volcano, function()
	return All(
		Any(
			Has(ShufflePortalsOn),
			Has(ShufflePortalsOutward)
		),
		Any(
			Has(D8LeadsToVolcano),
			Has(VolcanoLeadsToD8)
		)
	)
end)