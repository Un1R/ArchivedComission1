local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()
local Hitting = false
local once = false

local function Main(Character)
	local Humanoid = Character:WaitForChild("Humanoid")
	local Animator = Humanoid:WaitForChild("Animator")

	Character.ChildAdded:Connect(function(Child)
		if Child:IsA("Tool") then
			if Child:FindFirstChild("Hitbox_Hands_Value") then

				Mouse.Button1Down:Connect(function()
					if Hitting == false and Child.Parent:IsA("Model") and game.Players:FindFirstChild(Child.Parent.Name) then
						Hitting = true
						local Activate = Child:WaitForChild("Activate")
						local Track		
						
						Track = Animator:LoadAnimation(Activate)
						Track:Play()

						if Character:FindFirstChild("Left Arm") and once == false then
							once = true
							local raycastParams = RaycastParams.new()
							raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
							raycastParams.FilterDescendantsInstances = {
								Character:FindFirstChild("Left Arm");
								Character:FindFirstChild("Right Arm");
								Character:FindFirstChild("HumanoidRootPart");
								Character:FindFirstChild("Head");
								Character:FindFirstChild("Right Leg");
								Character:FindFirstChild("Left Leg");
								Character:FindFirstChild("Torso");
								Character;
								Child;
							}
							
							local CastRay1 = workspace:Raycast(Character:FindFirstChild("Left Arm").Position,Vector3.new(0,0,3.75),raycastParams)
							local CastRay2 = workspace:Raycast(Character:FindFirstChild("Left Arm").Position,Vector3.new(0,0,-3.75),raycastParams)
							local CastRay3 = workspace:Raycast(Character:FindFirstChild("Left Arm").Position,Vector3.new(0,3.75,0),raycastParams)
							local CastRay4 = workspace:Raycast(Character:FindFirstChild("Left Arm").Position,Vector3.new(0,-3.75,0),raycastParams)
							local CastRay5 = workspace:Raycast(Character:FindFirstChild("Left Arm").Position,Vector3.new(3.75,0,0),raycastParams)
							local CastRay6 = workspace:Raycast(Character:FindFirstChild("Left Arm").Position,Vector3.new(-3.75,0,0),raycastParams)
							
							local y,n = pcall(function()
								local Instance1 = CastRay1.Instance
								
								if Instance1 then
									return Instance1
								else return 'n_' end
								
							end)
							
							local y1,n1 = pcall(function()
								local Instance2 = CastRay2.Instance

								if Instance2 then
									return Instance2
								else return 'n_' end

							end)
							
							local y2,n2 = pcall(function()
								local Instance3 = CastRay3.Instance

								if Instance3 then
									return Instance3
								else return 'n_' end

							end)
							
							local y3,n3 = pcall(function()
								local Instance4 = CastRay4.Instance

								if Instance4 then
									return Instance4
								else return 'n_' end

							end)
							
							local y4,n4 = pcall(function()
								local Instance5 = CastRay5.Instance

								if Instance5 then
									return Instance5
								else return 'n_' end

							end)
							
							local y5,n5 = pcall(function()
								local Instance6 = CastRay6.Instance

								if Instance6 then
									return Instance6
								else return 'n_' end

							end)	
							
							if n ~= nil then
								
								if typeof(n) == "string" then
									
								else
									if n:IsA("BasePart") or n:IsA("MeshPart") or n:IsA("UnionOperation") then
										Child:FindFirstChild("ActivateSound"):Play()
										game:GetService("ReplicatedStorage"):FindFirstChild("CombatRemote"):FireServer(Player,Child,n)
										wait(0.4)
										once = false
										Hitting = false
										return
									end
								end
								
							end
							
							if n1 ~= nil then

								if typeof(n1) == "string" then

								else
									if n1:IsA("BasePart") or n1:IsA("MeshPart") or n1:IsA("UnionOperation") then
										Child:FindFirstChild("ActivateSound"):Play()
										game:GetService("ReplicatedStorage"):FindFirstChild("CombatRemote"):FireServer(Player,Child,n1)
										wait(0.4)
										once = false
										Hitting = false
										return
									end
								end

							end
							
							if n2 ~= nil then

								if typeof(n2) == "string" then

								else
									if n2:IsA("BasePart") or n2:IsA("MeshPart") or n2:IsA("UnionOperation") then
										Child:FindFirstChild("ActivateSound"):Play()
										game:GetService("ReplicatedStorage"):FindFirstChild("CombatRemote"):FireServer(Player,Child,n2)
										wait(0.4)
										once = false
										Hitting = false
										return
									end
								end

							end
							
							if n3 ~= nil then

								if typeof(n3) == "string" then

								else
									if n3:IsA("BasePart") or n3:IsA("MeshPart") or n3:IsA("UnionOperation") then
										Child:FindFirstChild("ActivateSound"):Play()
										game:GetService("ReplicatedStorage"):FindFirstChild("CombatRemote"):FireServer(Player,Child,n3)
										wait(0.4)
										once = false
										Hitting = false
										return
									end
								end

							end
							
							if n4 ~= nil then

								if typeof(n4) == "string" then

								else
									if n4:IsA("BasePart") or n4:IsA("MeshPart") or n4:IsA("UnionOperation") then
										Child:FindFirstChild("ActivateSound"):Play()
										game:GetService("ReplicatedStorage"):FindFirstChild("CombatRemote"):FireServer(Player,Child,n4)
										wait(0.4)
										once = false
										Hitting = false
										return
									end
								end

							end
							
							if n5 ~= nil then

								if typeof(n5) == "string" then

								else
									if n5:IsA("BasePart") or n5:IsA("MeshPart") or n5:IsA("UnionOperation") then
										Child:FindFirstChild("ActivateSound"):Play()
										game:GetService("ReplicatedStorage"):FindFirstChild("CombatRemote"):FireServer(Player,Child,n5)
										wait(0.4)
										once = false
										Hitting = false
										return
									end
								end

							end
							
						end
						
						wait(0.4)
						once = false
						Hitting = false
					end
				end)

			end
		end
	end)
end

if Player.Character then
	Main(Player.Character)
elseif not Player.Character then
	repeat
		wait()
	until Player.Character
	Main(Player.Character)
end
