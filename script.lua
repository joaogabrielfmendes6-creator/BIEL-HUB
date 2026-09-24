local clienteAutorizado = "biel_JGpro"

if game.Players.LocalPlayer.Name == clienteAutorizado then

    local CoreGui = game:GetService("CoreGui")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    if CoreGui:FindFirstChild("ScriptHubBiel") then
        CoreGui:FindFirstChild("ScriptHubBiel"):Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ScriptHubBiel"
    ScreenGui.Parent = CoreGui
    ScreenGui.ResetOnSpawn = false

    local ToggleButton = Instance.new("ImageButton")
    local ToggleCorner = Instance.new("UICorner")
    local ToggleStroke = Instance.new("UIStroke")

    ToggleButton.Name = "FloatingBall"
    ToggleButton.Size = UDim2.new(0, 50, 0, 50)
    ToggleButton.Position = UDim2.new(0.05, 0, 0.2, 0)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(15, 25, 45)
    ToggleButton.Image = "rbxassetid://10723345869"
    ToggleButton.Parent = ScreenGui
    ToggleButton.Active = true
    ToggleButton.Draggable = true

    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = ToggleButton

    ToggleStroke.Color = Color3.fromRGB(0, 150, 255)
    ToggleStroke.Thickness = 2
    ToggleStroke.Parent = ToggleButton

    local MainFrame = Instance.new("Frame")
    local MainCorner = Instance.new("UICorner")
    local MainStroke = Instance.new("UIStroke")

    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 460, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -230, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 15, 25)
    MainFrame.Parent = ScreenGui
    MainFrame.Visible = true
    MainFrame.Active = true
    MainFrame.Draggable = true

    MainCorner.CornerRadius = UDim.new(0, 10)
    MainCorner.Parent = MainFrame

    MainStroke.Color = Color3.fromRGB(0, 120, 255)
    MainStroke.Thickness = 1.5
    MainStroke.Parent = MainFrame

    local TopBar = Instance.new("Frame")
    local TopCorner = Instance.new("UICorner")

    TopBar.Name = "TopBar"
    TopBar.Size = UDim2.new(1, 0, 0, 45)
    TopBar.BackgroundColor3 = Color3.fromRGB(15, 22, 38)
    TopBar.Parent = MainFrame

    TopCorner.CornerRadius = UDim.new(0, 10)
    TopCorner.Parent = TopBar

    local ProfileImg = Instance.new("ImageLabel")
    local ProfileCorner = Instance.new("UICorner")

    ProfileImg.Name = "ProfileImg"
    ProfileImg.Size = UDim2.new(0, 32, 0, 32)
    ProfileImg.Position = UDim2.new(0, 8, 0, 6)
    ProfileImg.BackgroundColor3 = Color3.fromRGB(20, 30, 50)
    ProfileImg.Image = "rbxassetid://10723345869"
    ProfileImg.Parent = TopBar

    ProfileCorner.CornerRadius = UDim.new(1, 0)
    ProfileCorner.Parent = ProfileImg

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(0, 200, 1, 0)
    TitleLabel.Position = UDim2.new(0, 48, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "SCRIPT HUB BIEL v3"
    TitleLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
    TitleLabel.TextSize = 15
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TopBar

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -38, 0, 7)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 14
    CloseBtn.Parent = TopBar

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseBtn

    CloseBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
    end)

    ToggleButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)

    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0, 120, 1, -45)
    Sidebar.Position = UDim2.new(0, 0, 0, 45)
    Sidebar.BackgroundColor3 = Color3.fromRGB(12, 18, 30)
    Sidebar.Parent = MainFrame

    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, -125, 1, -50)
    Container.Position = UDim2.new(0, 122, 0, 48)
    Container.BackgroundTransparency = 1
    Container.Parent = MainFrame

    local UIListSidebar = Instance.new("UIListLayout")
    UIListSidebar.Parent = Sidebar
    UIListSidebar.SortOrder = Enum.SortOrder.LayoutOrder
    UIListSidebar.Padding = UDim.new(0, 4)

    local tabs = {}
    local tabButtons = {}

    local function CreateTab(name)
        local TabPage = Instance.new("ScrollingFrame")
        TabPage.Size = UDim2.new(1, 0, 1, 0)
        TabPage.BackgroundTransparency = 1
        TabPage.ScrollBarThickness = 3
        TabPage.ScrollBarImageColor3 = Color3.fromRGB(0, 140, 255)
        TabPage.Visible = false
        TabPage.Parent = Container

        local UIList = Instance.new("UIListLayout")
        UIList.Parent = TabPage
        UIList.SortOrder = Enum.SortOrder.LayoutOrder
        UIList.Padding = UDim.new(0, 6)

        local TabBtn = Instance.new("TextButton")
        TabBtn.Size = UDim2.new(1, 0, 0, 35)
        TabBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 38)
        TabBtn.Text = name
        TabBtn.TextColor3 = Color3.fromRGB(150, 180, 220)
        TabBtn.Font = Enum.Font.GothamMedium
        TabBtn.TextSize = 12
        TabBtn.Parent = Sidebar

        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 4)
        TabCorner.Parent = TabBtn

        TabBtn.MouseButton1Click:Connect(function()
            for _, page in pairs(tabs) do
                page.Visible = false
            end
            for _, btn in pairs(tabButtons) do
                btn.BackgroundColor3 = Color3.fromRGB(15, 22, 38)
                btn.TextColor3 = Color3.fromRGB(150, 180, 220)
            end
            TabPage.Visible = true
            TabBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
            TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        end)

        table.insert(tabs, TabPage)
        table.insert(tabButtons, TabBtn)

        return TabPage
    end

    local function CreateToggle(parent, text, callback)
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(1, -8, 0, 35)
        Frame.BackgroundColor3 = Color3.fromRGB(18, 26, 42)
        Frame.Parent = parent

        local FrameCorner = Instance.new("UICorner")
        FrameCorner.CornerRadius = UDim.new(0, 6)
        FrameCorner.Parent = Frame

        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(0.7, 0, 1, 0)
        Label.Position = UDim2.new(0, 10, 0, 0)
        Label.BackgroundTransparency = 1
        Label.Text = text
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.Font = Enum.Font.Gotham
        Label.TextSize = 12
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Parent = Frame

        local ToggleBtn = Instance.new("TextButton")
        ToggleBtn.Size = UDim2.new(0, 40, 0, 20)
        ToggleBtn.Position = UDim2.new(1, -48, 0.5, -10)
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
        ToggleBtn.Text = ""
        ToggleBtn.Parent = Frame

        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(1, 0)
        ToggleCorner.Parent = ToggleBtn

        local Circle = Instance.new("Frame")
        Circle.Size = UDim2.new(0, 16, 0, 16)
        Circle.Position = UDim2.new(0, 2, 0.5, -8)
        Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Circle.Parent = ToggleBtn

        local CircleCorner = Instance.new("UICorner")
        CircleCorner.CornerRadius = UDim.new(1, 0)
        CircleCorner.Parent = Circle

        local enabled = false
        ToggleBtn.MouseButton1Click:Connect(function()
            enabled = not enabled
            if enabled then
                ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
                Circle.Position = UDim2.new(1, -18, 0.5, -8)
            else
                ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
                Circle.Position = UDim2.new(0, 2, 0.5, -8)
            end
            callback(enabled)
        end)
    end

    local function CreateButton(parent, text, callback)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(1, -8, 0, 35)
        Btn.BackgroundColor3 = Color3.fromRGB(0, 110, 230)
        Btn.Text = text
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        Btn.Font = Enum.Font.GothamBold
        Btn.TextSize = 12
        Btn.Parent = parent

        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 6)
        BtnCorner.Parent = Btn

        Btn.MouseButton1Click:Connect(function()
            callback()
        end)
    end

    local FarmTab = CreateTab("🥚 Auto Farm")
    local FilterTab = CreateTab("🐾 Pet Filter")
    local TeleportTab = CreateTab("⚡ Teleport")
    local PlayerTab = CreateTab("👤 Player")
    local MiscTab = CreateTab("🌐 Discord")

    tabs[1].Visible = true
    tabButtons[1].BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    tabButtons[1].TextColor3 = Color3.fromRGB(255, 255, 255)

    _G.AutoFarmEgg = false
    _G.AutoPlaceEgg = false
    _G.AutoMissingIndex = false
    _G.OneShotSteal = false

    CreateToggle(FarmTab, "Auto Farm Ovos", function(state)
        _G.AutoFarmEgg = state
        task.spawn(function()
            while _G.AutoFarmEgg do
                task.wait(0.1)
                pcall(function()
                    for _, v in pairs(workspace:GetChildren()) do
                        if v.Name:lower():find("egg") or v.Name:lower():find("ovo") then
                            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                                task.wait(0.2)
                            end
                        end
                    end
                end)
            end
        end)
    end)

    CreateToggle(FarmTab, "Auto Place / Guardar", function(state)
        _G.AutoPlaceEgg = state
    end)

    CreateToggle(FarmTab, "Auto Farm Index Faltando", function(state)
        _G.AutoMissingIndex = state
    end)

    CreateToggle(FarmTab, "One Shot Steal (Roubo Rápido)", function(state)
        _G.OneShotSteal = state
    end)

    CreateToggle(FilterTab, "Filtrar Secretos", function(state) end)
    CreateToggle(FilterTab, "Filtrar Divinos", function(state) end)
    CreateToggle(FilterTab, "Filtrar Míticos", function(state) end)
    CreateToggle(FilterTab, "Filtrar Eternos", function(state) end)

    CreateButton(TeleportTab, "Teleportar para Safe Zone", function()
        pcall(function()
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
        end)
    end)

    CreateButton(TeleportTab, "Teleportar para Fenda", function()
        pcall(function()
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 10, 200)
        end)
    end)

    CreateButton(TeleportTab, "Teleportar para Templo Titan", function()
        pcall(function()
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-300, 15, -150)
        end)
    end)

    CreateToggle(PlayerTab, "Aumentar Velocidade (Speed)", function(state)
        if state then
            LocalPlayer.Character.Humanoid.WalkSpeed = 50
        else
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end)

    CreateToggle(PlayerTab, "Pulo Infinito (Inf Jump)", function(state)
        _G.InfJump = state
        UserInputService.JumpRequest:Connect(function()
            if _G.InfJump then
                LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
            end
        end)
    end)

    CreateButton(MiscTab, "Copiar Link do Discord", function()
        setclipboard("https://discord.gg/gJyHX5vwtm")
    end)

    CreateButton(MiscTab, "Fechar Script / Unload", function()
        ScreenGui:Destroy()
    end)

else
    game.Players.LocalPlayer:Kick("Acesso Negado! Este script é exclusivo. Compre no Discord: https://discord.gg/gJyHX5vwtm")
end
                 
