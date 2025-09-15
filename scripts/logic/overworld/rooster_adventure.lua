DragonKeyhole:connect_one_way_entrance(RoosterAdventure, function()
    return All(
        GaleSeeds,
        Satchel,
        Any(
            SpringBanana,
            Shovel
        ),
        HellLogic
    )
end)
RoosterAdventure:connect_one_way_entrance(LowerMtCucco, function() return GetCuccos()["mt. cucco"][1] ~= -1 end)
RoosterAdventure:connect_one_way_entrance(MoblinKeep, function()
    return Any(
        All(
            GetCuccos()["sunken"][2] > 0,
            NatzuIsRicky
        ),
        All(
            GetCuccos()["horon"][2] > 0,
            Any(
                AnyCompanion,
                All(
                    NatzuIsMoosh,
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
            SunkenCityWinter,
            All(
                Winter,
                Any(
                    Flippers,
                    Dimitri,
                    Bombs -- save Dimitri
                )
            )
        )
    )
end)
RoosterAdventure:connect_one_way_entrance(Syrup, function()
    return All(
        GetCuccos()["sunken"][3] > 0,
        Mushroom
    )
end)

RoosterAdventure:connect_one_way_entrance(LowerEasternSuburbs, function() return GetCuccos()["suburbs"][1] >= 0 end)
RoosterAdventure:connect_one_way_entrance(SuburbsSpringCave, function()
    return All(
        GetCuccos()["suburbs"][3] > 0,
        Any(
            EasternSuburbsSpring,
            Spring
        ),
        Any(
            MagnetGlove,
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
        CanReach(Pirates),
        PolishedBell,
        WesternCoastSummer
    )
end, {Pirates})
RoosterAdventure:connect_one_way_entrance(NorthSpoolSwamp, function() return GetCuccos()["swamp"][1] >= 0 end)
RoosterAdventure:connect_one_way_entrance(SpoolWinterCave, function()
    return Any(
        All(
            GetCuccos()["horon"][1] > 0,
            Any(
                Flippers,
                Dimitri
            )
        ),
        All(
            GetCuccos()["swamp"][1] > 0,
            FloodgateKey,
            Any(
                SpoolSwampSummer,
                SpoolSwampAutumn,
                SpoolSwampWinter,
                Summer,
                Autumn,
                Winter
            )
        )
    )
end)
RoosterAdventure:connect_one_way_entrance(TarmLostWoodsScrub, function()
    return All(
        GetCuccos()["swamp"][2] > 0,
        CanEnterTarm(),
        Any(
            CanReach(TarmTreeStump),
            LostWoodsSummer,
            Summer
        )
    )
end, {TarmTreeStump})
RoosterAdventure:connect_one_way_entrance(TempleRemainsStump, function()
    return All(
        GetCuccos()["mt. cucco"][1] > 0,
        Jump3,
        Any(
            TempleRemainsSummer,
            Summer,
            All(
                Any(
                    TempleRemainsWinter,
                    Winter
                ),
                Shovel
            ),
            All(
                Any(
                    TempleRemainsSpring,
                    Spring
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
            MagnetGlove,
            Jump6
        )
    )
end, {Fireworks})