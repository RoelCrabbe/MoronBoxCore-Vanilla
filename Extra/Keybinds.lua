------------------------------------------------------------------------------------------------------
----------------------------------------- Keybinds & Locals! -----------------------------------------
------------------------------------------------------------------------------------------------------

MB_RAID = "The Solution To Pollution" -- Change this to something UNIQUE for you!
MB_inviteMessage = "Invite please, spot for raid please?" -- Invite message that raidinviter above listens and autoinvites to.

MB_yourGuildName = "Ahn Qiraj Wipe Club" -- The guild you want to be in
MB_guildInviter = "Angerissues" -- The guild leader

MB_followTheLeaderTaxi = true --Change this to nil if you do not want slaves to automatically fly where mb_raidleader flies!

MB_frameflash = true -- Change this to nil if you do not want the frames to flash when you are out of range etc.
MB_shouldNSLowHealthAggroedPlayers = true -- Change to nil if you experience lag
MB_shouldHolyShockLowHealthAggroedPlayers = true -- Change to nil if you experience lag
MB_use40yardHealingRangeOnInstants = false -- Can cause massive lag and freezing if activated and raid is low on health. if nil = 28 yards, if true = 40 yards.

function mb_createBinds()
	local myClass = UnitClass("player")

	LoadBindings(1) -- Load binds.
	mb_unbindAllKeys() -- Unbind all keys.

	SetBinding("B","OPENALLBAGS") -- Open all bags.
	SetBinding("SHIFT-R","REPLY") -- Reply whisper.
	SetBinding("O","TOGGLERAIDTAB") -- O, Opens Raidtab instead of friendlist.
	SetBinding("M","TOGGLEWORLDMAP") -- Toggle minimap.

	-- Movement binds
	SetBinding("Z","MOVEFORWARD") -- Forward.
	SetBinding("S","MOVEBACKWARD") -- Backward.
	SetBinding("Q","STRAFELEFT") -- Left.
	SetBinding("D","STRAFERIGHT") -- Right.

	-- Extra's
	SetBinding("SHIFT-V","NAMEPLATES") -- Show all Nameplates.
	SetBinding("NUMPADMINUS","CAMERAZOOMIN") -- Zoom in view.
	SetBinding("NUMPADPLUS","CAMERAZOOMOUT") -- Zoom out view.
	SetBinding("NUMPADDECIMAL","RELOAD") -- ReloadUI.

	-- Set Custom Macro Binds
	SetBinding("NUMPAD1","SM_MACRO1") -- Setup / Buffs.
	SetBinding("2","SM_MACRO2") -- Single DPS.
	SetBinding("3","SM_MACRO3") -- Multi DPS.
	SetBinding("L","SM_MACRO4") -- Cooldowns.
	SetBinding("4","SM_MACRO5") -- AOE.
	SetBinding("Y","SM_MACRO6") -- Mount.
	SetBinding("F3","SM_MACRO7") -- Request invites / Request summon / Promote.
	SetBinding("T","SM_MACRO30") -- Precast.

	SetBinding("F2","SM_MACRO8") -- CC on pull, AltKeyDown => PowerWord: Shield Tanks, ShiftKeyDown => Target Raidleader.
	SetBinding("F4","SM_MACRO9") -- FocusME (Do not broadcast!), ShiftKeyDown => Focus Previous FocusME.
	SetBinding("F5","SM_MACRO10") -- Assign Offtanks to target, ShiftKeyDown => Assign interrupt to target.
	SetBinding("F6","SM_MACRO11") -- Assign CC to target, ShiftKeyDown => assign fear.
	SetBinding("F7","SM_MACRO12") -- Clear assign to target.
	SetBinding("NUMPAD8","SM_MACRO13") -- Make water on mages.
	SetBinding("A","SM_MACRO14") -- Drink and Trade for water.
	SetBinding("CTRL-A","SM_MACRO14") -- Drink and Trade for water.
	SetBinding("F","SM_MACRO15") -- Breakfear, ShiftKeyDown => Poison/Disease Cleanse Totem.
	SetBinding("SHIFT-X","SM_MACRO16") -- Follow Focus.
	SetBinding("N","SM_MACRO17") -- DropTotems.
	
	SetBinding("V","SM_MACRO19") -- Tanks and Healers ONLY, no dps.
	SetBinding("NUMPAD6","SM_MACRO20") -- Craftable Cooldowns.	
	SetBinding("SHIFT-T","SM_MACRO21") -- Interrupt Focus target.

	SetBinding("SHIFT-G","SM_MACRO22") -- Casters Follow.
	SetBinding("1","SM_MACRO23") -- Melees Follow.
	SetBinding("SHIFT-H","SM_MACRO24") -- Healers Follow.
	SetBinding("SHIFT-C","SM_MACRO25") -- Tank Follow.

	SetBinding("6","SM_MACRO26") -- Manual Recklessness.
	SetBinding("NUMPAD7","SM_MACRO27") -- Reports Cooldowns of Certain spells.
	SetBinding("K","SM_MACRO28") -- Tank Shoot.

	if myClass == "Druid" or myClass == "Shaman" or myClass == "Priest" or myClass == "Paladin" then
		SetBinding("J","SM_MACRO18") -- Ress with Thaliz. (Add delay in HKN).
	end

	if myClass == "Warrior" or MB_mySpecc == "Feral" then
		SetBinding("R","SM_MACRO29") -- Warrior / Feral Taunt.
	end

	SaveBindings(1)
	ReloadUI()
