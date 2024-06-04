------------------------------------------------------------------------------------------------------
--------------------------------------------- Craftables! --------------------------------------------
------------------------------------------------------------------------------------------------------

--------------------------------------------- Transmutes ---------------------------------------------
	-- MB_useMoonclothCooldowns => True or False (Work or Not)
	-- MB_onlyTransMuteBars => True or False (Work or Not) will ignore all of MB_TransmuteBars, MB_TransmuteLiving and MB_TransmuteWater

	MB_useMoonclothCooldowns = false
	MB_onlyTransMuteBars = false

	-------------------------------------- Transmutes Tactics ----------------------------------------
	-- MB_TransmuteBars, Arcinite Bars
	-- MB_TransmuteLiving, Essence of Living
	-- MB_TransmuteWater, Essence of Water
	--------------------------------------------------------------------------------------------------

	MB_TransmuteBars = {
		"Ajlano",
		"Rows",
		"Schmug",
		"Mukup"
	}

	MB_TransmuteLiving = { -- Earth
		"Trumptvänty",	
		"Smalheal",
		"Cykcyk",
		"Jolf",
		"Æces",
		"Chirichi",
		"Shlongz",
		"Dl",
		"Adorii",
		"Aip"
	}	

	MB_TransmuteWater = { -- Undead
		"Dekot",
		"Mantodea",
		"Baldred",
		"Heffodin",
		"Naturka"
	}

--------------------------------------------- Transmutes ---------------------------------------------

MB_potionTraders = { -- When ur buffingand ctrlkeydown, these toons will collect those pots
	Active = true, -- Working or not

	MajorMana = "Smalheal", -- The toon that will be giving out mana pots to all healers that need it
}

local myClass = UnitClass("player")
local myName = UnitName("player")
local myRace = UnitRace("player")

function mb_tradeCooldownMaterialsToLeader() -- This is our trade to Leader function
	
	if not MB_raidLeader then 
		RunLine("/w "..MB_raidinviter.." Press setFOCUS!")
		return
	end

	if myName == MB_raidLeader then 
		return 
	end

	if mb_haveInBags("Mooncloth") then 
		mb_pickAndDropItemOnTarget("Mooncloth", MBID[MB_raidLeader])
	end

	if mb_haveInBags("Hourglass Sand") then 
		mb_pickAndDropItemOnTarget("Hourglass Sand", MBID[MB_raidLeader])
	end

	if mb_haveInBags("Arcanite Bar") then 
		mb_pickAndDropItemOnTarget("Arcanite Bar", MBID[MB_raidLeader])
	end
	
	if mb_haveInBags("Refined Deeprock Salt") then 
		mb_pickAndDropItemOnTarget("Refined Deeprock Salt", MBID[MB_raidLeader])
	end

	if mb_haveInBags("Living Essence") then 
		mb_pickAndDropItemOnTarget("Living Essence", MBID[MB_raidLeader])
	end

	if mb_haveInBags("Essence of Water") then 
		mb_pickAndDropItemOnTarget("Essence of Water", MBID[MB_raidLeader])
	end

	if mb_haveInBags("Cured Rugged Hide") then 
		mb_pickAndDropItemOnTarget("Cured Rugged Hide", MBID[MB_raidLeader])
	end

	if not MB_onlyTransMuteBars then
		for k, name in pairs(MB_TransmuteLiving) do
			if myName == name then
				if mb_haveInBags("Arcane Crystal") then 
					mb_pickAndDropItemOnTarget("Arcane Crystal", MBID[MB_raidLeader])
				end
			end
		end

		for k, name in pairs(MB_TransmuteWater) do
			if myName == name then
				if mb_haveInBags("Arcane Crystal") then 
					mb_pickAndDropItemOnTarget("Arcane Crystal", MBID[MB_raidLeader])
				end
			end
		end
	end
end

