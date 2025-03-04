local UserInputService = game:GetService("UserInputService")
local speedMultiplier = 20
local player = game.Players.LocalPlayer

local function MapInputStart(inputObject)
    if (inputObject.KeyCode == Enum.KeyCode.LeftShift) then
        player.Character.Humanoid.WalkSpeed += speedMultiplier
    end
end

local function MapInputEnd(inputObject)
    if (inputObject.KeyCode == Enum.KeyCode.LeftShift) then
        player.Character.Humanoid.WalkSpeed -= speedMultiplier
    end
end

return {
    Map = function()
        UserInputService.InputBegan:Connect(MapInputStart)
        UserInputService.InputEnded:Connect(MapInputEnd)
    end
}