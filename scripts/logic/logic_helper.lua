-- cache for expensive or often-called functions
local CachedValues = {}
function InvalidateCache()
	CachedValues = {}
end

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

---@param includeDimitri? boolean false
---@return accessibilityLevel
function CanDestroyMushroom(includeDimitri)
	includeDimitri = includeDimitri or false
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

function HasBombsToFight()
	return Any(
		Bombs40,
		All(
			Bombs,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function HasBombsForTiles()
	return Any(
		Bombs20,
		All(
			Bombs,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function HasBombsForBombJump()
	return All(
		HasHearts(4),
		Any(
			Bombs20,
			All(
				Bombs,
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function HasBombchusToFight()
	return Any(
		Bombchus20,
		All(
			Bombchus,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function HasBombchusForTiles()
	return Any(
		Bombchus40,
		All(
			Bombchus,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanBombWall()
	if CachedValues["CanBombWall"] then
		return CachedValues["CanBombWall"]
	end
	local val = Any(
		HasBombsForTiles,
		All(
			HasBombchusForTiles,
			MediumLogic
		)
	)

	CachedValues["CanBombWall"] = val
	return val
end
function BombPunchWall()
	return Any(
		Ricky,
		CanBombWall
	)
end

---@param hearts integer
---@param difficulty? logicLevel LogicLevel.Casual
function HasHearts(hearts, difficulty)
	difficulty = difficulty or LogicLevel.Casual
	return Any(
		All(
			Tracker:FindObjectForCode("logic_difficulty").CurrentStage >= difficulty,
			Has(HeartContainer, hearts)
		),
		hearts <= 3,
		hearts > 10,
		AccessibilityLevel.SequenceBreak
	)
end

---@param hCasual? integer 20
---@param hMedium? integer 20
---@param hHard? integer 20
function HasHeartsByDifficulty(hCasual, hMedium, hHard)
	hCasual = hCasual or 20
	hMedium = hMedium or 20
	hHard = hHard or 20
	return Any(
		HasHearts(hCasual, LogicLevel.Casual),
		HasHearts(hMedium, LogicLevel.Medium),
		HasHearts(hHard, LogicLevel.Hard)
	)
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

function CanRemoveSnow()
	return Any(
		Shovel,
		AnyFlute
	)
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
	local num = 0
	for _, essence in ipairs(EssenceKeys) do
		if Has(essence) then
			num = num + 1
		end
	end
	return num >= required
end

function CanBeatOnox()
	return All(
		HasHeartsByDifficulty(8, 6, 4),
		Any(
			HasBombsToFight,
			HasBombchusToFight
		),
		Any(
			HasRod,
			HardLogic
		),
		WoodSword,
		Feather
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
	local num = 0
	for _, essence in ipairs(EssenceKeys) do
		if Has(essence) then
			num = num + 1
		end
	end
	return num >= required
end

---@param includeDimitri? boolean true
function CanHarvestSeeds(includeDimitri)
	if includeDimitri == nil then includeDimitri = true end
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
	if not CanSwordKill() then
		return false
	end
	-- rules for how many available spots remain
	local gashasPlanted = GashasPlanted()
	local gashaSetting = Tracker:FindObjectForCode(GashaSetting) --[[@as JsonItem]]
	if gashaSetting == nil or gashasPlanted >= gashaSetting.CurrentStage then
		return false
	end
	local ownedGashas = Tracker:ProviderCountForCode(GashaSeeds)
	return ownedGashas > gashasPlanted
end

-- similar to CanPlantGasha, but for collection
-- used to mark off mayor spots
---@param count integer|string
function CanHarvestGasha(count)
	-- rules for being able to collect the nut
	if not CanSwordKill() then
		return false
	end
	-- rules for how many available spots remain
	-- local ownedGashas = Tracker:ProviderCountForCode(GashaSeeds)
	local gashasHarvested = GashasHarvested()
	local gashasPlanted = GashasPlanted()
	if gashasPlanted < tonumber(count) then
		return false
	end
	local gashaSetting = Tracker:FindObjectForCode(GashaSetting) --[[@as JsonItem]]
	if gashaSetting == nil or gashasHarvested >= gashaSetting.CurrentStage then
		return false
	end
	return gashasPlanted > gashasHarvested
end

function GashasHarvested()
	local harvested = 0
	for i = 1, 16 do
		local section = Tracker:FindObjectForCode("@Horon Village/Gasha Spots/Gasha Spot #"..i) --[[@as LocationSection]]
		if section ~= nil then
			harvested = harvested + section.AvailableChestCount
		end
	end
	return 16 - harvested
end

---@param code string
function HasPlanted(code)
	local section = Tracker:FindObjectForCode(code) --[[@as LocationSection]]
	if not CanSwordKill() or section == nil then
		return false
	end
	return section.ChestCount - section.AvailableChestCount ~= 0
end

---@param count integer
function CanSeeGasha(count)
	local gashaSetting = Tracker:FindObjectForCode(GashaSetting)
	return gashaSetting and gashaSetting.CurrentStage >= tonumber(count) and GashasHarvested() < gashaSetting.CurrentStage
end

---@param section LocationSection
function OnSectionChanged(section)
	if GashaIDToRegion[section.FullID] then
		GashaIDToRegion[section.FullID].cleared = section.AccessibilityLevel == AccessibilityLevel.Cleared

		local updateItem = Tracker:FindObjectForCode(UpdateItem) --[[@as JsonItem]]
		updateItem.Active = not updateItem.Active
	elseif AutoCollectLocationTable["Any"][section.FullID] and section.AccessibilityLevel == AccessibilityLevel.Cleared then
		for _, code in ipairs(AutoCollectLocationTable["Any"][section.FullID]) do
			if code:sub(1, 1) == "@" then
				Tracker:FindObjectForCode(code).AvailableChestCount = 0
			else
				Tracker:FindObjectForCode(code).Active = true
			end
		end
	end
end

function GashasPlanted()
	local num = 0
	for _, loc in pairs(GashaIDToRegion) do
		if loc.cleared then
			num = num + 1
		end
	end
	return num
end

-- INTERACT RULES

function CanUseSeeds()
	return Has(Satchel) or Has(Slingshot) or Has(SeedShooter)
end
function CanRun()
	return Has(Satchel) and Has(PegasusSeeds)
end

function HasUpgradedSatchel()
	return Any(
		UpgradedSatchel,
		All(
			CanUseSeeds,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanShootSeedsCombat()
	if CachedValues["CanShootSeedsCombat"] then
		return CachedValues["CanShootSeedsCombat"]
	end
	local val = All(
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

	CachedValues["CanShootSeedsCombat"] = val
	return val
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

---@param allowBombchus? boolean false
function CanDestroyBush(allowBombchus)
	allowBombchus = allowBombchus or false

	return Any(
		CanBreakFlowers(false, allowBombchus),
		Bracelet
	)
end

---@param allowBombchus? boolean false
function CanDestroyBushFlute(allowBombchus)
	allowBombchus = allowBombchus or false

	return Any(
		CanBreakFlowers(true, allowBombchus),
		Bracelet
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

---@param allowCompanion? boolean false
---@param allowBombchus? boolean false
---@return accessibilityLevel
function CanBreakFlowers(allowCompanion, allowBombchus)
	allowCompanion = allowCompanion or false
	allowBombchus = allowBombchus or false

	if CachedValues["CanBreakFlowers"..tostring(allowCompanion)..tostring(allowBombchus)] then
		return CachedValues["CanBreakFlowers"..tostring(allowCompanion)..tostring(allowBombchus)]
	end

	local val = Any(
		HasAnySword,
		MagicBoomerang,
		SwitchHook,
		All(
			allowCompanion,
			AnyFlute
		),
		All(
			Any(
				HasBombsForTiles,
				CanBurnTrees,
				All(
					CanShootSeeds,
					GaleSeeds
				),
				All(
					allowBombchus,
					HasBombchusForTiles
				)
			),
			MediumLogic
		)
	)

	CachedValues["CanBreakFlowers"..tostring(allowCompanion)..tostring(allowBombchus)] = val
	return val
end

function CanBreakCrystal()
	return Any(
		HasAnySword,
		HasBombsForTiles,
		Bracelet,
		All(
			ExpertsRing,
			MediumLogic
		),
		All(
			HasBombchusForTiles,
			MediumLogic
		)
	)
end

function CanHarvestRegrowingBush()
	return Any(
		CanSwordKill,
		HasBombsForTiles,
		All(
			HasBombchusForTiles,
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
		HasBombsForTiles,
		HasSwordBeams,
		SwitchHook
	)
end

function HasSwordBeams()
	return Any(
		All(
			EnergyRing,
			WoodSword,
			MediumLogic
		),
		All(
			NobleSword,
			Any(
				HeartRing2,
				All(
					HeartRing1,
					HardLogic
				)
			),
			MediumLogic
		)
	)
end

function CanBeatGoldenBeast()
	return Any(
		CanSwordKill,
		All(
			CaneOfSomaria,
			HardLogic
		),
		All(
			-- golden beasts have 52 HP
			CountConsumableDamage() >= 52,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CountConsumableDamage()
	if CachedValues["CountConsumableDamage"] then
		return CachedValues["CountConsumableDamage"]
	end

	local seedCountMapping = {
		[0] = 0,
		[1] = 20,
		[2] = 50,
		[3] = 99
	}
	local hasSeeds = Tracker:ProviderCountForCode(Satchel) > 0 or Tracker:ProviderCountForCode(Slingshot) > 0 or Tracker:ProviderCountForCode(SeedShooter) > 0
	local seedCount = seedCountMapping[Tracker:FindObjectForCode(Satchel).CurrentStage]
	if seedCount == 0 then
		seedCount = hasSeeds and 20 or 0
	end
	local bombCount = Tracker:FindObjectForCode(Bombs).CurrentStage * 10
	if bombCount == 100 then
		bombCount = 99
	end
	local bombchuCount = Tracker:FindObjectForCode(Bombchus).CurrentStage * 10
	if bombchuCount == 100 then
		bombchuCount = 99
	end

	local emberDamage = 1
	local scentDamage = 2
	local bombDamage = 4
	-- local bombDamage = Tracker:ProviderCountForCode(BlastRing) == 1 and 6 or 4

	local damage =
		(seedCount * Tracker:ProviderCountForCode(EmberSeeds) * emberDamage) +
		(seedCount * Tracker:ProviderCountForCode(ScentSeeds) * scentDamage) +
		(bombCount * bombDamage) +
		(bombchuCount * bombDamage)

	CachedValues["CountConsumableDamage"] = damage
	return damage
end

function AreEnoughGoldenBeastsSlain()
	local goldenBeastsSetting = Tracker:FindObjectForCode(GoldenBeastsSetting) --[[@as JsonItem]]
	return goldenBeastsSetting and Tracker:ProviderCountForCode(GoldenBeasts) >= goldenBeastsSetting.CurrentStage
end

function MaxJump()
	if CachedValues["MaxJump"] then
		return CachedValues["MaxJump"]
	end
	local j = 0

	if Has(Cape) and CanRun() then
		j = 5
	elseif Has(Cape) then
		j = 3
	elseif Has(Feather) and CanRun() then
		j = 2
	elseif Has(Feather) then
		j = 1
	end

	CachedValues["MaxJump"] = j
	return j
end

---@param allowCompanion? boolean true
function Jump1(allowCompanion)
	if allowCompanion == nil then allowCompanion = true end
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

---@param allowCompanion boolean true
function JumpLiquid1(allowCompanion)
	if allowCompanion == nil then allowCompanion = true end
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
			HasBombsForBombJump,
			HardLogic
		)
	)
end

function JumpLiquid3()
	return Any(
		MaxJump() >= 3,
		All(
			MaxJump() >= 2,
			HasBombsForBombJump,
			HardLogic
		)
	)
end

function JumpLiquid4()
	return Any(
		MaxJump() >= 4,
		All(
			MaxJump() >= 3,
			HasBombsForBombJump,
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
		HasBombsForBombJump,
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

---@param pitAvailable? boolean false
---@param allowGale? boolean true
---@param allowCane? boolean true
---@return accessibilityLevel
function CanNormalKill(pitAvailable, allowGale, allowCane)
	pitAvailable = pitAvailable or false
	if allowGale == nil then allowGale = true end
	if allowCane == nil then allowCane = true end

	if CachedValues["CanNormalKill"..tostring(pitAvailable)..tostring(allowGale)..tostring(allowCane)] then
		return CachedValues["CanNormalKill"..tostring(pitAvailable)..tostring(allowGale)..tostring(allowCane)]
	end

	local val = Any(
		CanNormalSatchelKill(allowGale),
		CanNormalSlingshotKill(allowGale),
		All(
			pitAvailable,
			CanKillWithPit
		),
		CanSwordPunchKill,
		All(
			HasBombsToFight,
			MediumLogic
		),
		HasBombchusToFight,
		All(
			allowCane,
			CaneOfSomaria,
			MediumLogic
		)
	)

	CachedValues["CanNormalKill"..tostring(pitAvailable)..tostring(allowGale)..tostring(allowCane)] = val
	return val
end

---@param allowGale? boolean true
---@return accessibilityLevel
function CanNormalSatchelKill(allowGale)
	if allowGale == nil then allowGale = true end

	if CachedValues["CanNormalSatchelKill"..tostring(allowGale)] then
		return CachedValues["CanNormalSatchelKill"..tostring(allowGale)]
	end

	local val = All(
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

	CachedValues["CanNormalSatchelKill"..tostring(allowGale)] = val
	return val
end

---@param allowGale? boolean true
---@return accessibilityLevel
function CanNormalSlingshotKill(allowGale)
	if allowGale == nil then allowGale = true end

	if CachedValues["CanNormalSlingshotKill"..tostring(allowGale)] then
		return CachedValues["CanNormalSlingshotKill"..tostring(allowGale)]
	end

	local val = All(
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

	CachedValues["CanNormalSlingshotKill"..tostring(allowGale)] = val
	return val
end

---@param allowCane? boolean false
---@param allowBombchus? boolean false
---@return accessibilityLevel
function CanArmorKill(allowCane, allowBombchus)
	allowCane = allowCane or false
	allowBombchus = allowBombchus or false

	if CachedValues["CanArmorKill"..tostring(allowCane)..tostring(allowBombchus)] then
		return CachedValues["CanArmorKill"..tostring(allowCane)..tostring(allowBombchus)]
	end

	local val = Any(
		CanSwordPunchKill,
		All(
			HasBombsToFight,
			MediumLogic
		),
		All(
			allowBombchus,
			HasBombchusToFight
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

	CachedValues["CanArmorKill"..tostring(allowCane)..tostring(allowBombchus)] = val
	return val
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

---@param pitAvailable? boolean false
function CanKillMoldorm(pitAvailable)
	pitAvailable = pitAvailable or false
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

function CanCompleteLinkedPuzzle()
	if Has(ShuffleDungeonOff) then
		return true
	end
	local foundDungeons = 0
	for i = 1, 8 do
		if Tracker:FindObjectForCode("d"..i.."_ent_selector").CurrentStage ~= 0 then
			foundDungeons = foundDungeons + 1
		end
	end
	return foundDungeons >= 7
end

function CanFarmRupees()
	return Any(
		CanNormalKill(false, false),
		Shovel
	)
end

---@param count integer
function HasRupees(count)
	local rupees
	local bonusRupees
	local oolRupees

	if CachedValues["HasRupees"] then
		rupees = CachedValues["HasRupees"][1]
		bonusRupees = CachedValues["HasRupees"][2]
		oolRupees = CachedValues["HasRupees"][3]
	else
		rupees = Tracker:ProviderCountForCode(RupeeCount)
		bonusRupees = 0
		oolRupees = 0

		-- rupee rooms
		local snakeRupeeAmount = 150
		if Has(EventSnakeRupees) then
			if MediumLogic() == AccessibilityLevel.Normal then
				bonusRupees = bonusRupees + snakeRupeeAmount
			else
				oolRupees = oolRupees + snakeRupeeAmount
			end
		end

		local ancientRupeeAmount = 90
		if Has(EventAncientRupees) then
			if MediumLogic() == AccessibilityLevel.Normal then
				bonusRupees = bonusRupees + ancientRupeeAmount
			else
				oolRupees = oolRupees + snakeRupeeAmount
			end
		end

		if Tracker:FindObjectForCode("shuffle_old_men").CurrentStage ~= 4 then
			for _, val in pairs(OldMenValues) do
				-- val[1] = rupee amount
				-- val[2] = old man event item
				if val[1] < 0 or Has(val[2]) then
					-- first case: always subtract rupees even if you can't reach them yet
					-- otherwise you could "lose" access to a shop if one steals from you
					rupees = rupees + val[1]
				end
			end
		end

		CachedValues["HasRupees"] = {rupees, bonusRupees, oolRupees}
	end


	return All(
		CanFarmRupees,
		Any(
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

---@param count integer
---@return accessibilityLevel
function HasOreChunks(count)
	return All(
		CanFarmOreChunks,
		Any(
			Tracker:ProviderCountForCode(OreChunkCount) >= count,
			ShuffleGoldOresVanilla
		)
	)
end

function CanEncounterMaple()
	return CanNormalKill(false, false)
end
function CanMapleTrade()
	return Has(LonLonEgg)
end
---require a certain percent of progression items to soft-gate Maple logic</br>
---just an approximation, as we can't know exactly which items are progression, esp gashas and rupees
---@param pct integer
function CanAnnoyMaple(pct)
	local itemCount = 52 -- arbitrary number that relatively matches base item count
	-- add count based on settings
	for _, val in pairs(EssencesInWorld) do
		if val then
			itemCount = itemCount + 1
		end
	end
	if HardLogic() > AccessibilityLevel.Normal then
		itemCount = itemCount + 2
	elseif Has(Medium) then
		itemCount = itemCount + 5
	else
		itemCount = itemCount + 7
	end
	itemCount = itemCount + Tracker:FindObjectForCode(GashaSetting).CurrentStage
	if Has(MasterKeysBoth) then
		itemCount = itemCount + 8
	elseif Has(MasterKeysSmall) then
		itemCount = itemCount + 16
	else
		itemCount = itemCount + 35
	end

	return Any(
		Tracker:ProviderCountForCode("progitem") / itemCount * 100 >= pct,
		AccessibilityLevel.SequenceBreak -- items are always available
	)
end

function CanEnterTarm()
	return Tracker:ProviderCountForCode(Jewels) >= Tracker:FindObjectForCode(TarmGateSetting).CurrentStage
end

---@param allowDefault? boolean Allow use of default season (coming from pedestal). Default: false
---@param forceDeku? boolean Assume you can reach the Deku. Default: false
---@return boolean|accessibilityLevel
function CanLostWoods(allowDefault, forceDeku)
	allowDefault = allowDefault or false
	forceDeku = forceDeku or false

	local defaultSeason = IndexToSeason[Tracker:FindObjectForCode("lost_woods_season").CurrentStage]
	local canDefault = defaultSeason ~= UnknownSeason

	for i = 1, 4 do
		local season = IndexToSeason[Tracker:FindObjectForCode("lost_woods_"..i).CurrentStage]
		canDefault = allowDefault and canDefault and defaultSeason == season
		if not canDefault and (season == UnknownSeason or not Has(season)) then
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
---@param allowDefault? boolean Allow use of default season (coming from Tarm). Default: false
---@param forceDeku? boolean Assume you can reach the Deku. Default: false
---@return boolean|accessibilityLevel
function CanPedestal(allowDefault, forceDeku)
	allowDefault = allowDefault or false
	forceDeku = forceDeku or false

	local defaultSeason = IndexToSeason[Tracker:FindObjectForCode("lost_woods_season").CurrentStage]
	local canDefault = defaultSeason ~= UnknownSeason

	for i = 1, 4 do
		local season = IndexToSeason[Tracker:FindObjectForCode("pedestal_"..i).CurrentStage]
		canDefault = allowDefault and canDefault and defaultSeason == season
		if not canDefault and (season == UnknownSeason or not Has(season)) then
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

---@param area roosterArea
---@param anyAmt integer
---@param topAmt integer
---@param botAmt integer
---@param visited? string[] { }
---@return accessibilityLevel
function Roosters(area, anyAmt, topAmt, botAmt, visited)
	if not area then return AccessibilityLevel.None end
	visited = visited or {}
	table.insert(visited, area)

	if anyAmt > topAmt + botAmt then
		return Any(
			Roosters(area, anyAmt, topAmt + 1, botAmt, visited),
			Roosters(area, anyAmt, topAmt, botAmt + 1, visited)
		)
	elseif area == RoosterArea.MtCucco then
		local rules = {}
		if botAmt > 2 then
			error("Not implemented")
		end
		if botAmt > 0 then
			table.insert(rules, All(Any(Spring, SunkenCitySpring), Any(CanBreakFlowers, SpringBanana)))
		end
		if topAmt > 3 then
			error("Not implemented")
		end
		if topAmt == 3 then
			table.insert(rules, All(Shovel, Boomerang))
		elseif topAmt == 2 then
			table.insert(rules, Any(Shovel, All(Boomerang, CanRun)))
		end
		return All(table.unpack(rules))
	elseif area == RoosterArea.Horon then
		return All(
			Any(Jump3, Flippers, Dimitri),
			Roosters(RoosterArea.MtCucco, anyAmt, topAmt, botAmt)
		)
	elseif area == RoosterArea.Sunken then
		local rule = Any(
			All(
				Roosters(RoosterArea.Horon, anyAmt, topAmt, botAmt, visited),
				Any(
					AnyFlute,
					All(NatzuIsMoosh, JumpLiquid4)
				)
			),
			All(
				Roosters(RoosterArea.Horon, anyAmt + 1, topAmt + 1, botAmt, visited),
				NatzuIsMoosh,
				Jump3
			),
			All(
				NatzuIsRicky,
				Flippers,
				Any(CanBreakFlowers, Roosters(RoosterArea.MtCucco, anyAmt + 1, topAmt, botAmt, visited)),
				Roosters(RoosterArea.MtCucco, anyAmt, topAmt, botAmt, visited)
			)
		)
		if not TableContains(visited, RoosterArea.Suburbs) then
			rule = Any(
				rule,
				All(
					Any(Spring, EasternSuburbsSpring),
					Roosters(RoosterArea.Suburbs, anyAmt, topAmt, botAmt, visited)
				)
			)
		end
		return rule
	elseif area == RoosterArea.Suburbs then
		return Any(
			Roosters(RoosterArea.Sunken, anyAmt, topAmt, botAmt, visited),
			All(
				Roosters(RoosterArea.Horon, anyAmt, topAmt, botAmt, visited),
				CanBurnTrees
			),
			All(
				Roosters(RoosterArea.Horon, anyAmt + 1, topAmt, botAmt, visited),
				Any(Winter, NorthHoronWinter),
				Any(NorthHoronSummer, Spring, Autumn, Winter),
				Any(Flippers, Dimitri)
			)
		)
	elseif area == RoosterArea.MoblinRoad then
		return Any(
			All(
				Any(Winter, EasternSuburbsWinter),
				Roosters(RoosterArea.Suburbs, anyAmt, topAmt, botAmt, visited)
			),
			Roosters(RoosterArea.Sunken, anyAmt, topAmt + 1, botAmt + 1, visited)
		)
	elseif area == RoosterArea.Swamp then
		return Any(
			All(
				Any(
					Summer,
					HolodrumPlainSummer,
					Jump4,
					Ricky,
					Moosh
				),
				Roosters(RoosterArea.Horon, anyAmt, topAmt, botAmt, visited)
			),
			Roosters(RoosterArea.Horon, anyAmt + 1, topAmt, botAmt + 1, visited)
		)
	elseif area == RoosterArea.Tarm then
		return All(
			CanEnterTarm,
			Any(
				Summer,
				LostWoodsSummer,
				All(
					Any(Autumn, LostWoodsAutumn),
					MagicBoomerang,
					Any(Jump1(false), HardLogic),
					MediumLogic
				)
			),
			Any(Winter, LostWoodsWinter),
			Any(Spring, Summer, Autumn),
			Autumn,
			CanDestroyMushroom,
			Any(
				CanLostWoods,
				All(
					CanLostWoods(true),
					CanPedestal
				)
			)
		)
	end

	error("Not implemented")
end

---@param area roosterArea
---@param anyAmt integer
---@param topAmt integer
---@param botAmt integer
---@return accessibilityLevel
function GetCuccos(area, anyAmt, topAmt, botAmt)
	local cacheStr = "GetCuccos"..area..tostring(anyAmt)..tostring(topAmt)..tostring(botAmt)
	if CachedValues[cacheStr] then
		return CachedValues[cacheStr]
	end

	local access = Roosters(area, anyAmt, topAmt, botAmt)

	CachedValues[cacheStr] = access
	return access
end

---@param key string String for the small key
---@param master string String for the master key
---@param needed integer How many keys are logically required
---@param ool? integer How many keys can be used minimally
function HasKeys(key, master, needed, ool)
	local currentKeys = Tracker:ProviderCountForCode(key)
	return Any(
		All(MasterKeysOff, currentKeys >= needed),
		All(
			Any(MasterKeysSmall, MasterKeysBoth),
			master
		),
		All(
			ool ~= nil and currentKeys >= ool,
			AccessibilityLevel.SequenceBreak
		)
	)
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
function HasD2BossKey()
	return Any(
		D2BossKey,
		All(
			MasterKeysBoth,
			D2MasterKey
		)
	)
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
function HasD4BossKey()
	return Any(
		D4BossKey,
		All(
			MasterKeysBoth,
			D4MasterKey
		)
	)
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
function HasD6BossKey()
	return Any(
		D6BossKey,
		All(
			MasterKeysBoth,
			D6MasterKey
		)
	)
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
function HasD8BossKey()
	return Any(
		D8BossKey,
		All(
			MasterKeysBoth,
			D8MasterKey
		)
	)
end

function DungeonSettings()
	if not LOADED then
		return
	end
	if Tracker:FindObjectForCode("shuffle_dungeons").CurrentStage == 0 then
		for index, dungeon in ipairs(DungeonList) do
			Tracker:FindObjectForCode(dungeon.."_ent_selector").CurrentStage = index
		end
	else
		for _, dungeon in ipairs(DungeonList) do
			Tracker:FindObjectForCode(dungeon.."_ent_selector").CurrentStage = 0
		end
	end
end

local function DisplayDungeons()
	if Tracker:FindObjectForCode("shuffle_dungeons").CurrentStage == 1 and Tracker:FindObjectForCode("fill_dungeons").CurrentStage == 1 then
		for _, dungeon in ipairs(DungeonList) do
			Tracker:FindObjectForCode(dungeon.."_ent_selector").CurrentStage = Tracker:FindObjectForCode(dungeon.."_ent_selector_hidden").CurrentStage
		end
	end
end

function SeasonSettings()
	if not LOADED then
		return
	end
	local regionList = {"north_horon_season", "suburbs_season", "wow_season", "plain_season", "swamp_season", "sunken_season", "lost_woods_season", "tarm_ruins_season", "coast_season", "remains_season"}
	if Tracker:FindObjectForCode("default_seasons").CurrentStage == 0 then
		for _, region in ipairs(regionList) do
			Tracker:FindObjectForCode(region).CurrentStage = DefaultSeasons[region]
		end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 1 or Tracker:FindObjectForCode("default_seasons").CurrentStage == 2 then
		for _, region in ipairs(regionList) do
			Tracker:FindObjectForCode(region).CurrentStage = 4
			Tracker:FindObjectForCode("horon_village_season").CurrentStage = 4
		end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage >= 3 then
		local season = Tracker:FindObjectForCode("default_seasons").CurrentStage - 3
		for _, region in ipairs(regionList) do
			Tracker:FindObjectForCode(region).CurrentStage = season
			if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
				Tracker:FindObjectForCode("horon_village_season").CurrentStage = season
			end
		end
	end
end

local function DisplaySeasons()
	if (Tracker:FindObjectForCode("default_seasons").CurrentStage == 1 or Tracker:FindObjectForCode("default_seasons").CurrentStage == 2) and Tracker:FindObjectForCode("fill_seasons").CurrentStage == 1 then
		local regionList = {"horon_village_season", "north_horon_season", "suburbs_season", "wow_season", "plain_season", "swamp_season", "sunken_season", "lost_woods_season", "tarm_ruins_season", "coast_season", "remains_season"}
		for _, region in ipairs(regionList) do
			Tracker:FindObjectForCode(region).CurrentStage = Tracker:FindObjectForCode(region.."_hidden").CurrentStage
		end
	end
end

function VanillaPortals()
	if not LOADED then
		return
	end
	local hol_portals = {"suburbs", "swamp", "lake", "mtcucco", "horon", "remains", "upremains"}
	local sub_portals = {"mountain", "market", "furnace", "village", "pirates", "volcano", "d8"}
	if Tracker:FindObjectForCode("shuffle_portals").CurrentStage == 0 then
		for index, portal in pairs(hol_portals) do
			Tracker:FindObjectForCode(portal.."_portal_selector").CurrentStage = index
		end
		for index, portal in pairs(sub_portals) do
			Tracker:FindObjectForCode(portal.."_portal_selector").CurrentStage = index + 6
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

local function DisplayPortals()
	if Tracker:FindObjectForCode("fill_portals").CurrentStage == 1 then
		if Tracker:FindObjectForCode("shuffle_portals").CurrentStage == 1 or Tracker:FindObjectForCode("shuffle_portals").CurrentStage == 2 then
			local portal_list = {"suburbs","swamp","lake","mtcucco","horon","remains","upremains","mountain","market","furnace","village","pirates","volcano","d8"}
			for _, portal in pairs(portal_list) do
				Tracker:FindObjectForCode(portal.."_portal_selector").CurrentStage = Tracker:FindObjectForCode(portal.."_portal_selector_hidden").CurrentStage
			end
		end
	end
end

local function DisplayLostWoods()
	if not LOADED then
		return
	end
	if Has(LostWoodsVanilla) then
		for i = 1, 4 do
			Tracker:FindObjectForCode("lost_woods_"..i).CurrentStage = LostWoodsDefault[i]
			if i < 4 then
				Tracker:FindObjectForCode("lost_woods_d_"..i).CurrentStage = i - 1
			end
		end
	else
		for i = 1, 4 do
			Tracker:FindObjectForCode("lost_woods_"..i).CurrentStage = 4
			if i < 4 then
				Tracker:FindObjectForCode("lost_woods_d_"..i).CurrentStage = 4
			end
		end
	end
end
local function DisplayPedestal()
	if not LOADED then
		return
	end
	if Has(PedestalVanilla) then
		for i = 1, 4 do
			Tracker:FindObjectForCode("pedestal_"..i).CurrentStage = LostWoodsDefault[i]
			if i < 4 then
				Tracker:FindObjectForCode("pedestal_d_"..i).CurrentStage = 0
			end
		end
	else
		for i = 1, 4 do
			Tracker:FindObjectForCode("pedestal_"..i).CurrentStage = 4
			if i < 4 then
				Tracker:FindObjectForCode("pedestal_d_"..i).CurrentStage = 4
			end
		end
	end
end

-- Dungeon number display setting
function OnChangeDungeonImages()
	local setting = Tracker:FindObjectForCode("dungeon_number_setting") --[[@as JsonItem]]
	for i = 0, 9 do
		if i == 9 then
			i = 11
		end
		local dungeon = Tracker:FindObjectForCode("d"..i.."_ent_selector") --[[@as JsonItem]]
		dungeon.Icon = ImageReference:FromPackRelativePath(setting.CurrentStage == 0 and DungeonImageDict[dungeon.CurrentStage][1] or DungeonImageDict[dungeon.CurrentStage][2])
	end
end

local function OnFrameHandler()
	ScriptHost:RemoveOnFrameHandler("load handler")
	LOADED = true
end

ScriptHost:AddWatchForCode("dungeon settings handler", "shuffle_dungeons", DungeonSettings)
ScriptHost:AddWatchForCode("dungeons handler", "fill_dungeons", DisplayDungeons)
ScriptHost:AddWatchForCode("seasons settings handler", "default_seasons", SeasonSettings)
ScriptHost:AddWatchForCode("seasons handler", "fill_seasons", DisplaySeasons)
ScriptHost:AddWatchForCode("portal settings handler", "shuffle_portals", VanillaPortals)
ScriptHost:AddWatchForCode("portal handler", "fill_portals", DisplayPortals)
ScriptHost:AddWatchForCode("lost woods handler", "randomize_lost_woods_main_sequence", DisplayLostWoods)
ScriptHost:AddWatchForCode("pedestal handler", "randomize_lost_woods_item_sequence", DisplayPedestal)
ScriptHost:AddOnLocationSectionChangedHandler("section changed handler", OnSectionChanged)
ScriptHost:AddOnFrameHandler("load handler", OnFrameHandler)
ScriptHost:AddWatchForCode("see companion handler", Companion, function()
	local companion = Tracker:FindObjectForCode(Companion) --[[@as JsonItem]]
	local location = Tracker:FindObjectForCode("@Natzu/See Your Companion/") --[[@as LocationSection]]
	if companion.CurrentStage == 3 then
		location.AvailableChestCount = 1
	else
		location.AvailableChestCount = 0
	end
end)
-- "See the Season" locations
for i = 1, #SeeSeasonVars do
	ScriptHost:AddWatchForCode(SeeSeasonVars[i][1], SeeSeasonVars[i][2], function()
		local season = Tracker:FindObjectForCode(SeeSeasonVars[i][2]) --[[@as JsonItem]]
		local location = Tracker:FindObjectForCode(SeeSeasonVars[i][3]) --[[@as LocationSection]]
		if season.CurrentStage == 4 then
			location.AvailableChestCount = 1
		else
			location.AvailableChestCount = 0
		end
	end)
end
-- "Enter portal" locations
for i = 1, #PortalSetVars do
	ScriptHost:AddWatchForCode(PortalSetVars[i][1], PortalSetVars[i][2], function()
		local portal = Tracker:FindObjectForCode(PortalSetVars[i][2]) --[[@as JsonItem]]
		local location = Tracker:FindObjectForCode(PortalSetVars[i][3]) --[[@as LocationSection]]
		if portal.CurrentStage == PortalDictionary[PortalSetVars[i][1]]['unknown'] then
			location.AvailableChestCount = 1
		else
			location.AvailableChestCount = 0
		end
	end)
end

for _, val in ipairs(DungeonNumberWatch) do
	ScriptHost:AddWatchForCode("dungeon numbers "..val, val, OnChangeDungeonImages)
end