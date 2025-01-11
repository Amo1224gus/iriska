local meshId = "rbxassetid://140070422035683"
local textureId = "rbxassetid://77760401001791"
local accessoryOffset = CFrame.new(-0.1, -0.7, 0)
local accessoryRotation = CFrame.Angles(0, math.rad(90), 0)
local accessoryScale = Vector3.new(1.2, 1.2, 1.2)

local function createAccessory(meshId, textureId)
    local accessory = Instance.new("Accessory")
    accessory.Name = "CustomAccessory"
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(1, 1, 1)
    handle.Anchored = false
    handle.CanCollide = false
    handle.Parent = accessory
    local mesh = Instance.new("SpecialMesh")
    mesh.MeshId = meshId
    mesh.TextureId = textureId
    mesh.Scale = accessoryScale
    mesh.Parent = handle
    return accessory
end

local function applyAccessoryToCharacter(character)
    local head = character:FindFirstChild("Head")
    if head then
        head.Transparency = 1
        local accessory = createAccessory(meshId, textureId)
        accessory.Parent = character
        local handle = accessory:FindFirstChild("Handle")
        if handle then
            handle.CFrame = head.CFrame * accessoryOffset * accessoryRotation
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = handle
            weld.Part1 = head
            weld.Parent = handle
        end
    end
end

local function onPlayerAdded(player)
    player.CharacterAppearanceLoaded:Connect(function(character)
        applyAccessoryToCharacter(character)
    end)
    if player.Character then
        applyAccessoryToCharacter(player.Character)
    end
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
for _, player in pairs(game.Players:GetPlayers()) do
    onPlayerAdded(player)
end
