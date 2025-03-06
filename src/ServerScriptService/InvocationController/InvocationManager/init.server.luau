local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local function weldParts(part1, part2)
    local weld = Instance.new("WeldConstraint")
    weld.Part0 = part1
    weld.Part1 = part2
    weld.Parent = part1
end

local function createCharacterModel()
    local characterModel = Instance.new("Model")
    characterModel.Name = "InvocationModel"

    local humanoidRootPart = Instance.new("Part")
    humanoidRootPart.Size = Vector3.new(2, 2, 1)
    humanoidRootPart.Position = Vector3.new(0, 3, 0)
    humanoidRootPart.Anchored = false
    humanoidRootPart.CanCollide = false
    humanoidRootPart.Name = "HumanoidRootPart"
    humanoidRootPart.Parent = characterModel

    local humanoid = Instance.new("Humanoid")
    humanoid.Parent = characterModel

    local head = Instance.new("Part")
    head.Size = Vector3.new(2, 1, 1)
    head.Position = Vector3.new(0, 4, 0)
    head.Name = "Head"
    head.Parent = characterModel
    weldParts(humanoidRootPart, head)

    local torso = Instance.new("Part")
    torso.Size = Vector3.new(2, 3, 1)
    torso.Position = Vector3.new(0, 2.5, 0)
    torso.Name = "Torso"
    torso.Parent = characterModel
    weldParts(humanoidRootPart, torso)

    local leftArm = Instance.new("Part")
    leftArm.Size = Vector3.new(1, 2, 1)
    leftArm.Position = Vector3.new(-1.5, 2.5, 0)
    leftArm.Name = "LeftArm"
    leftArm.Parent = characterModel
    weldParts(humanoidRootPart, leftArm)

    local rightArm = Instance.new("Part")
    rightArm.Size = Vector3.new(1, 2, 1)
    rightArm.Position = Vector3.new(1.5, 2.5, 0)
    rightArm.Name = "RightArm"
    rightArm.Parent = characterModel
    weldParts(humanoidRootPart, rightArm)

    local leftLeg = Instance.new("Part")
    leftLeg.Size = Vector3.new(1, 2, 1)
    leftLeg.Position = Vector3.new(-0.5, 1, 0)
    leftLeg.Name = "LeftLeg"
    leftLeg.Parent = characterModel
    weldParts(humanoidRootPart, leftLeg)

    local rightLeg = Instance.new("Part")
    rightLeg.Size = Vector3.new(1, 2, 1)
    rightLeg.Position = Vector3.new(0.5, 1, 0)
    rightLeg.Name = "RightLeg"
    rightLeg.Parent = characterModel
    weldParts(humanoidRootPart, rightLeg)

    characterModel.PrimaryPart = humanoidRootPart
    characterModel.Parent = Workspace

    return characterModel
end

local function updateCharacterModelPosition(characterModel, character)
    if character and character:FindFirstChild("HumanoidRootPart") then
        local playerPosition = character.HumanoidRootPart.Position
        local behindPosition = playerPosition - character.HumanoidRootPart.CFrame.LookVector * 3
        characterModel:SetPrimaryPartCFrame(CFrame.new(behindPosition))
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local characterModel = createCharacterModel()
        characterModel:SetPrimaryPartCFrame(character.HumanoidRootPart.CFrame - character.HumanoidRootPart.CFrame.LookVector * 3)
        RunService.Heartbeat:Connect(function()
            updateCharacterModelPosition(characterModel, character)
        end)
    end)
end)