end

function mb_addonsDisableEnable()
    local myClass = UnitClass("player")

    if GetAddOnInfo("CT_MailMod") then DisableAddOn("CT_MailMod") end
    if GetAddOnInfo("Talentsaver") then DisableAddOn("Talentsaver") end
    
    if (myClass == "Rogue" or myClass == "Warrior" or myClass == "Hunter" or myClass == "Warlock" or MB_mySpecc == "Feral") then
        if GetAddOnInfo("MoronBoxDecursive") then DisableAddOn("MoronBoxDecursive") end
        if GetAddOnInfo("MoronBoxHeal") then DisableAddOn("MoronBoxHeal") end
        if GetAddOnInfo("Thaliz") then DisableAddOn("Thaliz") end
    end

    if myClass ~= "Warlock" then
        if GetAddOnInfo("RaidSummon") then DisableAddOn("RaidSummon") end
    end

    if myClass == "Mage" then
        if GetAddOnInfo("MoronBoxHeal") then DisableAddOn("MoronBoxHeal") end
        if GetAddOnInfo("Thaliz") then DisableAddOn("Thaliz") end
    end

    if mb_imHealer() then
        local _, _, _, Enabled, _, _, _ = GetAddOnInfo("MoronBoxHeal")
        if not Enabled then
            EnableAddOn("MoronBoxHeal")
        end

		local _, _, _, Enabled, _, _, _ = GetAddOnInfo("Thaliz")
        if not Enabled then
            EnableAddOn("Thaliz")
        end

		local _, _, _, Enabled, _, _, _ = GetAddOnInfo("MoronBoxDecursive")
        if not Enabled then
            EnableAddOn("MoronBoxDecursive")
        end
    end

    if myClass == "Warlock" then
        local _, _, _, Enabled, _, _, _ = GetAddOnInfo("RaidSummon")
        if not Enabled then
            EnableAddOn("RaidSummon")
        end
    end

    ReloadUI()
end

