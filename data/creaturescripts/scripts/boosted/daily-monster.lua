function onLogin(player)
local boostedMonsterIndex = getGlobalStorageValue(boostedCreature) -- SHOULD BE AN UTIL IN LIB
local boostedMonster = boostedMonsterList[boostedMonsterIndex] -- SHOULD BE AN UTIL IN LIB
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Today's boosted creature is : " .. boostedMonster .. "!")
    return true
end
