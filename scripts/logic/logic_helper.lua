EssenceKeys = {D1Essence, D2Essence, D3Essence, D4Essence, D5Essence, D6Essence, D7Essence, D8Essence}
GashaIDToLocation = {
	["Horon Village/Horon Village Gasha Spot/Near Mayor"] = HoronGasha,
	["North Horon/North Horon Gasha Spot/Near Impa"] = NorthHoronGasha,
	["North Horon/Eyeglass Lake Gasha Spot/Near D5"] = EyeglassGasha,
	["Western Coast/Western Coast Gasha Spot/Near Graveyard"] = WesternCoastGasha,
	["Eastern Suburbs/Eastern Suburbs Gasha Spot/Under Bushes"] = SuburbsGasha,
	["Holodrum Plain/Holodrum Plain Island Gasha Spot/Under Bushes"] = HolodrumPlainIsland,
	["Holodrum Plain/Lower Holodrum Plain Gasha Spot/Dig It Up"] = SouthHolodrumPlainGasha,
	["Holodrum Plain/Onox Gasha Spot/Dig It Up"] = OnoxGasha,
	["Spool Swamp/Spool Swamp North Gasha Spot/Near Keyhole"] = SwampNorthGashaSpot,
	["Spool Swamp/Spool Swamp South Gasha Spot/Near Portal"] = SwampSouthGashaSpot,
	["Sunken City/Sunken City Gasha Spot/Near Master Diver"] = SunkenGashaSpot,
	["Mount Cucco/Mount Cucco Gasha Spot/Behind Mushrooms"] = MtCuccoGasha,
	["Goron Mountain/Goron Mountain West Gasha Spot/Dig It Up"] = GoronGashaWest,
	["Goron Mountain/Goron Mountain East Gasha Spot/Under Rocks"] = GoronGashaEast,
	["Samasa Desert/Samasa Desert Gasha Spot/Surrounded by Cacti"] = SamasaDesertGasha,
	["Tarm Ruins/Tarm Ruins Gasha Spot/Dig It Up"] = TarmGasha
}
JewelKeys = {RoundJewel, SquareJewel, PyramidJewel, XJewel}

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

function BombPunchWall()
	return Ricky() or Has(Bombs)
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
		),
		AccessibilityLevel.Inspect
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
		Has(Bombs),
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
		local total = section.ChestCount
		local uncollected = section.AvailableChestCount
		gashasRemaining = total - uncollected
	end
	local gashasPlanted = GashasPlanted()
	if (gashasPlanted < tonumber(count)) then
		return false
	end
	local gashaSetting = Tracker:FindObjectForCode(GashaSetting)
	if (gashaSetting == nil or gashasPlanted >= gashaSetting.CurrentStage) then
		return false
	end
	return gashasPlanted > gashasRemaining
end

function CanSeeGasha(count)
	local gashaSetting = Tracker:FindObjectForCode(GashaSetting)
	return gashaSetting ~= nil and gashaSetting.CurrentStage >= tonumber(count)
end

function OnSectionChanged(section)
	---@cast section LocationSection
	if (GashaIDToLocation[section.FullID]) then
		if (section.AccessibilityLevel == AccessibilityLevel.Cleared) then
			GashaIDToLocation[section.FullID].cleared = true
		else
			GashaIDToLocation[section.FullID].cleared = false
		end
	end
	
	local hiddenGasha = Tracker:FindObjectForCode(HiddenGasha)
	---@cast hiddenGasha JsonItem
	hiddenGasha.Active = not hiddenGasha.Active
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

function harvest_cucco_tree()
	return HasSword() or
	(
		Has(FoolsOre) and (
			CanDestroyFlower() or
			CanWarp() and (Has(SpringBanana) or Has(Hard))
		)
	)
end

function CanWarp()
	return Has(Treewarp) or
	Has(SeedSatchel) and Has(GaleSeeds)
end

-- INTERACT RULES

function CanUseSeeds()
	return Has(SeedSatchel) or
	Has(Slingshot)
end

function use_seeds_combat()
	return Has(UpgradedSatchel) or
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

