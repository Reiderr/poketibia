local outfitm = {}
local let = {}
local namem = ""
local namef = ""

function onUse(cid, item, fromPosition, itemEx, toPosition)

if getPlayerGroupId(cid) == 11 then
return true
end

if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 then
return true
end

if getPlayerStorageValue(cid, 10) <= 0 then
   setPlayerStorageValue(cid, 10, 1)
   doRemoveCondition(cid, CONDITION_OUTFIT)
   outfitm = {lookType = 615, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
   let = {lookType = 614, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
   namem = "Elite Trainer"
   namef = "Elite Trainer"
elseif getPlayerStorageValue(cid, 10) == 1 then
   setPlayerStorageValue(cid, 10, 2)
   doRemoveCondition(cid, CONDITION_OUTFIT)
   outfitm = {lookType = 517, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
   let = {lookType = 516, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
   namem = "Athletic"
   namef = "Athletic"
elseif getPlayerStorageValue(cid, 10) == 2 then
   setPlayerStorageValue(cid, 10, 0)
   doRemoveCondition(cid, CONDITION_OUTFIT)
   outfitm = {lookType = 519, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
   let = {lookType = 518, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}
   namem = "Punk"
   namef = "Punk"
end
if getPlayerSex(cid) == 1 then
   doSetCreatureOutfit(cid, outfitm, -1)
   doPlayerSendTextMessage(cid, 27, "You are trying on the "..namem.." outfit.")
elseif getPlayerSex(cid) == 0 then
   doSetCreatureOutfit(cid, let, -1)
   doPlayerSendTextMessage(cid, 27, "You are trying on the "..namef.." outfit.")
end
return true
end