local UIS = game:GetService("UserInputService")

local p = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = p.PlayerGui

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,200,0,250)
frame.Position = UDim2.new(0,20,0,100)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Active = true
frame.Draggable = true

-- ปุ่มต่างๆ
local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1,0,1,0)
scroll.CanvasSize = UDim2.new(0,0,0,300)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)

local function btn(name,func)
	local b = Instance.new("TextButton",scroll)
	b.Size = UDim2.new(1,-10,0,40)
	b.Text = name
	b.BackgroundColor3 = Color3.fromRGB(60,60,60)
	b.TextColor3 = Color3.new(1,1,1)
	b.MouseButton1Click:Connect(func)
end

btn("Auto Airdrop",function()
	print("Auto Airdrop ON")
end)

btn("ESP",function()
	print("ESP Toggle")
end)

btn("Teleport Airdrop",function()
	print("TP Airdrop")
end)

-- ปุ่มเปิด/ปิด UI
UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.RightControl then
		frame.Visible = not frame.Visible
	end
end)
