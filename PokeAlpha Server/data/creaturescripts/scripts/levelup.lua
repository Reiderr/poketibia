local configuracao = {
efeito = {28, 29}, 		-- Efeito que vai mandar ao avançar de level.
texto = "Level up!", 	-- Texto que vai aparecer ao avançar de level.
cortexto = 215		-- Cor do texto, sendo o número entre 1 e 254.
}

function onAdvance(cid, skill, oldLevel, newLevel)
if skill ~= 8 then return true end
if newLevel >= 11 and newLevel <= 200 then doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, math.floor(newLevel/2)) end   --alterado v1.8



doRegainSpeed(cid)
local p = getThingPosWithDebug(cid)
doSendMagicEffect({x=p.x+1, y=p.y, z=p.z}, 382)

local color = 0

local s = getCreatureSummons(cid)
local item = getPlayerSlotItem(cid, 8)
  -- doCreatureAddHealth(cid, getCreatureMaxHealth(cid))                                                            
return true
end