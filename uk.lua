

local IriXa = Instance.new("ScreenGui")
local IriXaLogo = Instance.new("ImageLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local One = Instance.new("TextLabel")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local Divider = Instance.new("TextLabel")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local Two = Instance.new("TextLabel")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")

IriXa.Name = "IriXa"
IriXa.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
IriXa.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

IriXaLogo.Name = "IriXaLogo"
IriXaLogo.Parent = IriXa
IriXaLogo.AnchorPoint = Vector2.new(0.5, 0.5)
IriXaLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IriXaLogo.BackgroundTransparency = 1.000
IriXaLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
IriXaLogo.BorderSizePixel = 0
IriXaLogo.Position = UDim2.new(0.439733922, 0, 0.5, 0)
IriXaLogo.Size = UDim2.new(0.095238097, 0, 0.147699744, 0)
IriXaLogo.Visible = false
IriXaLogo.Image = "rbxassetid://87134700438873"
IriXaLogo.ImageTransparency = 1.000

UIAspectRatioConstraint.Parent = IriXaLogo
UIAspectRatioConstraint.AspectRatio = 1.164

One.Name = "One"
One.Parent = IriXa
One.AnchorPoint = Vector2.new(0.5, 0.5)
One.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
One.BackgroundTransparency = 1.000
One.BorderColor3 = Color3.fromRGB(0, 0, 0)
One.BorderSizePixel = 0
One.Position = UDim2.new(0.547347248, 0, 0.465496361, 0)
One.Size = UDim2.new(0.134138167, 0, 0.0302663445, 0)
One.Visible = false
One.Font = Enum.Font.Michroma;
One.RichText = true;
One.Text = "<b>EgasHub</b>"
One.TextColor3 = Color3.fromRGB(255, 255, 255)
One.TextSize = 49.000
One.TextTransparency = 1.000
One.TextXAlignment = Enum.TextXAlignment.Left

UIAspectRatioConstraint_2.Parent = One
UIAspectRatioConstraint_2.AspectRatio = 8.000

Divider.Name = "Divider"
Divider.Parent = IriXa
Divider.AnchorPoint = Vector2.new(0.5, 0.5)
Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Divider.BackgroundTransparency = 1.000
Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(0.547347248, 0, 0.481234878, 0)
Divider.Size = UDim2.new(0.134138167, 0, 0.0302663445, 0)
Divider.Visible = false
Divider.Font = Enum.Font.Michroma
Divider.RichText = true
Divider.Text = "<b>______</b>"
Divider.TextColor3 = Color3.fromRGB(255, 255, 255)
Divider.TextSize = 49.000
Divider.TextTransparency = 1.000
Divider.TextXAlignment = Enum.TextXAlignment.Left

UIAspectRatioConstraint_3.Parent = Divider
UIAspectRatioConstraint_3.AspectRatio = 8.000

Two.Name = "Two"
Two.Parent = IriXa
Two.AnchorPoint = Vector2.new(0.5, 0.5)
Two.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Two.BackgroundTransparency = 1.000
Two.BorderColor3 = Color3.fromRGB(0, 0, 0)
Two.BorderSizePixel = 0
Two.Position = UDim2.new(0.547347248, 0, 0.534503639, 0)
Two.Size = UDim2.new(0.134138167, 0, 0.0302663445, 0)
Two.Visible = false
Two.Font = Enum.Font.RobotoMono
Two.RichText = true
Two.Text = "<b>ЕгасХаб</b>"
Two.TextColor3 = Color3.fromRGB(255, 255, 255)
Two.TextSize = 23.000
Two.TextTransparency = 1.000
Two.TextXAlignment = Enum.TextXAlignment.Left

UIAspectRatioConstraint_4.Parent = Two
UIAspectRatioConstraint_4.AspectRatio = 8.000