function mb_unbindAllKeys() -- These keybinds will be removed
	SetBinding("SHIFT-1")
	SetBinding("SHIFT-2")
	SetBinding("SHIFT-3")
	SetBinding("SHIFT-4")
	SetBinding("SHIFT-5")
	SetBinding("SHIFT-6")
	SetBinding("SHIFT-7")
	SetBinding("SHIFT-8")
	SetBinding("SHIFT-9")
	SetBinding("SHIFT-0")
	SetBinding("SHIFT--")
	SetBinding("SHIFT-=")	
	SetBinding("ALT-1")
	SetBinding("ALT-2")
	SetBinding("ALT-3")
	SetBinding("ALT-4")
	SetBinding("ALT-5")
	SetBinding("ALT-6")
	SetBinding("ALT-7")
	SetBinding("ALT-8")
	SetBinding("ALT-9")
	SetBinding("ALT-0")
	SetBinding("ALT--")
	SetBinding("ALT-=")
	SetBinding("CTRL-S")
	SetBinding("CTRL-A")
	SetBinding("CTRL-1")
	SetBinding("CTRL-2")
	SetBinding("CTRL-3")
	SetBinding("CTRL-4")
	SetBinding("CTRL-5")
	SetBinding("CTRL-6")
	SetBinding("CTRL-7")
	SetBinding("CTRL-8")
	SetBinding("CTRL-9")
	SetBinding("CTRL-0")
	SetBinding("CTRL--")
	SetBinding("CTRL-=")
	SetBinding("SHIFT-V")
	SetBinding("CTRL-V")
	SetBinding("1")
	SetBinding("2")
	SetBinding("V")
	SetBinding("Q")
	SetBinding("W")
	SetBinding("E")
	SetBinding("R")
	SetBinding("T")
	SetBinding("Y")
	SetBinding("I")
	SetBinding("A")
	SetBinding("D")
	SetBinding("F")
	SetBinding("G")
	SetBinding("H")
	SetBinding("O")
	SetBinding("J")
	SetBinding("K")
	SetBinding("L")
	SetBinding("Z")
	SetBinding("X")
	SetBinding("N")
	SetBinding("?")
	SetBinding("?")
	SetBinding("?")
	SetBinding("NUMPAD0")
	SetBinding("NUMPAD1")
	SetBinding("NUMPAD2")
	SetBinding("NUMPAD3")
	SetBinding("NUMPAD4")
	SetBinding("NUMPAD5")
	SetBinding("NUMPAD6")
	SetBinding("NUMPAD7")
	SetBinding("NUMPAD8")
	SetBinding("NUMPAD9")
	SetBinding("F1")
	SetBinding("F2")
	SetBinding("F3")
	SetBinding("F4")
	SetBinding("F5")
	SetBinding("F6")
	SetBinding("F7")
	SetBinding("F8")
	SetBinding("F9")
	SetBinding("F10")
	SetBinding("F11")
	SetBinding("F12")
	SetBinding("SHIFT-F1")
	SetBinding("SHIFT-F2")
	SetBinding("SHIFT-F3")
	SetBinding("SHIFT-F4")
	SetBinding("SHIFT-F5")
	SetBinding("SHIFT-F6")
	SetBinding("SHIFT-F7")
	SetBinding("SHIFT-F8")
	SetBinding("SHIFT-F9")
	SetBinding("SHIFT-F10")
	SetBinding("SHIFT-F11")
	SetBinding("SHIFT-F12")
	SetBinding("ALT-F1")
	SetBinding("ALT-F2")
	SetBinding("ALT-F3")
	SetBinding("ALT-F4")
	SetBinding("ALT-F5")
	SetBinding("ALT-F6")
	SetBinding("ALT-F7")
	SetBinding("ALT-F8")
	SetBinding("ALT-F9")
	SetBinding("ALT-F10")
	SetBinding("ALT-F11")
	SetBinding("ALT-F12")
	SetBinding("CTRL-F1")
	SetBinding("CTRL-F2")
	SetBinding("CTRL-F3")
	SetBinding("CTRL-F4")
	SetBinding("CTRL-F5")
	SetBinding("CTRL-F6")
	SetBinding("CTRL-F7")
	SetBinding("CTRL-F8")
	SetBinding("CTRL-F9")
	SetBinding("ALT-F10")
	SetBinding("CTRL-F11")
	SetBinding("CTRL-F12")
	SetBinding("BUTTON3")
	SetBinding("SHIFT-UP")
	SetBinding("SHIFT-DOWN")
	SetBinding("SHIFT-MOUSEWHEELUP")
	SetBinding("SHIFT-MOUSEWHEELDOWN")
end

------------------------------------------------------------------------------------------------------
-------------------------------------------- Add Macro's! --------------------------------------------
------------------------------------------------------------------------------------------------------

