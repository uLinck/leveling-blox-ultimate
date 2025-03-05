local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local function createPet()
    local pet = Instance.new("Part")
    pet.Name = "Pet"
    pet.Size = Vector3.new(2, 2, 2)
    pet.Color = Color3.fromRGB(0, 250, 167)
    pet.Material = Enum.Material.Sand
    pet.Anchored = false
    pet.CanCollide = false

    local bodyPosition = Instance.new("BodyPosition")
    bodyPosition.MaxForce = Vector3.new(5000, 5000, 5000)
    bodyPosition.D = 10
    bodyPosition.P = 3000
    bodyPosition.Parent = pet

    return pet
end

local function updatePetPosition(pet, character)
    if character and character:FindFirstChild("HumanoidRootPart") then
        local characterPosition = character.HumanoidRootPart.Position
        local characterForward = character.HumanoidRootPart.CFrame.LookVector
        local petPosition = characterPosition - characterForward * 3
        pet.BodyPosition.Position = petPosition
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local pet = createPet()
        pet.Parent = Workspace

        wait(0.1)

        pet.Position = character.HumanoidRootPart.Position - character.HumanoidRootPart.CFrame.LookVector * 3

        RunService.Heartbeat:Connect(function()
            updatePetPosition(pet, character)
        end)
    end)
end)