function mb_useTradeCooldowns()
	
	if mb_knowSpell("Alchemy") and not mb_imBusy() then 

		if MB_onlyTransMuteBars then

			if mb_haveInBags("Philosopher's Stone") then

				if mb_haveInBags("Thorium Bar") and mb_haveInBags("Arcane Crystal") then

					CastSpellByName("Alchemy")
					mb_useTradeSkill("Transmute: Arcanite")

				elseif mb_haveInBags("Thorium Bar") and not mb_haveInBags("Arcane Crystal") then

					mb_message(GetColors("Missing Arcane Crystal", 60))

				elseif not mb_haveInBags("Thorium Bar") and mb_haveInBags("Arcane Crystal") then

					mb_message(GetColors("Missing Thorium Bar", 60))

				elseif not mb_haveInBags("Thorium Bar") and not mb_haveInBags("Arcane Crystal") then

					mb_message(GetColors("Missing Thorium Bar and Arcane Crystal", 60))
				end
			else

				mb_message("Missing Philosopher's Stone", 60)
			end

		else

			for k, name in pairs(MB_TransmuteBars) do
				if myName == name then
					if mb_haveInBags("Philosopher's Stone") then

						if mb_haveInBags("Thorium Bar") and mb_haveInBags("Arcane Crystal") then

							CastSpellByName("Alchemy")
							mb_useTradeSkill("Transmute: Arcanite")

						elseif mb_haveInBags("Thorium Bar") and not mb_haveInBags("Arcane Crystal") then

							mb_message(GetColors("Missing Arcane Crystal", 60))

						elseif not mb_haveInBags("Thorium Bar") and mb_haveInBags("Arcane Crystal") then

							mb_message(GetColors("Missing Thorium Bar", 60))

						elseif not mb_haveInBags("Thorium Bar") and not mb_haveInBags("Arcane Crystal") then

							mb_message(GetColors("Missing Thorium Bar and Arcane Crystal", 60))
						end
					else

						mb_message("Missing Philosopher's Stone", 60)
					end
					return
				end
			end

			for k, name in pairs(MB_TransmuteLiving) do
				if myName == name then
					if mb_haveInBags("Philosopher's Stone") then
						
						if mb_haveInBags("Essence of Earth") then

							CastSpellByName("Alchemy")
							mb_useTradeSkill("Transmute: Earth to Life")
						else

							mb_message(GetColors("Missing Essence of Earth", 60))
						end
					else

						mb_message("Missing Philosopher's Stone", 60)
					end
					return
				end
			end

			for k, name in pairs(MB_TransmuteWater) do
				if myName == name then
					if mb_haveInBags("Philosopher's Stone") then

						if mb_haveInBags("Essence of Undeath") then

							CastSpellByName("Alchemy")
							mb_useTradeSkill("Transmute: Undeath to Water")
						else

							mb_message(GetColors("Missing Essence of Undeath", 60))
						end
					else

						mb_message("Missing Philosopher's Stone", 60)
					end
					return
				end
			end
		
			mb_message("I've not been assigned a specific transmute!")
		end
	end

	if (mb_knowSpell("Leatherworking") or mb_knowSpell("Dragonscale Leatherworking")) and not mb_imBusy() then

		if mb_haveInBags("Salt Shaker") and mb_haveInBags("Deeprock Salt") then

			UseItemByName("Salt Shaker")

		elseif mb_haveInBags("Salt Shaker") and not mb_haveInBags("Deeprock Salt") then

			mb_message(GetColors("Missing Deeprock Salt", 60))

		elseif not mb_haveInBags("Salt Shaker") and mb_haveInBags("Deeprock Salt") then

			mb_message(GetColors("Missing Salt Shaker", 60))

		elseif not mb_haveInBags("Salt Shaker") and not mb_haveInBags("Deeprock Salt") then

			mb_message(GetColors("Missing Deeprock Salt and Salt Shaker", 60))
		end
	end

	if MB_useMoonclothCooldowns then
		if mb_knowSpell("Tailoring") and not mb_imBusy() then

			if mb_haveInBags("Felcloth") then

				CastSpellByName("Tailoring")
				mb_useTradeSkill("Mooncloth")
			else

				mb_message(GetColors("Missing Felcloth", 60))
			end
		end
	end
end