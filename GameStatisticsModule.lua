local module = {}

module.IncrementValue = function(ValueName, ToAdd, Player)
	local Stats = Player:WaitForChild("leaderstats")
	local Value = Stats:FindFirstChild(ValueName)
	if Value then
		Value.Value += ToAdd
		return
	elseif not Value then
		local Value1 = Player:FindFirstChild(ValueName,true)
		if Value1 then
			Value1.Value += ToAdd
			return
		end
		if not Value1 then
			return
		end
	end
	return
end

module.ReductValue = function(ValueName, ToReduct, Player)
	local Stats = Player:WaitForChild("leaderstats")
	local Value = Stats:FindFirstChild(ValueName)
	if Value then
		Value.Value -= ToReduct
		return
	elseif not Value then
		local Value1 = Player:FindFirstChild(ValueName,true)
		if Value1 then
			Value1.Value -= ToReduct
			return
		end
		if not Value1 then
			return
		end
	end
	return
end

module.ChangeValue = function(ValueName, ChangeTo, Player)
	local Value = Player:FindFirstChild(ValueName,true)
	if Value then
		Value.Value = ChangeTo
		return
	end
end

return module
