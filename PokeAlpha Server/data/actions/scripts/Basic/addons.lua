local addons = {
[12636] = {pokemon = "Crobat" , looktype = 2035},
}

local function getOldAddon (looktype)
	for index, value in pairs (addons) do
		if value.looktype == looktype then
			return index
		end
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local numero = addons[item.itemid].looktype
	local pb = itemEx.uid
	local pk = addons[item.itemid].pokemon
	
	if not isPokeball(itemEx.itemid) then 
		doPlayerSendCancel(cid, "Você só poder usar este item em uma poke ball.")
	return true
	end
	
	if getPlayerSlotItem (cid, 8).uid == pb and (getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 63215) >= 1) then
		doPlayerSendCancel (cid, "Desmonte do seu pokémon e volte-o para a poke ball.")
	return true
	end
	
	if getItemAttribute(pb, "addon") and getItemAttribute(pb, "addon") == numero then
		doPlayerSendCancel(cid, "Seu pokémon já está com este addon.")
	return true
	end     
	
	if #getCreatureSummons(cid) > 0 then
		doPlayerSendCancel(cid, "Por favor, volte o seu pokémon para a poke ball.")
	return true
	end   
	
	if getItemAttribute(pb, "poke") ~= pk then
		doPlayerSendCancel(cid, "Desculpe, você não pode adicionar este addon neste pokémon.")
	return true
	end
	
	if getItemAttribute (pb, "addon") and getItemAttribute (pb, "addon") > 1 then
		doPlayerSendTextMessage(cid, 27, "Você substituiu um "..getItemNameById (getOldAddon (getItemAttribute (pb, "addon"))).." por um "..getItemNameById (item.itemid).."!")
	else
		doPlayerSendTextMessage(cid, 27, "Agora seu pokémon usará este "..getItemNameById (item.itemid).."!")
	end
	
	doRemoveItem(item.uid, 1)
	doSetItemAttribute(pb, "addon", numero)   
return true
end