local function SMTA_fake_script() -- IriXa.jasperthesillyy 
	local script = Instance.new('LocalScript', IriXa)
	
	root = script.Parent; -- Root ScreenGui
	
	local Blur = Instance.new("BlurEffect");
	local Logo = root.IriXaLogo;
	
	local LogoStartPosition = UDim2.new(0.499, 0, 0.5, 0);
	local LogoEndPosition = UDim2.new(0.44, 0, 0.5, 0);
	
	Blur.Parent = game:GetService("Lighting");
	Blur.Size = 0;
	Blur.Enabled = true;
	
	Logo.ImageTransparency = 1;
	Logo.Position = LogoStartPosition;
	Logo.Visible = true;
	
	root.One.Visible = true;
	root.Two.Visible = true;
	root.Divider.Visible = true;
	
	coroutine.wrap(function()
		for step=0, 15, 1 do
			Blur.Size = step;
			wait();
		end
	end)();
	
	coroutine.wrap(function()
		for step=1, 0, -0.1 do
			Logo.ImageTransparency = step;
			wait();
		end
	end)();
	
	local TweenDetails = {Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 1}
	
	Logo:TweenPosition(LogoEndPosition, table.unpack(TweenDetails));
	
	coroutine.wrap(function()
		for step=1, 0, -0.1 do
			root.One.TextTransparency = step;
			root.Divider.TextTransparency = step;
			root.Two.TextTransparency = step;
			wait();
		end
	end)();
	
	wait(5);
	
	coroutine.wrap(function()
		for step=15, 0, -1 do
			Blur.Size = step;
			wait();
		end
	end)();
	
	coroutine.wrap(function()
		for step=0, 1, 0.1 do
			Logo.ImageTransparency = step;
			wait();
		end
	end)();
	
	Logo:TweenPosition(LogoStartPosition, table.unpack(TweenDetails));
	
	coroutine.wrap(function()
		for step=0, 1, 0.1 do
			root.One.TextTransparency = step;
			root.Divider.TextTransparency = step;
			root.Two.TextTransparency = step;
			wait();
		end
	end)();
	
	coroutine.wrap(function()
		for step=0, 1, 0.1 do
			Logo.ImageTransparency = step;
		end
	end)();
	
	wait(5);
	
	script.Parent:Destroy();
end
coroutine.wrap(SMTA_fake_script)()

local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()

local Window = WindUI:CreateWindow({
    Title = "ЕгасХаб", -- UI Title
    --Icon = "rbxassetid://125272542064435", -- Url or rbxassetid or lucide
    Icon = "rbxassetid://87134700438873", -- Url or rbxassetid or lucide
    Author = "Егас", -- Author & Creator
    Folder = "CloudHub", -- Folder name for saving data (And key)
    Size = UDim2.fromOffset(580, 460), -- UI Size
    Transparent = true,-- UI Transparency
    Theme = "Light", -- UI Theme
    SideBarWidth = 200, -- UI Sidebar Width (number)
    HasOutline = true, -- Adds Oultines to the window
})

Window:EditOpenButton({
    Title = "ЕгасХаб",
    Icon = "rbxassetid://87134700438873",  -- New icon
    CornerRadius = UDim.new(0,10),
    StrokeThickness = 3,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    )
})

local MainTab = Window:Tab({
    Title = "Основне",
    Icon = "house"
})

Window:SelectTab(1)

-- Заголовок "Welcome to EgasHub!"
MainTab:Section({ 
    Title = "Вітаємо в Egas hub!",
    TextSize = 30,
	TextXAlignment = "Center"
})

MainTab:Section({ Title = "Швидкість" })

local tpwalking = false
local currentSpeed = 1
local function adjustSpeed(speed)
    tpwalking = true
    currentSpeed = speed
end

local function stopTPWalk()
    tpwalking = false
end

game:GetService("RunService").Heartbeat:Connect(function(delta)
    if tpwalking then
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        if humanoid and humanoid.MoveDirection.Magnitude > 0 then
            character:TranslateBy(humanoid.MoveDirection * currentSpeed * delta * 10)
        end
    end
end)

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local tpwalking = false
local connection

-- Функции для управления скоростью анимации
local function adjustAnimationSpeed(humanoid, speed)
    for _, track in pairs(humanoid.Animator:GetPlayingAnimationTracks()) do
        track:AdjustSpeed(speed)
    end
end

