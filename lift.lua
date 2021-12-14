local AMOUNT_OF_CARS_2 = 1
local OVERRIDE = true -- Does nothing so far

local function clone(model, position, parent)
	local cloned = model:Clone()
	cloned:SetPrimaryPartCFrame(position)
	cloned.Parent = parent
end

--for i, folder in ipairs(workspace.Paths:GetChildren()) do

--	local p0T = Instance.new("Part")
--	p0T.Name = "0"
--	p0T.Parent = folder
--	p0T.Position = Vector3.new(math.huge,math.huge,math.huge)
--	p0T.Anchored = true

--	local positions = {}

--	for i, part in ipairs(folder:GetChildren()) do
--		positions[tonumber(part.Name)] = part.Position
--		part.CanCollide = false
--		part.Color = Color3.fromRGB(26, 28, 35)
--		part.Size = Vector3.new(.2,.2,.2)
--		part.Material = Enum.Material.SmoothPlastic
--	end

--	local totalDistance = 0

--	local CFrames = {}
--	for i = 1, #positions do
--		local prevI = i - 1
--		if prevI == 0 then prevI = #positions end
--		local offset = positions[i] - positions[prevI]
--		CFrames[i] = CFrame.lookAt(positions[i], positions[i] + offset)
		
--		local cable = Instance.new("Part")
--		cable.Anchored = true
--		cable.CanCollide = false
--		cable.CanTouch = false
--		cable.CFrame = CFrames[i] * CFrame.fromOrientation(0, math.rad(90), 0)
--		cable.Position -= offset *.5
--		cable.Size = Vector3.new(offset.Magnitude, .2, .2)
--		cable.Shape = Enum.PartType.Cylinder
--		cable.Color = Color3.fromRGB(26, 28, 35)
--		cable.TopSurface = Enum.SurfaceType.Smooth
--		cable.BottomSurface = Enum.SurfaceType.Smooth
--		cable.Parent = folder
--		cable.Material = Enum.Material.SmoothPlastic

--		totalDistance += offset.Magnitude

--	end

--	local startCFrame = CFrame.lookAt(positions[1], positions[2])

--	if OVERRIDE == true then
--		AMOUNT_OF_CARS = AMOUNT_OF_CARS_2
--	else
--		local AMOUNT_OF_CARS = totalDistance / 50
--	end

--	local waitTime = totalDistance / AMOUNT_OF_CARS / SPEED

--	local targets = {}

--	for i = 1, AMOUNT_OF_CARS do

--		local target = Instance.new("Part")
--		target.Anchored = true
--		target.CanCollide = false
--		target.CanTouch = false
--		target.CFrame = startCFrame
--		target.Size = Vector3.new(.5,.5,.5)
--		target.Parent = folder
--		target.Color = Color3.fromRGB(26, 28, 35)
--		target.Transparency = 1
--		target.Material = Enum.Material.SmoothPlastic

--		local attachment1 = Instance.new("Attachment", target)

--		local model = game:GetService("ServerStorage").Models[folder.Name]:Clone()
--		model:SetPrimaryPartCFrame(startCFrame)
--		model.Parent = folder

--		local attachment0 = Instance.new("Attachment", model.PrimaryPart)

--		local alignPosition = Instance.new("AlignPosition")
--		alignPosition.Attachment0 = attachment0
--		alignPosition.Attachment1 = attachment1
--		alignPosition.MaxForce = math.huge
--		alignPosition.MaxVelocity = SPEED
--		alignPosition.Responsiveness = 200
--		alignPosition.Parent = folder

--		local alignOrientation = Instance.new("AlignOrientation")
--		alignOrientation.Attachment0 = attachment0
--		alignOrientation.Attachment1 = attachment1
--		alignOrientation.MaxTorque = math.huge
--		alignOrientation.MaxAngularVelocity = 200
--		alignOrientation.Responsiveness = 200
--		alignOrientation.Parent = folder

--		table.insert(targets, target)

--	end

