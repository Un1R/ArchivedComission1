local Folder = workspace:WaitForChild("Monsters")
local DropModule = require(script:WaitForChild("Drop"))

local Monsters = {}

for index,monster in ipairs(Folder:GetChildren()) do
	if monster:IsA("Model") and monster:FindFirstChild("Monster") then
		table.insert(Monsters,monster)
	end
end

Folder.ChildAdded:Connect(function(Child)
	if Child:IsA("Model") and Child:FindFirstChild("Monster") then
		table.insert(Monsters,Child)
	end
end)

for index,monster_ in ipairs(Monsters) do
	if monster_:FindFirstChild("Monster") then
		if monster_:FindFirstChild("Head"):FindFirstChild("BillboardGui") then
			local GUI = monster_:FindFirstChild("Head"):FindFirstChild("BillboardGui")
			GUI.SkeletonName.Text = monster_.Name
			monster_:FindFirstChild("Monster"):GetPropertyChangedSignal("Health"):Connect(function()
				local HP = ((monster_.Monster.Health / monster_.Monster.MaxHealth))
				GUI.HealthBar.Size = UDim2.new(HP,0,0.326,0)
			end)
			monster_.Monster.Died:Connect(function()
				local RandomBone = DropModule.PickRandomFromBone(DropModule.Bones)
				DropModule.ShowDrop(RandomBone,monster_)
			end)
		end
	end
end