local function monitorAnimationSpeed(humanoid, speed)
    if connection then
        connection:Disconnect()
    end

    connection = humanoid.Animator.AnimationPlayed:Connect(function(track)
        track:AdjustSpeed(speed)
    end)
end

-- Функция для запуска телепортационного перемещения
local function startTPWalk(speed)
    tpwalking = true
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildWhichIsA("Humanoid")

    if not humanoid or not humanoid:FindFirstChild("Animator") then
        warn("Humanoid or Animator not found!")
        return
    end

    local adjustedSpeed = math.clamp(speed or 1, 0.1, 10)
    adjustAnimationSpeed(humanoid, adjustedSpeed)
    monitorAnimationSpeed(humanoid, adjustedSpeed)

    while tpwalking and character and humanoid and humanoid.Parent do
        local delta = RunService.Heartbeat:Wait()
        if humanoid.MoveDirection.Magnitude > 0 then
            if speed and tonumber(speed) then
                character:TranslateBy(humanoid.MoveDirection * tonumber(speed) * delta * 10)
            else
                character:TranslateBy(humanoid.MoveDirection * delta * 10)
            end
        end
    end
end

-- Функция для остановки телепортационного перемещения
local function stopTPWalk()
    tpwalking = false

    local character = player.Character
    local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
        adjustAnimationSpeed(humanoid, 1) -- Возвращаем стандартную скорость анимации
        if connection then
            connection:Disconnect()
            connection = nil
        end
    end
end

-- Добавляем галочку в интерфейс
MainTab:Toggle({
    Title = "Макс. швидкість (4⭐)",
    Callback = function(state)
        if state then
            local speed = 1.7 -- Установите желаемую скорость
            startTPWalk(speed)
        else
            stopTPWalk() -- Останавливаем перемещение и восстанавливаем стандартную скорость
        end
    end
})


MainTab:Slider({
    Title = "[Баг.] Швидкіть телепортації",
    Step = 0.1,
    Value = {
        Min = 1,
        Max = 2,
        Default = 1
    },
    Callback = function(value)
        adjustSpeed(value)
    end
})


MainTab:Section({ Title = "ESP" })

local monstersEnabled = false
local function updateMonstersHighlight()
    while monstersEnabled do
        local currentRoom = workspace:FindFirstChild("CurrentRoom")
        if currentRoom then
            for _, model in pairs(currentRoom:GetChildren()) do
                if model:IsA("Model") then
                    local monsters = model:FindFirstChild("Monsters")
                    if monsters and monsters:IsA("Folder") then
                        for _, monster in pairs(monsters:GetChildren()) do
                            if monster:IsA("Model") then
                                local highlight = monster:FindFirstChildOfClass("Highlight") or Instance.new("Highlight", monster)
                                highlight.FillColor = Color3.fromRGB(255, 100, 100)
                                highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                            end
                        end
                    end
                end
            end
        end
        wait(5) -- Проверка каждые 5 секунд
    end
    -- Убираем Highlight при отключении
    local currentRoom = workspace:FindFirstChild("CurrentRoom")
    if currentRoom then
        for _, model in pairs(currentRoom:GetChildren()) do
            if model:IsA("Model") then
                local monsters = model:FindFirstChild("Monsters")
                if monsters and monsters:IsA("Folder") then
                    for _, monster in pairs(monsters:GetChildren()) do
                        if monster:IsA("Model") then
                            local highlight = monster:FindFirstChildOfClass("Highlight")
                            if highlight then
                                highlight:Destroy()
                            end
                        end
                    end
                end
            end
        end
    end
end

MainTab:Toggle({
    Title = "ESP Монстрів",
    Callback = function(state)
        monstersEnabled = state
        if state then
            task.spawn(updateMonstersHighlight)
        end
    end
})

