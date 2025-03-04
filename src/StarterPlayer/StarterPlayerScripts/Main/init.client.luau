local UserInputService = game:GetService("UserInputService")
local OAService = require(game:GetService("ReplicatedStorage").LocalShared.ObjectAccessService)
local animator = Instance.new("Animator")
animator.Parent = OAService:GetHumanoid()

UserInputService.InputBegan:Connect(require(script.InputPrinter).onInputBegan)