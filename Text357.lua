--// SERVICIOS
local Players = game:GetService("Players")
local player = Players.LocalPlayer

--// TOOL
local tool = Instance.new("Tool")
tool.Name = " Decoy"
tool.RequiresHandle = true
tool.TextureId = "rbxassetid://102191095086351"

--// HANDLE
local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(4,1,2)
handle.Transparency = 1
handle.CanCollide = false
handle.Material = Enum.Material.Plastic
handle.Color = Color3.fromRGB(163,162,165)
handle.Parent = tool

--// FUNCION BASE
local function makePart(name, size, color, offset, texture)
	local p = Instance.new("Part")
	p.Name = name
	p.Size = Vector3.new(size[1], size[2], size[3])
	p.Color = Color3.new(color[1], color[2], color[3])
	p.Material = Enum.Material.Plastic
	p.CanCollide = false
	p.Anchored = false
	p.Parent = tool

	p.CFrame = handle.CFrame * CFrame.new(offset[1], offset[2], offset[3])

	if texture then
		local d = Instance.new("Decal")
		d.Texture = texture
		d.Face = Enum.NormalId.Front
		d.Parent = p
	end

	-- 🔥 AQUI ESTA LO IMPORTANTE (MESH DE LA CABEZA)
	if name == "Head" or name == "Head2" then
		local mesh = Instance.new("SpecialMesh")
		mesh.Scale = Vector3.new(1.25,1.25,1.25)
		mesh.Parent = p
	end

	local w = Instance.new("WeldConstraint")
	w.Part0 = handle
	w.Part1 = p
	w.Parent = p

	return p
end

--// 🔴 CUERPO ROJO
makePart("Head", {0.6,0.3,0.3}, {1,0,0}, {0,0.85,0}, "rbxasset://textures/face.png")
makePart("Torso", {0.6,0.6,0.3}, {1,0,0}, {0,0.4,0})
makePart("Left Arm", {0.3,0.6,0.3}, {1,0,0}, {-0.45,0.4,0})
makePart("Right Arm", {0.3,0.6,0.3}, {1,0,0}, {0.45,0.4,0})
makePart("Left Leg", {0.3,0.6,0.3}, {1,0,0}, {-0.15,-0.2,0})
makePart("Right Leg", {0.3,0.6,0.3}, {1,0,0}, {0.15,-0.2,0})

--// 🔵 CUERPO AZUL
makePart("Head2", {0.6,0.3,0.3}, {0.035,0.537,0.812}, {-1,0.85,0}, "rbxasset://textures/face.png")
makePart("Torso2", {0.6,0.6,0.3}, {0.035,0.537,0.812}, {-1,0.4,0})
makePart("LeftArm2", {0.3,0.6,0.3}, {0.035,0.537,0.812}, {-1.45,0.4,0})
makePart("RightArm2", {0.3,0.6,0.3}, {0.035,0.537,0.812}, {-0.55,0.4,0})
makePart("LeftLeg2", {0.3,0.6,0.3}, {0.035,0.537,0.812}, {-1.15,-0.2,0})
makePart("RightLeg2", {0.3,0.6,0.3}, {0.035,0.537,0.812}, {-0.85,-0.2,0})

--// DAR TOOL
tool.Parent = player:WaitForChild("Backpack")
