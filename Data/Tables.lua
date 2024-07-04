------------------------------------------------------------------------------------------------------
------------------------------------------------ Tables ----------------------------------------------
------------------------------------------------------------------------------------------------------

function mb_bossIShouldUseRunesAndManapotsOn() -- Healers and mages only.
	if mb_targetHealthFromRaidleader("Big Boss", 0.95) then
		--mb_targetHealthFromRaidleader("Patchwerk", 0.95) then -- I dont use runes on PW
		return true
	end
	return false
end

function mb_bossIShouldUseManapotsOn() -- Healers and mages only.
	if mb_targetHealthFromRaidleader("Big Boss", 0.65) or
		mb_targetHealthFromRaidleader("Patchwerk", 0.95) then
		return true
	end
	return false
end

-- Idont use this shit lol, get good
function mb_bossIShouldUseBandageOn()
	local myClass = UnitClass("player")
	
	if myClass == "Warlock" then

		if (mb_tankTarget("Patchwerk") or mb_tankTarget("Lady Blaumeux") or mb_tankTarget("Sir Zeliek") or mb_tankTarget("Thane Korth\'azz") or mb_tankTarget("Highlord Alexandros Mograine")) then
			return true
		end

	elseif myClass == "Mage" then

		if (mb_tankTarget("Lady Blaumeux") or mb_tankTarget("Sir Zeliek") or mb_tankTarget("Thane Korth\'azz") or mb_tankTarget("Highlord Alexandros Mograine")) then
			return true
		end
	end
	return false
end

-- Mage --

function mb_mobsToFireWard() -- List of fire ward
	if mb_tankTarget("High Priestess Jeklik") or 
		mb_tankTarget("Necro Night") or 
		mb_tankTarget("Grand Widow Faerlina") or 
		mb_tankTarget("Gehennas") or 
		mb_tankTarget("Magmadar") or
		mb_tankTarget("Ragnaros") or 
		mb_tankTarget("Firemaw") or 
		mb_tankTarget("Blackwing Warlock") or 
		mb_tankTarget("Blackwing Technician") or 
		mb_tankTarget("Vaelastrasz the Corrupt") or
		mb_tankTarget("Flame Imp") then 
		return true
	end
	return false
end

function mb_mobsToDetectMagic() -- List with detect magic mobs
	if UnitName("target") == "Anubisath Sentinel" or 
		UnitName("target") == "Anubisath Guardian" or
		UnitName("target") == "Anubisath Defender" or
		UnitName("target") == "Death Talon Wyrmguard" or
		UnitName("target") == "Shazzrah" then
		return true
	end
	return false
end

function mb_mobsToDampenMagic()
	if mb_tankTarget("Grethok the Controller") or
		mb_isAtLoatheb() then
		return true
	end
	return false
end

function mb_mobsToAplifyMagic()
	if mb_tankTarget("Patchwerk") or 
		mb_tankTarget("Noth the Plaguebringer") or 
		mb_tankTarget("Gluth") or 
		mb_tankTarget("Maexxna") then		
		return true
	end
	return false
end

-- ? not rly used ?
function mb_mobsToAutoTurn()
	if mb_tankTarget("Magmadar") or
		mb_tankTarget("Ancient Core Hound") or 
		mb_tankTarget("Onyxia") or 
		mb_tankTarget("Deathknight") then
		return true
	end
	return false
end

-- Druid --

function mb_mobsToRoot()
	if UnitName("target") == "Qiraji Gladiator" then
		return true
	end
	return false
end

-- Priest -- 

function mb_mobsToFearWard()
	if mb_tankTarget("Nefarian") or
		mb_tankTarget("Magmadar") or
		mb_tankTarget("Princess Yauj") or
		mb_tankTarget("Lord Kri") or
		mb_tankTarget("Vem") or
		mb_tankTarget("Onyxia") or
		mb_tankTarget("Deathknight") or
		mb_tankTarget("High Priestess Jeklik") or
		mb_tankTarget("Gurubashi Berserker") or
		mb_tankTarget("Gluth") then
		return true
	end
	return false
end

-- Warlock --

function mb_mobsToShadowWard() -- List of shadow ward mobs
	if mb_tankTarget("Death Lord") or 
		mb_tankTarget("Necropolis Acolyte") or 
		mb_tankTarget("Deathknight Cavalier") or 
		mb_tankTarget("Shade of Naxxramas") or 
		mb_tankTarget("Spirit of Naxxramas") or
		mb_tankTarget("Lord Kazzak") or
		mb_tankTarget("Hakkar") or 
		mb_tankTarget("Necro Knight") then
		return true
	end
	return false