local itemsEnabled = false
local function updateItemsHighlight()
    while itemsEnabled do
        local currentRoom = workspace:FindFirstChild("CurrentRoom")
        if currentRoom then
            for _, model in pairs(currentRoom:GetChildren()) do
                if model:IsA("Model") then
                    local items = model:FindFirstChild("Items")
                    if items and items:IsA("Folder") then
                        for _, item in pairs(items:GetChildren()) do
                            if item:IsA("Model") and not (item.Name == "Ornament" or item.Name == "Ornaments") then
                                local highlight = item:FindFirstChildOfClass("Highlight") or Instance.new("Highlight", item)
                                highlight.FillColor = Color3.fromRGB(255, 255, 100)
                                highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
                            end
                        end
                    end
                end
            end
        end
        wait(5) -- Проверка каждые 5 секунд
    end
    -- Убираем Highlight при отключении
    local currentRoom = workspace:FindFirstChild("CurrentRoom")
    if currentRoom then
        for _, model in pairs(currentRoom:GetChildren()) do
            if model:IsA("Model") then
                local items = model:FindFirstChild("Items")
                if items and items:IsA("Folder") then
                    for _, item in pairs(items:GetChildren()) do
                        local highlight = item:FindFirstChildOfClass("Highlight")
                        if highlight then
                            highlight:Destroy()
                        end
                    end
                end
            end
        end
    end
end

MainTab:Toggle({
    Title = "ESP Предметів",
    Callback = function(state)
        itemsEnabled = state
        if state then
            task.spawn(updateItemsHighlight)
        end
    end
})

local ornamentsEnabled = false
local function updateOrnamentsHighlight()
    while ornamentsEnabled do
        local currentRoom = workspace:FindFirstChild("CurrentRoom")
        if currentRoom then
            for _, model in pairs(currentRoom:GetChildren()) do
                if model:IsA("Model") then
                    local items = model:FindFirstChild("Items")
                    if items and items:IsA("Folder") then
                        for _, item in pairs(items:GetChildren()) do
                            if item:IsA("Model") and (item.Name == "Ornament" or item.Name == "Ornaments") then
                                local highlight = item:FindFirstChildOfClass("Highlight") or Instance.new("Highlight", item)
                                highlight.FillColor = Color3.fromRGB(255, 200, 100)
                                highlight.OutlineColor = Color3.fromRGB(255, 165, 0)
                            end
                        end
                    end
                end
            end
        end
        wait(5) -- Проверка каждые 5 секунд
    end
    -- Убираем Highlight при отключении
    local currentRoom = workspace:FindFirstChild("CurrentRoom")
    if currentRoom then
        for _, model in pairs(currentRoom:GetChildren()) do
            if model:IsA("Model") then
                local items = model:FindFirstChild("Items")
                if items and items:IsA("Folder") then
                    for _, item in pairs(items:GetChildren()) do
                        local highlight = item:FindFirstChildOfClass("Highlight")
                        if highlight then
                            highlight:Destroy()
                        end
                    end
                end
            end
        end
    end
end

MainTab:Toggle({
    Title = "ESP Прикрасів",
    Callback = function(state)
        ornamentsEnabled = state
        if state then
            task.spawn(updateOrnamentsHighlight)
        end
    end
})

local generatorsEnabled = false

-- Функция для обновления Highlight у генераторов
local function updateGeneratorsHighlight()
    while generatorsEnabled do
        local currentRoom = workspace:FindFirstChild("CurrentRoom")
        if currentRoom then
            for _, model in pairs(currentRoom:GetChildren()) do
                if model:IsA("Model") then
                    local generators = model:FindFirstChild("Generators")
                    if generators and generators:IsA("Folder") then
                        for _, generator in pairs(generators:GetChildren()) do
                            if generator:IsA("Model") then
                                local highlight = generator:FindFirstChildOfClass("Highlight") or Instance.new("Highlight", generator)
                                highlight.FillColor = Color3.fromRGB(80, 80, 80) -- Более тёмный серый цвет
                                highlight.OutlineColor = Color3.fromRGB(20, 20, 20) -- Почти чёрный цвет
                            end
                        end
                    end
                end
            end
        end
        wait(5) -- Проверка каждые 5 секунд
    end
end

