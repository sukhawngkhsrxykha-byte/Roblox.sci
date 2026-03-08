local player = game.Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,200,0,180)
frame.Position = UDim2.new(0.75,0,0.3,0)
frame.BackgroundColor3 = Color3.fromRGB(40,40,40)
frame.Active = true
frame.Draggable = true

local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1,0,1,0)
scroll.CanvasSize = UDim2.new(0,0,0,300)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0,5)

-- Auto Airdrop
local auto = Instance.new("TextButton", scroll)
auto.Size = UDim2.new(1,0,0,40)
auto.Text = "Auto Airdrop : OFF"

local autoOn = false
auto.MouseButton1Click:Connect(function()
	autoOn = not autoOn
	auto.Text = "Auto Airdrop : "..(autoOn and "ON" or "OFF")
end)

-- ESP
local esp = Instance.new("TextButton", scroll)
esp.Size = UDim2.new(1,0,0,40)
esp.Text = "ESP : OFF"

local espOn = false
esp.MouseButton1Click:Connect(function()
	espOn = not espOn
	esp.Text = "ESP : "..(espOn and "ON" or "OFF")
end)

-- Teleport
local tp = Instance.new("TextButton", scroll)
tp.Size = UDim2.new(1,0,0,40)
tp.Text = "Teleport Airdrop"

tp.MouseButton1Click:Connect(function()
	print("Teleport ไป Airdrop")
end)
