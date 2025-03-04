local OAService = require(game:GetService("ReplicatedStorage").LocalShared.ObjectAccessService)
local UserInputService = game:GetService("UserInputService")
local speedMultiplier = 20
local character = OAService:GetCharacter()

local function MapInputStart(inputObject)
    if (inputObject.KeyCode == Enum.KeyCode.LeftShift) then
        character.Humanoid.WalkSpeed += speedMultiplier
    end
end

local function MapInputEnd(inputObject)
    if (inputObject.KeyCode == Enum.KeyCode.LeftShift) then
        character.Humanoid.WalkSpeed -= speedMultiplier
    end
end

return {
    Map = function()
        UserInputService.InputBegan:Connect(MapInputStart)
        UserInputService.InputEnded:Connect(MapInputEnd)
    end
}