end

function mb_debuffsToShadowWard() -- List of shadow ward debuff
	if mb_hasBuffOrDebuff("Corruption", "player", "debuff") or
		mb_hasBuffOrDebuff("Curse of Agony", "player", "debuff") or
		mb_hasBuffOrDebuff("Siphon Life", "player", "debuff") or
		mb_hasBuffOrDebuff("Impending Doom", "player", "debuff") or
		mb_hasBuffOrDebuff("Inevitable Doom", "player", "debuff") or
		mb_hasBuffOrDebuff("Aura of Agony", "player", "debuff") or
		mb_hasBuffOrDebuff("Shadow Word: Pain", "player", "debuff") or
		mb_hasBuffNamed("Shadow and Frost Reflect", "target") or
		mb_hasBuffOrDebuff("Corruption of the Earth", "player", "debuff") then
		return true
	end
	return false
end

function mb_mobsNoCurses()
	if UnitName("target") == "Blackwing Mage" or 
		UnitName("target") == "Blackwing Legionnaire" or 
		UnitName("target") == "Corrupted Green Whelp" or 
		UnitName("target") == "Corrupted Red Whelp" or 
		UnitName("target") == "Corrupted Bronze Whelp" or 
		UnitName("target") == "Corrupted Blue Whelp" or 
		UnitName("target") == "Mutated Grub" or 
		UnitName("target") == "Frenzied Bat" or 
		UnitName("target") == "Plagued Bat" then
		return true
	end
	return false
end

-- Warrior --

function mb_useBloodFury() -- Warrior only, these targets you wont wanna pop BF (healing intensive fights)
	if mb_tankTarget("Shade of Naxxramas") or
		mb_tankTarget("Necro Knight") or -- they pump wtf
		mb_tankTarget("Stoneskin Gargoyle") or -- big aoe dmg, dont wanna lose any ++ healing
		mb_tankTarget("Shazzrah") or
		mb_tankTarget("Grand Widow Faerlina") or
		mb_tankTarget("Magmadar") or
		mb_tankTarget("Corrupted Green Whelp") or 
		mb_tankTarget("Corrupted Red Whelp") or 
		mb_tankTarget("Corrupted Bronze Whelp") or 
		mb_tankTarget("Corrupted Blue Whelp") or 
		mb_tankTarget("Death Talon Hatcher") or 
		mb_tankTarget("Princess Huhuran") or 
		mb_tankTarget("Blackwing Taskmaster") then --> can be removed, but i cba melee getting fucked is bad.. main dps on here
		return false
	end
	return true
end

function mb_mobsNoSunders()
	if UnitName("target") == "Blackwing Mage" or 
		UnitName("target") == "Blackwing Legionnaire" or 
		UnitName("target") == "Death Talon Dragonspawn" or 
		UnitName("target") == "Deathknight Understudy" or
		UnitName("target") == "Corrupted Green Whelp" or 
		UnitName("target") == "Corrupted Red Whelp" or 
		UnitName("target") == "Corrupted Bronze Whelp" or 
		UnitName("target") == "Corrupted Blue Whelp" or 
		UnitName("target") == "Mutated Grub" or 
		UnitName("target") == "Frenzied Bat" or 
		UnitName("target") == "Plague Beast" or
		UnitName("target") == "Plagued Bat" then  
		return true
	end
	return false
end

function mb_bossIShouldUseRecklessnessOn()
	if mb_targetHealthFromRaidleader("Patchwerk", 0.19) or 
		mb_targetHealthFromRaidleader("Maexxna", 0.19) or
		mb_targetHealthFromRaidleader("Noth the Plaguebringer", 0.19) or
		mb_targetHealthFromRaidleader("Ragnaros", 0.19) or
		mb_targetHealthFromRaidleader("Chromaggus", 0.19) or
		mb_targetHealthFromRaidleader("Nefarian", 0.19) or
		mb_targetHealthFromRaidleader("Fankriss the Unyielding", 0.19) or
		--mb_targetHealthFromRaidleader("Princess Huhuran", 0.20) or
		mb_targetHealthFromRaidleader("Princess Yauj", 0.30) or
		mb_targetHealthFromRaidleader("Heigan the Unclean", 0.25) or
		mb_targetHealthFromRaidleader("Magmadar", 0.25) or
		mb_targetHealthFromRaidleader("Vaelastrasz the Corrupt", 0.11) or
		mb_targetHealthFromRaidleader("Grand Widow Faerlina", 0.19) then
		return true
	end
	return false