-- Функция для удаления всех Highlight у генераторов
local function removeGeneratorsHighlight()
    local currentRoom = workspace:FindFirstChild("CurrentRoom")
    if currentRoom then
        for _, model in pairs(currentRoom:GetChildren()) do
            if model:IsA("Model") then
                local generators = model:FindFirstChild("Generators")
                if generators and generators:IsA("Folder") then
                    for _, generator in pairs(generators:GetChildren()) do
                        local highlight = generator:FindFirstChildOfClass("Highlight")
                        if highlight then
                            highlight:Destroy()
                        end
                    end
                end
            end
        end
    end
end

-- Галочка для активации и деактивации Highlight
MainTab:Toggle({
    Title = "ESP генератори",
    Callback = function(state)
        generatorsEnabled = state
        if state then
            task.spawn(updateGeneratorsHighlight)
        else
            removeGeneratorsHighlight() -- Мгновенно удаляем Highlight
        end
    end
})


local playersEnabled = false

-- Функция для обновления Highlight у игроков
local function updatePlayersHighlight()
    while playersEnabled do
        for _, player in pairs(game.Players:GetPlayers()) do
            local character = player.Character
            if character then
                -- Добавляем Highlight в модель игрока
                local highlight = character:FindFirstChildOfClass("Highlight") or Instance.new("Highlight", character)
                highlight.FillColor = Color3.fromRGB(200, 255, 200) -- Очень светло-зелёный цвет
                highlight.OutlineColor = Color3.fromRGB(245, 245, 245) -- Почти белый цвет
            end
        end
        wait(10) -- Проверка каждые 10 секунд
    end
end

-- Функция для удаления всех Highlight у игроков
local function removePlayersHighlight()
    for _, player in pairs(game.Players:GetPlayers()) do
        local character = player.Character
        if character then
            local highlight = character:FindFirstChildOfClass("Highlight")
            if highlight then
                highlight:Destroy()
            end
        end
    end
end

-- Галочка для активации и деактивации Highlight
MainTab:Toggle({
    Title = "Підсвічювати гравців",
    Callback = function(state)
        playersEnabled = state
        if state then
            task.spawn(updatePlayersHighlight)
        else
            removePlayersHighlight() -- Мгновенно удаляем Highlight
        end
    end
})


MainTab:Section({ Title = "Авто штуки" })

local rareItemsNotificationState = false
local rareItemsNotification = MainTab:Toggle({
    Title = "Рідкий предмет сповіщення",
    Callback = function(state)
        rareItemsNotificationState = state
        if state then
            task.spawn(function()
                while rareItemsNotificationState do
                    for _, model in ipairs(workspace.CurrentRoom:GetDescendants()) do
                        if model:IsA("Model") and model:FindFirstChild("Items") then
                            if string.find(model.Name, "Smoke") or string.find(model.Name, "Bandage") or 
                               string.find(model.Name, "Kit") or string.find(model.Name, "Cable") or 
                               string.find(model.Name, "Inject") then
                                WindUI:Notify({
                                    Title = "Rare Item Found",
                                    Content = model.Name .. " появился!",
                                    Duration = 5,
                                })
                            end
                        end
                    end
                    task.wait(2)
                end
            end)
        end
    end,
})

local mainToonsNotificationState = false
local mainToonsNotification = MainTab:Toggle({
    Title = "Мейн тун сповіщення",
    Callback = function(state)
        mainToonsNotificationState = state
        if state then
            task.spawn(function()
                while mainToonsNotificationState do
                    for _, model in ipairs(workspace.CurrentRoom:GetDescendants()) do
                        if model:IsA("Model") and model:FindFirstChild("Monsters") then
                            if string.find(model.Name, "Astro") or string.find(model.Name, "Shelly") or 
                               string.find(model.Name, "Dandy") or string.find(model.Name, "Pebble") or 
                               string.find(model.Name, "Vee") or string.find(model.Name, "Bobette") or 
                               string.find(model.Name, "Sprout") then
                                WindUI:Notify({
                                    Title = "Monster Found",
                                    Content = model.Name .. " появился!",
                                    Duration = 5,
                                })
                            end
                        end
                    end
                    task.wait(2)
                end
            end)
        end
    end,
})

