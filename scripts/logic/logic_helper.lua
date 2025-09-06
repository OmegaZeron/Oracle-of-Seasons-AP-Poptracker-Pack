function MediumLogic()
	return Any(
		Has(Medium),
		HardLogic,
		AccessibilityLevel.SequenceBreak
	)
end
function HardLogic()
	return Any(
		Has(Hard),
		HellLogic,
		AccessibilityLevel.SequenceBreak
	)
end
function HellLogic()
	return Any(
		Has(Hell),
		AccessibilityLevel.SequenceBreak
	)
end

-- Individual items
function HasSword() return Has(WoodSword) end
function HasAnySword() return Has(WoodSword) or Has(BiggoronSword) end
function HasBreakingSword() return Has(NobleSword) or Has(BiggoronSword) end
function HasStrongWeapon() return HasBreakingSword() or Has(FoolsOre) end
function HasGoodPunch() return Has(ExpertsRing) end
function HasShield() return Has(Shield) end
function HasSpring() return Has(Spring) end
function HasSummer() return Has(Summer) end
function HasAutumn() return Has(Autumn) end
function HasWinter() return Has(Winter) end
function HasBracelet() return Has(Bracelet) end
function HasBoomerang() return Has(Boomerang) end
function HasMagicBoomerang() return Has(MagicBoomerang) end
function HasBombs() return Has(Bombs) end
function HasTraversalBombs() return Has(Bombs20) end
function HasCombatBombs() return Has(Bombs40) end
function HasBombchus() return Has(Bombchus) end
function HasTraversalBombchus() return Has(Bombchus20) end
function HasCombatBombchus() return Has(Bombchus50) end
function HasSatchel() return Has(SeedSatchel) end
function HasUpgradedSatchel() return Has(UpgradedSatchel) end
function HasSlingshot() return Has(Slingshot) end
function HasHSS() return Has(HyperSlingshot) end
function HasEmbers() return Has(EmberSeeds) end
function HasScents() return Has(ScentSeeds) end
function HasPegasus() return Has(PegasusSeeds) end
function HasGales() return Has(GaleSeeds) end
function HasMysteries() return Has(MysterySeeds) end
function HasFeather() return Has(Feather) end
function HasShovel() return Has(Shovel) end
function HasFlippers() return Has(Flippers) end
function HasMagnetGlove() return Has(MagnetGlove) end

function HasCane() return Has(CaneOfSomaria) end
function HasSwitchHook() return Has(SwitchHook) end
function HasLongHook() return Has(LongHook) end

function CanDestroyMushroom(includeDimitri)
	if (includeDimitri == nil) then
		includeDimitri = false
	end
	return Any(
		HasBracelet,
		All(
			Any(
				HasMagicBoomerang,
				All(
					includeDimitri,
					Dimitri
				)
			),
			MediumLogic
		)
	)
end

function DestroySigns()
	return Any(
		CanDestroyPot,
		CanBurnTrees,
		HasMagicBoomerang
	)
end

function CanBurnTrees()
	return CanUseSeeds() and Has(EmberSeeds)
end

function CanBombWall()
	return Any(
		HasBombs,
		All(
			Any(
				HasCombatBombchus,
				All(
					HasBombchus,
					AccessibilityLevel.SequenceBreak
				)
			),
			MediumLogic
		)
	)
end
function BombPunchWall()
	return Any(
		Ricky,
		CanBombWall
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

function CanDimitriClip()
	return All(
		Dimitri,
		HasBracelet,
		HasSatchel,
		HasGales,
		HellLogic
	)
end

function HasRod()
	return Any(
		HasSpring,
		HasSummer,
		HasAutumn,
		HasWinter
	)
end

function CanPunch()
	return All(
		Any(
			Has(FistRing),
			Has(ExpertsRing)
		),
		MediumLogic
	)
end

function HasEnoughEssencesForTreehouse()
	local required = Tracker:FindObjectForCode("treehouse_old_man_requirement").CurrentStage
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
		HasAnySword,
		Any(
			HasBombs,
			Any(
				HasTraversalBombchus,
				All(
					HasBombchus,
					AccessibilityLevel.SequenceBreak
				)
			)
		),
		HasFeather,
		Any(
			HasRod,
			HardLogic
		)
	)
end

