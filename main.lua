local ws = game:GetService("Workspace")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local pps = game:GetService("ProximityPromptService")
local plrs = game:GetService("Players")
local lighting = game:GetService("Lighting")
local cg = game:GetService("CoreGui")

local cam = ws.CurrentCamera
local lplr = plrs.LocalPlayer

local toggles = {
    AimAssist = false,
    ESP = false,
    PlayerESP = false,
    EnemyHP = false,
    ItemESP = false,
    Crosshair = true,
    Noclip = false,
    Hitboxes = false,
    Fullbright = false,
    InstantInteract = false,
    DelCorpses = false,
    Speed = false,
    -- Optimization
    LowVisuals = false,
    InstanceOptimizer = false,
    ParticleCap = false,
    UltraPotato = false,
}

local cfg = {
    aimStrength = 0.5,
    fov = 60,
    targetPart = "Head",
    maxDist = 500,
    delCorpses = true,
    maxEsp = 10,
    espFill = Color3.fromRGB(255, 0, 0),
    espOutline = Color3.fromRGB(255, 255, 255),
    fillTrans = 0.5,
    outTrans = 0,
    scanRate = 0.5,
    speed = 16,
}

local hitboxCfg = {
    enabled = true,
    part = "Head",
    size = Vector3.new(2, 2, 2),
    show = true,
    color = BrickColor.new("Bright red"),
    trans = 0.7,
    refreshRate = 1
}

-- GUI Setup
local gui = Instance.new("ScreenGui")
gui.Name = "OmniMenu"
gui.Parent = cg
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local main = Instance.new("Frame")
main.Name = "main"
main.Parent = gui
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.05, 0, 0.2, 0)
main.Size = UDim2.new(0.2, 0, 0.6, 0)
main.Active = true
main.Draggable = true
main.ClipsDescendants = true

local sizeConstraint = Instance.new("UISizeConstraint")
sizeConstraint.Parent = main
sizeConstraint.MinSize = Vector2.new(150, 250)
sizeConstraint.MaxSize = Vector2.new(250, 600)

local title = Instance.new("TextLabel")
title.Parent = main
title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
title.Size = UDim2.new(1, 0, 0, 30)
title.Font = Enum.Font.GothamBold
title.Text = "FOOL"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 14

local minBtn = Instance.new("TextButton")
minBtn.Parent = main
minBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
minBtn.Position = UDim2.new(1, -30, 0, 0)
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Font = Enum.Font.GothamBold
minBtn.Text = "-"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.TextSize = 16