function mb_createMacros()

	SetActionBarToggles(1,1,1,1,1)
	SHOW_MULTI_ACTIONBAR_1=1
	SHOW_MULTI_ACTIONBAR_2=1
	SHOW_MULTI_ACTIONBAR_3=1
	SHOW_MULTI_ACTIONBAR_4=1
	ALWAYS_SHOW_MULTI_ACTIONBAR=1
	MultiActionBar_Update()

	for i=1,36 do
		DeleteMacro(i)
	end

	mb_deleteMacros()
	mb_deleteSuperMacros()
	
	CreateMacro("01Setup", 487, "/script mb_setup()", 1, nil)
	CreateMacro("02Single", 121, "/script mb_single()", 1, nil)
	CreateMacro("03Multi", 155, "/script mb_multi()", 1, nil)
	CreateMacro("04Cooldowns", 21, "/script mb_cooldowns()", 1, nil)
	CreateMacro("05AOE", 206, "/script mb_AOE()", 1, nil)
	CreateMacro("06Mount", 90, "/script mb_mountUp()", 1, nil)
	CreateMacro("07InviteSum", 63, "/script mb_requestInviteSummon()", 1, nil)
	CreateMacro("08PWStanksCCPull", 394, "/script mb_crowdControlAsPull()", 1, nil)
	CreateMacro("09FocusME", 471, "/script mb_setFocus()", 1, nil)
	CreateMacro("10AssignOT", 22, "/script mb_assignOffTank()", 1, nil)
	CreateMacro("11AssignCC", 394, "/script mb_assignCrowdControl()", 1, nil)
	CreateMacro("12ClearAssign", 492,"/script mb_clearRaidTarget()", 1, nil)
	CreateMacro("13MakeWater", 339,"/script mb_makeWater()", 1, nil)
	CreateMacro("14DrinkWater", 339,"/script mb_smartDrink()", 1, nil)
	CreateMacro("15BreakFear", 489,"/script mb_fearBreak()", 1, nil)
	CreateMacro("16Follow", 129,"/script mb_followFocus()", 1, nil)
	CreateMacro("17Totems", 432,"/script mb_dropTotems()", 1, nil)
	CreateMacro("18Ress", 303,"/script mb_ress()", 1, nil)
	CreateMacro("19TankNheal", 165,"/script mb_healAndTank()", 1, 1)
	CreateMacro("20CraftCooldowns", 170,"/script mb_craftCooldowns()", 1, 1)
		
	CreateMacro("21Interrupt", 180,"/script mb_interruptSpell()", 1, 1)
	
	CreateMacro("22CasterFollow", 180,"/script mb_casterFollow()", 1, 1)
	CreateMacro("23MeleeFollow", 180,"/script mb_meleeFollow()", 1, 1)
	CreateMacro("24HealerFollow", 180,"/script mb_healerFollow()", 1, 1)
	CreateMacro("25TankFollow", 180,"/script mb_tankFollow()", 1, 1)

	CreateMacro("26ManualReck", 21,"/script mb_useManualRecklessness()", 1, 1)
	CreateMacro("27ReportMyCooldowns", 21,"/script mb_reportCooldowns()", 1, 1)

	CreateMacro("28TankShoot", 87,"/script mb_tankShoot()", 1, 1)
	CreateMacro("29ManualTaunt", 402,"/script mb_manualTaunt()", 1, 1)

	CreateMacro("30PreCast", 83,"/script mb_preCast()", 1, 1)
	
	mb_createBinds()
	mb_addonsDisableEnable()
end

