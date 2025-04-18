local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AdminMenu"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(20, 0, 20)
frame.BorderColor3 = Color3.fromRGB(150, 0, 150)
frame.BorderSizePixel = 3
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, -30, 0, 25)
label.Position = UDim2.new(0, 5, 0, 5)
label.BackgroundTransparency = 1
label.Text = "JToH Cheat [by riot]"
label.TextColor3 = Color3.fromRGB(200, 60, 200)
label.Font = Enum.Font.Arcade
label.TextScaled = true
label.Parent = frame

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -30, 0, 5)
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 60, 60)
close.Font = Enum.Font.Arcade
close.TextScaled = true
close.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
close.BorderColor3 = Color3.fromRGB(150, 0, 0)
close.Parent = frame

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

local textbox = Instance.new("TextBox")
textbox.Text = "TowerName"
textbox.Size = UDim2.new(0.45, 0, 0, 40)
textbox.Position = UDim2.new(0.05, 0, 0.4, 0)
textbox.BackgroundColor3 = Color3.fromRGB(10, 0, 10)
textbox.TextColor3 = Color3.fromRGB(180, 60, 180)
textbox.BorderColor3 = Color3.fromRGB(120, 0, 120)
textbox.BorderSizePixel = 2
textbox.Font = Enum.Font.Arcade
textbox.TextScaled = true
textbox.ClearTextOnFocus = true
textbox.Parent = frame

local button = Instance.new("TextButton")
button.Text = "Complete"
button.Size = UDim2.new(0.45, 0, 0, 40)
button.Position = UDim2.new(0.05, 0, 0.65, 0)
button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button.TextColor3 = Color3.fromRGB(200, 60, 200)
button.BorderColor3 = Color3.fromRGB(150, 0, 150)
button.BorderSizePixel = 2
button.Font = Enum.Font.Arcade
button.TextScaled = true
button.Parent = frame

button.MouseButton1Click:Connect(function()
	local vName = textbox.Text
	if vName == "" then return end

	local tool1 = Instance.new("Tool")
	tool1.Name = "Toxic Wings"
	tool1.Parent = player.Character
	task.wait(0.2)

	local tool2 = Instance.new("Tool")
	tool2.Name = "Heavenly Orb"
	tool2.Parent = player.Character
	task.wait(0.2)

	local tool3 = Instance.new("Tool")
	tool3.Name = "Candy Cane Grappling Hook"
	tool3.Parent = player.Character
	task.wait(0.2)

	local tool4 = Instance.new("Tool")
	tool4.Name = "Heavenly Coil"
	tool4.Parent = player.Character

	local tpModel = game.Workspace:FindFirstChild("Teleporters", true)
	if tpModel then
		local towerTp = tpModel:FindFirstChild(vName)
		if towerTp and towerTp:FindFirstChild("Teleporter") and towerTp.Teleporter:FindFirstChild("TPFRAME") then
			player.Character:SetPrimaryPartCFrame(towerTp.Teleporter.TPFRAME.CFrame)
			task.wait(1)
		end
	end

	local winpad
	for _, w in pairs(game.Workspace:FindFirstChild("WinPads", true):GetChildren()) do
		if w:IsA("BasePart") and w:FindFirstChild("TowerId") then
			if tostring(w.TowerId.Value) == tostring(vName) then
				winpad = w
				break
			end
		end
	end

	if winpad then
		player.Character:SetPrimaryPartCFrame(winpad.CFrame)
	end

	task.wait(1)

	local restartBrick = game.Workspace:FindFirstChild("RestartBrick", true)
	if restartBrick then
		player.Character:SetPrimaryPartCFrame(restartBrick.CFrame)
	end

	player.CharacterAdded:Wait()
	task.wait(0.5)
end)
