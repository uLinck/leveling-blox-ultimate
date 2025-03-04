local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(require(script.InputPrinter).onInputBegan)