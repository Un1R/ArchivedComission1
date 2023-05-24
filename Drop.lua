local module = {
	Bones = {
		Bone = 75;
		TwoRegularBones = 15;
		RareShinyBone = 10;
	};
	BoneGiveAmount = {
		Bone = 1;
		TwoRegularBones = 2;
		RareShinyBone = 1;
	}
}

local GameStatisticsModule = require(game:GetService("ServerScriptService"):FindFirstChild("GameStatisticsModule"))

module.GetChanceOfBone = function(bone)
	local chance = 0

	for boneName,boneChance in pairs(bone) do
		chance += boneChance
	end

	return chance
end


module.PickRandomFromBone = function(bone)
	local chance = module.GetChanceOfBone(bone)

	local chance = math.random(0, chance)

	for boneName,boneChance in pairs(bone) do
		chance -= boneChance

		if chance <= 0 then
			return boneName
		end
	end	
end


module.ShowDrop = function(BoneName , Monster)
	local Bone = script:FindFirstChild("DropModels"):FindFirstChild(BoneName)
	if not Bone then
		return warn("BONE DROP NAMED ".. "'" .. BoneName .. "'" .. " DOES NOT EXIST!")
	end
	if not Bone.PrimaryPart then
		return warn("BONE DROP NAMED ".. "'".. BoneName .."'" .. " DOESN'T HAVE A PRIMARY PART ASSIGNED!")
	end
	local Duplicate = Bone:Clone()
	Duplicate.Parent = workspace:FindFirstChild("Drops")
	Duplicate:SetPrimaryPartCFrame(Monster:FindFirstChild("Torso").CFrame * CFrame.new(0,1.1,0))
	Monster:FindFirstChild("Torso"):ApplyImpulse(Vector3.new(55,0,3))
	Duplicate.PrimaryPart.Touched:Connect(function(Part)
		local Player = game.Players:GetPlayerFromCharacter(Part.Parent)
		if Player then
			Duplicate:Destroy()
			GameStatisticsModule.IncrementValue("BonesInBackpack",module.BoneGiveAmount[BoneName],Player)
		end
	end)
	game:GetService("Debris"):AddItem(Duplicate,5)
end

return module
