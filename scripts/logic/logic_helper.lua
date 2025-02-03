function IsMediumPlus()
	return Has(Medium) or
	Has(Hard)
end

function HasSword()
	return Has(WoodSword) or
	Has(BiggoronSword)
end

function CanDestroyMushroom(includeDimitri)
	if (Has(Bracelet)) then
		return true
	end
	if (Has(MagicBoomerang) or (includeDimitri == true and Dimitri())) then
		if (Has(Casual)) then
			return AccessibilityLevel.SequenceBreak
		end
		return true
	end
	return false
end

function DestroySigns()
	return Has(NobleSword) or
	Has(BiggoronSword) or
	CanUseSeeds() and Has(EmberSeeds) or
	Has(Bracelet) or
	Has(MagicBoomerang)
end

function CanBurnTrees()
	return CanUseSeeds() and Has(EmberSeeds)
end

function CanBombWall()
	return Any(
		Has(Bombs),
		All(
			Has(Bombchus50),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end
function BombPunchWall()
	return Any(
		Ricky(),
		CanBombWall()
	)
end

function AnyFlute()
	return Moosh() or
	Ricky() or
	Dimitri()
end

function Moosh()
	return Has(AnyCompanion) and Has(NatzuIsMoosh)
end
function Ricky()
	return Has(AnyCompanion) and Has(NatzuIsRicky)
end
function Dimitri()
	return Has(AnyCompanion) and Has(NatzuIsDimitri)
end

function HasRod()
	return Has(Winter) or
	Has(Spring) or
	Has(Summer) or
	Has(Autumn)
end

function CanPunch()
	return Has(FistRing) or Has(ExpertsRing)
end

function HasEnoughEssencesForTreehouse()
	local required = Tracker:FindObjectForCode("oldmanessences").CurrentStage
	local n = 0
	for _, e in ipairs(EssenceKeys) do
		if (Has(e)) then
			n = n + 1
		end
	end
	return n >= required
end

function CanBeatOnox()
	return All(
		Has(WoodSword),
		CanArmorKill(),
		Any(
			Has(Bombs),
			Has(Bombchus20)
		),
		Has(Feather),
		Any(
			HasRod(),
			Any(
				Has(Hard),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function CanBeatGanon()
	return All(
		Has(Slingshot),
		Any(
			Has(EmberSeeds),
			Has(MysterySeeds)
		)
	)
end

function CanGoal()
	return All(
		HasEnoughEssencesForGoal(),
		CanBeatOnox(),
		Any(
			Has(OnoxGoal),
			All(
				Has(GanonGoal),
				CanBeatGanon()
			)
		)
	)
end

function HasEnoughEssencesForGoal()
	local required = Tracker:FindObjectForCode("onox_essences").CurrentStage
	local n = 0
	for _, e in ipairs(EssenceKeys) do
		if (Has(e)) then
			n = n + 1
		end
	end
	return n >= required
end

function CanHarvestSeeds(includeDimitri)
	return CanUseSeeds() and (
		CanSwordPunchKill() or
		HasRod() or
		includeDimitri == true and Dimitri()
	)
end

-- show possible spots to plant seeds
function CanPlantGasha()
	-- rules for being able to collect the nut
	if (not CanSwordKill()) then
		return false
	end
	-- rules for how many available spots remain
	local ownedGashas = Tracker:ProviderCountForCode(GashaSeeds)
	local gashasPlanted = GashasPlanted()
	local gashaSetting = Tracker:FindObjectForCode(GashaSetting)
	if (gashaSetting == nil or gashasPlanted >= gashaSetting.CurrentStage) then
		return false
	end
	return ownedGashas > gashasPlanted
end

-- similar to above, but for collection
-- used to mark off mayor spots
function CanHarvestGasha(count)
	-- rules for being able to collect the nut
	if (not CanSwordKill()) then
		return false
	end
	-- rules for how many available spots remain
	-- local ownedGashas = Tracker:ProviderCountForCode(GashaSeeds)
	local gashasRemaining = 0
	for i = 1, 16 do
		local section = Tracker:FindObjectForCode("@Horon Village/Gasha Spots/Gasha Spot #"..i)
		if (section == nil) then
			return false
		end
		gashasRemaining = gashasRemaining + section.AvailableChestCount
	end
	local gashasPlanted = GashasPlanted()
	if (gashasPlanted < tonumber(count)) then
		return false
	end
	local gashaSetting = Tracker:FindObjectForCode(GashaSetting)
	if (gashaSetting == nil or (16 - gashasRemaining) >= gashaSetting.CurrentStage) then
		return false
	end
	return gashasPlanted > (16 - gashasRemaining)
end

function HasPlanted(code)
	local section = Tracker:FindObjectForCode(code)
	if (not CanSwordKill() or section == nil) then
		return false
	end
	---@cast section LocationSection
	return section.ChestCount - section.AvailableChestCount ~= 0
end

function CanSeeGasha(count)
	local gashaSetting = Tracker:FindObjectForCode(GashaSetting)
	return gashaSetting ~= nil and gashaSetting.CurrentStage >= tonumber(count)
end

function OnSectionChanged(section)
	---@cast section LocationSection
	if (GashaIDToLocation[section.FullID]) then
		GashaIDToLocation[section.FullID].cleared = section.AccessibilityLevel == AccessibilityLevel.Cleared
		
		local hiddenGasha = Tracker:FindObjectForCode(HiddenGasha)
		---@cast hiddenGasha JsonItem
		hiddenGasha.Active = not hiddenGasha.Active
	elseif (WildSeeds[section.FullID] and section.AccessibilityLevel == AccessibilityLevel.Cleared) then
		Tracker:FindObjectForCode(WildSeeds[section.FullID]).Active = true
	end
end

function GashasPlanted()
	local n = 0
	for _, loc in pairs(GashaIDToLocation) do
		if (loc.cleared) then
			n = n + 1
		end
	end
	return n
end

function CanWarp()
	return All(
		Any(
			IsMediumPlus(),
			AccessibilityLevel.SequenceBreak
		),
		Any(
			Has(Treewarp),
			All(
				Has(SeedSatchel),
				Has(GaleSeeds)
			)
		)
	)
end

-- INTERACT RULES

function CanUseSeeds()
	return Has(SeedSatchel) or
	Has(Slingshot)
end

function CanShootSeedsCombat()
	return All(
		Has(UpgradedSatchel),
		Has(Slingshot),
		Any(
			Has(EmberSeeds),
			Has(ScentSeeds),
			All(
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				),
				Any(
					Has(MysterySeeds),
					Has(GaleSeeds)
				)
			)
		)
	)
end

function HasContactSeeds()
	return Has(EmberSeeds) or
	Has(ScentSeeds) or
	Has(MysterySeeds)
end

function CanLightTorches()
	return All(
		Any(
			Has(SeedSatchel),
			Has(Slingshot)
		),
		Any(
			Has(EmberSeeds),
			All(
				Has(MysterySeeds),
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end

function CanShootLongTorches()
	return All(
		CanLightTorches(),
		Has(Slingshot)
	)
end

function CanDestroyBush(allowBombchus)
	return Any(
		HasSword(),
		Has(MagicBoomerang),
		Has(Bracelet),
		All(
			Has(Slingshot),
			Has(GaleSeeds)
		),
		All(
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			),
			Any(
				Has(Bombs20),
				allowBombchus == true and Has(Bombchus50),
				All(
					Any(
						Has(SeedSatchel),
						Has(Slingshot)
					),
					Has(EmberSeeds)
				)
			)
		)
	)
end

function CanDestroyBushFlute()
	return Any(
		CanDestroyBush(),
		AnyFlute()
	)
end

function CanDestroyPot()
	return Has(NobleSword) or
	Has(Bracelet) or
	Has(BiggoronSword)
end

function CanDestroyFlower()
	return Any(
		HasSword(),
		Has(MagicBoomerang),
		All(
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			),
			Any(
				Has(Bombs20),
				All(
					CanUseSeeds(),
					Has(EmberSeeds)
				),
				All(
					Has(Slingshot),
					Has(GaleSeeds)
				),
				Has(Bombchus50)
			)
		)
	)
end

function CanDestroyCrystal()
	return Any(
		HasSword(),
		CanBombWall(),
		Has(Bracelet),
		All(
			Has(ExpertsRing),
			Any(
				Has(Hard),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function CanDestroyRespawningBush()
	return Any(
		CanSwordKill(),
		All(
			Has(Bombs),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function CanTriggerLever()
	return Any(
		CanSwordPunchKill(),
		HasRod(),
		Has(Shovel),
		Has(Boomerang),
		All(
			CanUseSeeds(),
			HasContactSeeds()
		),
		All(
			Has(Shovel),
			Any(
				Has(Casual),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function CanHitLeverFromMinecart()
	return CanSwordKill() or
	Has(Boomerang) or
	HasRod() or
	Has(Slingshot) or
	CanUseSeeds() and HasContactSeeds()
end

function CanHitFarSwitch()
	return Any(
		Has(Slingshot),
		Has(Boomerang),
		Has(Bombs),
		All(
			Has(WoodSword),
			Has(EnergyRing)
		)
	)
end

function AreEnoughGoldenBeastsSlain()
	local goldenBeastsSetting = Tracker:FindObjectForCode(GoldenBeastsSetting)
	if (goldenBeastsSetting == nil or goldenBeastsSetting.CurrentStage > Tracker:ProviderCountForCode(GoldenBeasts)) then
		return false
	end
	return true
end

function MaxJump()
	local j = 0
	
	if (Has(Cape) and Has(SeedSatchel) and Has(PegasusSeeds)) then
		j = 5
	elseif Has(Cape) then
		j = 3
	elseif (Has(Feather) and Has(SeedSatchel) and Has(PegasusSeeds)) then
		j = 2
	elseif Has(Feather) then
		j = 1
	end
	
	return j
end

function Jump2()
	return Any(
		MaxJump() >= 2,
		All(
			MaxJump() >= 1,
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function Jump3()
	return Any(
		MaxJump() >= 3,
		All(
			MaxJump() >= 2,
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function Jump4()
	return Any(
		MaxJump() >= 4,
		All(
			MaxJump() >= 3,
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function Jump5()
	return MaxJump() >= 5
end

function Jump6()
	return All(
		MaxJump() >= 5,
		Any(
			IsMediumPlus(),
			AccessibilityLevel.SequenceBreak
		)
	)
end

function JumpLiquid2()
	return Any(
		MaxJump() >= 2,
		All(
			MaxJump() >= 1,
			Has(Bombs),
			Any(
				Has(Hard),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function JumpLiquid3()
	return Any(
		MaxJump() >= 3,
		All(
			MaxJump() >= 2,
			Has(Bombs),
			Any(
				Has(Hard),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function JumpLiquid4()
	return Any(
		MaxJump() >= 4,
		All(
			MaxJump() >= 3,
			Has(Bombs),
			Any(
				Has(Hard),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function JumpLiquid5()
	return MaxJump() >= 5
end

-- KILL RULES

function CanSwordKill()
	return Has(WoodSword) or
	Has(FoolsOre) or
	Has(BiggoronSword)
end

function CanSwordPunchKill()
	return CanPunch() or
	CanSwordKill()
end

function CanGaleKill()
	return Any(
		All(
			Has(UpgradedSatchel),
			Has(Slingshot),
			Has(GaleSeeds)
		),
		All(
			Has(SeedSatchel),
			Has(GaleSeeds),
			Any(
				All(
					Has(Feather),
					Any(
						IsMediumPlus(),
						AccessibilityLevel.SequenceBreak
					)
				),
				Any(
					Has(Hard),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end

function CanKillWithPit()
	return Has(Shield) or HasRod()
end

function CanNormalKill(pitAvailable, allowGale, allowCane)
	if (allowGale == nil) then
		allowGale = true
	end
	if (allowCane == nil) then
		allowCane = true
	end
	return Any(
		pitAvailable == true and CanKillWithPit(),
		CanSwordPunchKill(),
		CanNormalSatchelKill(allowGale),
		CanNormalSlingshotKill(allowGale),
		All(
			Any(
				Has(Bombs40),
				Has(Bombchus20)
			),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		),
		All(
			allowCane and Has(CaneOfSomaria),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function CanNormalSatchelKill(allowGale)
	if (allowGale == nil) then
		allowGale = true
	end
	return All(
		Has(UpgradedSatchel),
		Any(
			Has(EmberSeeds),
			All(
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				),
				Any(
					Has(ScentSeeds),
					Has(MysterySeeds),
					All(
						allowGale,
						Has(Feather),
						Has(GaleSeeds)
					)
				)
			),
			All(
				allowGale,
				Any(
					Has(Hard),
					AccessibilityLevel.SequenceBreak
				),
				Has(GaleSeeds)
			)
		)
	)
end

function CanNormalSlingshotKill(allowGale)
	if (allowGale == nil) then
		allowGale = true
	end
	return All(
		Has(UpgradedSatchel),
		All(
			Has(Slingshot),
			Any(
				Has(EmberSeeds),
				Has(ScentSeeds),
				All(
					allowGale,
					Any(
						IsMediumPlus(),
						AccessibilityLevel.SequenceBreak
					),
					Has(MysterySeeds),
					Has(GaleSeeds)
				)
			)
		)
	)
end

function CanArmorKill()
	return Any(
		CanSwordPunchKill(),
		All(
			Has(UpgradedSatchel),
			Has(ScentSeeds),
			Any(
				Has(Slingshot),
				Any(
					IsMediumPlus(),
					AccessibilityLevel.SequenceBreak
				)
			)
		),
		All(
			Has(CaneOfSomaria),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function CanKillKeese()
	return Any(
		CanNormalKill(),
		Has(Boomerang)
	)
end

function CanKillStalfos()
	return Any(
		CanNormalKill(),
		All(
			HasRod(),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function CanFlipBeetle()
	return Any(
		Has(Shield),
		All(
			Has(Shovel),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end
function CanKillSpinyBeetle()
	return Any(
		CanGaleKill(),
		All(
			CanFlipBeetle(),
			Any(
				CanSwordKill(),
				CanNormalSatchelKill(),
				CanNormalSlingshotKill()
			)
		)
	)
end

function CanFarmRupees()
	return Has(Shovel) or HasSword()
end

function HasRupees(count)
	if (not CanFarmRupees()) then
		return false
	end

	local rupees = Tracker:FindObjectForCode(RupeeCount).AcquiredCount
	local bonusRupees = 0
	local oolRupees = 0

	-- rupee rooms
	local snakeRupees = CanReach(SnakeRupeeRoom)
	local snakeRupeeAmount = 150
	if (snakeRupees == AccessibilityLevel.SequenceBreak or (snakeRupees == AccessibilityLevel.Normal and not IsMediumPlus())) then
		oolRupees = oolRupees + snakeRupeeAmount
	elseif (snakeRupees == AccessibilityLevel.Normal) then
		bonusRupees = bonusRupees + snakeRupeeAmount
	end

	local ancientRupees = CanReach(AncientRupeeRoom)
	local ancientRupeeAmount = 90
	if (ancientRupees == AccessibilityLevel.SequenceBreak or (ancientRupees == AccessibilityLevel.Normal and not IsMediumPlus())) then
		oolRupees = oolRupees + ancientRupeeAmount
	elseif (ancientRupees == AccessibilityLevel.Normal) then
		bonusRupees = bonusRupees + ancientRupeeAmount
	end

	return Any(
		-- already have the right amount of rupees
		rupees >= count,
		-- shovel is infinite farm, and expected in hard
		All(
			Has(Shovel),
			Any(
				Has(Hard),
				AccessibilityLevel.SequenceBreak
			)
		),
		-- D2 and D6 rupee rooms are medium+ only
		All(
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			),
			rupees + bonusRupees >= count
		),
		All(
			AccessibilityLevel.SequenceBreak,
			rupees + bonusRupees + oolRupees >= count
		)
	)
end

function CanFarmOreChunks()
	return Any(
		Has(Shovel),
		All(
			CanReach(SubrosiaMountainEast),
			Any(
				Has(Hard),
				AccessibilityLevel.SequenceBreak
			)
		),
		All(
			Any(
				HasSword(),
				Has(Bracelet),
				Has(MagicBoomerang)
			),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function HasOreChunks(count)
	if (Has(ShuffleGoldOresVanilla)) then
		return CanFarmOreChunks()
	end
	if (CanFarmOreChunks() < AccessibilityLevel.SequenceBreak) then
		return false
	end

	local oreChunks = Tracker:FindObjectForCode(OreChunkCount).AcquiredCount
	
	return Any(
		oreChunks >= count,
		All(
			CanFarmOreChunks(),
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanFarmMaple()
	return CanNormalKill(false, false)
end

function CanEnterTarm()
	local required = Tracker:FindObjectForCode("jewelreq").CurrentStage
	local n = 0
	for _, j in ipairs(JewelKeys) do
		if (Has(j)) then
			n = n + 1
		end
	end
	return n >= required
end

local indexToSeason = {
	[0] = Spring,
	[1] = Summer,
	[2] = Autumn,
	[3] = Winter,
	[4] = UnknownSeason
}
function CanLostWoods()
	if (Has(LostWoodsVanilla)) then
		return All(
			Has(Spring),
			Has(Summer),
			Has(Autumn),
			Has(Winter)
		)
	end
	for i=1, 4 do
		local season = indexToSeason[Tracker:FindObjectForCode("lost_woods_"..i).CurrentStage]
		if (season == UnknownSeason or not Has(season)) then
			return false
		end
	end
	return true
end
function CanPedestal()
	if (Has(PedestalVanilla)) then
		return All(
			Has(Spring),
			Has(Summer),
			Has(Autumn),
			Has(Winter)
		)
	end
	for i=1, 4 do
		local season = indexToSeason[Tracker:FindObjectForCode("pedestal_"..i).CurrentStage]
		if (season == UnknownSeason or not Has(season)) then
			return false
		end
	end
	return true
end

function D1KeyCount(count)
	return Tracker:ProviderCountForCode(D1SmallKey) >= count or Has(D1MasterKey)
end

function D2KeyCount(count)
	return Tracker:ProviderCountForCode(D2SmallKey) >= count or Has(D2MasterKey)
end

function D3KeyCount(count)
	return Tracker:ProviderCountForCode(D3SmallKey) >= count or Has(D3MasterKey)
end

function D4KeyCount(count)
	return Tracker:ProviderCountForCode(D4SmallKey) >= count or Has(D4MasterKey)
end

function D5KeyCount(count)
	return Tracker:ProviderCountForCode(D5SmallKey) >= count or Has(D5MasterKey)
end

function D6KeyCount(count)
	return Tracker:ProviderCountForCode(D6SmallKey) >= count or Has(D6MasterKey)
end

function D7KeyCount(count)
	return Tracker:ProviderCountForCode(D7SmallKey) >= count or Has(D7MasterKey)
end

function D8KeyCount(count)
	return Tracker:ProviderCountForCode(D8SmallKey) >= count or Has(D8MasterKey)
end

function dungeon_settings()
	if (not LOADED) then
		return
	end
	local dungeon_list = {"d0","d1","d2","d3","d4","d5","d6","d7","d8"}
	if Tracker:FindObjectForCode("dungeonshuffle").CurrentStage == 0 then
		for index, dungeon in pairs(dungeon_list) do
			Tracker:FindObjectForCode(dungeon.."_ent_selector").CurrentStage = index
		end
	else
		for index, dungeon in pairs(dungeon_list) do
			Tracker:FindObjectForCode(dungeon.."_ent_selector").CurrentStage = 0
		end
	end
end

function display_dungeons()
	if Tracker:FindObjectForCode("dungeonshuffle").CurrentStage == 1 then
		if Tracker:FindObjectForCode("fill_dungeons").CurrentStage == 1 then
			Tracker:FindObjectForCode("d0_ent_selector").CurrentStage = Tracker:FindObjectForCode("d0_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d1_ent_selector").CurrentStage = Tracker:FindObjectForCode("d1_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d2_ent_selector").CurrentStage = Tracker:FindObjectForCode("d2_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d3_ent_selector").CurrentStage = Tracker:FindObjectForCode("d3_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d4_ent_selector").CurrentStage = Tracker:FindObjectForCode("d4_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d5_ent_selector").CurrentStage = Tracker:FindObjectForCode("d5_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d6_ent_selector").CurrentStage = Tracker:FindObjectForCode("d6_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d7_ent_selector").CurrentStage = Tracker:FindObjectForCode("d7_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d8_ent_selector").CurrentStage = Tracker:FindObjectForCode("d8_ent_selector_hidden").CurrentStage
		end
	end
end

function seasons_settings()
	if (not LOADED) then
		return
	end
	local region_list = {"north_horon", "suburbs", "wow", "plain", "swamp", "sunken", "lost_woods", "tarm_ruins", "coast", "remains"}
	if Tracker:FindObjectForCode("default_seasons").CurrentStage == 0 then
		Tracker:FindObjectForCode("north_horon_season").CurrentStage = 3
		Tracker:FindObjectForCode("suburbs_season").CurrentStage = 2
		Tracker:FindObjectForCode("wow_season").CurrentStage = 1
		Tracker:FindObjectForCode("plain_season").CurrentStage = 0
		Tracker:FindObjectForCode("swamp_season").CurrentStage = 2
		Tracker:FindObjectForCode("sunken_season").CurrentStage = 1
		Tracker:FindObjectForCode("lost_woods_season").CurrentStage = 2
		Tracker:FindObjectForCode("tarm_ruins_season").CurrentStage = 0
		Tracker:FindObjectForCode("coast_season").CurrentStage = 3
		Tracker:FindObjectForCode("remains_season").CurrentStage = 3
		Tracker:FindObjectForCode("horon_village_season").CurrentStage = 4
	end
	if Tracker:FindObjectForCode("default_seasons").CurrentStage == 1 then
		for _, region in pairs(region_list) do
			Tracker:FindObjectForCode(region.."_season").CurrentStage = 4
			Tracker:FindObjectForCode("horon_village_season").CurrentStage = 4
		end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 2 then
		for _, region in pairs(region_list) do
			Tracker:FindObjectForCode(region.."_season").CurrentStage = 4
			Tracker:FindObjectForCode("horon_village_season").CurrentStage = 4
		end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 3 then
		for _, region in pairs(region_list) do
			Tracker:FindObjectForCode(region.."_season").CurrentStage = 0
			if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
				Tracker:FindObjectForCode("horon_village_season").CurrentStage = 0
			end
		end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 4 then
		for _, region in pairs(region_list) do
			Tracker:FindObjectForCode(region.."_season").CurrentStage = 1
			if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
				Tracker:FindObjectForCode("horon_village_season").CurrentStage = 1
			end
		end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 5 then
		for _, region in pairs(region_list) do
			Tracker:FindObjectForCode(region.."_season").CurrentStage = 2
			if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
				Tracker:FindObjectForCode("horon_village_season").CurrentStage = 2
			end
		end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 6 then
		for _, region in pairs(region_list) do
			Tracker:FindObjectForCode(region.."_season").CurrentStage = 3
			if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
				Tracker:FindObjectForCode("horon_village_season").CurrentStage = 3
			end
		end
	end
end

function display_seasons()
	if Tracker:FindObjectForCode("default_seasons").CurrentStage == 1 or Tracker:FindObjectForCode("default_seasons").CurrentStage == 2 then
		if Tracker:FindObjectForCode("fill_seasons").CurrentStage == 1 then
			Tracker:FindObjectForCode("north_horon_season").CurrentStage = Tracker:FindObjectForCode("north_horon_season_hidden").CurrentStage
			Tracker:FindObjectForCode("horon_village_season").CurrentStage = Tracker:FindObjectForCode("horon_village_season_hidden").CurrentStage
			Tracker:FindObjectForCode("suburbs_season").CurrentStage = Tracker:FindObjectForCode("suburbs_season_hidden").CurrentStage
			Tracker:FindObjectForCode("wow_season").CurrentStage = Tracker:FindObjectForCode("wow_season_hidden").CurrentStage
			Tracker:FindObjectForCode("plain_season").CurrentStage = Tracker:FindObjectForCode("plain_season_hidden").CurrentStage
			Tracker:FindObjectForCode("swamp_season").CurrentStage = Tracker:FindObjectForCode("swamp_season_hidden").CurrentStage
			Tracker:FindObjectForCode("sunken_season").CurrentStage = Tracker:FindObjectForCode("sunken_season_hidden").CurrentStage
			Tracker:FindObjectForCode("lost_woods_season").CurrentStage = Tracker:FindObjectForCode("lost_woods_season_hidden").CurrentStage
			Tracker:FindObjectForCode("tarm_ruins_season").CurrentStage = Tracker:FindObjectForCode("tarm_ruins_season_hidden").CurrentStage
			Tracker:FindObjectForCode("coast_season").CurrentStage = Tracker:FindObjectForCode("coast_season_hidden").CurrentStage
			Tracker:FindObjectForCode("remains_season").CurrentStage = Tracker:FindObjectForCode("remains_season_hidden").CurrentStage
		end
	end
end

function vanilla_portals()
	if (not LOADED) then
		return
	end
	local hol_portals = {"suburbs","swamp","lake","mtcucco","horon","remains","upremains"}
	local sub_portals = {"mountain","market","furnace","village","pirates","volcano","d8"}
	if Tracker:FindObjectForCode("portalshuffle").CurrentStage == 0 then
		for index, portal in pairs(hol_portals) do
			Tracker:FindObjectForCode(portal.."_portal_selector").CurrentStage = index
		end
		for index, portal in pairs(sub_portals) do
			Tracker:FindObjectForCode(portal.."_portal_selector").CurrentStage = index+6
		end
	else
		for _, portal in pairs(hol_portals) do
			Tracker:FindObjectForCode(portal.."_portal_selector").CurrentStage = 0
		end
		for _, portal in pairs(sub_portals) do
			Tracker:FindObjectForCode(portal.."_portal_selector").CurrentStage = 6
		end
	end
end

function display_portals()
	if Tracker:FindObjectForCode("fill_portals").CurrentStage == 1 then
		if Tracker:FindObjectForCode("portalshuffle").CurrentStage == 1 or Tracker:FindObjectForCode("portalshuffle").CurrentStage == 2 then
			local portal_list = {"suburbs","swamp","lake","mtcucco","horon","remains","upremains","mountain","market","furnace","village","pirates","volcano","d8"}
			for _, portal in pairs(portal_list) do
				Tracker:FindObjectForCode(portal.."_portal_selector").CurrentStage = Tracker:FindObjectForCode(portal.."_portal_selector_hidden").CurrentStage
			end
		end
	end
end

function display_lost_woods()
	if (not LOADED) then
		return
	end
	if (Has(LostWoodsVanilla)) then
		for i=1, 4 do
			Tracker:FindObjectForCode("lost_woods_"..i).CurrentStage = LostWoodsDefault[i]
			if (i < 4) then
				Tracker:FindObjectForCode("lost_woods_d_"..i).CurrentStage = i - 1
			end
		end
	else
		for i=1, 4 do
			Tracker:FindObjectForCode("lost_woods_"..i).CurrentStage = 4
			if (i < 4) then
				Tracker:FindObjectForCode("lost_woods_d_"..i).CurrentStage = 4
			end
		end
	end
end
function display_pedestal()
	if (not LOADED) then
		return
	end
	if (Has(PedestalVanilla)) then
		for i=1, 4 do
			Tracker:FindObjectForCode("pedestal_"..i).CurrentStage = LostWoodsDefault[i]
			if (i < 4) then
				Tracker:FindObjectForCode("pedestal_d_"..i).CurrentStage = 0
			end
		end
	else
		for i=1, 4 do
			Tracker:FindObjectForCode("pedestal_"..i).CurrentStage = 4
			if (i < 4) then
				Tracker:FindObjectForCode("pedestal_d_"..i).CurrentStage = 4
			end
		end
	end
end

function OnCollectEmbers()
	local seeds = Tracker:FindObjectForCode(EmberSeeds)
	if (seeds == nil) then
		return
	end
	for _, loc in pairs(WildSeedLocationMapping[EmberSeeds]) do
		local wildSection = Tracker:FindObjectForCode(loc)
		---@cast wildSection LocationSection
		if (seeds.Active) then
			wildSection.AvailableChestCount = wildSection.AvailableChestCount - 1
		else
			wildSection.AvailableChestCount = wildSection.AvailableChestCount + 1
		end
	end
end
function OnCollectMysteries()
	local seeds = Tracker:FindObjectForCode(MysterySeeds)
	if (seeds == nil) then
		return
	end
	for _, loc in pairs(WildSeedLocationMapping[MysterySeeds]) do
		local wildSection = Tracker:FindObjectForCode(loc)
		---@cast wildSection LocationSection
		if (seeds.Active) then
			wildSection.AvailableChestCount = wildSection.AvailableChestCount - 1
		else
			wildSection.AvailableChestCount = wildSection.AvailableChestCount + 1
		end
	end
end

function OnFrameHandler()
	ScriptHost:RemoveOnFrameHandler("load handler")
	LOADED = true
end

ScriptHost:AddWatchForCode("dungeon settings handler", "dungeonshuffle", dungeon_settings)
ScriptHost:AddWatchForCode("dungeons handler", "fill_dungeons", display_dungeons)
ScriptHost:AddWatchForCode("seasons settings handler", "default_seasons", seasons_settings)
ScriptHost:AddWatchForCode("seasons handler", "fill_seasons", display_seasons)
ScriptHost:AddWatchForCode("portal settings handler", "portalshuffle", vanilla_portals)
ScriptHost:AddWatchForCode("portal handler", "fill_portals", display_portals)
ScriptHost:AddWatchForCode("lost woods handler", "shuffle_lost_woods", display_lost_woods)
ScriptHost:AddWatchForCode("pedestal handler", "shuffle_pedestal", display_pedestal)
ScriptHost:AddWatchForCode("wild ember handler", EmberSeeds, OnCollectEmbers)
ScriptHost:AddWatchForCode("wild mystery handler", MysterySeeds, OnCollectMysteries)
ScriptHost:AddOnLocationSectionChangedHandler("section changed handler", OnSectionChanged)
ScriptHost:AddOnFrameHandler("load handler", OnFrameHandler)
-- "See the Season" locations
for i = 1, 11 do
	ScriptHost:AddWatchForCode(SeeSeasonVars[i][1], SeeSeasonVars[i][2], function()
		local season = Tracker:FindObjectForCode(SeeSeasonVars[i][2])
		---@cast season JsonItem
		local location = Tracker:FindObjectForCode(SeeSeasonVars[i][3])
		---@cast location LocationSection
		if (season.CurrentStage == 4) then
			location.AvailableChestCount = 1
		else
			location.AvailableChestCount = 0
		end
	end)
end