function mb_createSpecialMacro()
	local myClass = UnitClass("player")

	SetActionBarToggles(1,1,1,1,1)
	SHOW_MULTI_ACTIONBAR_1=1
	SHOW_MULTI_ACTIONBAR_2=1
	SHOW_MULTI_ACTIONBAR_3=1
	SHOW_MULTI_ACTIONBAR_4=1
	ALWAYS_SHOW_MULTI_ACTIONBAR=1
	MultiActionBar_Update()

	for i=1,36 do
		DeleteMacro(i)
	end

	mb_deleteMacros()
	mb_deleteSuperMacros()
	
	CreateMacro("01Setup", 487, "/script mb_setup()", 1, nil)
	CreateMacro("02Single", 121, "/script mb_single()", 1, nil)
	CreateMacro("03Multi", 155, "/script mb_multi()", 1, nil)
	CreateMacro("04Cooldowns", 21, "/script mb_cooldowns()", 1, nil)
	CreateMacro("05AOE", 206, "/script mb_AOE()", 1, nil)
	CreateMacro("06Mount", 90, "/script mb_mountUp()", 1, nil)
	CreateMacro("07InviteSum", 100, "/script mb_requestInviteSummon()", 1, nil)
	CreateMacro("08PWStanksCCPull", 110, "/script mb_crowdControlAsPull()", 1, nil)
	CreateMacro("09FocusME", 115, "/script mb_setFocus()", 1, nil)
	CreateMacro("10AssignOT", 116, "/script mb_assignOffTank()", 1, nil)
	CreateMacro("11AssignCC", 120, "/script mb_assignCrowdControl()", 1, nil)
	CreateMacro("12ClearAssign", 125,"/script mb_clearRaidTarget()", 1, nil)
	CreateMacro("13MakeWater", 130,"/script mb_makeWater()", 1, nil)
	CreateMacro("14DrinkWater", 135,"/script mb_smartDrink()", 1, nil)
	CreateMacro("15BreakFear", 140,"/script mb_fearBreak()", 1, nil)
	CreateMacro("16Follow", 145,"/script mb_followFocus()", 1, nil)
	CreateMacro("17Totems", 150,"/script mb_dropTotems()", 1, nil)
	CreateMacro("18Ress", 155,"/script mb_ress()", 1, nil)
	CreateMacro("19TankNheal", 165,"/script mb_healAndTank()", 1, 1)
	CreateMacro("20CraftCooldowns", 170,"/script mb_craftCooldowns()", 1, 1)
		
	CreateMacro("21Interrupt", 180,"/script mb_interruptSpell()", 1, 1)
	
	CreateMacro("22CasterFollow", 180,"/script mb_casterFollow()", 1, 1)
	CreateMacro("23MeleeFollow", 180,"/script mb_meleeFollow()", 1, 1)
	CreateMacro("24HealerFollow", 180,"/script mb_healerFollow()", 1, 1)
	CreateMacro("25TankFollow", 180,"/script mb_tankFollow()", 1, 1)

	CreateMacro("26ManualReck", 21,"/script mb_useManualRecklessness()", 1, 1)
	CreateMacro("27ReportMyCooldowns", 21,"/script mb_reportCooldowns()", 1, 1)

	CreateMacro("28TankShoot", 87,"/script mb_tankShoot()", 1, 1)
	CreateMacro("29ManualTaunt", 402,"/script mb_manualTaunt()", 1, 1)

	CreateMacro("30PreCast", 83,"/script mb_preCast()", 1, 1)
	
	if myClass == "Warrior" then
		
		setWarriorTank = CreateSuperMacro("WarriorTank", "Interface\\Icons\\Ability_Warrior_Defensivestance", "/specc warrior tank\n/run mb_warriorSetDefensive()")
		PickupMacro(setWarriorTank, "WarriorTank")
		PlaceAction(2)
		PickupMacro(setWarriorTank, "WarriorTank")
		PlaceAction(74)
		PickupMacro(setWarriorTank, "WarriorTank")
		PlaceAction(86)
		PickupMacro(setWarriorTank, "WarriorTank")
		PlaceAction(98)
		PickupMacro(setWarriorTank, "WarriorTank")
		PlaceAction(110)

		setWarriorDPS = CreateSuperMacro("WarriorDPS", "Interface\\Icons\\Ability_Racial_Avatar", "/specc warrior dps\n/run mb_warriorSetBerserker()")
		PickupMacro(setWarriorDPS, "WarriorDPS")
		PlaceAction(3)
		PickupMacro(setWarriorDPS, "WarriorDPS")
		PlaceAction(75)
		PickupMacro(setWarriorDPS, "WarriorDPS")
		PlaceAction(87)
		PickupMacro(setWarriorDPS, "WarriorDPS")
		PlaceAction(99)
		PickupMacro(setWarriorDPS, "WarriorDPS")
		PlaceAction(111)
	end
		
	mb_createBinds()
	mb_addonsDisableEnable()
end

function mb_deleteMacros()
	MB_macronamestodelete={
							"01Setup",
							"02Single",
							"03Multi",
							"04Cooldowns",
							"05AOE",
							"06Mount",
							"07InviteSum",
							"08PWStanks",
							"08PWStanksCCPull",
							"09FocusME",
							"10AssignOT",
							"11AssignCC",
							"12ClearAssign",
							"13MakeWater",
							"14DrinkWater",
							"15BreakFear",
							"16Follow",
							"17Totems",
							"18Totems",
							"18Ress",
							"19TankNheal",
							"20CraftCooldowns",
							"21Interrupt",
							"22CasterFollow",
							"23MeleeFollow",
							"24HealerFollow",
							"25TankFollow",
							"26ManualReck",
							"27ReportMyCooldowns",
							"28TankShoot",
							"29ManualTaunt",
							"30PreCast",
						}
	for k,macname in pairs(MB_macronamestodelete) do
		while (GetMacroIndexByName(macname))>0 do
			local index=GetMacroIndexByName(macname)
			DeleteMacro(index)
		end
	end
