-- mountain
SubrosiaMountainEast:connect_two_ways_entrance(TempleOfSeasons)
SubrosiaMountainEast:connect_two_ways_entrance(SubrosiaMountainWest, function() return Has(Feather) end)
SubrosiaMountainEast:connect_two_ways_entrance(StrangeBrothers, JumpLiquid5)
SubrosiaMountainEast:connect_one_way(SubrosiaMountainMagnetDigSpot, function() return Has(Shovel) end)
SubrosiaMountainEast:connect_one_way(SubrosiaMountainTempleDigSpot, function() return Has(Shovel) end)
SubrosiaMountainEast:connect_one_way(SmithyHardOre, function() return Has(HardOre) end)
SubrosiaMountainEast:connect_one_way(SmithyBell, function() return Has(RustyBell) end)
SubrosiaMountainWest:connect_one_way(SubrosiaChef, function() return Has(IronPot) end)
SubrosiaMountainWest:connect_two_ways_entrance(SubrosiaWilds, JumpLiquid5)
SubrosiaMountainWest:connect_one_way(SubrosiaMountainLockedChest, function() return CanReach(RosaDate) end, RosaDate)
SubrosiaMountainWest:connect_one_way(SubrosiaMountainWestDigSpot, function() return Has(Shovel) end)
SubrosiaMountainWest:connect_one_way(SubrosiaMountainSouthDigSpot, function() return Has(Shovel) end)
Volcano:connect_one_way_entrance(Fireworks, function() return Has(Bombs) end)

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
end, RosaDate)
TempleOfSeasons:connect_one_way(TempleAutumnFairy, function()
    return All(
        Has(Feather),
        Has(BombFlower)
    )
end)
TempleOfSeasons:connect_two_ways_entrance(SubrosiaMarket, function() return Has(Feather) end)

-- market
SubrosiaMarket:connect_one_way(SubrosiaMarket1, function() return Has(StarOre) end)
SubrosiaMarket:connect_one_way(SubrosiaMarket2, CanFarmOreChunks, SubrosiaMountainEast)
SubrosiaMarket:connect_one_way(SubrosiaMarket3, CanFarmOreChunks, SubrosiaMountainEast)
SubrosiaMarket:connect_one_way(SubrosiaMarket4, CanFarmOreChunks, SubrosiaMountainEast)
SubrosiaMarket:connect_one_way(SubrosiaMarket5, CanFarmOreChunks, SubrosiaMountainEast)
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
SubrosiaWildsMagnet:connect_one_way(WildsDigSpot)
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
EastFurnace:connect_one_way(GreatFurnace, function()
    return All(
        Has(RedOre),
        Has(BlueOre)
    )
end)
EastFurnace:connect_one_way(SignGuy, DestroySigns)
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