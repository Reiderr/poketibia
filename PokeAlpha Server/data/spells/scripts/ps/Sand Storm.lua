function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Sand Storm")

return true
end