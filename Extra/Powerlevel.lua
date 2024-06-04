------------------------------------------------------------------------------------------------------
---------------------------------------------- Party UP! ---------------------------------------------
------------------------------------------------------------------------------------------------------

MB_powerLeveler = {
	Active = false, -- True of false, work or not working 
	Player = "Suecia" -- Your main guy eveyone is following
}

MB_powerLevelParty = { -- Try to have in each grp 1 caster
	
	"Zwartje", -- Leader GRP 1
	"Despacitos",
	"Hurricain",
	"Dembolo",
	"Dimbolo",

	--[[-- Party 1 NO TAB
	"Hurricain", -- Leader GRP 1
	"Eddgies",
	"Morladin",
	"Despacitos",
	"Watchmojo",

	-- Party 2 SHIFT TAB
	"Wivea", -- Leader GRP 2
	"Fizea",
	"Fiwea",
	"Viclun",
	"Zwartje",

	-- Party 3 CONTROL TAB
	"Dimbolo", -- Leader GRP 3
	"Deino",
	"Dienos",
	"Xumavoid",
	"Dembolo",

	-- Party 4 ALT TAB
	"Stockfish", -- Leader GRP 4
	"Angerissue",
	"Sweeping",
	"Alphazero",
	"Goatquote",]]
}

local myName =  UnitName("player")
local myClass = UnitClass("player")

function mb_powerLeveler(healPowerleveler, doAoeDamage)
	
	if not MB_powerLeveler.Player then Print("WARNING: You have not chosen a powerLeveler") end
	
	if myClass == "Mage" then mb_powerMage(doAoeDamage) return end
	if myClass == "Shaman" then mb_powerShaman(healPowerleveler) return end
	if myClass == "Priest" then mb_powerPriest(healPowerleveler) return end
	if myClass == "Rogue" then mb_powerRogue() return end
	if myClass == "Warrior" then mb_powerWarrior() return end
	if myClass == "Warlock" then mb_powerWarlock() return end
	if myClass == "Druid" then mb_powerDruid(healPowerleveler) return end
	if myClass == "Hunter" then mb_powerHunter() return end
end

function mb_verifySelector()

	if not (IsShiftKeyDown() or IsControlKeyDown() or IsAltKeyDown()) then

		if mb_isInGroup(MB_groupOneLeader) or (myName == MB_groupOneLeader) then
			return true
		end

	elseif IsShiftKeyDown() and not (IsAltKeyDown() or IsControlKeyDown()) then

		if mb_isInGroup(MB_groupTwoLeader) or (myName == MB_groupTwoLeader) then
			return true
		end

	elseif IsControlKeyDown() and not (IsShiftKeyDown() or IsAltKeyDown()) then

		if mb_isInGroup(MB_groupThreeLeader) or (myName == MB_groupThreeLeader) then
			return true
		end

	elseif IsAltKeyDown() and not (IsShiftKeyDown() or IsControlKeyDown()) then

		if mb_isInGroup(MB_groupFourLeader) or (myName == MB_groupFourLeader) then
			return true
		end
	end
	return false
end

MB_groupOneLeader = MB_powerLevelParty[1]
MB_groupTwoLeader = MB_powerLevelParty[6]
MB_groupThreeLeader = MB_powerLevelParty[11]
MB_groupFourLeader = MB_powerLevelParty[16]

function mb_levelPartyUP()
			
	if myName == MB_groupOneLeader then

		for i = 2, 5 do
			if not mb_isInGroup(MB_powerLevelParty[i]) then
				InviteByName(MB_powerLevelParty[i])
			end
		end
	
	elseif myName == MB_groupTwoLeader then

		for i = 7, 10 do
			if not mb_isInGroup(MB_powerLevelParty[i]) then
				InviteByName(MB_powerLevelParty[i])
			end
		end

	elseif myName == MB_groupThreeLeader then

		for i = 12, 15 do
			if not mb_isInGroup(MB_powerLevelParty[i]) then
				InviteByName(MB_powerLevelParty[i])
			end
		end

	elseif myName == MB_groupFourLeader then

		for i = 17, 20 do
			if not mb_isInGroup(MB_powerLevelParty[i]) then
				InviteByName(MB_powerLevelParty[i])
			end
		end
	end

	SetLootMethod("freeforall")
end

------------------------------------------------------------------------------------------------------
------------------------------------------ START MAGE CODE! ------------------------------------------
------------------------------------------------------------------------------------------------------

function mb_powerMage(doAoeDamage)

	AssistByName(MB_powerLeveler.Player)

	if doAoeDamage then

		if not mb_hasBuffOrDebuff("Clearcasting", "player", "buff") then
			
			CastSpellByName("Arcane Explosion(Rank 1)")
			return
		else
	
			CastSpellByName("Arcane Explosion")
		end
		return
	end

	if not mb_verifySelector() then return end

	CastSpellByName("Fireball(Rank 1)")

	if mb_inMeleeRange() then

		CastSpellByName("Arcane Explosion(Rank 1)") 
	end