function CanBeatGanon()
	return Any(
		All(
			-- casual rules
			Has(NobleSword),
			HasSlingshot,
			HasEmbers,
			HasMysteries
		),
		All(
			HasSword,
			Any(
				-- all seeds damage Twinrova phase 2
				HasSlingshot,
				All(
					HasSatchel,
					-- all seeds other than Pegasus damage from satchel
					HasContactSeeds,
					HasGales,
					HardLogic
				)
			),
			MediumLogic
		)
	)
end

function CanGoal()
	return All(
		HasEnoughEssencesForGoal,
		CanBeatOnox,
		Any(
			Has(OnoxGoal),
			CanBeatGanon
		)
	)
end

function HasEnoughEssencesForGoal()
	local required = Tracker:FindObjectForCode("required_essences").CurrentStage
	local n = 0
	for _, e in ipairs(EssenceKeys) do
		if (Has(e)) then
			n = n + 1
		end
	end
	return n >= required
end

function CanHarvestSeeds(includeDimitri)
	return All(
		CanUseSeeds,
		Any(
			CanSwordPunchKill,
			HasRod,
			All(
				includeDimitri == true,
				Dimitri
			)
		)
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
	local gashasHarvested = GashasHarvested()
	local gashasPlanted = GashasPlanted()
	if (gashasPlanted < tonumber(count)) then
		return false
	end
	local gashaSetting = Tracker:FindObjectForCode(GashaSetting)
	if (gashaSetting == nil or gashasHarvested >= gashaSetting.CurrentStage) then
		return false
	end
	return gashasPlanted > gashasHarvested
end

function GashasHarvested()
	local harvested = 0
	for i = 1, 16 do
		local section = Tracker:FindObjectForCode("@Horon Village/Gasha Spots/Gasha Spot #"..i)
		if (section ~= nil) then
			harvested = harvested + section.AvailableChestCount
		end
	end
	return 16 - harvested
end

---@param code string
---@return integer | boolean
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
	return gashaSetting ~= nil and gashaSetting.CurrentStage >= tonumber(count) and GashasHarvested() < gashaSetting.CurrentStage
end

---@param section LocationSection
function OnSectionChanged(section)
	if (GashaIDToLocation[section.FullID]) then
		GashaIDToLocation[section.FullID].cleared = section.AccessibilityLevel == AccessibilityLevel.Cleared

		local hiddenSetting = Tracker:FindObjectForCode(HiddenSetting)
		---@cast hiddenSetting JsonItem
		hiddenSetting.Active = not hiddenSetting.Active
	elseif (WildItems[section.FullID] and section.AccessibilityLevel == AccessibilityLevel.Cleared) then
		Tracker:FindObjectForCode(WildItems[section.FullID]).Active = true
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

-- INTERACT RULES

function CanUseSeeds()
	return Has(SeedSatchel) or
	Has(Slingshot)
end

function CanShootSeedsCombat()
	return All(
		HasSatchel,
		HasSlingshot,
		Any(
			HasEmbers,
			HasScents,
			All(
				Any(
					HasMysteries,
					HasGales
				),
				MediumLogic
			)
		),
		Any(
			HasUpgradedSatchel,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function HasContactSeeds()
	return Any(
		HasEmbers,
		HasScents,
		HasMysteries
	)
end

function CanLightTorches()
	return All(
		Any(
			HasSatchel,
			HasSlingshot
		),
		Any(
			HasEmbers,
			All(
				HasMysteries,
				MediumLogic
			)
		)
	)
end

function CanShootLongTorches()
	return All(
		CanLightTorches,
		HasSlingshot
	)
end

function CanDestroyBush(allowBombchus)
	return Any(
		HasAnySword,
		HasMagicBoomerang,
		HasBracelet,
		All(
			Any(
				HasTraversalBombs,
				All(
					HasBombs,
					AccessibilityLevel.SequenceBreak
				),
				All(
					allowBombchus == true,
					Any(
						HasCombatBombchus,
						All(
							HasBombchus,
							AccessibilityLevel.SequenceBreak
						)
					)
				),
				All(
					CanUseSeeds,
					HasEmbers
				),
				All(
					HasSlingshot,
					HasGales
				)
			),
			MediumLogic
		)
	)
end

function CanDestroyBushFlute(allowBombchus)
	return Any(
		CanDestroyBush(allowBombchus),
		AnyFlute
	)
end

function CanDestroyPot()
	return Any(
		HasBreakingSword,
		HasBracelet
	)
end

function CanDestroyFlower(allowCompanion)
	if (allowCompanion == nil) then
		allowCompanion = false
	end
	return Any(
		HasAnySword,
		HasMagicBoomerang,
		All(
			allowCompanion,
			AnyFlute
		),
		All(
			Any(
				HasTraversalBombs,
				All(
					HasBombs,
					AccessibilityLevel.SequenceBreak
				),
				CanBurnTrees,
				All(
					HasSlingshot,
					HasGales
				),
				Any(
					HasCombatBombchus,
					All(
						HasBombchus,
						AccessibilityLevel.SequenceBreak
					)
				)
			),
			MediumLogic
		)
	)
end

function CanDestroyCrystal()
	return Any(
		HasAnySword,
		CanBombWall,
		HasBracelet,
		All(
			Has(ExpertsRing),
			MediumLogic
		)
	)
end

function CanDestroyRespawningBush()
	return Any(
		CanSwordKill,
		All(
			HasBombs,
			MediumLogic
		)
	)
end

function CanTriggerLever()
	return Any(
		CanHitLeverFromMinecart,
		All(
			HasShovel,
			MediumLogic
		)
	)
end

function CanHitLeverFromMinecart()
	return Any(
		CanSwordPunchKill,
		HasBoomerang,
		HasRod,
		HasSlingshot,
		All(
			CanUseSeeds,
			HasContactSeeds
		)
	)
end

function CanHitFarSwitch()
	return Any(
		HasSlingshot,
		HasBoomerang,
		HasBombs,
		UseEnergyRing
	)
end

function UseEnergyRing()
	return All(
		Has(EnergyRing),
		HasSword,
		MediumLogic
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

function Jump1(allowCompanion)
	if (allowCompanion == nil) then
		allowCompanion = false
	end
	return Any(
		HasFeather,
		All(
			allowCompanion,
			Any(
				Ricky,
				Moosh
			)
		)
	)
end

function Jump2()
	return Any(
		MaxJump() >= 2,
		All(
			MaxJump() >= 1,
			MediumLogic
		)
	)
end

function Jump3()
	return Any(
		MaxJump() >= 3,
		All(
			MaxJump() >= 2,
			MediumLogic
		)
	)
end

function Jump4()
	return Any(
		MaxJump() >= 4,
		All(
			MaxJump() >= 3,
			MediumLogic
		)
	)
end

function Jump5()
	return MaxJump() >= 5
end

function Jump6()
	return All(
		MaxJump() >= 5,
		MediumLogic
	)
end

function JumpLiquid1(allowCompanion)
	if (allowCompanion == nil) then
		allowCompanion = false
	end
	return Any(
		HasFeather,
		All(
			allowCompanion,
			Ricky
		)
	)
end
function JumpLiquid2()
	return Any(
		MaxJump() >= 2,
		All(
			MaxJump() >= 1,
			HasBombs,
			HardLogic
		)
	)
end

function JumpLiquid3()
	return Any(
		MaxJump() >= 3,
		All(
			MaxJump() >= 2,
			HasBombs,
			HardLogic
		)
	)
end

function JumpLiquid4()
	return Any(
		MaxJump() >= 4,
		All(
			MaxJump() >= 3,
			HasBombs,
			HardLogic
		)
	)
end

function JumpLiquid5()
	return MaxJump() >= 5
end

function JumpLiquid6()
	return All(
		MaxJump() >= 5,
		HasBombs,
		HardLogic
	)
end

-- KILL RULES

function CanSwordKill()
	return HasAnySword() or Has(FoolsOre)
end

function CanSwordPunchKill()
	return Any(
		CanPunch,
		CanSwordKill
	)
end

function CanGaleKill()
	return All(
		Any(
			HasGales,
			HasMysteries
		),
		HasUpgradedSatchel,
		Any(
			HasSlingshot,
			HasFeather,
			HardLogic
		),
		MediumLogic
	)
end

function CanKillWithPit()
	return Any(
		HasRod,
		HasShield,
		All(
			HasShovel,
			MediumLogic
		)
	)
end

function CanNormalKill(pitAvailable, allowGale, allowCane)
	if (allowGale == nil) then
		allowGale = true
	end
	if (allowCane == nil) then
		allowCane = true
	end
	return Any(
		CanNormalSatchelKill(allowGale),
		CanNormalSlingshotKill(allowGale),
		All(
			pitAvailable == true,
			CanKillWithPit
		),
		CanSwordPunchKill,
		All(
			Any(
				HasCombatBombs,
				All(
					HasBombs,
					AccessibilityLevel.SequenceBreak
				),
				HasTraversalBombchus,
				All(
					HasBombchus,
					AccessibilityLevel.SequenceBreak
				)
			),
			MediumLogic
		),
		All(
			allowCane,
			HasCane,
			MediumLogic
		)
	)
end

function CanNormalSatchelKill(allowGale)
	if (allowGale == nil) then
		allowGale = true
	end
	return All(
		HasSatchel,
		Any(
			HasEmbers,
			All(
				Any(
					HasScents,
					HasMysteries,
					All(
						allowGale,
						HasFeather,
						HasGales
					)
				),
				MediumLogic
			),
			All(
				allowGale,
				HasGales,
				HardLogic
			)
		),
		Any(
			HasUpgradedSatchel,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanNormalSlingshotKill(allowGale)
	if (allowGale == nil) then
		allowGale = true
	end
	return All(
		HasSatchel,
		All(
			HasSlingshot,
			Any(
				HasEmbers,
				HasScents,
				All(
					Any(
						All(
							allowGale,
							HasGales
						),
						HasMysteries
					),
					MediumLogic
				)
			)
		),
		Any(
			HasUpgradedSatchel,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanArmorKill()
	return Any(
		CanSwordPunchKill,
		All(
			Any(
				HasCombatBombs,
				HasTraversalBombchus,
				All(
					HasBombs,
					AccessibilityLevel.SequenceBreak
				),
				All(
					HasBombchus,
					AccessibilityLevel.SequenceBreak
				)
			),
			MediumLogic
		),
		All(
			HasUpgradedSatchel,
			HasScents,
			Any(
				HasSlingshot,
				MediumLogic
			)
		),
		All(
			HasCane,
			MediumLogic
		),
		All(
			-- ool version of above without upgraded satchel
			CanUseSeeds,
			HasScents,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanKillKeese()
	return Any(
		CanNormalKill,
		HasBoomerang
	)
end

function CanKillStalfos()
	return Any(
		CanNormalKill,
		All(
			HasRod,
			MediumLogic
		)
	)
end

function CanFlipBeetle()
	return Any(
		HasShield,
		All(
			HasShovel,
			MediumLogic
		)
	)
end
function CanKillSpinyBeetle()
	return Any(
		CanGaleKill,
		All(
			CanFlipBeetle,
			Any(
				CanSwordKill,
				CanNormalSatchelKill,
				CanNormalSlingshotKill
			)
		)
	)
end

function CanFarmRupees()
	return Any(
		CanNormalKill(false, false),
		HasShovel
	)
end

function HasRupees(count)
	if (CanFarmRupees() < AccessibilityLevel.SequenceBreak) then
		return false
	end

	local rupees = Tracker:FindObjectForCode(RupeeCount).AcquiredCount
	local bonusRupees = 0
	local oolRupees = 0

	-- rupee rooms
	local snakeRupees = CanReach(SnakeRupeeRoom)
	local snakeRupeeAmount = 150
	if (snakeRupees == AccessibilityLevel.SequenceBreak) then
		oolRupees = oolRupees + snakeRupeeAmount
	elseif (snakeRupees == AccessibilityLevel.Normal) then
		bonusRupees = bonusRupees + snakeRupeeAmount
	end

	local ancientRupees = CanReach(AncientRupeeRoom)
	local ancientRupeeAmount = 90
	if (ancientRupees == AccessibilityLevel.SequenceBreak) then
		oolRupees = oolRupees + ancientRupeeAmount
	elseif (ancientRupees == AccessibilityLevel.Normal) then
		bonusRupees = bonusRupees + ancientRupeeAmount
	end

	if (Tracker:FindObjectForCode("shuffle_old_men").CurrentStage ~= 4) then
		for _, val in pairs(OldMenValues) do
			if (val[1] < 0) then
				-- always subtract rupees even if you can't reach them yet
				-- otherwise you could "lose" access to a shop if one steals from you
				rupees = rupees + val[1]
			else
				local access = CanReach(val[2])
				if (access == AccessibilityLevel.SequenceBreak) then
					oolRupees = oolRupees + val[1]
				elseif (access == AccessibilityLevel.Normal) then
					rupees = rupees + val[1]
				end
			end
		end
	end

	return Any(
		-- already have the right amount of rupees
		rupees >= count,
		-- D2 and D6 rupee rooms are medium+ only
		All(
			rupees + bonusRupees >= count,
			MediumLogic
		),
		-- shovel is infinite farm, and expected in hard
		All(
			HasShovel,
			HardLogic
		),
		All(
			rupees + bonusRupees + oolRupees >= count,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanFarmOreChunks()
	return Any(
		HasShovel,
		All(
			CanReach(SubrosiaMountainEast),
			HardLogic
		),
		All(
			Any(
				HasAnySword,
				HasBracelet,
				HasMagicBoomerang
			),
			MediumLogic
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

	return oreChunks >= count
end

function CanMapleTrade()
	return All(
		Has(LonLonEgg),
		CanNormalKill(false, false)
	)
end

function CanEnterTarm()
	local required = Tracker:FindObjectForCode(TarmGateSetting).CurrentStage
	local n = 0
	for _, j in ipairs(JewelKeys) do
		if (Has(j)) then
			n = n + 1
		end
	end
	return n >= required
end

function CanLostWoods(allowDefault, forceDeku)
	if (allowDefault == nil) then
		allowDefault = false
	end
	if (forceDeku == nil) then
		forceDeku = false
	end
	local defaultSeason = IndexToSeason[Tracker:FindObjectForCode("lost_woods_season").CurrentStage]
	local canDefault = defaultSeason ~= UnknownSeason
	for i=1, 4 do
		local season = IndexToSeason[Tracker:FindObjectForCode("lost_woods_"..i).CurrentStage]
		canDefault = allowDefault and canDefault and defaultSeason == season
		if (not canDefault and (season == UnknownSeason or not Has(season))) then
			return false
		end
	end

	return Any(
		forceDeku,
		CanReach(TarmLostWoodsScrub),
		All(
			-- know the sequence
			Has(LostWoodsVanilla),
			MediumLogic
		)
	)
end
function CanPedestal(allowDefault, forceDeku)
	if (allowDefault == nil) then
		allowDefault = false
	end
	if (forceDeku == nil) then
		forceDeku = false
	end
	local defaultSeason = IndexToSeason[Tracker:FindObjectForCode("lost_woods_season").CurrentStage]
	local canDefault = defaultSeason ~= UnknownSeason
	for i=1, 4 do
		local season = IndexToSeason[Tracker:FindObjectForCode("pedestal_"..i).CurrentStage]
		canDefault = allowDefault and canDefault and defaultSeason == season
		if (not canDefault and (season == UnknownSeason or not Has(season))) then
			return false
		end
	end

	return Any(
		forceDeku,
		CanReach(TarmPedestalScrub),
		All(
			-- know the sequence
			Has(PedestalVanilla),
			MediumLogic
		)
	)
end

local availableCuccos = nil

function GetCuccos()
	if (availableCuccos == nil) then
		availableCuccos = {
			["mt. cucco"] = {-1, -1, -1},
			["horon"] = {-1, -1, -1},
			["suburbs"] = {-1, -1, -1},
			["moblin road"] = {-1, -1, -1},
			["sunken"] = {-1, -1, -1},
			["swamp"] = {-1, -1, -1},
			["tarm"] = {-1, -1, -1}
		}

		function RegisterCucco(region, cuccos)
			local oldCuccos = availableCuccos[region]
			local newCuccos = {}
			for i = 1, 3, 1 do
				newCuccos[i] = math.max(oldCuccos[i], cuccos[i])
			end
			availableCuccos[region] = newCuccos
		end
		function UseAnyCucco(cuccos)
			return {cuccos[1] - 1, cuccos[2], cuccos[3]}
		end
		function UseTopCucco(cuccos)
			return {cuccos[1] - 1, cuccos[2] - 1, cuccos[3]}
		end
		function UseBottomCucco(cuccos)
			return {cuccos[1] - 1, cuccos[2], cuccos[3] - 1}
		end

		local top, bottom = 1, 0

		if (Has(Shovel)) then
			if (Has(Boomerang)) then
				top = 3
			else
				top = 2
			end
		elseif (Has(Boomerang) and Has(SeedSatchel) and Has(PegasusSeeds)) then
			top = 2
		end

		if ((Has(SunkenCitySpring) or Has(Spring)) and CanDestroyFlower() or Has(SpringBanana)) then
			bottom = 2
		end

		availableCuccos["mt. cucco"] = {top + bottom, top, bottom}

		if (Jump3() or Has(Flippers) or Has(Dimitri())) then
			availableCuccos["horon"] = availableCuccos["mt. cucco"]
		end

		if (AnyFlute()) then
			availableCuccos["sunken"] = availableCuccos["horon"]
		elseif (Has(NatzuIsMoosh)) then
			if (JumpLiquid4()) then
				availableCuccos["sunken"] = availableCuccos["horon"]
			elseif (Jump3()) then
				availableCuccos["sunken"] = UseTopCucco(availableCuccos["horon"])
			end
		elseif (Has(NatzuIsDimitri)) then
			if (CanDestroyFlower() and Has(Flippers)) then
				availableCuccos["sunken"] = UseAnyCucco(availableCuccos["mt. cucco"])
			end
		elseif (Has(Flippers)) then
			availableCuccos["sunken"] = availableCuccos["mt. cucco"]
		end

		availableCuccos["suburbs"] = availableCuccos["sunken"]

		if (Has(SeedSatchel) and Has(EmberSeeds)) then
			availableCuccos["suburbs"] = availableCuccos["horon"]
		elseif (Has(NorthHoronWinter) or Has(Winter) or ((Has(NorthHoronSpring) or Has(NorthHoronAutumn) or Has(NorthHoronWinter) or Has(Spring) or Has(Autumn) or Has(Winter)) and (Has(Flippers) or Dimitri()))) then
			availableCuccos["suburbs"] = UseAnyCucco(availableCuccos["horon"])
		end

		if (Has(EasternSuburbsSpring) or Has(Spring)) then
			RegisterCucco("sunken", availableCuccos["suburbs"])
		end

		if (Has(EasternSuburbsWinter) or Has(Winter)) then
			availableCuccos["moblin road"] = availableCuccos["suburbs"]
		else
			availableCuccos["moblin road"] = UseTopCucco(availableCuccos["sunken"])
		end

		if (Has(HolodrumPlainSummer) or Has(Summer) or Jump4() or Ricky() or Moosh()) then
			availableCuccos["swamp"] = availableCuccos["horon"]
		else
			availableCuccos["swamp"] = UseBottomCucco(availableCuccos["horon"])
		end

		if (All(
			CanEnterTarm,
			Any(
				Has(LostWoodsWinter),
				HasWinter
			),
			Any(
				HasSpring,
				HasSummer,
				HasAutumn
			),
			Any(
				Has(LostWoodsSummer),
				HasSummer,
				All(
					Any(
						Has(LostWoodsAutumn),
						HasAutumn
					),
					HasMagicBoomerang
				)
			)
		) == AccessibilityLevel.Normal) then
			local canReachDeku = All(
				HasShield,
				Any(
					availableCuccos["swamp"][2] > 0,
					JumpLiquid2,
					HasFlippers
				)
			) == AccessibilityLevel.Normal
			if (All(
				HasAutumn,
				CanDestroyMushroom,
				Any(
					CanLostWoods(false, canReachDeku),
					All(
						CanLostWoods(true, canReachDeku),
						CanLostWoods(false, CanBurnTrees() and Has(Phonograph))
					)
				)
			) == AccessibilityLevel.Normal) then
				availableCuccos["tarm"] = availableCuccos["swamp"]
			end
		end

		for region in pairs(availableCuccos) do
			for i = 1, 3, 1 do
				if (availableCuccos[region][i] < 0) then
					availableCuccos[region] = {-1, -1, -1}
				end
			end
		end
	end
	return availableCuccos
end

function D1KeyCount(count)
	return Tracker:ProviderCountForCode(D1SmallKey) >= count or Has(D1MasterKey)
end
function HasD1BossKey()
	return Any(
		Has(D1BossKey),
		All(
			Has(MasterKeysBoth),
			Has(D1MasterKey)
		)
	)
end

function D2KeyCount(count)
	return Tracker:ProviderCountForCode(D2SmallKey) >= count or Has(D2MasterKey)
end
function HasD2BossKey()
	return Any(
		Has(D2BossKey),
		All(
			Has(MasterKeysBoth),
			Has(D2MasterKey)
		)
	)
end

function D3KeyCount(count)
	return Tracker:ProviderCountForCode(D3SmallKey) >= count or Has(D3MasterKey)
end
function HasD3BossKey()
	return Any(
		Has(D3BossKey),
		All(
			Has(MasterKeysBoth),
			Has(D3MasterKey)
		)
	)
end

function D4KeyCount(count)
	return Tracker:ProviderCountForCode(D4SmallKey) >= count or Has(D4MasterKey)
end
function HasD4BossKey()
	return Any(
		Has(D4BossKey),
		All(
			Has(MasterKeysBoth),
			Has(D4MasterKey)
		)
	)
end

function D5KeyCount(count)
	return Tracker:ProviderCountForCode(D5SmallKey) >= count or Has(D5MasterKey)
end
function HasD5BossKey()
	return Any(
		Has(D5BossKey),
		All(
			Has(MasterKeysBoth),
			Has(D5MasterKey)
		)
	)
end

function D6KeyCount(count)
	return Tracker:ProviderCountForCode(D6SmallKey) >= count or Has(D6MasterKey)
end
function HasD6BossKey()
	return Any(
		Has(D6BossKey),
		All(
			Has(MasterKeysBoth),
			Has(D6MasterKey)
		)
	)
end

function D7KeyCount(count)
	return Tracker:ProviderCountForCode(D7SmallKey) >= count or Has(D7MasterKey)
end
function HasD7BossKey()
	return Any(
		Has(D7BossKey),
		All(
			Has(MasterKeysBoth),
			Has(D7MasterKey)
		)
	)
end

function D8KeyCount(count)
	return Tracker:ProviderCountForCode(D8SmallKey) >= count or Has(D8MasterKey)
end
function HasD8BossKey()
	return Any(
		Has(D8BossKey),
		All(
			Has(MasterKeysBoth),
			Has(D8MasterKey)
		)
	)
end

function dungeon_settings()
	if (not LOADED) then
		return
	end
	local dungeon_list = {"d0","d1","d2","d3","d4","d5","d6","d7","d8"}
	if Tracker:FindObjectForCode("shuffle_dungeons").CurrentStage == 0 then
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
	if Tracker:FindObjectForCode("shuffle_dungeons").CurrentStage == 1 then
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
	if Tracker:FindObjectForCode("shuffle_portals").CurrentStage == 0 then
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
		if Tracker:FindObjectForCode("shuffle_portals").CurrentStage == 1 or Tracker:FindObjectForCode("shuffle_portals").CurrentStage == 2 then
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

function OnFrameHandler()
	ScriptHost:RemoveOnFrameHandler("load handler")
	LOADED = true
end

ScriptHost:AddWatchForCode("dungeon settings handler", "shuffle_dungeons", dungeon_settings)
ScriptHost:AddWatchForCode("dungeons handler", "fill_dungeons", display_dungeons)
ScriptHost:AddWatchForCode("seasons settings handler", "default_seasons", seasons_settings)
ScriptHost:AddWatchForCode("seasons handler", "fill_seasons", display_seasons)
ScriptHost:AddWatchForCode("portal settings handler", "shuffle_portals", vanilla_portals)
ScriptHost:AddWatchForCode("portal handler", "fill_portals", display_portals)
ScriptHost:AddWatchForCode("lost woods handler", "randomize_lost_woods_main_sequence", display_lost_woods)
ScriptHost:AddWatchForCode("pedestal handler", "randomize_lost_woods_item_sequence", display_pedestal)
ScriptHost:AddOnLocationSectionChangedHandler("section changed handler", OnSectionChanged)
ScriptHost:AddOnFrameHandler("load handler", OnFrameHandler)
-- "See the Season" locations
for i = 1, #SeeSeasonVars do
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
-- "Enter portal" locations
for i = 1, #PortalSetVars do
	ScriptHost:AddWatchForCode(PortalSetVars[i][1], PortalSetVars[i][2], function()
		local portal = Tracker:FindObjectForCode(PortalSetVars[i][2])
		---@cast portal JsonItem
		local location = Tracker:FindObjectForCode(PortalSetVars[i][3])
		---@cast location LocationSection
		if (portal.CurrentStage == PortalDictionary[PortalSetVars[i][1]]['unknown']) then
			location.AvailableChestCount = 1
		else
			location.AvailableChestCount = 0
		end
	end)
end