end

function mb_mobsToAutoBreakFear()
	if mb_tankTarget("Break Fear") or
		mb_tankTarget("Deathknight") or 
		mb_tankTarget("Princess Yauj") then
		return true
	end
	return false
end

-- Shaman --

function mb_mobsNoTotems()
	if mb_tankTarget("Mob no Totem") or
		
		-- Onytrash
		mb_tankTarget("Onyxian Warder") or

		-- Supression Room
		mb_tankTarget("Corrupted Green Whelp") or 
		mb_tankTarget("Corrupted Red Whelp") or 
		mb_tankTarget("Corrupted Bronze Whelp") or 
		mb_tankTarget("Corrupted Blue Whelp") or 
		mb_tankTarget("Death Talon Hatcher") or 
		mb_tankTarget("Blackwing Taskmaster") or 

		-- Plague Tunnel
		mb_tankTarget("Mutated Grub") or 
		mb_tankTarget("Frenzied Bat") or 
		mb_tankTarget("Plague Beast") or 
		mb_tankTarget("Plagued Bat") or 

		-- Saturna Tunnel
		mb_tankTarget("Vekniss Drone") or 
		mb_tankTarget("Vekniss Soldier") or 

		-- BRD torch room
		mb_tankTarget("Anvilrage Reservist") or 
		mb_tankTarget("Shadowforge Flame Keeper") then 
		return true
	end
	return false
end

function mb_mobsToAoeTotem()
	if mb_tankTarget("Aoe Totem Mob") or
		
		-- Plague Tunnel
		mb_tankTarget("Plague Beast") or 
		mb_tankTarget("Mutated Grub") or 
		mb_tankTarget("Frenzied Bat") or 
		mb_tankTarget("Plagued Bat") or

		-- Saturna Tunnel
		mb_tankTarget("Vekniss Drone") or 
		mb_tankTarget("Vekniss Soldier") or
		mb_tankTarget("Fankriss the Unyielding") or

		-- Supression Room
		mb_tankTarget("Corrupted Green Whelp") or 
		mb_tankTarget("Corrupted Red Whelp") or 
		mb_tankTarget("Corrupted Bronze Whelp") or 
		mb_tankTarget("Corrupted Blue Whelp") or
		mb_tankTarget("Death Talon Hatcher") or 
		mb_tankTarget("Blackwing Taskmaster") or

		-- Naxx Spider packs
		mb_tankTarget("Poisonous Skitterer") then
		return true
	end
	return false
end

-- Spells to Intterupt --

MB_spellsToInt = { -- These spells will automatically be interrupted

	-- Normal Spells
	"Frostbolt",
	"Shadow Bolt",

	"Mind Flay", -- PW trash
	"Mind Blast", -- AQ40, Mindslayers

	"Holy Fire",
	"Drain Life", -- Spider ZG

	-- Heals
	"Greater Heal",
	"Great Heal", -- Tiger heal
	"Heal",
	"Healing Wave",
	"Dark Mending", -- Flamewalker Priest

	-- CC's
	"Banish",
	"Polymorph",

	-- Slows
	"Cripple",

	-- Supression Room
	"Healing Circle",
	"Flamestrike",

	-- Blackwing Warlock
	"Shadow Bolt",
	"Demon Portal",
	"Rain of Fire",

	-- Razorgore First Phase
	"Arcane Explosion",
	"Fireball",

	-- AOE's
	"Fireball Volley", -- Packs behind Vaelstraz
	"Shadow Bolt Volley",
	"Frostbolt Volley",
	"Venom Spit", -- Snake AOE
}

-- Auto Trader --

MB_itemToAutoTrade = {
	"Arcanite Bar",
	"Mooncloth",
	"Refined Deeprock Salt",
	"Essence of Air",
	"Essence of Undeath",
	"Living Essence",
	"Essence of Water",
	"Essence of Earth",
	"Cured Rugged Hide",
	"Arcane Crystal",
	"Thorium Bar",
	"Hourglass Sand",
	"Felcloth",
	"Major Mana Potion",
	"Elixir of the Mongoose",
	"Greater Stoneshield Potion",
	"Gift of Arthas",
	"Conjured.*Water",
	"Rumsey Rum Black Label",
	".*Hakkari Bijou",
	"Dirge\'s Kickin\' Chimaerok Chops",
	"Deeprock Salt",
	"Greater Nature Protection Potion",
	"Greater Shadow Protection Potion"
}