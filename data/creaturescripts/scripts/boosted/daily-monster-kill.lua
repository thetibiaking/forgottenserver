function onKill(creature, target) -- SHOULD BE REFAC TO LIB FUNCTIONS ALSO

    if not creature or not target then
        return true
    end

    local creatureName = creature:getName()
    local targetMonster = Monster(target)
    local targetName = targetMonster and targetMonster:getName():lower() or nil


    if not targetMonster or targetMonster:isPlayer() or targetMonster:getMaster() then
        return true
    end

    local boostedMonsterIndex = getGlobalStorageValue(BOOSTED_MONSTER)
    if boostedMonsterIndex > 0 and boostedMonsterIndex <= #boostedMonsterList then
        local boostedMonster = boostedMonsterList[boostedMonsterIndex]
        -- DISABLE IF IN PRODUCTION ONLY FOR TESTS
        print ("[Boost monster] kill boosted" ..boostedMonster)
        print ("[Boost monster] kill boosted index" ..boostedMonsterIndex)
        
        -- Apply bost to all player who have contribuited to kill monster
        if targetName == boostedMonster then
            local damageMap = targetMonster:getDamageMap()
            -- TRY TO EXP SHARE NOT WORKS
           -- local totalDamage = 0

            -- for _, dmg in pairs(damageMap) do
            --     totalDamage = totalDamage + dmg.damage
            -- end

            for pid, dmg in pairs(damageMap) do
                local player = Player(pid)
                if player then
                    -- TRY TO EXP SHARE NOT WORKS
                   -- local expShare = math.floor(targetMonster:getType():getExperience() * (dmg.damage / totalDamage))
                  ---  player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You contributed to killing a boosted ' .. boostedMonster)
                  --  player:addExperience(expShare, true)
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You contributed to killing a boosted ' .. boostedMonster)
                    local exp = math.floor(targetMonster:getType():getExperience() * (Game.getExperienceStage(player:getLevel()) / 1))
                    player:addExperience(exp, true)
                end
            end
        end
    end

    return true
end