local autoCollectState = false
local autoCollect = MainTab:Toggle({
    Title = "Авто підбіп",
    Callback = function(state)
        autoCollectState = state
        if state then
            task.spawn(function()
                while autoCollectState do
                    for _, prompt in ipairs(workspace:GetDescendants()) do
                        if prompt:IsA("ProximityPrompt") and not prompt:IsDescendantOf(workspace.Elevators.Elevator) then
                            fireproximityprompt(prompt)
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end,
})

local autoElevatorState = false
local autoElevator = MainTab:Toggle({
    Title = "Авто Ліфт",
    Callback = function(state)
        autoElevatorState = state
        if state then
            task.spawn(function()
                while autoElevatorState do
                    if workspace.Info.Panic.Value then
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace.Elevators.Elevator.SpawnZones.CFrame)
                    end
                    task.wait(0.1)
                end
            end)
        end
    end,
})

-- 1. Телепортация по скорости
-- 2. Fullbright с сохранением освещения


local LightTab = Window:Tab({
    Title = "Навколишнє середовище",
    Icon = "lamp"
})



LightTab:Section({ Title = "Світ" })

local originalLighting = {}
local function saveOriginalLighting()
    local lighting = game:GetService("Lighting")
    originalLighting = {
        Ambient = lighting.Ambient,
        Brightness = lighting.Brightness,
        FogEnd = lighting.FogEnd
    }
end

local function restoreOriginalLighting()
    local lighting = game:GetService("Lighting")
    if originalLighting.Ambient and originalLighting.Brightness and originalLighting.FogEnd then
        lighting.Ambient = originalLighting.Ambient
        lighting.Brightness = originalLighting.Brightness
        lighting.FogEnd = originalLighting.FogEnd
    end
end

local function enableFullbright()
    saveOriginalLighting()
    local lighting = game:GetService("Lighting")
    lighting.Ambient = Color3.fromRGB(255, 255, 255)
    lighting.Brightness = 1
    lighting.FogEnd = 1e10
end

LightTab:Toggle({
    Title = "Фуллбрайт",
    Callback = function(state)
        if state then
            enableFullbright()
        else
            restoreOriginalLighting()
        end
    end
})

LightTab:Button({
    Title = "Анти лаг",
    Callback = function()
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.Plastic -- Устанавливаем материал на Plastic
            end
            if obj:IsA("Decal") or obj:IsA("Texture") then
                obj:Destroy() -- Удаляем декали и текстуры
            end
            if obj:IsA("MeshPart") then
                obj.TextureID = "" -- Удаляем текстуру на MeshPart
                obj.Material = Enum.Material.Plastic -- Меняем материал на Plastic
            end
        end

        -- Также проходимся по персонажам всех игроков
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("MeshPart") then
                        part.TextureID = "" -- Удаляем текстуру
                        part.Material = Enum.Material.Plastic -- Устанавливаем материал
                    elseif part:IsA("BasePart") then
                        part.Material = Enum.Material.Plastic -- Устанавливаем материал на Plastic
                    elseif part:IsA("Decal") or part:IsA("Texture") then
                        part:Destroy() -- Удаляем декали и текстуры
                    end
                end
            end
        end
    end
})

LightTab:Button({
    Title = "ДЕ ІРИСКА?...",
    Desc = "змінити всі картини на іриску",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/ipknJXby"))()
    end,
})

LightTab:Section({ Title = "Персонаж" })

local accessoryName = "CustomAccessory" -- Название аксессуара для удобного удаления
local accessoryEnabled = false -- Состояние галочки

-- Функция для создания аксессуара
local function createAccessory(meshId, textureId)
    local accessory = Instance.new("Accessory")
    accessory.Name = accessoryName
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(1, 1, 1)
    handle.Anchored = false
    handle.CanCollide = false
    handle.Parent = accessory
    local mesh = Instance.new("SpecialMesh")
    mesh.MeshId = meshId
    mesh.TextureId = textureId
    mesh.Scale = Vector3.new(1.2, 1.2, 1.2)
    mesh.Parent = handle
    return accessory
end

