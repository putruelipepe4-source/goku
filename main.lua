-- =========================================================
-- HERMANOS DEV FULL INTERFACE STYLE - MAQUETA DE OPCIONES
-- =========================================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HermanosDevFullUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Variables de Estado Visual (Solo para interactuar con los botones)
local toggles = {
	Aimbot = false, KillAura = false, Hitbox = false, AutoBlock = false, TeleportKill = false,
	WalkSpeed = false, JumpPower = false, InfiniteJump = false, NoClip = false, Fly = false, GodMode = false
}

-- =========================================================
-- 1. VENTANA PRINCIPAL (DISEÑO PREMIUM OSCURO + BORDES NEÓN)
-- =========================================================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 520, 0, 360) -- Ventana más grande para que quepan todas las opciones
mainFrame.Position = UDim2.new(0.5, -260, 0.5, -180)
mainFrame.BackgroundColor3 = Color3.fromRGB(13, 13, 16)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = mainFrame

local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.fromRGB(255, 45, 45) -- Rojo neón vibrante estilo exploit
frameStroke.Thickness = 2.5
frameStroke.Parent = mainFrame

-- BARRA LATERAL (Sidebar)
local sideBar = Instance.new("Frame")
sideBar.Size = UDim2.new(0, 150, 1, 0)
sideBar.BackgroundColor3 = Color3.fromRGB(9, 9, 11)
sideBar.BorderSizePixel = 0
sideBar.Parent = mainFrame

local sideBarCorner = Instance.new("UICorner")
sideBarCorner.CornerRadius = UDim.new(0, 10)
sideBarCorner.Parent = sideBar

-- TÍTULOS DE LA BARRA LATERAL
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 15)
titleLabel.Text = "HERMANOS DEV"
titleLabel.TextSize = 16
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = sideBar

local subTitle = Instance.new("TextLabel")
subTitle.Size = UDim2.new(1, 0, 0, 20)
subTitle.Position = UDim2.new(0, 0, 0, 35)
subTitle.Text = "Menu Options v2.5"
subTitle.TextSize = 11
subTitle.Font = Enum.Font.GothamSemibold
subTitle.TextColor3 = Color3.fromRGB(255, 45, 45)
subTitle.BackgroundTransparency = 1
subTitle.Parent = sideBar

-- BOTÓN DE CIERRE PRINCIPAL "X"
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 26, 0, 26)
closeButton.Position = UDim2.new(1, -35, 0, 12)
closeButton.Text = "X"
closeButton.TextSize = 13
closeButton.Font = Enum.Font.GothamBold
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

-- =========================================================
-- 2. PANEL CONTENEDOR CON SCROLLING (TODAS LAS OPCIONES VISIBLES)
-- =========================================================
local container = Instance.new("ScrollingFrame")
container.Size = UDim2.new(1, -185, 1, -60)
container.Position = UDim2.new(0, 170, 0, 50)
container.BackgroundTransparency = 1
container.BorderSizePixel = 0
container.ScrollBarThickness = 5
container.ScrollBarImageColor3 = Color3.fromRGB(255, 45, 45)
container.CanvasSize = UDim2.new(0, 0, 0, 580) -- Amplio espacio vertical para ver todo al bajar
container.Parent = mainFrame

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = container
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 8)

-- Funciones auxiliares para agregar elementos rápidamente
local function addSectionHeader(text, order)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -10, 0, 30)
	label.Text = text
	label.TextSize = 13
	label.Font = Enum.Font.GothamBold
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.BackgroundTransparency = 1
	label.LayoutOrder = order
	label.Parent = container
end

local function addOptionButton(text, order)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -10, 0, 36)
	btn.Text = "  " .. text .. ": DESACTIVADO"
	btn.TextSize = 12
	btn.Font = Enum.Font.GothamBold
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
	btn.TextColor3 = Color3.fromRGB(255, 90, 90)
	btn.LayoutOrder = order
	btn.Parent = container
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = btn
	
	return btn
end

-- =========================================================
-- 3. INSERCIÓN DE TODAS LAS OPCIONES EXIGIDAS
-- =========================================================

