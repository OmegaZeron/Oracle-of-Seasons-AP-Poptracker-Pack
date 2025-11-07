function MediumLogic()
	return Any(
		Medium,
		HardLogic,
		AccessibilityLevel.SequenceBreak
	)
end
function HardLogic()
	return Any(
		Hard,
		HellLogic,
		AccessibilityLevel.SequenceBreak
	)
end
function HellLogic()
	return Any(
		Hell,
		AccessibilityLevel.SequenceBreak
	)
end

-- Individual items
function HasAnySword() return Has(WoodSword) or Has(BiggoronSword) end
function CanShootSeeds() return Has(Slingshot) or Has(SeedShooter) end

function CanDestroyMushroom(includeDimitri)
	if (includeDimitri == nil) then
		includeDimitri = false
	end
	return Any(
		Bracelet,
		All(
			Any(
				MagicBoomerang,
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
		MagicBoomerang,
		SwitchHook
	)
end

function CanBurnTrees()
	return CanUseSeeds() and Has(EmberSeeds)
end

function CanBombWall()
	return Any(
		Bombs,
		All(
			Any(
				Bombchus50,
				All(
					Bombchus,
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

function HasAnyFlute()
	return Moosh() or
	Ricky() or
	Dimitri()
end

function Moosh()
	return Has(AnyFlute) and Has(NatzuIsMoosh)
end
function Ricky()
	return Has(AnyFlute) and Has(NatzuIsRicky)
end
function Dimitri()
	return Has(AnyFlute) and Has(NatzuIsDimitri)
end

function CanDimitriClip()
	return All(
		Dimitri,
		Bracelet,
		Satchel,
		GaleSeeds,
		HellLogic
	)
end

function HasRod()
	return Any(
		Spring,
		Summer,
		Autumn,
		Winter
	)
end

function CanPunch()
	return All(
		Any(
			FistRing,
			ExpertsRing
		),
		MediumLogic
	)
end

function TightSwitchHook()
	return Any(
		LongHook,
		All(
			SwitchHook,
			MediumLogic
		)
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
		WoodSword,
		Any(
			Bombs,
			Bombchus20,
			All(
				Bombchus,
				AccessibilityLevel.SequenceBreak
			)
		),
		Feather,
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
			NobleSword,
			CanShootSeeds,
			EmberSeeds,
			MysterySeeds
		),
		All(
			WoodSword,
			Any(
				-- all seeds damage Twinrova phase 2
				CanShootSeeds,
				All(
					Satchel,
					-- all seeds other than Pegasus damage from satchel
					HasContactSeeds,
					GaleSeeds,
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
			OnoxGoal,
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

-- similar to CanPlantGasha, but for collection
-- used to mark off mayor spots
---@param count integer
---@return boolean
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
---@return boolean
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
	Has(Slingshot) or
	Has(SeedShooter)
end

function HasUpgradedSatchel()
	return Any(
		UpgradedSatchel,
		All(
			Satchel,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanShootSeedsCombat()
	return All(
		CanShootSeeds,
		HasUpgradedSatchel,
		Any(
			EmberSeeds,
			ScentSeeds,
			All(
				Any(
					MysterySeeds,
					GaleSeeds
				),
				MediumLogic
			)
		)
	)
end

function HasContactSeeds()
	return Any(
		EmberSeeds,
		ScentSeeds,
		MysterySeeds
	)
end

function CanLightTorches()
	return All(
		Any(
			Satchel,
			CanShootSeeds
		),
		Any(
			EmberSeeds,
			All(
				MysterySeeds,
				MediumLogic
			)
		)
	)
end

function CanShootLongTorches()
	return All(
		CanLightTorches,
		CanShootSeeds
	)
end

function CanDestroyBush(allowBombchus)
	return Any(
		HasAnySword,
		MagicBoomerang,
		Bracelet,
		SwitchHook,
		All(
			Any(
				Bombs20,
				All(
					Bombs,
					AccessibilityLevel.SequenceBreak
				),
				All(
					allowBombchus == true,
					Any(
						Bombchus50,
						All(
							Bombchus,
							AccessibilityLevel.SequenceBreak
						)
					)
				),
				All(
					CanUseSeeds,
					EmberSeeds
				),
				All(
					CanShootSeeds,
					GaleSeeds
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
		Bracelet,
		NobleSword,
		BiggoronSword,
		SwitchHook
	)
end

function CanDestroyFlower(allowCompanion)
	if (allowCompanion == nil) then
		allowCompanion = false
	end
	return Any(
		HasAnySword,
		MagicBoomerang,
		SwitchHook,
		All(
			allowCompanion,
			AnyFlute
		),
		All(
			Any(
				Bombs20,
				All(
					Bombs,
					AccessibilityLevel.SequenceBreak
				),
				CanBurnTrees,
				All(
					CanShootSeeds,
					GaleSeeds
				),
				Any(
					Bombchus50,
					All(
						Bombchus,
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
		Bracelet,
		All(
			ExpertsRing,
			MediumLogic
		)
	)
end

function CanDestroyRespawningBush()
	return Any(
		CanSwordKill,
		All(
			Bombs,
			MediumLogic
		)
	)
end

function CanTriggerLever()
	return Any(
		CanHitLeverFromMinecart,
		SwitchHook,
		All(
			Shovel,
			MediumLogic
		)
	)
end

function CanHitLeverFromMinecart()
	return Any(
		CanSwordPunchKill,
		Boomerang,
		HasRod,
		CanShootSeeds,
		All(
			CanUseSeeds,
			HasContactSeeds
		)
	)
end

function CanHitFarSwitch()
	return Any(
		CanShootSeeds,
		Boomerang,
		Bombs,
		UseEnergyRing,
		SwitchHook
	)
end

function UseEnergyRing()
	return All(
		EnergyRing,
		WoodSword,
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
		Feather,
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
		Feather,
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
			Bombs,
			HardLogic
		)
	)
end

function JumpLiquid3()
	return Any(
		MaxJump() >= 3,
		All(
			MaxJump() >= 2,
			Bombs,
			HardLogic
		)
	)
end

function JumpLiquid4()
	return Any(
		MaxJump() >= 4,
		All(
			MaxJump() >= 3,
			Bombs,
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
		Bombs,
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
			GaleSeeds,
			MysterySeeds
		),
		HasUpgradedSatchel,
		Any(
			CanShootSeeds,
			Feather,
			HardLogic
		),
		MediumLogic
	)
end

function CanKillWithPit()
	return Any(
		HasRod,
		Shield,
		All(
			Shovel,
			MediumLogic
		)
	)
end

function CanNormalKill(pitAvailable, allowGale)
	pitAvailable = Default(pitAvailable, false)
	allowGale = Default(allowGale, true)

	return Any(
		CanNormalSatchelKill(allowGale),
		CanNormalSlingshotKill(allowGale),
		All(
			pitAvailable,
			CanKillWithPit
		),
		CanSwordPunchKill,
		All(
			Any(
				Bombs40,
				All(
					Bombs,
					AccessibilityLevel.SequenceBreak
				),
				Bombchus20,
				All(
					Bombchus,
					AccessibilityLevel.SequenceBreak
				)
			),
			MediumLogic
		),
		All(
			CaneOfSomaria,
			MediumLogic
		)
	)
end

function CanNormalSatchelKill(allowGale)
	if (allowGale == nil) then
		allowGale = true
	end
	return All(
		HasUpgradedSatchel,
		Any(
			EmberSeeds,
			All(
				Any(
					ScentSeeds,
					MysterySeeds,
					All(
						allowGale,
						Feather,
						GaleSeeds
					)
				),
				MediumLogic
			),
			All(
				allowGale,
				GaleSeeds,
				HardLogic
			)
		)
	)
end

function CanNormalSlingshotKill(allowGale)
	if (allowGale == nil) then
		allowGale = true
	end
	return All(
		HasUpgradedSatchel,
		All(
			CanShootSeeds,
			Any(
				EmberSeeds,
				ScentSeeds,
				All(
					Any(
						All(
							allowGale,
							GaleSeeds
						),
						MysterySeeds
					),
					MediumLogic
				)
			)
		)
	)
end

function CanArmorKill(allowCane, allowBombchus)
	allowCane = Default(allowCane, false)
	allowBombchus = Default(allowBombchus, false)
	return Any(
		CanSwordPunchKill,
		All(
			allowBombchus,
			Any(
				Bombs40,
				Bombchus20,
				All(
					Bombs,
					AccessibilityLevel.SequenceBreak
				),
				All(
					Bombchus,
					AccessibilityLevel.SequenceBreak
				)
			),
			MediumLogic
		),
		All(
			ScentSeeds,
			HasUpgradedSatchel,
			Any(
				CanShootSeeds,
				MediumLogic
			)
		),
		All(
			allowCane,
			CaneOfSomaria,
			MediumLogic
		)
	)
end

function CanKillKeese()
	return Any(
		CanNormalKill,
		Boomerang
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
		Shield,
		All(
			Shovel,
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
				CanNormalSlingshotKill,
				SwitchHook
			)
		)
	)
end

function CanKillMoldorm(pitAvailable)
	pitAvailable = Default(pitAvailable, false)
	return Any(
		CanArmorKill(true, true),
		SwitchHook,
		All(
			pitAvailable,
			Any(
				Shield,
				All(
					Shovel,
					MediumLogic
				)
			)
		)
	)
end

function CanFarmRupees()
	return Any(
		CanNormalKill(false, false),
		Shovel
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
			Shovel,
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
		Shovel,
		All(
			Any(
				CanReach(SubrosiaMountainEast),
				Bracelet,
				SwitchHook
			),
			HardLogic
		),
		All(
			Any(
				HasAnySword,
				MagicBoomerang
			),
			MediumLogic
		),
		All(
			-- burn the sign next to the market
			-- not in logic because it sucks
			CanBurnTrees,
			AccessibilityLevel.SequenceBreak
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
		LonLonEgg,
		CanNormalKill(false, false)
	)
end

function CanEnterTarm()
	return Tracker:ProviderCountForCode(Jewels) >= Tracker:FindObjectForCode(TarmGateSetting).CurrentStage
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
			LostWoodsVanilla,
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
			PedestalVanilla,
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

		if (HasAnyFlute()) then
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
				LostWoodsWinter,
				Winter
			),
			Any(
				Spring,
				Summer,
				Autumn
			),
			Any(
				LostWoodsSummer,
				Summer,
				All(
					Any(
						LostWoodsAutumn,
						Autumn
					),
					MagicBoomerang
				)
			)
		) == AccessibilityLevel.Normal) then
			local canReachDeku = All(
				Shield,
				Any(
					availableCuccos["swamp"][2] > 0,
					JumpLiquid2,
					Flippers
				)
			) == AccessibilityLevel.Normal
			if (All(
				Autumn,
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
		D1BossKey,
		All(
			MasterKeysBoth,
			D1MasterKey
		)
	)
end

function D2KeyCount(count)
	return Tracker:ProviderCountForCode(D2SmallKey) >= count or Has(D2MasterKey)
end
function HasD2BossKey()
	return Any(
		D2BossKey,
		All(
			MasterKeysBoth,
			D2MasterKey
		)
	)
end

function D3KeyCount(count)
	return Tracker:ProviderCountForCode(D3SmallKey) >= count or Has(D3MasterKey)
end
function HasD3BossKey()
	return Any(
		D3BossKey,
		All(
			MasterKeysBoth,
			D3MasterKey
		)
	)
end

function D4KeyCount(count)
	return Tracker:ProviderCountForCode(D4SmallKey) >= count or Has(D4MasterKey)
end
function HasD4BossKey()
	return Any(
		D4BossKey,
		All(
			MasterKeysBoth,
			D4MasterKey
		)
	)
end

function D5KeyCount(count)
	return Tracker:ProviderCountForCode(D5SmallKey) >= count or Has(D5MasterKey)
end
function HasD5BossKey()
	return Any(
		D5BossKey,
		All(
			MasterKeysBoth,
			D5MasterKey
		)
	)
end

function D6KeyCount(count)
	return Tracker:ProviderCountForCode(D6SmallKey) >= count or Has(D6MasterKey)
end
function HasD6BossKey()
	return Any(
		D6BossKey,
		All(
			MasterKeysBoth,
			D6MasterKey
		)
	)
end

function D7KeyCount(count)
	return Tracker:ProviderCountForCode(D7SmallKey) >= count or Has(D7MasterKey)
end
function HasD7BossKey()
	return Any(
		D7BossKey,
		All(
			MasterKeysBoth,
			D7MasterKey
		)
	)
end

function D8KeyCount(count)
	return Tracker:ProviderCountForCode(D8SmallKey) >= count or Has(D8MasterKey)
end
function HasD8BossKey()
	return Any(
		D8BossKey,
		All(
			MasterKeysBoth,
			D8MasterKey
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
ScriptHost:AddWatchForCode("see companion handler", Companion, function()
	local companion = Tracker:FindObjectForCode(Companion)
	---@cast companion JsonItem
	local location = Tracker:FindObjectForCode("@Holodrum Plain/See Your Companion/")
	---@cast location LocationSection
	if (companion.CurrentStage == 3) then
		location.AvailableChestCount = 1
	else
		location.AvailableChestCount = 0
	end
end)
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