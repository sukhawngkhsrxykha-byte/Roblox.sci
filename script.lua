local p = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui",p.PlayerGui)

-- ปุ่มเปิด UI
local open = Instance.new("TextButton",gui)
open.Size = UDim2.new(0,50,0,50)
open.Position = UDim2.new(0,20,0,200)
open.Text = "UI"
open.BackgroundColor3 = Color3.fromRGB(0,170,255)
open.TextColor3 = Color3.new(1,1,1)

-- หน้าต่างหลัก
local frame = Instance.new("Frame",gui)
frame.Size = UDim2.new(0,230,0,260)
frame.Position = UDim2.new(0,80,0,120)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Visible = false

-- ปุ่มปิด
local close = Instance.new("TextButton",frame)
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(200,60,60)

-- Scroll
local scroll = Instance.new("ScrollingFrame",frame)
scroll.Size = UDim2.new(1,0,1,-40)
scroll.Position = UDim2.new(0,0,0,40)
scroll.CanvasSize = UDim2.new(0,0,0,300)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout",scroll)
layout.Padding = UDim.new(0,5)

-- ฟังก์ชันสร้างปุ่ม
local function btn(text,func)
	local b = Instance.new("TextButton",scroll)
	b.Size = UDim2.new(1,-10,0,40)
	b.Text = text
	b.BackgroundColor3 = Color3.fromRGB(60,60,60)
	b.TextColor3 = Color3.new(1,1,1)
	b.MouseButton1Click:Connect(func)
end

-- Auto Airdrop
btn("Auto Airdrop",function()
	print("Auto Airdrop ON")
end)

-- ESP
local esp=false
btn("ESP Toggle",function()
	esp = not esp
	for _,v in pairs(game.Players:GetPlayers()) do
		if v~=p and v.Character then
			if esp then
				Instance.new("Highlight",v.Character)
			end
		end
	end
end)

-- Teleport
btn("Teleport Player",function()
	for _,v in pairs(game.Players:GetPlayers()) do
		if v~=p and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
			p.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
			break
		end
	end
end)

-- เปิด UI
open.MouseButton1Click:Connect(function()
	frame.Visible = true
end)

-- ปิด UI
close.MouseButton1Click:Connect(function()
	frame.Visible = false
end)

-- ระบบลากหน้าต่าง
local dragging,dragInput,dragStart,startPos

local function update(input)
	local delta = input.Position - dragStart
	frame.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
end

frame.InputBegan:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
		dragging=true
		dragStart=input.Position
		startPos=frame.Position
		input.Changed:Connect(function()
			if input.UserInputState==Enum.UserInputState.End then
				dragging=false
			end
		end)
	end
end)

frame.InputChanged:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then
		dragInput=input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input==dragInput and dragging then
		update(input)
	end
end)
