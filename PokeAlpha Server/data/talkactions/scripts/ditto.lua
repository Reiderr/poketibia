function onSay(cid, words, param)
 
local diamond = 2149
local price = 15
local unique = false
local boost = 0
local config = nil

if getPlayerItemCount(cid, diamond) < price then
return doPlayerSendTextMessage(cid, 20, "Voce precisa de ".. price .." emeralds para comprar o ditto.") and true
end

if getPlayerItemCount(cid, diamond) > price then

addPokeToPlayer(cid, "Ditto", 0, nil, "poke", false)

doPlayerRemoveItem(cid, diamond, price)
doSendAnimatedText(getThingPos(cid), "Ditto!", math.random(1, 255))
doPlayerSendTextMessage(cid, 20, "Voce comprou o pokemon com sucesso!")
return true
end
end