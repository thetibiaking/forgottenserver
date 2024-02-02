function onLogin(player)
local boostedMonsterIndex = getGlobalStorageValue(BOOSTED_BOSS) -- SHOULD BE AN UTIL IN LIB
local boostedMonster = boostedBossesList[boostedMonsterIndex] -- SHOULD BE AN UTIL IN LIB
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Today's boosted boss is : " .. boostedMonster .. "!")
    return true
end