function CanDestroyBush()
	return Any(
		HasSword(),
		Has(MagicBoomerang),
		Has(Bracelet),
		All(
			Has(Slingshot),
			Has(GaleSeeds)
		),
		Has(Bombs),
		All(
			Any(
				Has(SeedSatchel),
				Has(Slingshot)
			),
			Has(EmberSeeds),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
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
		Has(MagicBoomerang)
	)
end

function CanDestroyCrystal()
	return HasSword() or
	Has(Bracelet) or
	Has(ExpertsRing)
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
	if (
		CanSwordPunchKill() or
		HasRod() or
		Has(Shovel) or
		Has(Boomerang) or
		CanUseSeeds() and HasContactSeeds()
	) then
		return true
	end
	if (Has(Shovel)) then
		if (Has(Casual)) then
			return AccessibilityLevel.SequenceBreak
		end
		return true
	end
	return false
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

function CanOpenOldManDoor()
	return CanUseSeeds() and Has(EmberSeeds)
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
	if (MaxJump() >= 2) then
		return true
	end
	if (MaxJump() >= 1) then
		if (Has(Casual)) then
			return AccessibilityLevel.SequenceBreak
		end
		return true
	end
	return false
end

function Jump3()
	if (MaxJump() >= 3) then
		return true
	end
	if (MaxJump() >= 2) then
		if (Has(Casual)) then
			return AccessibilityLevel.SequenceBreak
		end
		return true
	end
	return false
end

function Jump4()
	if (MaxJump() >= 4) then
		return true
	end
	if (MaxJump() >= 3) then
		if (Has(Casual)) then
			return AccessibilityLevel.SequenceBreak
		end
		return true
	end
	return false
end

function Jump5()
	return MaxJump() >= 5
end

function Jump6()
	if (MaxJump() < 5) then
		return false
	end
	if (Has(Casual)) then
		return AccessibilityLevel.SequenceBreak
	end
	return true
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

function CanNormalKill(pitAvailable)
	return Any(
		pitAvailable ~= nil and pitAvailable and CanKillWithPit(),
		CanSwordPunchKill(),
		CanNormalSatchelKill(),
		CanNormalSlingshotKill(),
		CanGaleKill(),
		All(
			Has(Bombs),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function CanNormalSatchelKill()
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
						Has(Feather),
						Has(GaleSeeds)
					)
				)
			),
			All(
				Any(
					Has(Hard),
					AccessibilityLevel.SequenceBreak
				),
				Has(GaleSeeds)
			)
		)
	)
end