end

function mb_deleteSuperMacros()
	MB_macronamestodelete={
							"01Setup",
							"02Single",
							"03Multi",
							"04Cooldowns",
							"05AOE",
							"06Mount",
							"07InviteSum",
							"08PWStanks",
							"08PWStanksCCPull",
							"09FocusME",
							"10AssignOT",
							"11AssignCC",
							"12ClearAssign",
							"13MakeWater",
							"14DrinkWater",
							"15BreakFear",
							"16Follow",
							"17Totems",
							"18Totems",
							"18Ress",
							"19TankNheal",
							"20CraftCooldowns",
							"21Interrupt",
							"22CasterFollow",
							"23MeleeFollow",
							"24HealerFollow",
							"25TankFollow",
							"26ManualReck",
							"27ReportMyCooldowns",
							"28TankShoot",
							"29ManualTaunt",
							"30PreCast",
						}
	for k,macname in pairs(MB_macronamestodelete) do
		while (GetSuperMacroInfo(macname,"name")) do
			local index=GetSuperMacroInfo(macname,"name")
			DeleteSuperMacro(index)
		end
	end
end

------------------------------------------------------------------------------------------------------
---------------------------------------------- Extra's! ----------------------------------------------
------------------------------------------------------------------------------------------------------

function mb_buyBlessedSunfruits()
	local myClass = UnitClass("player")
	
	MB_sunfruitList = { 
		["Druid"] = "Blessed Sunfruit Juice",
		["Priest"] = "Blessed Sunfruit Juice",
		["Shaman"] = "Blessed Sunfruit Juice",
		["Paladin"] = "Blessed Sunfruit Juice",
		["Warrior"] = "Blessed Sunfruit",
		["Rogue"] = "Blessed Sunfruit"
	}

	MB_sunfruitLimit = {
		["Blessed Sunfruit Juice"] = { 20, 1 },
		["Blessed Sunfruit"] = { 20, 1 }
	}
	
	MB_sunfruitTexture = {
		["Blessed Sunfruit Juice"] = "Interface\\Icons\\INV_Drink_16",
		["Blessed Sunfruit"] = "Interface\\Icons\\INV_Misc_Food_41"
	}

	for class, item in MB_sunfruitList do
		if myClass == class then 
			local myCurrentItems = math.ceil((mb_hasItem(item) / MB_sunfruitLimit[item][2]) / 5)
			local myNeededItems = (MB_sunfruitLimit[item][1] - myCurrentItems) / MB_sunfruitLimit[item][2]
			
			if myNeededItems > 0 then 
				for itemID = 1,40 do

					itemName, itemTexture = GetMerchantItemInfo(itemID)
					local reqItemTexture = MB_sunfruitTexture[item]

					if itemTexture == reqItemTexture then 
						
						Print("Buying "..myNeededItems.." "..itemName)
						BuyMerchantItem(itemID, myNeededItems)
					end
				end
			end
		end
	end
	MB_autoBuySunfruit.Active = false
end

function mb_buyReagentsAndArrows()
	local myClass = UnitClass("player")

	MB_reagentsList = {
		["Jagged Arrow"] = "Warrior",
		["Flash Powder"] = "Rogue",
		["Wild Thornroot"] = "Druid",
		["Ironwood Seed"] = "Druid",
		["Sacred Candle"] = "Priest",
		["Ankh"] = "Shaman",
		["Arcane Powder"] = "Mage",
		["Rune of Portals"] = "Mage",
		["Symbol of Kings"] = "Paladin",
		["Symbol of Divinity"] = "Paladin"
	}

	MB_reagentsLimit = {
			["Jagged Arrow"] = { 1, 2 },
			["Flash Powder"] = { 80, 1 },
			["Wild Thornroot"] = { 200, 1 },
			["Ironwood Seed"] = { 20, 1 },
			["Sacred Candle"] = { 200, 1 },
			["Ankh"] = { 10, 1 },
			["Arcane Powder"] = { 160, 1 },
			["Rune of Portals"] = { 10, 1 },
			["Symbol of Kings"] = { 5, 1 }, -- 5 stacks
			["Symbol of Divinity"] = { 10, 1 }
	}
	
	for item, class in MB_reagentsList do
		if myClass == class then 
			local myCurrentItems = mb_hasItem(item) / MB_reagentsLimit[item][2]

			local myNeededItems

			if item == "Symbol of Kings" then
				myNeededItems = ((MB_reagentsLimit[item][1] * 100) - myCurrentItems) / MB_reagentsLimit[item][2]
			else
				myNeededItems = (MB_reagentsLimit[item][1] - myCurrentItems) / MB_reagentsLimit[item][2]
			end
			

			if myNeededItems > 0 then 

				if item == "Symbol of Kings" then
					myNeededItems = math.floor(myNeededItems / 20)
				end

				for itemID = 1,40 do

					merchantItemLink = GetMerchantItemLink(itemID)
					
					if merchantItemLink then 
						if string.find(merchantItemLink, item) then 
							
							Print("Buying "..myNeededItems.." "..merchantItemLink)
							BuyMerchantItem(itemID, myNeededItems)
						end
					end
				end
			end
		end
	end
	MB_autoBuyReagents.Active = false
