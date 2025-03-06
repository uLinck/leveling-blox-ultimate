local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local function createInvocation()
    local invocation = Instance.new("Model")
    invocation.Name = "Invocation"

    local humanoidModel = game.ServerStorage:FindFirstChild("InvocationModel")
    if humanoidModel then
        invocation = humanoidModel:Clone()
        invocation:SetPrimaryPartCFrame(invocation.HumanoidRootPart.CFrame)
    else
        local body = Instance.new("Part")
        body.Size = Vector3.new(2, 5, 1)
        body.Color = Color3.fromRGB(116, 0, 110)
        body.Material = Enum.Material.SmoothPlastic
        body.Anchored = false
        body.CanCollide = false
        body.Name = "HumanoidRootPart"
        body.Parent = invocation

        local humanoid = Instance.new("Humanoid")
        humanoid.Parent = invocation
        humanoid.Health = 100
        humanoid.MaxHealth = 100

        invocation.PrimaryPart = body
    end

    invocation.Parent = Workspace

    return invocation
end

local function updateInvocationPosition(invocation, character)
    if character and character:FindFirstChild("HumanoidRootPart") then
        local characterPosition = character.HumanoidRootPart.Position
        local characterForward = character.HumanoidRootPart.CFrame.LookVector
        local invocationPosition = characterPosition - characterForward * 3
        local invocationCFrame = CFrame.new(invocationPosition, characterPosition)

        invocation:SetPrimaryPartCFrame(invocationCFrame)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local invocation = createInvocation()
        local initialCFrame = CFrame.new(character.HumanoidRootPart.Position - character.HumanoidRootPart.CFrame.LookVector * 3, character.HumanoidRootPart.Position)
        invocation:SetPrimaryPartCFrame(initialCFrame)

        RunService.Heartbeat:Connect(function()
            updateInvocationPosition(invocation, character)
        end)
    end)
end)

