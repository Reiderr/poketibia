function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Giant Water Gun")

return true
end