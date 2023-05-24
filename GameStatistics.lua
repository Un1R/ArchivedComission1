local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(Player)
	
	local Character = Player.Character or Player.CharacterAdded:Wait()
	local leaderstats = Instance.new("Folder")
	local Gold = Instance.new("IntValue")
	local BonesInBackpack = Instance.new("IntValue")
	local BackpackCapacity = Instance.new("IntValue")
	local BackpacksOwned = Instance.new("Folder")
	local BackpackEquipped = Instance.new("StringValue")
	local BoughtTools = Instance.new("Folder")
	local EquippedTool = Instance.new("StringValue")
	
	leaderstats.Name = "leaderstats"
	Gold.Name = "Gold"
	BonesInBackpack.Name = "BonesInBackpack"
	BackpackCapacity.Name = "BackpackCapacity"
	BackpacksOwned.Name = "BackpacksOwned"
	BackpackEquipped.Name = "BackpackEquipped"
	BoughtTools.Name = "BoughtTools"
	EquippedTool.Name = "EquippedTool"
	
	leaderstats.Parent = Player
	Gold.Parent = leaderstats
	BonesInBackpack.Parent = Player
	BackpackCapacity.Parent = Player
	BackpacksOwned.Parent = Player
	BackpackEquipped.Parent = Player
	BoughtTools.Parent = Player
	EquippedTool.Parent = Player
	
	Gold.Value = 9999
	BonesInBackpack.Value = 0
	BackpackCapacity.Value = 10
    BackpackEquipped = "Nothing"	
	EquippedTool.Value = "Fists"
	
end)
