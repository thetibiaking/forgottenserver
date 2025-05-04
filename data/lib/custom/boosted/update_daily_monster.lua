function updateBoostedCreatureInDatabase() 
local randomMonsterIndex = math.random(#boostedMonsterList)
local randomMonster = boostedMonsterList[randomMonsterIndex]
local query = string.format("INSERT INTO boosted_creature (date, boostname, raceid) VALUES (NOW(), '%s', '%s')", randomMonster, randomMonster)
	db.query(query)
	setGlobalStorageValue(boostedCreature, randomMonsterIndex)
end
