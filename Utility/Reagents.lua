------------------------------------------------------------------------------------------------------
--------------------------------------------- Reagents! ---------------------------------------------
------------------------------------------------------------------------------------------------------

local myClass = UnitClass("player")

function mb_buyBlessedSunfruits()

    local MB_sunfruitList = { 
        ["Druid"] = "Blessed Sunfruit Juice",
        ["Priest"] = "Blessed Sunfruit Juice",
        ["Shaman"] = "Blessed Sunfruit Juice",
        ["Paladin"] = "Blessed Sunfruit Juice",
        ["Warrior"] = "Blessed Sunfruit",
        ["Rogue"] = "Blessed Sunfruit"
    }

    local MB_sunfruitLimit = {
        ["Blessed Sunfruit Juice"] = { 20, 1 },
        ["Blessed Sunfruit"] = { 20, 1 }
    }
    
    local MB_sunfruitTexture = {
        ["Blessed Sunfruit Juice"] = "Interface\\Icons\\INV_Drink_16",
        ["Blessed Sunfruit"] = "Interface\\Icons\\INV_Misc_Food_41"
    }

    for class, item in pairs(MB_sunfruitList) do
        if myClass == class then 
            local myCurrentItems = math.ceil((mb_hasItem(item) / MB_sunfruitLimit[item][2]) / 5)
            local myNeededItems = (MB_sunfruitLimit[item][1] - myCurrentItems) / MB_sunfruitLimit[item][2]
            
            if myNeededItems > 0 then 
                for itemID = 1, 40 do
                    local itemName, itemTexture = GetMerchantItemInfo(itemID)
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

    local MB_reagentsList = {
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

    local MB_reagentsLimit = {
        ["Jagged Arrow"] = { 1, 2 },
        ["Flash Powder"] = { 80, 1 },
        ["Wild Thornroot"] = { 200, 1 },
        ["Ironwood Seed"] = { 20, 1 },
        ["Sacred Candle"] = { 200, 1 },
        ["Ankh"] = { 10, 1 },
        ["Arcane Powder"] = { 160, 1 },
        ["Rune of Portals"] = { 10, 1 },
        ["Symbol of Kings"] = { 5, 1 },
        ["Symbol of Divinity"] = { 10, 1 }
    }
    
    for item, class in pairs(MB_reagentsList) do
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

                for itemID = 1, 40 do
                    local merchantItemLink = GetMerchantItemLink(itemID)
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

function mb_hasItem(item)
    local count = 0
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do 
            local texture, itemCount, locked, quality, readable, lootable, link = GetContainerItemInfo(bag, slot) 
            if texture then
                link = GetContainerItemLink(bag, slot)
                if string.find(link, item) then
                    count = count + itemCount
                end
            end
        end
    end
    if count == 0 then 
        mb_message("I'm out of "..item)
    end
    return count
end