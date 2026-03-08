-- Auto Parry
local Players = game:GetService("Players")
local VIM = game:GetService("VirtualInputManager")

local lp = Players.LocalPlayer
local distance = 25
local cooldown = 0.15
local lastParry = 0

task.spawn(function()
    while task.wait(0.03) do
        
        local char = lp.Character
        if not char then continue end
        
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        
        for _,plr in pairs(Players:GetPlayers()) do
            if plr ~= lp and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                
                local enemy = plr.Character.HumanoidRootPart
                local dist = (hrp.Position - enemy.Position).Magnitude
                
                if dist <= distance and tick() - lastParry >= cooldown then
                    
                    lastParry = tick()
                    
                    VIM:SendKeyEvent(true,"F",false,game)
                    task.wait()
                    VIM:SendKeyEvent(false,"F",false,game)
                    
                end
                
            end
        end
        
    end
end)