for i, folder in ipairs(workspace.Paths:GetChildren()) do

	local p0T = Instance.new("Part")
	p0T.Name = "0"
	p0T.Parent = folder
	p0T.Position = Vector3.new(math.huge,math.huge,math.huge)
	p0T.Anchored = true

	local positions = {}
	local speeds = {}

	for i, part in ipairs(folder:GetChildren()) do
		local pnnum = tonumber(part.Name)
		positions[pnnum] = part.Position
		speeds[pnnum] = part:GetAttribute("Speed")
		part.CanCollide = false
		part.Color = Color3.fromRGB(26, 28, 35)
		part.Size = Vector3.new(.2,.2,.2)
		part.Material = Enum.Material.Sand
	end

	local totalDistance = 0

	local CFrames = {}
	for i = 1, #positions do
		local prevI = i - 1
		if prevI == 0 then prevI = #positions end
		local offset = positions[i] - positions[prevI]
		CFrames[i] = CFrame.lookAt(positions[i], positions[i] + offset)

		local cable = Instance.new("Part")
		cable.Anchored = true
		cable.CanCollide = false
		cable.CanTouch = false
		cable.CFrame = CFrames[i] * CFrame.fromOrientation(0, math.rad(90), 0)
		cable.Position -= offset *.5
		cable.Size = Vector3.new(offset.Magnitude, .2, .2)
		cable.Shape = Enum.PartType.Cylinder
		cable.Color = Color3.fromRGB(26, 28, 35)
		cable.TopSurface = Enum.SurfaceType.Smooth
		cable.BottomSurface = Enum.SurfaceType.Smooth
		cable.Parent = folder
		cable.Material = Enum.Material.Sand

		totalDistance += offset.Magnitude

	end

	local startCFrame = CFrame.lookAt(positions[1], positions[2])

	if OVERRIDE == true then
		AMOUNT_OF_CARS = AMOUNT_OF_CARS_2
	else
		local AMOUNT_OF_CARS = totalDistance / 50
	end

	--local waitTime = totalDistance / AMOUNT_OF_CARS / SPEED

	local targets = {}
	local alignPositions = {}

	for i = 1, AMOUNT_OF_CARS do

		local target = Instance.new("Part")
		target.Anchored = true
		target.CanCollide = false
		target.CanTouch = false
		target.CFrame = startCFrame
		target.Size = Vector3.new(.5,.5,.5)
		target.Parent = folder
		target.Color = Color3.fromRGB(26, 28, 35)
		target.Transparency = 1
		target.Material = Enum.Material.Sand

		local attachment1 = Instance.new("Attachment", target)

		local model = game:GetService("ServerStorage").Models[folder.Name]:Clone()
		model:SetPrimaryPartCFrame(startCFrame)
		model.Parent = folder

		local attachment0 = Instance.new("Attachment", model.PrimaryPart)

		local alignPosition = Instance.new("AlignPosition")
		alignPosition.Attachment0 = attachment0
		alignPosition.Attachment1 = attachment1
		alignPosition.MaxForce = math.huge
		alignPosition.MaxVelocity = SPEED
		alignPosition.Responsiveness = 25 -- 
		alignPosition.Parent = folder
		table.insert(alignPositions, alignPosition)

		local alignOrientation = Instance.new("AlignOrientation")
		alignOrientation.Attachment0 = attachment0
		alignOrientation.Attachment1 = attachment1
		alignOrientation.MaxTorque = math.huge
		alignOrientation.MaxAngularVelocity = 4
		alignOrientation.Responsiveness = 25 -- 
		alignOrientation.Parent = folder

		table.insert(targets, target)

	end

	spawn(function()

		--clone(game:GetService("ServerStorage").Models[folder.Name], startCFrame, folder)

		local i = 0
		while true do
			local nextI = i + 1
			if nextI > #positions then
				repeat nextI = 1 until nextI == 1
			end

			local magnitude = (positions[nextI] - positions[i]).Magnitude

			i = nextI
			

			spawn(function()
				for i, target in ipairs(targets) do
					alignPositions[i].MaxVelocity = speeds[nextI]
					target.CFrame = CFrames[nextI]
					wait(totalDistance / AMOUNT_OF_CARS / speeds[nextI])
				end
			end)

			wait(magnitude / speeds[nextI])
		end
	end)

end
