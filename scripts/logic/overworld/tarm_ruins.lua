TarmEntrance:connect_one_way_entrance(TarmTreeStump, function()
	return All(
		Any(
			Has(Winter),
			Has(LostWoodsWinter)
		),
		Any(
			Has(Summer),
			Has(LostWoodsSummer),
			All(
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				),
				Any(
					Has(Autumn),
					Has(LostWoodsAutumn)
				),
				Has(MagicBoomerang),
				All(
					Has(Feather),
					Any(
						Has(Hard),
						AccessibilityLevel.SequenceBreak
					)
				)
			)
		)
	)
end)
TarmTreeStump:connect_one_way(Maple, CanMapleTrade)
TarmTreeStump:connect_one_way(GoldenLynelKill, function()
	return Any(
		-- not biggoron?
		Has(WoodSword),
		Has(FoolsOre)
	)
end)
TarmTreeStump:connect_one_way_entrance(LostWoods, function()
	return All(
		CanDestroyMushroom(),
		Has(Autumn)
	)
end)
LostWoods:connect_one_way(Pedestal, function()
	return All(
		CanPedestal(),
		Any(
			All(
				CanBurnTrees(),
				Has(Phonograph)
			),
			All(
				-- know the sequence
				Has(PedestalVanilla),
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
-- special case to get to D6 using default seasons
Pedestal:connect_one_way_entrance(TarmTree, function()
	return All(
		Any(
			CanLostWoods(),
			All(
				CanLostWoods(true),
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		),
		Any(
			All(
				Any(
					Has(Flippers),
					JumpLiquid2()
				),
				Has(Shield)
			),
			All(
				-- know the sequence
				Has(LostWoodsVanilla),
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
LostWoods:connect_one_way_entrance(TarmTree, function()
	return All(
		CanLostWoods(),
		Any(
			All(
				Any(
					Has(Flippers),
					JumpLiquid2()
				),
				Has(Shield)
			),
			All(
				-- know the sequence
				Has(LostWoodsVanilla),
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
-- special case to get to pedestal using default seasons
TarmTree:connect_one_way(Pedestal, function()
	return All(
		Any(
			CanPedestal(),
			All(
				CanPedestal(true),
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		),
		Any(
			All(
				CanBurnTrees(),
				Has(Phonograph)
			),
			All(
				Has(PedestalVanilla),
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
TarmTree:connect_one_way_entrance(LostWoods)
TarmTree:connect_one_way(LostWoodsFindSeason)
TarmTree:connect_one_way(TarmRuinsFindSeason)
TarmTree:connect_one_way(TarmGasha, function()
	return All(
		CanPlantGasha(),
		Has(Shovel)
	)
end)
TarmTree:connect_one_way(TarmMushroomTreeChest, function()
	return All(
		Any(
			Has(Autumn),
			Has(TarmRuinsAutumn)
		),
		CanBurnTrees(),
		CanDestroyMushroom()
	)
end)
TarmTree:connect_one_way_entrance(UpperTarm, function()
	return All(
		Any(
			Has(Winter),
			Has(TarmRuinsWinter)
		),
		Any(
			Has(Shovel),
			CanBurnTrees()
		)
	)
end)
UpperTarm:connect_one_way(Maple, CanMapleTrade)
UpperTarm:connect_one_way_entrance(TarmTree)
UpperTarm:connect_one_way(TarmOldMan, function()
	return All(
		Any(
			Has(Spring),
			Has(TarmRuinsSpring)
		),
		CanDestroyFlower(),
		CanBurnTrees()
	)
end)
UpperTarm:connect_one_way_entrance(AncientRuins, function()
	return All(
		Any(
			Has(Spring),
			Has(TarmRuinsSpring)
		),
		CanDestroyFlower()
	)
end)
AncientRuins:connect_one_way(TarmRuinsFindSeason)
AncientRuins:connect_one_way_entrance(UpperTarm, function()
	return All(
		CanDestroyFlower(),
		Has(TarmRuinsSpring)
	)
end)
AncientRuins:connect_two_ways_entrance(AncientFoyer, function()
	return Any(
		Has(ShuffleDungeonOff),
		Has(D6LeadsToD6)
	)
end)

-- dungeon shuffle
AncientRuins:connect_two_ways_entrance(HerosCaveFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD0)
	)
end)
AncientRuins:connect_one_way_entrance(GnarledFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD1)
	)
end)
AncientRuins:connect_two_ways_entrance(SnakeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD2)
	)
end)
AncientRuins:connect_one_way_entrance(PoisonFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD3)
	)
end)
AncientRuins:connect_one_way_entrance(DancingFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD4)
	)
end)
AncientRuins:connect_one_way_entrance(UnicornFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD5)
	)
end)
AncientRuins:connect_one_way_entrance(CryptFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD7)
	)
end)
AncientRuins:connect_one_way_entrance(MazeFoyer, function()
	return All(
		Has(ShuffleDungeonOn),
		Has(D6LeadsToD8)
	)
end)