-- Функция для добавления аксессуара персонажу
local function addAccessoryToCharacter(character)
    local head = character:FindFirstChild("Head")
    if head then
        head.Transparency = 1
        local accessory = createAccessory("rbxassetid://140070422035683", "rbxassetid://77760401001791")
        accessory.Parent = character
        local handle = accessory:FindFirstChild("Handle")
        if handle then
            handle.CFrame = head.CFrame * CFrame.new(-0.1, -0.7, 0) * CFrame.Angles(0, math.rad(90), 0)
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = handle
            weld.Part1 = head
            weld.Parent = handle
        end
    end
end

-- Функция для удаления аксессуара у персонажа
local function removeAccessoryFromCharacter(character)
    local accessory = character:FindFirstChild(accessoryName)
    if accessory then
        accessory:Destroy()
    end

    local head = character:FindFirstChild("Head")
    if head then
        head.Transparency = 0 -- Восстанавливаем прозрачность головы
    end
end


local function onPlayerAdded(player)
    player.CharacterAppearanceLoaded:Connect(function(character)
        if accessoryEnabled then
            addAccessoryToCharacter(character)
        end
    end)
end


LightTab:Toggle({
    Title = "[К] Тепер всі іриска.",
    Callback = function(state)
        accessoryEnabled = state
        if state then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character then
                    addAccessoryToCharacter(player.Character)
                end
            end

            game.Players.PlayerAdded:Connect(onPlayerAdded)
        else

            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character then
                    removeAccessoryFromCharacter(player.Character)
                end
            end
        end
    end
})


local forceFieldEnabled = false
local defaultColor = Color3.fromRGB(0, 255, 0) 
local originalMaterials = {}
local originalColors = {}


local function enableForceField(color)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then

            if not originalMaterials[part] then
                originalMaterials[part] = part.Material
                originalColors[part] = part.Color
            end


            part.Material = Enum.Material.ForceField
            part.Color = color
        end
    end
end


local function disableForceField()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and originalMaterials[part] then

            part.Material = originalMaterials[part]
            part.Color = originalColors[part]


            originalMaterials[part] = nil
            originalColors[part] = nil
        end
    end
end


LightTab:Toggle({
    Title = "[К] Персонаж привид",
	Desc = "так nixis hub функція і що-",
    Callback = function(state)
        forceFieldEnabled = state
        if state then
            enableForceField(defaultColor)
        else
            disableForceField()
        end
    end
})


LightTab:Colorpicker({
    Title = "[К] Колір привида",
    Default = defaultColor,
    Callback = function(color)
        defaultColor = color
        if forceFieldEnabled then
            enableForceField(color) 
        end
    end
})

local rainbowEnabled = false


local function startRainbowEffect()
    local hueOffset = 0 
    while rainbowEnabled and forceFieldEnabled do
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                -- Плавно изменяем цвет
                local hue = (tick() % 10 / 10 + hueOffset) % 1 
                local rainbowColor = Color3.fromHSV(hue, 1, 1)
                part.Color = rainbowColor
            end
        end
        wait(0.05) 
    end


    if not rainbowEnabled and forceFieldEnabled then
        enableForceField(defaultColor)
    end
end


LightTab:Toggle({
    Title = "[К] Різно кольоровий привид",
    Callback = function(state)
        rainbowEnabled = state
        if state and forceFieldEnabled then
            startRainbowEffect()
        elseif not state and forceFieldEnabled then
            enableForceField(defaultColor) 
        end
    end
})

local originalMaterials = {}

LightTab:Toggle({
    Title = "[К] Шейдер гравців",
    Callback = function(state)
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        if state then
                            originalMaterials[part] = part.Material
                            part.Material = Enum.Material.Metal
                        else
                            if originalMaterials[part] then
                                part.Material = originalMaterials[part]
                                originalMaterials[part] = nil
                            end
                        end
                    end
                end
            end
        end
    end
})


local GuiTab = Window:Tab({
    Title = "GUI",
    Icon = "presentation"
})

GuiTab:Section({ Title = "GUI" })

GuiTab:Button({
    Title = "Анті Vee вікно",
    Desc = "без Vee реклами хаха",
    Callback = function()
        local popup = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ScreenGui"):FindFirstChild("PopUp")
        if popup then
            popup:Destroy()
        end
    end,
})