end

function mb_autoDeleteItems()
	--Delete certain items when beyond a certain number of stacks
	--have to pick food type based on hunter name and pet
	--It only works by STACKS. 1 means you allow 1 stack. 2 means 2 stacks.
	--That could be 1.5 stacks also. Partial stacks count as a stack.

	local amount=0
	local TheList={ --RUNECLOTH FFS

	--["Runecloth"]=0,
	["Aquamarine"]=0,
	--["Essence of Undeath"]=0,
	["Powerful Mojo"]=0,
	

	--Green Patterns that sell for less than 1gold:
	["Pattern: Brightcloth Robe"]=0,
	["Pattern: Chimeric Boots"]=0,
	["Pattern: Felcloth Hood"]=0,
	["Plans: Radiant Boots"]=0,

	--Reagents for crafting:
	["Thick Spider\'s Silk"]=0,
	["Black Diamond"]=0,
	["Dark Iron Residue"]=16,
	["Shadow Silk"]=0,
	["Wicked Claw"]=0, 
	["Ichor of Undeath"]=0,
	--Grey equipment:
	["Twill Pants"]=0,
	["Crochet Boots"]=0,
	["Smooth Cloak"]=0,
	["Overlinked Chain Bracers"]=0,
	["Overlinked Coif"]=0,
	["Overlinked Chain Belt"]=0,
	["Overlinked Chain Cloak"]=0,
	["Thick Leather Shoulderpads"]=0,
	["Thick Leather Tunic"]=0,
	["Thick Leather Hat"]=0,
	["Thick Leather Pants"]=0,
	["Thick Leather Bracers"]=0,
	["Thick Leather Boots"]=0,
	["Smooth Leather Helmet"]=0,
	["Smooth Leather Shoulderpads"]=0,
	["Smooth Leather Bracers"]=0,
	["Smooth Leather Armor"]=0,
	["Laminated Scale Belt"]=0,
	["Laminated Scale Circlet"]=0,
	["Laminated Scale Cloak"]=0,
	["Laminated Scale Pants"]=0,
	["Light Plate Helmet"]=0,
	["Light Plate Shoulderpads"]=0,
	["Light Plate Gloves"]=0,
	["Light Plate Chestpiece"]=0,
	--grey weapons, can vendor for a abit
	["Balanced Long Bow"]=0,
	["Heavy Flint Axe"]=0,
	["Fine Longsword"]=0,
	["Blunting Mace"]=0,
	["Spiked Dagger"]=0,
	["Bulky Maul"]=0,
	["Primed Musket"]=0,
	["Protective Pavise"]=0,
	["Deflecting Tower"]=0,
	["Crested Buckler"]=0,
	["Blocking Targe"]=0,
	--Grey/white shit.
	["Broken Scorpid Leg"]=0,
	["Delicate Insect Wing"]=0,
	["Husk Fragment"]=0,
	["Dry Scorpid Eye"]=0,
	["Empty Venom Sac"]=0,
	["Large Scorpid Claw"]=0,
	["Dripping Spider Mandible"]=0,
	["Sleek Bat Pelt"]=0,
	["Hard Spider Leg Tip"]=0,
	["Dried Scorpid Carapace"]=0,
	["Bat Ear"]=0,
	["Glowing Scorpid Blood"]=0,
	["Lifeless Stone"]=0,
	["Seeping Gizzard"]=0,
	["Smooth Stone Chip"]=0,
	["Shiny Polished Stone"]=0,
	["Shed Lizard Skin"]=0,
	["Gelatinous Goo"]=0,
	["Slimy Ichor"]=0,
	["Thick Furry Mane"]=0,
	["Large Trophy Paw"]=0,
	["Burning Pitch"]=0,
	["Morning Glory Dew"]=0, --vendor water, beware if you dont have a mage.
	["Dried King Bolete"]=0,
	["Nightcrawler"]=0,
	["Evil Bat Eye"]=0,
	["Large Bat Fang"]=0,
	["Pristine Raptor Skull"]=0,
	["Trophy Raptor Skull"]=0,
	["Elder Raptor Feathers"]=0,
	["Patch of Fine Fur"]=0,
	["Sabertooth Fang"]=0,
	["Darkmoon Special Reserve"]=0,
	["Brilliant Scale"]=0,
	["Forked Tongue"]=0,
	["Alterac Swiss"]=0,
	["Homemade Cherry Pie"]=0,
	["Coal"]=0,
	["Scroll of Spirit"]=0,
	["Scroll of Stamina"]=0,
	["Scroll of Intellect"]=0,
	["Roasted Quail"]=0,
	["Pattern: Volcanic "]=0,
	["White Spider Meat"]=0,
	["Immature Venom Sac"]=0,
	["Red Wolf Meat"]=0,
	["Tender Wolf Meat"]=0,
	["Armored Chitin"]=0,
	["Heavy Silithus Husk"]=0,
	}
	local CrapIGot={}

	for bag=0,4 do 
		for slot=1,GetContainerNumSlots(bag) do 
			local texture,itemCount,locked,quality,readable,lootable,link=GetContainerItemInfo(bag,slot) 
			if texture then
			link=GetContainerItemLink(bag,slot) 
				for key,limit in TheList do
					if string.find(link,key) then 
						if limit==0 then 
							PickupContainerItem(bag,slot)
							DeleteCursorItem()
						elseif not mb_findInTable(CrapIGot,key) then 
							table.insert(CrapIGot,key)
							CrapIGot[key]=1
						elseif CrapIGot[key]==limit then
							PickupContainerItem(bag,slot)
							DeleteCursorItem()
						else
							CrapIGot[key]=CrapIGot[key]+1
						end
					end
				end
			end
		end 
	end
