function onLogin(player)
local boostedMonsterIndex = getGlobalStorageValue(BOOSTED_MONSTER) -- SHOULD BE AN UTIL IN LIB
local boostedMonster = boostedMonsterList[boostedMonsterIndex] -- SHOULD BE AN UTIL IN LIB
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Today's boosted creature is : " .. boostedMonster .. "!")
    return true
end
