function onSay(cid, words, param, channel)

if param == "" then
return sendMsgToPlayer(cid, 20, "Estao faltam os parametros! [clan name], [rank]")
end
local t = string.explode(param, ",")
local clans = {'Volcanic', 'Seavell', 'Orebound', 'Wingeon', 'Malefic', 'Gardestrike', 'Psycraft', 'Naturia', 'Raibolt', "Ironhard"}
if not isInArray(clans, t[1]) then
   return sendMsgToPlayer(cid, 20, t[1].." nao é uma clan valido!")
elseif not tonumber(t[2]) then
   return sendMsgToPlayer(cid, 20, "Parametros errados! [clan name], [rank].")
end

local rank = tonumber(t[2])
local clan = t[1]

local diamond = 2149 -- id do "diamond"
local price = 50 -- preço que custa a cada vez para mudar de clan
local lvl = 120 -- lvl que precisa pra mudar de clan, aconselho não mudar, pq o rank 5 precisa de lvl 120...
local msg1 = "Parabens! Você mudou para o clan "..clan.." rank "..rank.."!" -- Mensagem que ira mandar ao trocar de clan
local msgfail = "Você precisa de "..price.." diamonds para mudar de clan." -- mensagem caso o player não tenha os diamonds
local msgfail2 = "Você precistar estar no lvl "..lvl.." para mudar de clan." -- mensagem caso o player não tenha o level

    if getPlayerItemCount(cid, diamond) >= price then
        doPlayerSendTextMessage(cid, 27, msg1)
        doPlayerRemoveItem(cid, diamond, price)
        setPlayerClan(cid, clan)
        setPlayerClans(cid, clan)
        setPlayerClanRank(cid, rank)
    else
        if getPlayerItemCount(cid, diamond) < price then
            return doPlayerSendCancel(cid, msgfail)
        else
            return doPlayerSendCancel(cid, "Sorry, not possible.")
        end
        if(getPlayerLevel(cid) < lvl) then
            return doPlayerSendCancel(cid, msgfail2)
        else
            return doPlayerSendCancel(cid, "Sorry, not possible.")
        end
        doPlayerSendTextMessage(cid, 27, msg1)
        doPlayerRemoveItem(cid, diamond, price)
        setPlayerClan(cid, clan)
        setPlayerClans(cid, clan)
        setPlayerClanRank(cid, rank)
    end
    return true

end
