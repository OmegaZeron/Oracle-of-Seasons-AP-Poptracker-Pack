DragonKeyhole:connect_one_way_entrance(RoosterAdventure, function()
    return All(
        HasGales,
        HasSatchel,
        Any(
            Has(SpringBanana),
            HasShovel
        ),
        HellLogic
    )
end)
RoosterAdventure:connect_one_way_entrance(LowerMtCucco, function() return GetCuccos()["mt. cucco"][1] ~= -1 end)
RoosterAdventure:connect_one_way_entrance(MoblinKeep, function()
    return Any(
        All(
            GetCuccos()["sunken"][2] > 0,
            Has(NatzuIsRicky)
        ),
        All(
            GetCuccos()["horon"][2] > 0,
            Any(
                Has(AnyCompanion),
                All(
                    Has(NatzuIsMoosh),
                    Jump3
                )
            )
        )
    )
end)
RoosterAdventure:connect_one_way_entrance(SunkenCity, function() return GetCuccos()["sunken"][1] >= 0 end)
RoosterAdventure:connect_one_way_entrance(SunkenGashaSpot, function()
    return All(
        GetCuccos()["sunken"][3] > 0,
        CanPlantGasha,
        Any(
            Has(SunkenCityWinter),
            All(
                HasWinter,
                Any(
                    HasFlippers,
                    Dimitri,
                    HasBombs -- save Dimitri
                )
            )
        )
    )
end)
RoosterAdventure:connect_one_way_entrance(Syrup, function()
    return All(
        GetCuccos()["sunken"][3] > 0,
        Has(Mushroom)
    )
end)

RoosterAdventure:connect_one_way_entrance(LowerEasternSuburbs, function() return GetCuccos()["suburbs"][1] >= 0 end)
RoosterAdventure:connect_one_way_entrance(SuburbsSpringCave, function()
    return All(
        GetCuccos()["suburbs"][3] > 0,
        Any(
            Has(EasternSuburbsSpring),
            HasSpring
        ),
        Any(
            HasMagnetGlove,
            Jump3
        )
    )
end)
RoosterAdventure:connect_one_way_entrance(WindmillHP, function() return GetCuccos()["suburbs"][2] > 0 end)
RoosterAdventure:connect_one_way_entrance(SamasaDesertChest, function()
    return All(
        GetCuccos()["suburbs"][2] > 0,
        CanReach(Pirates)
    )
end, {Pirates})
RoosterAdventure:connect_one_way_entrance(MoblinRoad, function() return GetCuccos()["moblin road"][1] > 0 end)
RoosterAdventure:connect_one_way_entrance(Holly, function() return GetCuccos()["moblin road"][2] > 0 end)
RoosterAdventure:connect_one_way_entrance(HoronTreeHP, function() return GetCuccos()["horon"][2] > 0 end)
RoosterAdventure:connect_one_way_entrance(GraveyardHP, function()
    return All(
        GetCuccos()["horon"][2] > 0,
        Has(PolishedBell),
        CanReach(Pirates),
        Has(WesternCoastSummer)
    )
end, {Pirates})
RoosterAdventure:connect_one_way_entrance(NorthSpoolSwamp, function() return GetCuccos()["swamp"][1] >= 0 end)
RoosterAdventure:connect_one_way_entrance(SpoolWinterCave, function()
    return Any(
        All(
            Any(
                HasFlippers,
                Dimitri
            ),
            GetCuccos()["horon"][1] > 0
        ),
        All(
            Has(FloodgateKey),
            GetCuccos()["swamp"][1] > 0,
            Any(
                Has(SpoolSwampSummer),
                Has(SpoolSwampAutumn),
                Has(SpoolSwampWinter),
                HasSummer,
                HasAutumn,
                HasWinter
            )
        )
    )
end)
RoosterAdventure:connect_one_way_entrance(TarmLostWoodsScrub, function()
    return All(
        GetCuccos()["swamp"][2] > 0,
        CanEnterTarm(),
        Any(
            Has(LostWoodsSummer),
            CanReach(TarmTreeStump),
            HasSummer
        )
    )
end, {TarmTreeStump})
RoosterAdventure:connect_one_way_entrance(TempleRemainsStump, function()
    return All(
        GetCuccos()["mt. cucco"][1] > 0,
        Jump3,
        Any(
            Has(TempleRemainsSummer),
            HasSummer,
            All(
                Any(
                    Has(TempleRemainsWinter),
                    HasWinter
                ),
                HasShovel
            ),
            All(
                Any(
                    Has(TempleRemainsSpring),
                    HasSpring
                ),
                CanDestroyFlower
            )
        )
    )
end)
RoosterAdventure:connect_one_way_entrance(TempleRemainsUpperPortal, function()
    return All(
        CanReach(Fireworks),
        GetCuccos()["mt. cucco"][2] > 0,
        Jump3,
        Any(
            HasMagnetGlove,
            Jump6
        )
    )
end, {Fireworks})