local scriptActive = false
local timeElapsed = 0
local checkInterval = 0.01

local toggleScript = GuiTab:Toggle({
    Title = "Авто скілл чек",
    Callback = function(state)
        scriptActive = state
        if scriptActive then
            local plr = game.Players.LocalPlayer

            local userInputService = game:GetService("UserInputService")
            local runService = game:GetService("RunService")
            local VirtualInputManager = game:GetService("VirtualInputManager")

            local ScreenGui = plr:WaitForChild("PlayerGui"):FindFirstChild("ScreenGui")
            local menu = ScreenGui:WaitForChild("Menu")
            local skillCheckFrame = menu:WaitForChild("SkillCheckFrame")
            local frame1 = skillCheckFrame:WaitForChild("Marker")
            local frame2 = skillCheckFrame:WaitForChild("GoldArea")

            if not (frame1 and frame2) then
                warn("One or more elements not found.")
                return
            end

            local function pressSpace()
                if skillCheckFrame.Visible then
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                end
            end

            local function checkFramesPosition()
                local frame1X = frame1.AbsolutePosition.X
                local frame2X = frame2.AbsolutePosition.X
                local minRange = frame2X
                local maxRange = frame2X + 10

                if frame1X >= minRange and frame1X <= maxRange then
                    pressSpace()
                end
            end

            runService.RenderStepped:Connect(function(deltaTime)
                if scriptActive then
                    timeElapsed = timeElapsed + deltaTime
                    if timeElapsed >= checkInterval then
                        timeElapsed = 0
                        checkFramesPosition()
                    end
                end
            end)
        end
    end,
})

GuiTab:Section({ Title = "Егас адд-они" })

GuiTab:Button({
    Title = "[Б] Мій політ",
    Desc = "Використовуйте після 1 поверха",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/PDdkDsgy"))()
    end,
})

GuiTab:Section({ Title = "Інші хаби" })

GuiTab:Button({
    Title = "Hex hub",
    Desc = "Zyra = класний😎",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/N4Y01FkS"))();
    end,
})

GuiTab:Button({
    Title = "G0bbyD0llan hub",
    Desc = "G0bbyD0llan = класний😎",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/QQt4pVtu"))()
    end,
})

GuiTab:Button({
    Title = "Noxious hub",
    Desc = "команда Noxious = класний😎",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/y8eKgLSs"))()
    end,
})

GuiTab:Button({
    Title = "Глістен анімація шкаф",
    Desc = "Rode = класний😎",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RodeStriker/TheDandyHelper/refs/heads/main/GAC"))()
    end,
})

local FTab = Window:Tab({
    Title = "ПТВ",
    Icon = "circle-help"
})

FTab:Section({ 
    Title = "ПТВ",
    TextSize = 40,
    TextXAlignment = "Center"
})

FTab:Section({ 
    Title = "П: Де ключ система?",
    TextSize = 25,
})

FTab:Section({ 
    Title = "В: З'їла іриска", 
    TextSize = 30,
})

FTab:Section({ 
    Title = "П: Де я можу бути \nперекладачем для скрипта?", 
    TextSize = 25,
})

FTab:Section({ 
    Title = "В: Залишайтеся на зв'язку\n зі всіма новинами про переклад в \ndiscord.gg/kotolog!", 
    TextSize = 30,
})

FTab:Section({ 
    Title = "КРЕДІТИ", 
    TextSize = 40,
    TextXAlignment = "Center"
})

FTab:Section({ 
    Title = "Код, РУ&АНГЛ, іриска = Egas (Егас)", 
    TextSize = 30,
})

FTab:Section({ 
    Title = "🇺🇦 = Dimko4ka", 
    TextSize = 30,
})

FTab:Section({ 
    Title = "Що означає...", 
    TextSize = 35,
    TextXAlignment = "Center"
})

FTab:Section({ 
    Title = "[К] - Клієнт\n\n [Б] - Баггануте", 
    TextSize = 30,
})

wait(5)
WindUI:Notify({
    Title = "Дискорд сервер скопирован!",
    Content = "спасибо",
    Duration = 5,
})

setclipboard("discord.gg/kotolog")
