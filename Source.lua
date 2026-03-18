-- VoidUI: Modular UI Library (inspired by modern hub layouts, not a copy of any library)
-- Author: VoidHub
-- Notes: Lightweight, no external assets required. Built for Executors.

local VoidUI = {}
VoidUI.__index = VoidUI

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Helpers
local function create(className, props, children)
    local inst = Instance.new(className)
    if props then
        for k, v in pairs(props) do
            inst[k] = v
        end
    end
    if children then
        for _, child in ipairs(children) do
            child.Parent = inst
        end
    end
    return inst
end

local function tween(inst, info, goal)
    local t = TweenService:Create(inst, info, goal)
    t:Play()
    return t
end

local function clamp(n, min, max)
    if n < min then return min end
    if n > max then return max end
    return n
end

local function listToText(list)
    if type(list) ~= "table" then
        return tostring(list or "")
    end
    if #list == 0 then
        return "None specified"
    end
    local parts = {}
    for _, v in ipairs(list) do
        parts[#parts + 1] = "- " .. tostring(v)
    end
    return table.concat(parts, "\n")
end

-- Theme
local DefaultTheme = {
    Background = Color3.fromRGB(16, 18, 22),
    Panel = Color3.fromRGB(22, 25, 32),
    PanelAlt = Color3.fromRGB(28, 32, 40),
    Sidebar = Color3.fromRGB(18, 20, 26),
    Accent = Color3.fromRGB(0, 190, 255),
    AccentSoft = Color3.fromRGB(0, 120, 160),
    Text = Color3.fromRGB(230, 234, 240),
    Muted = Color3.fromRGB(140, 150, 165),
    Stroke = Color3.fromRGB(40, 45, 56),
}

-- Window object
local Window = {}
Window.__index = Window

-- Tab object
local Tab = {}
Tab.__index = Tab

-- Section object
local Section = {}
Section.__index = Section

-- Create library
function VoidUI:CreateWindow(opts)
    opts = opts or {}
    local Title = opts.Title or "VoidUI"
    local Subtitle = opts.Subtitle or ""
    local Keybind = opts.Keybind or Enum.KeyCode.RightShift
    local Parent = opts.Parent or PlayerGui
    local Theme = opts.Theme or DefaultTheme
    local LoadingEnabled = opts.LoadingEnabled ~= false
    local LoadingTitle = opts.LoadingTitle or Title
    local LoadingSubtitle = opts.LoadingSubtitle or "Loading..."
    local LoadingDuration = opts.LoadingDuration or 1.6
    local KeySystem = opts.KeySystem or false
    local KeyTitle = opts.KeyTitle or "Key System"
    local KeySubtitle = opts.KeySubtitle or "Enter access key"
    local KeyNote = opts.KeyNote or "Join our Discord for the key"
    local KeyList = opts.Key or {}

    local self = setmetatable({}, Window)
    self.Theme = Theme
    self.Tabs = {}
    self.ActiveTab = nil
    self.Minimized = false

    -- Root
    local ScreenGui = create("ScreenGui", {
        Name = "VoidUI",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = Parent,
    })

    local Root = create("Frame", {
        Name = "Root",
        Size = UDim2.new(0, 760, 0, 460),
        Position = UDim2.new(0.5, -380, 0.5, -230),
        BackgroundColor3 = Theme.Background,
        BorderSizePixel = 0,
        Parent = ScreenGui,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 14) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local Topbar = create("Frame", {
        Name = "Topbar",
        Size = UDim2.new(1, 0, 0, 48),
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Parent = Root,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 14) }),
    })

    local TopbarMask = create("Frame", {
        Name = "TopbarMask",
        Size = UDim2.new(1, 0, 0, 14),
        Position = UDim2.new(0, 0, 0, 34),
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Parent = Topbar,
    })

    local TitleLabel = create("TextLabel", {
        Name = "Title",
        Text = Title,
        Font = Enum.Font.GothamSemibold,
        TextSize = 16,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -24, 0, 20),
        Position = UDim2.new(0, 12, 0, 7),
        Parent = Topbar,
    })

    local SubtitleLabel = create("TextLabel", {
        Name = "Subtitle",
        Text = Subtitle,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Muted,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -24, 0, 16),
        Position = UDim2.new(0, 12, 0, 26),
        Parent = Topbar,
    })

    -- Window controls
    local Controls = create("Frame", {
        Name = "Controls",
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 64, 0, 24),
        Position = UDim2.new(1, -72, 0, 12),
        Parent = Topbar,
    })

    local MinBtn = create("TextButton", {
        Name = "Minimize",
        Text = "–",
        Font = Enum.Font.GothamBold,
        TextSize = 18,
        TextColor3 = Theme.Muted,
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 28, 0, 24),
        Position = UDim2.new(0, 0, 0, 0),
        AutoButtonColor = false,
        Parent = Controls,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 8) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local CloseBtn = create("TextButton", {
        Name = "Close",
        Text = "×",
        Font = Enum.Font.GothamBold,
        TextSize = 18,
        TextColor3 = Theme.Muted,
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 28, 0, 24),
        Position = UDim2.new(0, 34, 0, 0),
        AutoButtonColor = false,
        Parent = Controls,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 8) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local Sidebar = create("Frame", {
        Name = "Sidebar",
        Size = UDim2.new(0, 180, 1, -48),
        Position = UDim2.new(0, 0, 0, 48),
        BackgroundColor3 = Theme.Sidebar,
        BorderSizePixel = 0,
        Parent = Root,
    })

    local SidebarList = create("UIListLayout", {
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = Sidebar,
    })

    local SidebarPadding = create("UIPadding", {
        PaddingTop = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        Parent = Sidebar,
    })

    local Content = create("Frame", {
        Name = "Content",
        Size = UDim2.new(1, -180, 1, -48),
        Position = UDim2.new(0, 180, 0, 48),
        BackgroundTransparency = 1,
        Parent = Root,
    })

    -- Drag
    local dragging = false
    local dragStart, startPos
    Topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Root.Position
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Root.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Minimize
    UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == Keybind then
            self.Minimized = not self.Minimized
            if self.Minimized then
                tween(Root, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 760, 0, 48) })
                Content.Visible = false
                Sidebar.Visible = false
            else
                Content.Visible = true
                Sidebar.Visible = true
                tween(Root, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 760, 0, 460) })
            end
        end
    end)

    local function setMinimize(state)
        self.Minimized = state
        if self.Minimized then
            tween(Root, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 760, 0, 48) })
            Content.Visible = false
            Sidebar.Visible = false
        else
            Content.Visible = true
            Sidebar.Visible = true
            tween(Root, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 760, 0, 460) })
        end
    end

    MinBtn.MouseButton1Click:Connect(function()
        setMinimize(not self.Minimized)
    end)
    CloseBtn.MouseButton1Click:Connect(function()
        self:Destroy()
    end)

    self._gui = ScreenGui
    self._root = Root
    self._content = Content
    self._sidebar = Sidebar
    self._sidebarList = SidebarList

    function self:SetTheme(newTheme)
        self.Theme = newTheme or Theme
        Root.BackgroundColor3 = self.Theme.Background
        Topbar.BackgroundColor3 = self.Theme.Panel
        TopbarMask.BackgroundColor3 = self.Theme.Panel
        Sidebar.BackgroundColor3 = self.Theme.Sidebar
        TitleLabel.TextColor3 = self.Theme.Text
        SubtitleLabel.TextColor3 = self.Theme.Muted
        MinBtn.BackgroundColor3 = self.Theme.PanelAlt
        CloseBtn.BackgroundColor3 = self.Theme.PanelAlt
        MinBtn.TextColor3 = self.Theme.Muted
        CloseBtn.TextColor3 = self.Theme.Muted
    end

    function self:Destroy()
        if self._gui then
            self._gui:Destroy()
        end
    end

    -- Loading overlay (animated)
    if LoadingEnabled then
        local Overlay = create("Frame", {
            Name = "LoadingOverlay",
            BackgroundColor3 = Theme.Background,
            BackgroundTransparency = 0,
            Size = UDim2.new(1, 0, 1, 0),
            Parent = Root,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 14) }),
        })

        local LTitle = create("TextLabel", {
            Text = LoadingTitle,
            Font = Enum.Font.GothamSemibold,
            TextSize = 16,
            TextColor3 = Theme.Text,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 22),
            Position = UDim2.new(0, 0, 0.5, -32),
            Parent = Overlay,
        })

        local LSub = create("TextLabel", {
            Text = LoadingSubtitle,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextColor3 = Theme.Muted,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 18),
            Position = UDim2.new(0, 0, 0.5, -10),
            Parent = Overlay,
        })

        local Bar = create("Frame", {
            BackgroundColor3 = Theme.Panel,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 220, 0, 6),
            Position = UDim2.new(0.5, -110, 0.5, 18),
            Parent = Overlay,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 4) }),
        })

        local BarFill = create("Frame", {
            BackgroundColor3 = Theme.Accent,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 0, 1, 0),
            Parent = Bar,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 4) }),
        })

        local Dots = create("TextLabel", {
            Text = "•",
            Font = Enum.Font.GothamSemibold,
            TextSize = 16,
            TextColor3 = Theme.Accent,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 18),
            Position = UDim2.new(0, 0, 0.5, 30),
            Parent = Overlay,
        })

        task.spawn(function()
            local run = true
            task.delay(LoadingDuration, function() run = false end)
            while run do
                tween(BarFill, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 1, 0) })
                tween(BarFill, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { Size = UDim2.new(0.15, 0, 1, 0) })
                Dots.Text = "•"
                task.wait(0.12)
                Dots.Text = "••"
                task.wait(0.12)
                Dots.Text = "•••"
                task.wait(0.12)
            end
            tween(Overlay, TweenInfo.new(0.2), { BackgroundTransparency = 1 })
            tween(LTitle, TweenInfo.new(0.2), { TextTransparency = 1 })
            tween(LSub, TweenInfo.new(0.2), { TextTransparency = 1 })
            tween(Bar, TweenInfo.new(0.2), { BackgroundTransparency = 1 })
            tween(BarFill, TweenInfo.new(0.2), { BackgroundTransparency = 1 })
            tween(Dots, TweenInfo.new(0.2), { TextTransparency = 1 })
            task.wait(0.22)
            Overlay:Destroy()
        end)
    end

    -- Key system overlay
    local function normalizeKeys(list)
        if type(list) == "string" then
            return { list }
        end
        if type(list) ~= "table" then
            return {}
        end
        return list
    end
    KeyList = normalizeKeys(KeyList)

    if KeySystem then
        local KeyOverlay = create("Frame", {
            Name = "KeyOverlay",
            BackgroundColor3 = Theme.Background,
            BackgroundTransparency = 0.05,
            Size = UDim2.new(1, 0, 1, 0),
            Parent = Root,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 14) }),
        })

        local Card = create("Frame", {
            BackgroundColor3 = Theme.Panel,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 360, 0, 200),
            Position = UDim2.new(0.5, -180, 0.5, -100),
            Parent = KeyOverlay,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 12) }),
            create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
        })

        create("TextLabel", {
            Text = KeyTitle,
            Font = Enum.Font.GothamSemibold,
            TextSize = 16,
            TextColor3 = Theme.Text,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -20, 0, 20),
            Position = UDim2.new(0, 10, 0, 12),
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = Card,
        })

        create("TextLabel", {
            Text = KeySubtitle,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextColor3 = Theme.Muted,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -20, 0, 18),
            Position = UDim2.new(0, 10, 0, 34),
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = Card,
        })

        local Input = create("TextBox", {
            Text = "",
            PlaceholderText = "Enter key...",
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextColor3 = Theme.Text,
            PlaceholderColor3 = Theme.Muted,
            BackgroundColor3 = Theme.PanelAlt,
            BorderSizePixel = 0,
            Size = UDim2.new(1, -20, 0, 28),
            Position = UDim2.new(0, 10, 0, 70),
            ClearTextOnFocus = false,
            Parent = Card,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 8) }),
            create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
        })

        local Status = create("TextLabel", {
            Text = "",
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextColor3 = Theme.Muted,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -20, 0, 18),
            Position = UDim2.new(0, 10, 0, 104),
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = Card,
        })

        local Submit = create("TextButton", {
            Text = "Submit",
            Font = Enum.Font.GothamSemibold,
            TextSize = 13,
            TextColor3 = Theme.Text,
            BackgroundColor3 = Theme.Accent,
            BorderSizePixel = 0,
            Size = UDim2.new(1, -20, 0, 30),
            Position = UDim2.new(0, 10, 0, 130),
            AutoButtonColor = false,
            Parent = Card,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 8) }),
        })

        create("TextLabel", {
            Text = KeyNote,
            Font = Enum.Font.Gotham,
            TextSize = 11,
            TextColor3 = Theme.Muted,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -20, 0, 18),
            Position = UDim2.new(0, 10, 1, -22),
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = Card,
        })

        local function isValid(key)
            for _, k in ipairs(KeyList) do
                if tostring(k) == tostring(key) then
                    return true
                end
            end
            return false
        end

        local function unlock()
            tween(KeyOverlay, TweenInfo.new(0.2), { BackgroundTransparency = 1 })
            for _, child in ipairs(Card:GetDescendants()) do
                if child:IsA("TextLabel") then
                    tween(child, TweenInfo.new(0.2), { TextTransparency = 1 })
                elseif child:IsA("TextBox") then
                    tween(child, TweenInfo.new(0.2), { BackgroundTransparency = 1, TextTransparency = 1 })
                elseif child:IsA("TextButton") then
                    tween(child, TweenInfo.new(0.2), { BackgroundTransparency = 1, TextTransparency = 1 })
                end
            end
            task.wait(0.22)
            KeyOverlay:Destroy()
        end

        local function submitKey()
            local key = Input.Text
            if isValid(key) then
                Status.Text = "Access granted"
                Status.TextColor3 = Theme.Accent
                unlock()
            else
                Status.Text = "Invalid key"
                Status.TextColor3 = Color3.fromRGB(255, 90, 90)
            end
        end

        Submit.MouseButton1Click:Connect(submitKey)
        Input.FocusLost:Connect(function(enter)
            if enter then submitKey() end
        end)
    end

    return self
