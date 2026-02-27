-- =========================
-- TOGGLE AUTO GHOST
-- =========================

if _G.AutoGhost then
	_G.AutoGhost.Enabled = false
	_G.AutoGhost = nil
	return
end

_G.AutoGhost = {Enabled = true}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local remote = ReplicatedStorage:WaitForChild("ActivateGear")

-- Transparencia
local function setTransparency()
	local character = player.Character
	if not character then return end

	for _, v in ipairs(character:GetDescendants()) do
		if v:IsA("BasePart") and v.Transparency == 0 then
			v.Transparency = 0.8
		end
	end
end

task.spawn(function()
	while _G.AutoGhost and _G.AutoGhost.Enabled do
		
		remote:FireServer("Ghost")
		setTransparency()

		task.wait(15.1)
	end
end)
