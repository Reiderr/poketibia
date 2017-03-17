local megasStones = {15133}
local megasToPlayer = {
	["Blastoisinite"] = {id = 15133, megaID = "", pokeName = "Blastoise"},
}
function onSay(cid, words, param)
 
local diamond = 2149
local price = 50
local unique = false
local boost = 0
local config = nil

if getPlayerItemCount(cid, diamond) < price then
return doPlayerSendTextMessage(cid, 20, "You need ".. price .." emeralds.") and true
end

if getPlayerItemCount(cid, diamond) > price then

	local mega = megasStones[math.random(1, #megasStones)]
		
		for a, b in pairs(megasToPlayer) do
			if mega == b.id then 
				addPokeToPlayer(cid, b.pokeName, 0, nil, "ultra", false, a)


doPlayerRemoveItem(cid, diamond, price)
doSendAnimatedText(getThingPos(cid), "Ditto!", math.random(1, 255))
doPlayerSendTextMessage(cid, 20, "Congratulations for your purchase!")
				break
			end
		end	
	 return true
end
return true
end