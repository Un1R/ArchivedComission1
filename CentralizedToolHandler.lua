local Container = script.Parent:WaitForChild("Container")
local Modules = script.Parent:WaitForChild("Modules")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CombatRemote = ReplicatedStorage:WaitForChild("CombatRemote")

CombatRemote.OnServerEvent:Connect(function(_,player,tool,target)
	if tool:FindFirstChild("Hitbox_Hands_Value").Value == true then
		local Character = player.Character
		if not Character then
			return warn("CHARACTER NOT FOUND :: Combat_Remote")
		end
		local LeftArm = Character:FindFirstChild("Left Arm")
		local Humanoid = Character:FindFirstChild("Humanoid")
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
		if not LeftArm or not Humanoid or not HumanoidRootPart then
			return warn("ESSENTIAL INSTANCE(S) NOT FOUND :: Combat_Remote")
		end
		if Humanoid.Health <= 0 then
			return warn("PLAYER'S HEALTH IS BELOW OR EQUAL TO 0 :: Combat_Remote")
		end
		
		local TargetHumanoid
		if target.Parent:FindFirstChild("Monster") then
			TargetHumanoid = target.Parent:FindFirstChild("Monster")
		elseif target.Parent.Parent:FindFirstChild("Monster") then
			TargetHumanoid = target.Parent.Parent:FindFirstChild("Monster")
		elseif not target.Parent:FindFirstChild("Monster") and not target.Parent.Parent:FindFirstChild("Monster") then
			TargetHumanoid = nil
		end
		if TargetHumanoid == nil then
			return
		end
		if (HumanoidRootPart.Position - TargetHumanoid.Parent.Torso.Position).Magnitude > 15 then
			return warn("PLAYER TOO FAR AWAY TO DAMAGE, POSSIBLE EXPLOITER. USERNAME: " .. player.Name .. " :: Combat_Remote")
		end
		
		if TargetHumanoid then
			local Module = require(Modules:WaitForChild(tool.Name))
			TargetHumanoid:TakeDamage(Module.Damage)
			return 'DAMAGE TAKEN'
		end
		
	end
end)

Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAdded:Connect(function(Character)
		if not Player:FindFirstChild("EquippedTool") then
			repeat
				wait()
			until Player:FindFirstChild("EquippedTool")
		end
		local LoadedTracks = {
			Idle = nil;
		}
		
		local Humanoid = Character:WaitForChild("Humanoid")
		local Animator = Humanoid:WaitForChild("Animator")
		local Backpack = Player:WaitForChild("Backpack")
		local ToolEquipped = Player:FindFirstChild("EquippedTool")

		local Tool = Container:WaitForChild(ToolEquipped.Value)
		local ToolModule = require(Modules:WaitForChild(ToolEquipped.Value))
		local ToolHandler = script:WaitForChild("ToolClientHandler"):Clone()
		ToolHandler.Parent = Character
		
		local ToolInCharacter = Tool:Clone()
		ToolInCharacter.Parent = Backpack
		
		ToolInCharacter:GetPropertyChangedSignal("Parent"):Connect(function()
			if ToolInCharacter.Parent:IsA("Model") and game.Players:FindFirstChild(ToolInCharacter.Parent.Name) then
				local Idle = ToolInCharacter:WaitForChild("Idle")		
				LoadedTracks.Idle = Animator:LoadAnimation(Idle)
				LoadedTracks.Idle:Play()
			end
		end)
		
		ToolInCharacter:GetPropertyChangedSignal("Parent"):Connect(function()
			if ToolInCharacter.Parent.Name == "Backpack" then
				if LoadedTracks.Idle.IsPlaying then
					LoadedTracks.Idle:Stop()
				end
			end
		end)
		
	end)
end)
