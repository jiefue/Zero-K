
local defaultRank = {}

for i = 1, #UnitDefs do
	local ud = UnitDefs[i]
	defaultRank[i] = ud.customParams.selection_rank and tonumber(ud.customParams.selection_rank)
	if not defaultRank[i] then
		if (ud.isImmobile or ud.speed == 0) and not ud.isFactory then
			defaultRank[i] = 1
		elseif (ud.isMobileBuilder or ud.isFactory) and not ud.customParams.commtype then
			defaultRank[i] = 2
		else
			defaultRank[i] = 3
		end
	end
end

return defaultRank
