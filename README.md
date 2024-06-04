# GET STARTED HERE

---

## Introduction

This is a custom box-script (My obsession going into overdrive) that Ive worked on for the past 3 years.
It will also **NOT** support leveling 1-59!
Everything is **custom** and will need to be changed to work for you!
There are no guides on how to setup, you will need some expirience with boxing in general to make it work.
But once you have setup everything, made you're launch scripts. It should be smooth sailing going forward
(Also macro's don't show on your bars, for those wondering)

*There are still things that need to be fixing for the newer cores, this was disigned on the Vmangos version of 2017.*

---

As of the moment of writing (03/01/2024) my successes have been

	AQ40 : Everything till Twins, both Horde and Alliance (Ouro ~70%)
	BWL  : Everything till Chromagus, both Horde and Alliance (Nefarian 64%)
	MC   : Everything
	Naxx : 	
		Full Spiderwing
		Noth, Heigan, Loatheb 53%
		Razuvious (Solo MCing), Gothik, 4HM (I once killed a horse :D)
		PW, Grobbulus (World Second, World First 2 man), Gluth 21%
	20's : Everything

> Given the successes I've had I know everything works propperly

---

## How to make a simple setup?

	1) Assign a raidInviter, to invite your team! (Functions/Config.lua)
	2) Make your MB_RAID unique, if you want to "DUO" box! (Extra/Keybinds.lua)
	3) Change keybinds to your own preference (Extra/Keybinds.lua) and have a custom HKN team launcher
	4) Assign tanks inside the MB_tanklist! (Functions/Config.lua)
	5) If you have FIRE mages, make sure to add them inside the dedicated list (Functions/Config.lua) (They wont dps otherwise)
	6) Do a /init on your windows, macro/keybinds should be created
	7) To INVITE your party, the default keybinds is ALT-F3
	8) Good luck!

---

## How to make a ADVANCED setup?

	1) Please follow the steps of the "HOW TO SETUP SIMPLE?" guide.
	2) If you have the latest versions of BW, ItemRack, Decursive, SortBags certain things will be required: (Most things can be toggled on and off)
		- If AutoEquipSet (Functions/Config.lua) enabled, you will need to make a ItemRack called "NRML", that will automatically be equiped when logging in or reloading
		- In GTFO (Functions/Config.lua), there are lists that are used on specific encounters. Like Baron Bomb autofollow out of the raid and more..
		- In AnnihilatorWeavers (Functions/Config.lua), you can give X amount of toons that will stack up 3 debuffs of Annihilator, specify their weapons in (Database/WarriorData.lua) ONLY used on bosses
		- Make sure to assign Fire/Frost mages
		- When MB_sortingBags (Functions/Config.lua) is enabled, it will sort bags when opening a vendor REQUIRES SortBags addon, don't enable when u don't have the addon!
		- In mb_tankList(encounter) you are able to add multiple different tanklists and call then in game by doing the command /tanklist <encounter>
		- In MB_furysThatCanTank (Functions/Config.lua), there can be fury's with decent tankgear. They require 2 ItemRacks, 1 DPS and 1 TANK. They will equip correct set when assign/unassigned
	3) Encounters (Functions/Encounters.lua), Some bosses require different things. Ive explained most of it, its all personal tactics. Questions let me know!
	4) Healing (Functions/Healing.lua), Here you can change the values of when renew/ reju and comes out. And what rank/ overheal MT heal only fights should used
	5) Tables (Functions/Tables.lua), Here you can change the names or add things for certain buffs or functionalities
	
	Summary : Make sure ItemRacks are setup (/gear <set>) to switch! Mages need and EVO (spirit) and a DPS set AND NRML, Warriors need DPS, Tank AND NRML, rest just needs NRML only (to get started!) (Watch my PNG photo's)
			  Read the Encounters and Config file for more info's enable only what is needed
			  Make sure Tanklists are in order

	!! Certain gearsets, like EVO and NRML will be announced in raid when missing (if you run latest ItemRack)
	!! Try to read the code if you don't understand explanations from Encounter.lua

---

## Extra utilities?

	1) ALL Rogues with EXPOSE armor, will expose make sure you only RUN ONE!
	2) Improved Demo over Unbridled Wrath yes yes!
	3) If you run more then 3 locks, consider using a BITCH priest. (Only does stacks on bosses)
	4) PI works, but is at random sorted by players on the PowerInfusionList (Functions/Config.lua)
	5) Please use Annihilator on at least 1 for boss only
	6) If you have a lot of mage if you assign fire/frost mages correctly you will be able to mix them into the raid 