-- SECCIÓN COMBATE (PVP)
addSectionHeader("⚔️ OPCIONES DE COMBATE (PVP)", 1)
local bAimbot     = addOptionButton("Aimbot (Apuntado Automático)", 2)
local bKillAura   = addOptionButton("Kill Aura (Daño en Rango)", 3)
local bHitbox     = addOptionButton("Hitbox Expander (Agrandar Enemigos)", 4)
local bAutoBlock  = addOptionButton("Auto Block / Parry (Bloqueo)", 5)
local bTeleportKp = addOptionButton("Teleport Kill (Combate Remoto)", 6)

-- SECCIÓN MODIFICACIONES DE PERSONAJE
addSectionHeader("🏃 MODIFICACIONES DE PERSONAJE", 7)
local bSpeed      = addOptionButton("WalkSpeed (Velocidad Avanzada)", 8)
local bJump       = addOptionButton("JumpPower (Súper Salto)", 9)
local bInfJump    = addOptionButton("Infinite Jump (Salto en el Aire)", 10)
local bNoClip     = addOptionButton("No Clip (Atravesar Estructuras)", 11)
local bFly        = addOptionButton("Fly (Modo Vuelo)", 12)
local bGodMode    = addOptionButton("God Mode (Simulación de Inmunidad)", 13)

-- =========================================================
-- 4. MENÚ FLOTANTE CIRCULAR (MINIMIZADO)
-- =========================================================
local floatingButton = Instance.new("TextButton")
floatingButton.Size = UDim2.new(0, 55, 0, 55)
floatingButton.Position = UDim2.new(0, 25, 0.4, 0)
floatingButton.BackgroundColor3 = Color3.fromRGB(13, 13, 16)
floatingButton.Text = "👹" -- Icono clásico estilo exploit
floatingButton.TextSize = 22
floatingButton.Visible = false
floatingButton.Parent = screenGui

local roundFloating = Instance.new("UICorner")
roundFloating.CornerRadius = UDim.new(1, 0)
roundFloating.Parent = floatingButton

local floatingStroke = Instance.new("UIStroke")
floatingStroke.Color = Color3.fromRGB(255, 45, 45)
floatingStroke.Thickness = 2
floatingStroke.Parent = floatingButton

-- =========================================================
-- 5. CONEXIONES INTERACTIVAS Y LÓGICA DE APERTURA / CIERRE
-- =========================================================
closeButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	floatingButton.Visible = true
end)

floatingButton.MouseButton1Click:Connect(function()
	floatingButton.Visible = false
	mainFrame.Visible = true
end)

-- Conexión interactiva para que todos los botones cambien a verde neón visualmente al pulsarlos
local function connectToggle(btn, cleanName)
	local active = false
	btn.MouseButton1Click:Connect(function()
		active = not active
		if active then
			btn.Text = "  " .. cleanName .. ": ACTIVADO"
			btn.TextColor3 = Color3.fromRGB(60, 255, 60)
			btn.BackgroundColor3 = Color3.fromRGB(18, 30, 18)
		else
			btn.Text = "  " .. cleanName .. ": DESACTIVADO"
			btn.TextColor3 = Color3.fromRGB(255, 90, 90)
			btn.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
		end
	end)
end

connectToggle(bAimbot, "Aimbot (Apuntado Automático)")
connectToggle(bKillAura, "Kill Aura (Daño en Rango)")
connectToggle(bHitbox, "Hitbox Expander (Agrandar Enemigos)")
connectToggle(bAutoBlock, "Auto Block / Parry (Bloqueo)")
connectToggle(bTeleportKp, "Teleport Kill (Combate Remoto)")
connectToggle(bSpeed, "WalkSpeed (Velocidad Avanzada)")
connectToggle(bJump, "JumpPower (Súper Salto)")
connectToggle(bInfJump, "Infinite Jump (Salto en el Aire)")
connectToggle(bNoClip, "No Clip (Atravesar Estructuras)")
connectToggle(bFly, "Fly (Modo Vuelo)")
connectToggle(bGodMode, "God Mode (Simulación de Inmunidad)")

-- =========================================================
-- 6. SISTEMA DE ARRASTRE MULTIPLATAFORMA (MÓVILES Y PC)
-- =========================================================
local UserInputService = game:GetService("UserInputService")
local function makeDraggable(frameToDrag)
	local dragging, dragInput, dragStart, startPos
	local function update(input)
		local delta = input.Position - dragStart
		frameToDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	frameToDrag.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frameToDrag.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	frameToDrag.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then update(input) end
	end)
end

makeDraggable(mainFrame)
makeDraggable(floatingButton)