end

function Window:CreateTab(opts)
    opts = opts or {}
    local Name = opts.Name or "Tab"
    local Icon = opts.Icon
    local Theme = self.Theme

    local TabButton = create("TextButton", {
        Name = Name .. "Button",
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = Theme.PanelAlt,
        Text = "",
        AutoButtonColor = false,
        Parent = self._sidebar,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local TabLabel = create("TextLabel", {
        Name = "Label",
        Text = Name,
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -16, 1, 0),
        Position = UDim2.new(0, 12, 0, 0),
        Parent = TabButton,
    })

    if Icon then
        TabLabel.Position = UDim2.new(0, 36, 0, 0)
        local IconLabel = create("TextLabel", {
            Name = "Icon",
            Text = Icon,
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            TextColor3 = Theme.Accent,
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 24, 1, 0),
            Position = UDim2.new(0, 10, 0, 0),
            Parent = TabButton,
        })
    end

    local Page = create("ScrollingFrame", {
        Name = Name .. "Page",
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 4,
        BackgroundTransparency = 1,
        Visible = false,
        Parent = self._content,
    }, {
        create("UIListLayout", {
            Padding = UDim.new(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        create("UIPadding", {
            PaddingTop = UDim.new(0, 12),
            PaddingLeft = UDim.new(0, 12),
            PaddingRight = UDim.new(0, 12),
            PaddingBottom = UDim.new(0, 12),
        }),
    })

    local tab = setmetatable({
        Name = Name,
        Button = TabButton,
        Page = Page,
        Theme = Theme,
        _window = self,
    }, Tab)

    TabButton.MouseButton1Click:Connect(function()
        if self.ActiveTab then
            self.ActiveTab.Page.Visible = false
            self.ActiveTab.Button.BackgroundColor3 = Theme.PanelAlt
        end
        self.ActiveTab = tab
        tab.Page.Visible = true
        tab.Button.BackgroundColor3 = Theme.Panel
    end)

    if not self.ActiveTab then
        self.ActiveTab = tab
        tab.Page.Visible = true
        tab.Button.BackgroundColor3 = Theme.Panel
    end

    table.insert(self.Tabs, tab)
    return tab
end

function Window:CreateHomeTab(opts)
    opts = opts or {}
    local Name = opts.Name or "Home"
    local Icon = opts.Icon or "home"
    local Description = opts.Description or "Welcome."
    local SupportedExecutors = opts.SupportedExecutors or {}
    local DiscordInvite = opts.DiscordInvite
    local ExtraInfo = opts.ExtraInfo

    local tab = self:CreateTab({
        Name = Name,
        Icon = Icon,
    })

    local info = tab:CreateSection({ Title = "Welcome" })
    info:CreateParagraph({
        Title = Name,
        Text = Description,
    })

    local exec = tab:CreateSection({ Title = "Supported Executors" })
    exec:CreateParagraph({
        Title = "Executors",
        Text = listToText(SupportedExecutors),
    })

    if DiscordInvite then
        local community = tab:CreateSection({ Title = "Community" })
        community:CreateParagraph({
            Title = "Discord",
            Text = "Invite: " .. tostring(DiscordInvite),
        })
    end

    if ExtraInfo then
        local extra = tab:CreateSection({ Title = "Info" })
        extra:CreateParagraph({
            Title = "Details",
            Text = tostring(ExtraInfo),
        })
    end

    return tab
end

function Tab:CreateSection(opts)
    opts = opts or {}
    local Title = opts.Title or "Section"
    local Theme = self.Theme

    local SectionFrame = create("Frame", {
        Name = Title .. "Section",
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = self.Page,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 12) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
        create("UIPadding", {
            PaddingTop = UDim.new(0, 12),
            PaddingBottom = UDim.new(0, 12),
            PaddingLeft = UDim.new(0, 12),
            PaddingRight = UDim.new(0, 12),
        }),
        create("UIListLayout", {
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    })

    local Header = create("TextLabel", {
        Name = "Header",
        Text = Title,
        Font = Enum.Font.GothamSemibold,
        TextSize = 14,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 0, 20),
        Parent = SectionFrame,
    })

    local section = setmetatable({
        Frame = SectionFrame,
        Theme = Theme,
    }, Section)

    return section
end

function Section:CreateLabel(opts)
    opts = opts or {}
    local Text = opts.Text or "Label"
    local Theme = self.Theme

    local Label = create("TextLabel", {
        Text = Text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Muted,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 0, 18),
        Parent = self.Frame,
    })
    return Label
end

function Section:CreateParagraph(opts)
    opts = opts or {}
    local Title = opts.Title or "Title"
    local Text = opts.Text or ""
    local Theme = self.Theme

    local Wrap = create("Frame", {
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = self.Frame,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIPadding", {
            PaddingTop = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
        }),
    })

    local TitleLabel = create("TextLabel", {
        Text = Title,
        Font = Enum.Font.GothamSemibold,
        TextSize = 13,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 0, 18),
        Parent = Wrap,
    })

    local Body = create("TextLabel", {
        Text = Text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Muted,
        BackgroundTransparency = 1,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 0, 18),
        AutomaticSize = Enum.AutomaticSize.Y,
        Position = UDim2.new(0, 0, 0, 20),
        Parent = Wrap,
    })
    return Wrap
