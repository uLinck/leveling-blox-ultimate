local UserInputService = game:GetService("UserInputService")
local speedMultiplier = 20
local character = script.Parent.Parent
local humanoid = character:WaitForChild("Humanoid")

local function MapInputStart(inputObject)
    if (inputObject.KeyCode == Enum.KeyCode.LeftShift) then
        humanoid.WalkSpeed += speedMultiplier
    end
end

local function MapInputEnd(inputObject)
    if (inputObject.KeyCode == Enum.KeyCode.LeftShift) then
        humanoid.WalkSpeed -= speedMultiplier
    end
end

return {
    Map = function()
        UserInputService.InputBegan:Connect(MapInputStart)
        UserInputService.InputEnded:Connect(MapInputEnd)
    end
}