end

------------------------------------------------------------------------------------------------------
----------------------------------------- START SHAMAN CODE! -----------------------------------------
------------------------------------------------------------------------------------------------------

function mb_powerShaman(healPowerleveler)
	
	if healPowerleveler then

		TargetByName(MB_powerLeveler.Player)

		if UnitName("target") == MB_powerLeveler.Player and mb_healthPct("target") < 0.75 then

			CastSpellByName("Healing Wave(rank 5)")
		else
			TargetLastTarget()
		end

		return
	end

	AssistByName(MB_powerLeveler.Player)

	if not mb_verifySelector() then return end

	MBHToggle("Autoheal Healing Wave")
	CastSpellByName("Lightning Bolt(Rank 1)")
end

------------------------------------------------------------------------------------------------------
----------------------------------------- START PRIEST CODE! -----------------------------------------
------------------------------------------------------------------------------------------------------

function mb_powerPriest(healPowerleveler)

	if healPowerleveler then

		TargetByName(MB_powerLeveler.Player)

		if UnitName("target") == MB_powerLeveler.Player and mb_healthPct("target") < 0.75 then

			CastSpellByName("Heal(rank 2)")
		else
			TargetLastTarget()
		end
		
		return
	end

	AssistByName(MB_powerLeveler.Player)

	if not mb_verifySelector() then return end

	MBHToggle("Autoheal Heal")
	CastSpellByName("Smite(Rank 1)")
end

------------------------------------------------------------------------------------------------------
---------------------------------------- START WARLOCK CODE! -----------------------------------------
------------------------------------------------------------------------------------------------------

function mb_powerWarlock()

	AssistByName(MB_powerLeveler.Player)

	if not mb_verifySelector() then return end

	CastSpellByName("Shadow Bolt(Rank 1)")
end

------------------------------------------------------------------------------------------------------
----------------------------------------- START DRUID CODE! ------------------------------------------
------------------------------------------------------------------------------------------------------

function mb_powerDruid(healPowerleveler)

	if healPowerleveler then

		TargetByName(MB_powerLeveler.Player)

		if UnitName("target") == MB_powerLeveler.Player and mb_healthPct("target") < 0.75 then

			CastSpellByName("Healing Touch(rank 3)")
		else
			TargetLastTarget()
		end
		
		return
	end
	
	AssistByName(MB_powerLeveler.Player)

	if not mb_verifySelector() then return end

	MBHToggle("Autoheal Healing Touch")
	CastSpellByName("Wrath(Rank 1)")
end

------------------------------------------------------------------------------------------------------
----------------------------------------- START HUNTER CODE! -----------------------------------------
------------------------------------------------------------------------------------------------------

function mb_powerHunter()

	AssistByName(MB_powerLeveler.Player)

	if not mb_verifySelector() then return end

	mb_autoRangedAttack()
end

------------------------------------------------------------------------------------------------------
----------------------------------------- START WARRIOR CODE! ----------------------------------------
------------------------------------------------------------------------------------------------------

function mb_powerWarrior()

	AssistByName(MB_powerLeveler.Player)

	if not mb_verifySelector() then return end

	mb_autoAttack()
end

------------------------------------------------------------------------------------------------------
------------------------------------------ START ROGUE CODE! -----------------------------------------
------------------------------------------------------------------------------------------------------

function mb_powerRogue()

	AssistByName(MB_powerLeveler.Player)

	if not mb_verifySelector() then return end

	mb_autoAttack()
end

------------------------------------------------------------------------------------------------------
---------------------------------------------- END CODE! ---------------------------------------------
------------------------------------------------------------------------------------------------------

function mb_selectedLoathebSpore()

	--if not mb_inCombat("player") then return end

	if not MB_loathebSporeRunning.Active then

		if UnitInRaid("player") then

			SendAddonMessage(MB_RAID, "MB_NEXTSPORE", "RAID")				
		else
			SendAddonMessage(MB_RAID, "MB_NEXTSPORE")
		end

		MB_loathebSporeRunning.Active = true
		MB_loathebSporeRunning.Time = GetTime() + 12
	end
end

function mb_followSporeLoatheb()

	--if not mb_inCombat("player") then return end

	if not mb_isAlive(MBID[MB_myLoathebSpore[MB_loathebSporeIndex][1]]) then return end

	if myName == MB_myLoathebReminderWhoToFollow then

		mb_message(MB_myLoathebSpore[MB_loathebSporeIndex][1].." Go!", 24)
	end

	for k, follower in pairs(MB_myLoathebSpore[MB_loathebSporeIndex][2]) do

		if myName == follower then

			FollowByName(MB_myLoathebSpore[MB_loathebSporeIndex][1])
			return
		end
	end
end