end

function Section:CreateButton(opts)
    opts = opts or {}
    local Name = opts.Name or "Button"
    local Callback = opts.Callback or function() end
    local Theme = self.Theme

    local Btn = create("TextButton", {
        Text = Name,
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        TextColor3 = Theme.Text,
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 34),
        AutoButtonColor = false,
        Parent = self.Frame,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    Btn.MouseEnter:Connect(function()
        tween(Btn, TweenInfo.new(0.12), { BackgroundColor3 = Theme.Panel })
    end)
    Btn.MouseLeave:Connect(function()
        tween(Btn, TweenInfo.new(0.12), { BackgroundColor3 = Theme.PanelAlt })
    end)
    Btn.MouseButton1Click:Connect(function()
        task.spawn(Callback)
    end)

    return Btn
end

function Section:CreateToggle(opts)
    opts = opts or {}
    local Name = opts.Name or "Toggle"
    local Default = opts.Default or false
    local Callback = opts.Callback or function(_) end
    local Theme = self.Theme

    local Wrap = create("Frame", {
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 34),
        Parent = self.Frame,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local Label = create("TextLabel", {
        Text = Name,
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -54, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        Parent = Wrap,
    })

    local Toggle = create("Frame", {
        Size = UDim2.new(0, 36, 0, 18),
        Position = UDim2.new(1, -46, 0.5, -9),
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Parent = Wrap,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 9) }),
    })

    local Knob = create("Frame", {
        Size = UDim2.new(0, 14, 0, 14),
        Position = UDim2.new(0, 2, 0.5, -7),
        BackgroundColor3 = Theme.Muted,
        BorderSizePixel = 0,
        Parent = Toggle,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 7) }),
    })

    local state = Default
    local function setState(v)
        state = v
        if state then
            tween(Knob, TweenInfo.new(0.12), { Position = UDim2.new(1, -16, 0.5, -7), BackgroundColor3 = Theme.Accent })
        else
            tween(Knob, TweenInfo.new(0.12), { Position = UDim2.new(0, 2, 0.5, -7), BackgroundColor3 = Theme.Muted })
        end
        task.spawn(Callback, state)
    end

    Wrap.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            setState(not state)
        end
    end)

    setState(Default)
    return { Set = setState }