---

## Healing assignments?

**This is the latest version of the script and uses my own healing addon!**

	Running the latest MBH, everyone should have about 19% overheal on default (U CAN CHANGE THESE WITH /MBH)

	Shamans) 
			ChainHeal Shamans, 15-19% overheal, RNG Target
			T1/HealWave Shamans, 19% overheal, Target 1 - 2 (I have 4, 2 heal target 1 other heal 2)
	Paladins)
			They will Flash of Light heal, Ive set 2 to heal target 1. Rest are on RNG, 25-30% overheal 
	Priest)
			Default : Heal, set to heal target 1 - 2, 19 - 25% overheal
			(Assign in List Functions/Healing.lua) Flash Heal, set to heal target 1 - 3. On alliance most are Flash healers and all are random target apart from 3 that heal target 1 - 3, overheal set from 5-11%
			If not assigned Flash Heal and has full T2 equiped will heal with Greater Heal. I don't use these only on MT heal bossfights
	Druid)
			Will Rejuv MORE when it has 2T3 equiped. Healing Targets 1 - 2 with 11-19% overheal

	Check (Functions/Healing.lua) as well

---

### Speccs!

	Fury Dual Wield : https://classicdb.ch/?talent#LhhxzhbZVV0VgxoVo
	Fury 2H : https://classicdb.ch/?talent#LhhxzIbZVVbVMxoVo

	Fury Tank : https://classicdb.ch/?talent#LhZVV0VLxoVoxfzox
	Improved DemoTank : https://classicdb.ch/?talent#LhZVv0V0xoVoxfzox

	Full Prot1: https://classicdb.ch/?talent#LV0hZVZEizoeMdVo 
	Full Prot2: https://classicdb.ch/?talent#LV0hZVVZxizoeMdVo

	Heal Priest : https://classicdb.ch/?talent#bxRhsV0oZrxxccMcx
	Shadowweaver Priest : https://classicdb.ch/?talent#bxMhsZfbxccZx0gd0L

	Fire Mage : https://classicdb.ch/?talent#of0E00MZxg0zfcut0h
	Deep Frost Mage : https://classicdb.ch/?talent#of0EM0cZZVA0c0fzAo
	Arcane Frost Mage : https://classicdb.ch/?talent#of0ycocquZVA0c0r

	Sacrifice Lock : https://classicdb.ch/?talent#IV0bZfx0zThoZvx0tM0z
	Imp Lock : https://classicdb.ch/?talent#IEhbuRboVZZgx0tM0z

	Sword Rogue : https://classicdb.ch/?talent#fbecoxZMxqb0Vzxfo
	Mace Rogue : https://classicdb.ch/?talent#fbecoxZMxqb0Vt0fo
	Expose Rogue : https://classicdb.ch/?talent#f0ecRxZMhqbbVzxfo
	Expose Hemorrhage Rogue : https://classicdb.ch/?talent#f0ecRxZ0xVZxMe0Mhoo

	Hunter : https://classicdb.ch/?talent#ce0MZVEohthtf0b

	Feral Druid : https://classicdb.ch/?talent#0x0V0oZxxxscMdtx0b
	Healing Druid: https://classicdb.ch/?talent#0x0bIMVsZZxtcotq
	Swiftment Dot Druid: https://classicdb.ch/?talent#0xM0hMZZxEcoeqVo

	Healer Shaman : https://classicdb.ch/?talent#hZxZEfxtVeqo
	Improved WF Shaman : https://classicdb.ch/?talent#hZxdbbxGZtcxt0eo