function CanNormalSlingshotKill()
	return All(
		Has(UpgradedSatchel),
		All(
			Has(Slingshot),
			Any(
				Has(EmberSeeds),
				Has(ScentSeeds),
				Any(
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
				CanSwordKill(), -- no punch?
				CanNormalSatchelKill(),
				CanNormalSlingshotKill()
			)
		)
	)
end

function CanKillWizzrobe()
	local minAccess = CanNormalKill()
	if (Has(Bombs40)) then
		if (IsMediumPlus()) then
			return true
		end
		if (minAccess == 0 or minAccess == false) then
			minAccess = AccessibilityLevel.SequenceBreak
		end
	end
	return minAccess
end

-- HORON VILLAGE
function CanFarmRupees(accessOnly)
	if (Has(Shovel) or HasSword()) then
		return true
	end
	if (accessOnly == true) then
		return false
	end
	return AccessibilityLevel.Inspect
end

function CanFarmMaple()
	return Any(
		CanSwordPunchKill(),
		All(
			Has(Bombs),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		),
		All(
			CanShootSeedsCombat(),
			HasContactSeeds()
		),
		Has(Bracelet),
		-- Has(Boomerang),
		AnyFlute(),
		All(
			Has(UpgradedSatchel),
			HasContactSeeds(),
			Any(
				IsMediumPlus(),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
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
	[4] = "unknown"
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
		if (season == "unknown" or not Has(season)) then
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
		if (season == "unknown" or not Has(season)) then
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

-- function d1clear()
-- 	return (Has("small_keysanity_off") or (Has("small_keysanity_on") and (ClearD1Keys() or Has("d1_master_key")))) and 
-- 	(Has("boss_keysanity_off") or (Has("boss_keysanity_on") and (Has("d1bk") or (Has("d1_master_key") and Has("master_keys_both")))))
-- 	and CanUseSeeds() and Has(EmberSeeds) and 
-- 	Has("bombs") and kill_goriyabros() and CanArmorKill()
-- end

-- function d2clear()
-- 	return ((Has("small_keysanity_off") or (Has("small_keysanity_on") and (ClearD2Keys() or Has("d2_master_key")))) and (Has("boss_keysanity_off") or (Has("boss_keysanity_on") and (Has("d2bk") or (Has("d2_master_key") and Has("master_keys_both"))))))  
-- 	and CanUseSeeds() and Has(EmberSeeds) and 
-- 	Has("bracelet") and Has("bombs")
-- end

-- function d3clear()
-- 	return ((Has("small_keysanity_off") or (Has("small_keysanity_on") and (ClearD3Keys() or Has("d3_master_key")))) and (Has("boss_keysanity_off") or (Has("boss_keysanity_on") and (Has("d3bk") or (Has("d3_master_key") and Has("master_keys_both"))))))  
-- 	and CanKillSpinyBeetle() and MaxJump() >= 1 and 
-- 	Has("bombs") and Has("bracelet") and 
-- 	kill_omuai() and kill_mothula()
-- end

-- function d4clear()
-- 	return ((Has("small_keysanity_off") or (Has("small_keysanity_on") and (ClearD4Keys() or Has("d4_master_key")))) and (Has("boss_keysanity_off") or (Has("boss_keysanity_on") and (Has("d4bk") or (Has("d4_master_key") and Has("master_keys_both"))))))  
-- 	and Has("flippers") and Has("bracelet") and 
-- 	Has("bombs") and MaxJump() >= 1 and 
-- 	Has(Slingshot) and Has(EmberSeeds) and 
-- 	kill_agunima() and kill_gohma()
-- end

-- function d5clear()
-- 	return ((Has("small_keysanity_off") or (Has("small_keysanity_on") and (ClearD5Keys() or Has("d5_master_key")))) and (Has("boss_keysanity_off") or (Has("boss_keysanity_on") and (Has("d5bk") or (Has("d5_master_key") and Has("master_keys_both"))))))  
-- 	and Has("magnet") and kill_syger() and 
-- 	MaxJump() >= 1 and (MaxJump() >= 4 or Has("flippers"))
-- end

-- function d6clear()
-- 	return ((Has("small_keysanity_off") or (Has("small_keysanity_on") and (ClearD6Keys() or Has("d6_master_key")))) and (Has("boss_keysanity_off") or (Has("boss_keysanity_on") and (Has("d6bk") or (Has("d6_master_key") and Has("master_keys_both"))))))  
-- 	and Has("magnet") and MaxJump() >= 1 and
-- 	Has("bombs") and Has("magicboomerang") and
-- 	Has(Slingshot) and Has(EmberSeeds) and destroy_crystal() and
-- 	CanSwordPunchKill() and kill_manhandla()
-- end

-- function CanClearD7()
-- 	return ((Has("small_keysanity_off") or (Has("small_keysanity_on") and (ClearD7Keys() or Has("d7_master_key")))) and (Has("boss_keysanity_off") or (Has("boss_keysanity_on") and (Has("d7bk") or (Has("d7_master_key") and Has("master_keys_both"))))))  
-- 	and Jump4() and Has("bombs") and Has("bracelet") and
-- 	Has("satchel1") and Has("pegasusseeds") and
-- 	Has(Slingshot) and Has(EmberSeeds) and Has("magnet") and
-- 	Has("flippers") and kill_magunesu() and
-- 	kill_poe() and kill_gleeok()
-- end

-- function d8clear()
-- 	return ((Has("small_keysanity_off") or (Has("small_keysanity_on") and (ClearD8Keys() or Has("d8_master_key")))) and (Has("boss_keysanity_off") or (Has("boss_keysanity_on") and (Has("d8bk") or (Has("d8_master_key") and Has("master_keys_both"))))))  
-- 	and Has("slingshot2") and MaxJump() >= 3 and
-- 	Has("magnet") and Has("bombs") and
-- 	Has(EmberSeeds) and Has("bracelet") and kill_magunesu() and
-- 	(Has("magicboomerang") or MaxJump() >= 4) and kill_polsvoice_pit() and 
-- 	torches_d8() and kill_medusahead() 
-- end

function checkRequirements(reference, check_count)
	local reqCount = Tracker:ProviderCountForCode(reference)
	local count = Tracker:ProviderCountForCode(check_count)
  
	if count >= reqCount then
		return true
	else
		return false
	end
end

function dungeon_settings()
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
	local region_list = {"north_horon", "suburbs", "wow", "plain", "swamp", "sunken", "tarm_ruins", "coast", "remains"}
	if Tracker:FindObjectForCode("default_seasons").CurrentStage == 0 then
		Tracker:FindObjectForCode("north_horon_season").CurrentStage = 3
		Tracker:FindObjectForCode("suburbs_season").CurrentStage = 2
		Tracker:FindObjectForCode("wow_season").CurrentStage = 1
		Tracker:FindObjectForCode("plain_season").CurrentStage = 0
		Tracker:FindObjectForCode("swamp_season").CurrentStage = 2
		Tracker:FindObjectForCode("sunken_season").CurrentStage = 1
		Tracker:FindObjectForCode("tarm_ruins_season").CurrentStage = 2
		Tracker:FindObjectForCode("coast_season").CurrentStage = 3
		Tracker:FindObjectForCode("remains_season").CurrentStage = 3
		Tracker:FindObjectForCode("horon_village_season").CurrentStage = 4
	end
	if Tracker:FindObjectForCode("default_seasons").CurrentStage == 1 then
		for index, region in pairs(region_list) do
			Tracker:FindObjectForCode(region.."_season").CurrentStage = 4
			Tracker:FindObjectForCode("horon_village_season").CurrentStage = 4
		end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 2 then
		for index, region in pairs(region_list) do
			Tracker:FindObjectForCode(region.."_season").CurrentStage = 4
			Tracker:FindObjectForCode("horon_village_season").CurrentStage = 4
		end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 3 then
		for index, region in pairs(region_list) do
			Tracker:FindObjectForCode(region.."_season").CurrentStage = 0
			if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
				Tracker:FindObjectForCode("horon_village_season").CurrentStage = 0
			end
		end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 4 then
		for index, region in pairs(region_list) do
			Tracker:FindObjectForCode(region.."_season").CurrentStage = 1
			if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
				Tracker:FindObjectForCode("horon_village_season").CurrentStage = 1
			end
		end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 5 then
		for index, region in pairs(region_list) do
			Tracker:FindObjectForCode(region.."_season").CurrentStage = 2
			if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
				Tracker:FindObjectForCode("horon_village_season").CurrentStage = 2
			end
		end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 6 then
		for index, region in pairs(region_list) do
			Tracker:FindObjectForCode(region.."_season").CurrentStage = 3
			if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
				Tracker:FindObjectForCode("horon_village_season").CurrentStage = 3
			end
		end
	end
end

function display_seasons()
	if Tracker:FindObjectForCode("default_seasons").CurrentStage == 1 then
		if Tracker:FindObjectForCode("fill_seasons").CurrentStage == 1 then
			Tracker:FindObjectForCode("north_horon_season").CurrentStage = Tracker:FindObjectForCode("north_horon_season_hidden").CurrentStage
			Tracker:FindObjectForCode("horon_village_season").CurrentStage = Tracker:FindObjectForCode("horon_village_season_hidden").CurrentStage
			Tracker:FindObjectForCode("suburbs_season").CurrentStage = Tracker:FindObjectForCode("suburbs_season_hidden").CurrentStage
			Tracker:FindObjectForCode("wow_season").CurrentStage = Tracker:FindObjectForCode("wow_season_hidden").CurrentStage
			Tracker:FindObjectForCode("plain_season").CurrentStage = Tracker:FindObjectForCode("plain_season_hidden").CurrentStage
			Tracker:FindObjectForCode("swamp_season").CurrentStage = Tracker:FindObjectForCode("swamp_season_hidden").CurrentStage
			Tracker:FindObjectForCode("sunken_season").CurrentStage = Tracker:FindObjectForCode("sunken_season_hidden").CurrentStage
			Tracker:FindObjectForCode("tarm_ruins_season").CurrentStage = Tracker:FindObjectForCode("tarm_ruins_season_hidden").CurrentStage
			Tracker:FindObjectForCode("coast_season").CurrentStage = Tracker:FindObjectForCode("coast_season_hidden").CurrentStage
			Tracker:FindObjectForCode("remains_season").CurrentStage = Tracker:FindObjectForCode("remains_season_hidden").CurrentStage
		end
	end
	if Tracker:FindObjectForCode("default_seasons").CurrentStage == 2 then
		if Tracker:FindObjectForCode("fill_seasons").CurrentStage == 1 then
			Tracker:FindObjectForCode("north_horon_season").CurrentStage = Tracker:FindObjectForCode("north_horon_season_hidden").CurrentStage
			Tracker:FindObjectForCode("horon_village_season").CurrentStage = Tracker:FindObjectForCode("horon_village_season_hidden").CurrentStage
			Tracker:FindObjectForCode("suburbs_season").CurrentStage = Tracker:FindObjectForCode("suburbs_season_hidden").CurrentStage
			Tracker:FindObjectForCode("wow_season").CurrentStage = Tracker:FindObjectForCode("wow_season_hidden").CurrentStage
			Tracker:FindObjectForCode("plain_season").CurrentStage = Tracker:FindObjectForCode("plain_season_hidden").CurrentStage
			Tracker:FindObjectForCode("swamp_season").CurrentStage = Tracker:FindObjectForCode("swamp_season_hidden").CurrentStage
			Tracker:FindObjectForCode("sunken_season").CurrentStage = Tracker:FindObjectForCode("sunken_season_hidden").CurrentStage
			Tracker:FindObjectForCode("tarm_ruins_season").CurrentStage = Tracker:FindObjectForCode("tarm_ruins_season_hidden").CurrentStage
			Tracker:FindObjectForCode("coast_season").CurrentStage = Tracker:FindObjectForCode("coast_season_hidden").CurrentStage
			Tracker:FindObjectForCode("remains_season").CurrentStage = Tracker:FindObjectForCode("remains_season_hidden").CurrentStage
		end
	end
end

function vanilla_portals()
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

local lostWoodsDefault = {3, 2, 0, 1}
function display_lost_woods()
	if (Has(LostWoodsVanilla)) then
		for i=1, 4 do
			Tracker:FindObjectForCode("lost_woods_"..i).CurrentStage = lostWoodsDefault[i]
		end
	else
		for i=1, 4 do
			Tracker:FindObjectForCode("lost_woods_"..i).CurrentStage = 4
		end
	end
end
function display_pedestal()
	if (Has(PedestalVanilla)) then
		for i=1, 4 do
			Tracker:FindObjectForCode("pedestal_"..i).CurrentStage = lostWoodsDefault[i]
		end
	else
		for i=1, 4 do
			Tracker:FindObjectForCode("pedestal_"..i).CurrentStage = 4
		end
	end
end

ScriptHost:AddWatchForCode("dungeon settings handler", "dungeonshuffle", dungeon_settings)
ScriptHost:AddWatchForCode("dungeons handler", "fill_dungeons", display_dungeons)
ScriptHost:AddWatchForCode("seasons settings handler", "default_seasons", seasons_settings)
ScriptHost:AddWatchForCode("seasons handler", "fill_seasons", display_seasons)
ScriptHost:AddWatchForCode("portal settings handler", "portalshuffle", vanilla_portals)
ScriptHost:AddWatchForCode("portal handler", "fill_portals", display_portals)
ScriptHost:AddWatchForCode("lost woods handler", "shuffle_lost_woods", display_lost_woods)
ScriptHost:AddWatchForCode("pedestal handler", "shuffle_pedestal", display_pedestal)
ScriptHost:AddOnLocationSectionChangedHandler("gashachanged", OnSectionChanged)