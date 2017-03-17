function onUse(cid, item, frompos, item2, topos)
	if item.itemid == 12330 then
		if isInChannelsArray(cid) then 
			doSendMsg(cid, "You are recording.") 
			return true 
		end
	
		if getPlayerStorageValue(cid, 99284) == 2 then
			doPlayerSendCancel(cid, "You need to close the private channel to record.")
		return true
		end

		if getPlayerStorageValue(cid, 99284) == 1 then
			doPlayerSendCancel(cid, "You are recording in: "..getPlayerStorageValue(cid, 99285).."")
			doPlayerSendChannel(cid, getPlayerChannelId(cid), getPlayerStorageValue(cid, 99285))
		return true
		end

		if not isPremium(cid) then
			doPlayerSendCancel(cid, "Only premium account can record.")
		return true
		end
		doCreateChannelTVs(cid)
	else
		if isInChannelsArray(cid) then 
			doSendMsg(cid, "You can't see TV if you are recording.") 
			return true 
		end
		if isRiderOrFlyOrSurf(cid) then 
		   doSendMsg(cid, "You can't see TV if you are riding.")
		   return true 
		end
		doOpenChannelTVs(cid)
		doCreatureSetNoMove(cid, true)
		addEvent(doCreatureSetNoMove, 9000, cid, false)

	end
	
end