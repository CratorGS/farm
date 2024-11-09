-- Script para coletar automaticamente objetos "Soap" no jogo Overlock

local function collectSoaps()
    for _, object in pairs(workspace:GetChildren()) do
        if object.Name == "Soap" and object:IsA("Part") then
            local player = game.Players.LocalPlayer
            player.Character.HumanoidRootPart.CFrame = object.CFrame
            wait(0.5)
        end
    end
end

while wait(1) do
    collectSoaps()
end
