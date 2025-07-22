--(Team! H4kId_1N 1! Join! TODAAAY!!!... RMT-HACK FE v1.2.8)--

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- Auto-create RemoteEvent
local Remote = ReplicatedStorage:FindFirstChild("REMOTE_BYPASS") or Instance.new("RemoteEvent", ReplicatedStorage)
Remote.Name = "REMOTE_BYPASS"

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "Team H4kId_1NtOdAy FuCk roblox-FE"
ScreenGui.ResetOnSpawn = false

-- Background blur
local blur = Instance.new("BlurEffect", game:GetService("Lighting"))
blur.Size = 12
task.delay(6, function()
	blur:Destroy()
end)

-- Main Frame
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 400, 0, 350)
Main.Position = UDim2.new(0.5, -200, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(255, 0, 0)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Parent = ScreenGui
Main.Active = true
Main.Draggable = true
Main.BackgroundTransparency = 0.2
Main.Size = UDim2.new(0, 0, 0, 0) -- Start small

-- Tween (scale in)
TweenService:Create(Main, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
	Size = UDim2.new(0, 400, 0, 350)
}):Play()

-- Title
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.Text = "Team H4kId_1NtOdAy FuCkS Roblox-FE"
Title.TextColor3 = Color3.fromRGB(85, 255, 85)
Title.TextScaled = true
Title.BackgroundTransparency = 1

-- Button Area
local ButtonsFrame = Instance.new("Frame", Main)
ButtonsFrame.Size = UDim2.new(1, 0, 0.2, 0)
ButtonsFrame.Position = UDim2.new(0, 0, 0.1, 0)
ButtonsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

local function makeButton(parent, pos, text, color)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(0.25, 0, 1, 0)
	btn.Position = UDim2.new(pos, 0, 0, 0)
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.BackgroundColor3 = color
	btn.TextScaled = true
	return btn
end

local ServerButton = makeButton(ButtonsFrame, 0, "ServerScript", Color3.fromRGB(0, 0, 255))
local LocalButton = makeButton(ButtonsFrame, 0.25, "LocalScript", Color3.fromRGB(0, 40, 0))
local ExecuteButton = makeButton(ButtonsFrame, 0.5, "Execute", Color3.fromRGB(0, 165, 0))
local ResetButton = makeButton(ButtonsFrame, 0.75, "Reset", Color3.fromRGB(255, 50, 0))

-- Text Boxes
local ServerBox = Instance.new("TextBox", Main)
ServerBox.Size = UDim2.new(1, 0, 0.6, 0)
ServerBox.Position = UDim2.new(0, 0, 0.3, 0)
ServerBox.Text = ""
ServerBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ServerBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ServerBox.TextScaled = true
ServerBox.PlaceholderText = "Write your ServerScript here..."

local LocalBox = ServerBox:Clone()
LocalBox.Parent = Main
LocalBox.Visible = false
LocalBox.PlaceholderText = "Write your LocalScript here..."

-- Toggle Visibility
ServerButton.MouseButton1Click:Connect(function()
	ServerBox.Visible = true
	LocalBox.Visible = false
end)
LocalButton.MouseButton1Click:Connect(function()
	ServerBox.Visible = false
	LocalBox.Visible = true
end)

-- Execute Logic
ExecuteButton.MouseButton1Click:Connect(function()
	local code = ServerBox.Visible and ServerBox.Text or LocalBox.Text
	if code and code ~= "" then
		local success, err = pcall(function()
			loadstring(code)()
		end)
		if not success then warn("Error: "..err) end
	end
end)

ResetButton.MouseButton1Click:Connect(function()
	ServerBox.Text = ""
	LocalBox.Text = ""
end)

-- Inject [RMT bypass] Green Button
local InjectBtn = Instance.new("TextButton", Main)
InjectBtn.Size = UDim2.new(0.25, 0, 0.1, 0)
InjectBtn.Position = UDim2.new(0.75, 0, 0.9, 0)
InjectBtn.Text = "Inject [RMT HACK]"
InjectBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
InjectBtn.BackgroundColor3 = Color3.fromRGB(10, 255, 15)
InjectBtn.TextScaled = true

InjectBtn.MouseButton1Click:Connect(function()
	Remote:FireServer("BYPASS_NOW", "DeleteTarget")
end)