end	

function mb_hasItem(item)
	--Used to pick up pet food when feeding pet
	--have to pick food type based on hunter name and pet
	count = 0
	for bag = 0, 4 do for slot = 1, GetContainerNumSlots(bag) do 
		local texture, itemCount, locked, quality, readable, lootable, link=GetContainerItemInfo(bag, slot) 
			if texture then
				link = GetContainerItemLink(bag, slot) 
				if string.find(link, item) then count = count + itemCount end
			end
		end
	end
	if count == 0 then 
		mb_message("I\'m out of "..item)
	end
	return count
end

MB_waterMessage = "Water pls" -- If anyone whispers this to a mage they will trade him water or decline the trade
MB_boxTradeWaterReply = "[Box-Reply] If u want water, whisper me ["..MB_waterMessage.."] cheers!"
MB_boxTradeWaterOutOfStockReply = "[Box-Reply] I\'m sorry! I can\'t trade, not enough water for myself."

LOFGuild = CreateFrame("Frame", nil, UIParent)
LOFGuild:RegisterEvent("GUILD_INVITE_REQUEST")
LOFGuild:RegisterEvent("CHAT_MSG_WHISPER")

LOFGuild:SetScript("OnEvent", function()
	if event == "CHAT_MSG_WHISPER" then

		if arg1 == "Guild INV Please" then

			GuildInviteByName(arg2)
		end

	elseif event == "GUILD_INVITE_REQUEST" then

		if arg2 == MB_yourGuildName then

			AcceptGuild()
			StaticPopup_Hide("GUILD_INVITE")
		end
	end
end)

SLASH_GUILDJOIN1 = "/guildjoin"


SlashCmdList["GUILDJOIN"] = function(arg)

	if GetGuildInfo("player") and GetGuildInfo("player") ~= MB_yourGuildName then

		GuildLeave()
	end

	if not GetGuildInfo("player") then

		SendChatMessage("Guild INV Please", WHISPER, nil, MB_guildInviter)
	end
end

function math.round(x)
	return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
  end