end

function Section:CreateInput(opts)
    opts = opts or {}
    local Name = opts.Name or "Input"
    local Placeholder = opts.Placeholder or ""
    local Callback = opts.Callback or function(_) end
    local Theme = self.Theme

    local Wrap = create("Frame", {
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        Parent = self.Frame,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local Label = create("TextLabel", {
        Text = Name,
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -12, 0, 16),
        Position = UDim2.new(0, 10, 0, 6),
        Parent = Wrap,
    })

    local Box = create("TextBox", {
        Text = "",
        PlaceholderText = Placeholder,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Text,
        PlaceholderColor3 = Theme.Muted,
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Size = UDim2.new(1, -20, 0, 18),
        Position = UDim2.new(0, 10, 0, 20),
        ClearTextOnFocus = false,
        Parent = Wrap,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 6) }),
    })

    Box.FocusLost:Connect(function(enter)
        task.spawn(Callback, Box.Text, enter)
    end)

    return Box
end

function Section:CreateSlider(opts)
    opts = opts or {}
    local Name = opts.Name or "Slider"
    local Min = opts.Min or 0
    local Max = opts.Max or 100
    local Default = opts.Default or Min
    local Callback = opts.Callback or function(_) end
    local Theme = self.Theme

    local Wrap = create("Frame", {
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 44),
        Parent = self.Frame,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local Label = create("TextLabel", {
        Text = Name,
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -12, 0, 16),
        Position = UDim2.new(0, 10, 0, 6),
        Parent = Wrap,
    })

    local ValueLabel = create("TextLabel", {
        Text = tostring(Default),
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Muted,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Right,
        Size = UDim2.new(1, -12, 0, 16),
        Position = UDim2.new(0, 0, 0, 6),
        Parent = Wrap,
    })

    local Track = create("Frame", {
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Size = UDim2.new(1, -20, 0, 8),
        Position = UDim2.new(0, 10, 0, 26),
        Parent = Wrap,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 4) }),
    })

    local Fill = create("Frame", {
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 0, 1, 0),
        Parent = Track,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 4) }),
    })

    local dragging = false
    local function setValue(v)
        v = clamp(v, Min, Max)
        local alpha = (v - Min) / (Max - Min)
        Fill.Size = UDim2.new(alpha, 0, 1, 0)
        ValueLabel.Text = tostring(math.floor(v))
        task.spawn(Callback, v)
    end

    Track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local x = (input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X
            setValue(Min + (Max - Min) * x)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local x = (input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X
            setValue(Min + (Max - Min) * x)
        end
    end)

    setValue(Default)
    return { Set = setValue }
end

function Section:CreateDropdown(opts)
    opts = opts or {}
    local Name = opts.Name or "Dropdown"
    local Items = opts.Items or {}
    local Callback = opts.Callback or function(_) end
    local Theme = self.Theme

    local Wrap = create("Frame", {
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        Parent = self.Frame,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local Label = create("TextLabel", {
        Text = Name,
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -12, 0, 16),
        Position = UDim2.new(0, 10, 0, 6),
        Parent = Wrap,
    })

    local Button = create("TextButton", {
        Text = "Select",
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Muted,
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Size = UDim2.new(1, -20, 0, 18),
        Position = UDim2.new(0, 10, 0, 20),
        AutoButtonColor = false,
        Parent = Wrap,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 6) }),
    })

    local Open = false
    local List = create("Frame", {
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Size = UDim2.new(1, -20, 0, 0),
        Position = UDim2.new(0, 10, 0, 40),
        ClipsDescendants = true,
        Parent = Wrap,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 8) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local ListLayout = create("UIListLayout", {
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = List,
    })

    local function rebuild()
        for _, child in ipairs(List:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        for _, item in ipairs(Items) do
            local Option = create("TextButton", {
                Text = tostring(item),
                Font = Enum.Font.Gotham,
                TextSize = 12,
                TextColor3 = Theme.Text,
                BackgroundColor3 = Theme.PanelAlt,
                BorderSizePixel = 0,
                Size = UDim2.new(1, -10, 0, 20),
                AutoButtonColor = false,
                Parent = List,
            }, {
                create("UICorner", { CornerRadius = UDim.new(0, 6) }),
            })
            Option.MouseButton1Click:Connect(function()
                Button.Text = tostring(item)
                task.spawn(Callback, item)
                Open = false
                tween(List, TweenInfo.new(0.16), { Size = UDim2.new(1, -20, 0, 0) })
            end)
        end
    end

    rebuild()

    Button.MouseButton1Click:Connect(function()
        Open = not Open
        local height = Open and (#Items * 24 + 8) or 0
        tween(List, TweenInfo.new(0.16), { Size = UDim2.new(1, -20, 0, height) })
    end)

    return {
        SetItems = function(newItems)
            Items = newItems or {}
            rebuild()
        end
    }
end

function Window:Notify(opts)
    opts = opts or {}
    local Title = opts.Title or "Notification"
    local Text = opts.Text or ""
    local Duration = opts.Duration or 3
    local Theme = self.Theme

    if not self._notifyRoot then
        local Holder = create("Frame", {
            Name = "Notify",
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 280, 1, -20),
            Position = UDim2.new(1, -300, 0, 10),
            Parent = self._gui,
        }, {
            create("UIListLayout", {
                Padding = UDim.new(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Top,
            }),
        })
        self._notifyRoot = Holder
    end

    local Card = create("Frame", {
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 60),
        Parent = self._notifyRoot,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local TitleLabel = create("TextLabel", {
        Text = Title,
        Font = Enum.Font.GothamSemibold,
        TextSize = 13,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -12, 0, 18),
        Position = UDim2.new(0, 8, 0, 6),
        Parent = Card,
    })

    local Body = create("TextLabel", {
        Text = Text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Muted,
        BackgroundTransparency = 1,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -12, 0, 32),
        Position = UDim2.new(0, 8, 0, 22),
        Parent = Card,
    })

    -- Notification animations (slide + fade)
    Card.Position = UDim2.new(1, 20, 0, 0)
    Card.BackgroundTransparency = 1
    for _, child in ipairs(Card:GetChildren()) do
        if child:IsA("TextLabel") then
            child.TextTransparency = 1
        end
    end

    tween(Card, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0 })
    for _, child in ipairs(Card:GetChildren()) do
        if child:IsA("TextLabel") then
            tween(child, TweenInfo.new(0.2), { TextTransparency = 0 })
        end
    end

    task.delay(Duration, function()
        if Card and Card.Parent then
            tween(Card, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = UDim2.new(1, 20, 0, 0), BackgroundTransparency = 1 })
            for _, child in ipairs(Card:GetChildren()) do
                if child:IsA("TextLabel") then
                    tween(child, TweenInfo.new(0.12), { TextTransparency = 1 })
                end
            end
            task.wait(0.18)
            Card:Destroy()
        end
    end)
end

return setmetatable(VoidUI, VoidUI)
