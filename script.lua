local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,200,0,120)
frame.Position = UDim2.new(0.8,0,0.4,0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local autoBtn = Instance.new("TextButton", frame)
autoBtn.Size = UDim2.new(1,0,0,40)
autoBtn.Text = "Auto Airdrop OFF"

local espBtn = Instance.new("TextButton", frame)
espBtn.Position = UDim2.new(0,0,0,40)
espBtn.Size = UDim2.new(1,0,0,40)
espBtn.Text = "ESP OFF"

local tpBtn = Instance.new("TextButton", frame)
tpBtn.Position = UDim2.new(0,0,0,80)
tpBtn.Size = UDim2.new(1,0,0,40)
tpBtn.Text = "Teleport Airdrop"

local auto = false
local esp = false

-- หาแอร์ดรอป
function getAirdrop()
    for _,v in pairs(workspace:GetDescendants()) do
        if string.find(string.lower(v.Name),"airdrop") then
            return v
        end
    end
end

-- Teleport
tpBtn.MouseButton1Click:Connect(function()
    local drop = getAirdrop()
    if drop and drop:IsA("BasePart") then
        char:MoveTo(drop.Position)
    end
end)

-- ESP
espBtn.MouseButton1Click:Connect(function()
    esp = not esp
    espBtn.Text = esp and "ESP ON" or "ESP OFF"

    if esp then
        local drop = getAirdrop()
        if drop then
            local h = Instance.new("Highlight")
            h.Parent = drop
            h.FillColor = Color3.fromRGB(255,0,0)
        end
    end
end)

-- Auto Airdrop
autoBtn.MouseButton1Click:Connect(function()
    auto = not auto
    autoBtn.Text = auto and "Auto Airdrop ON" or "OFF"

    while auto do
        local drop = getAirdrop()
        if drop and drop:IsA("BasePart") then
            char:MoveTo(drop.Position)
        end
        task.wait(2)
    end
end)
