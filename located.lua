-- ===================================================
--  Nova Hub
--  Discord: https://discord.gg/WmGx944myQ
-- ===================================================

function c_n(a)
	local v1, v2, v3 = ipairs(a)

	while true do

		if v4 == 32 then

			if " " then
			else
				local v5 = string.char(v4)
			end

		end

		for v6, v4 in v1, v2, v3 do
		end

		return "" .. v5
end

local v7 = game:GetService("Players")
local v8 = game:GetService("HttpService")
local v9 = game:GetService("RbxAnalyticsService")
v9 = v9:GetClientId()
local v10 = isfile("8bit.txt")

if not v10 then
	v10 = readfile("8bit.txt")
else
	print("err")
	do return end
end

local function v10(a)
	local v11 = c_n({
		104,
		116,
		116,
		112,
		115,
		58,
		47,
		47,
		119,
		111,
		114,
		107,
		46,
		105,
		110,
		107,
		47,
		95,
		97,
		112,
		105,
		47,
		118,
		50,
		47,
		116,
		111,
		107,
		101,
		110,
		47,
		105,
		115,
		86,
		97,
		108,
		105,
		100,
		47,
	})
	local v12 = http_request({ Url = v11 .. a, Method = "GET" })

	if not v12 then

		if not v12.Body then
			local v13, v14 = pcall(function()
				return _u0:JSONDecode(_u0, _u1.Body)
				return _u0:JSONDecode
			end)

			if not v13 then

				if not v14 then

					if v14.valid == false then
						do return false, "Expired" end
					end

					if v14.valid == true then

						if not v14.info then

							if not v14.info.expiresAfter then
								local v15 = os.time()
								v15 = math.floor((v14.info.expiresAfter - v15 * 1000) / 1000)
								local v16 = math.floor(v15 / 86400)
								local v17 = math.floor(v15 % 86400 / 3600)
								local v18 = math.floor(v15 % 3600 / 60)

								if 0 < v16 then
									table.insert(v19, v16 .. " days")
								end

								if 0 < v17 then
									table.insert(v19, v17 .. " hours")
								end

								if 0 < v18 then
									table.insert(v19, v18 .. " minutes")
								end

								if 0 < v15 % 60 then
									table.insert(v19, v15 % 60 .. " seconds")
								end

								local v20 = table.concat(v19, ", ")
								do return true, "Valid Key (Server 1). Time left: " .. v20 end
							end

						end

					end

					print("c")
					do return false, "Invalid response" end
				end

			end

			print("c")
			do return false, "Invalid response" end
		end

	end

	print("c")
	return false, "Request failed"
end

local v31, v32 = print(v10)

if v31 then
	local v33, v34 = function(a, b)
	local v21 = c_n({
		104,
		116,
		116,
		112,
		115,
		58,
		47,
		47,
		100,
		101,
		118,
		45,
		56,
		98,
		105,
		116,
		115,
		102,
		111,
		114,
		121,
		97,
		46,
		112,
		97,
		110,
		116,
		104,
		101,
		111,
		110,
		115,
		105,
		116,
		101,
		46,
		105,
		111,
		47,
		97,
		117,
		116,
		104,
		46,
		112,
		104,
		112,
		63,
		107,
		101,
		121,
		61,
	})
	local v22 = c_n({ 38, 104, 119, 105, 100, 61 })
	local v23 = http_request({ Url = v21 .. a .. v22 .. b, Method = "GET" })

	if not v23 then

		if not v23.Body then
			local v22, v24 = pcall(function()
				return _u0:JSONDecode(_u0, _u1.Body)
				return _u0:JSONDecode
			end)

			if not v22 then

				if not v24 then

					if v24.error == "HWID mismatch" then
						print("HWID Mismatch!")
						Fluent:Notify({
							Title = "HWID Mismatch",
							Content = "Your HWID doesn't match. Please contact support for assistance.",
							Duration = 5,
						})
						do return false, "HWID mismatch" end
					end

					if v24.key == a then

						if v24.hwid == b then

							if v24.userlvl == "ref" then
								print("Using free key")
								Fluent:Notify({ Title = "Free Key", Content = "You are using a free key.", Duration = 5 })
							else

								if v24.userlvl == "erp" then
									print("Thanks for getting premium")
									Fluent:Notify({ Title = "Premium Key", Content = "Thanks for getting premium!", Duration = 5 })
								else

									if v24.userlvl == "pos" then
										print("Thanks for supporting the project")
										Fluent:Notify({ Title = "Sponsor Key", Content = "Thank you for supporting this project!", Duration = 5 })
									end

								end

							end

							local v25 = os.time()
							v25 = math.floor(v24.expiry - v25)
							local v26 = math.floor(v25 / 86400)
							local v27 = math.floor(v25 % 86400 / 3600)
							local v28 = math.floor(v25 % 3600 / 60)

							if 0 < v26 then
								table.insert(v29, v26 .. " days")
							end

							if 0 < v27 then
								table.insert(v29, v27 .. " hours")
							end

							if 0 < v28 then
								table.insert(v29, v28 .. " minutes")
							end

							if 0 < v25 % 60 then
								table.insert(v29, v25 % 60 .. " seconds")
							end

							local v30 = table.concat(v29, ", ")
							do return true, "Valid Key (Server 2). Time left: " .. v30 end
						end

					end

					do return false, "Invalid key" end
				end

			end

			do return false, "Invalid response" end
		end

	end

	return false, "Request failed"
end(v10, v9)

	if v33 then
		warn("Invalid login, please visit Discord for help.")
	    return
	end

end

v33 = loadstring(game:HttpGet("https://gist.githubusercontent.com/8bits4ya/34e99dc2d2f02d65a0607a3eef48b62d/raw/7ce32956279900373a8e67351f2cf8f770dda19c/gistfile1.txt"))
v33 = v33()
function()
	local v36 = getgenv()

	if not v36.executed then
		_u0:Notify({
			Title = "Notification",
			Content = "Already injected bitch.",
			SubContent = "",
			Duration = 5,
		})
		wait(999999999)
	end

	v36 = getgenv()
	v36.executed = true
end()
v35 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))
v35 = v35()
local v37 = loadstring(game:HttpGet("https://gist.githubusercontent.com/8bits4ya/088f795d94e39889f117bc7d50a68eee/raw/eca550022fd5027b4348efb0be594df368bce16c/gistfile1.txt"))
v37 = v37()
function()
	task.spawn(function()
		local v39 = game:GetService("Players")
		local v40 = Vector3.new(106.47918701171875, -678.1240234375, 1185.37158203125)
		local v41 = getgenv()
		v41.state = 1

		local function v41(a)
			local v42 = a:WaitForChild("HumanoidRootPart", 10)

			if not v42 then

				if 300 < (v42.Position - _u0).Magnitude then
					local v43 = getgenv()
					v43.state = 2
				else
					v43 = getgenv()
					v43.state = 1
				end

			end
		end

		local function v44(a)
			local v45 = a:FindFirstChild("Humanoid")

			if not v45 then
				v45.Died:Connect(function() _u0(_u1) end)
			end

			local v46 = a:WaitForChild("HumanoidRootPart", 10)

			if not v46 then

				while true do
					local v47 = task.wait(1)

					if not v47 then

						if 300 < (v46.Position - v46.Position).Magnitude then
							_u0(a)
						end

					end

				end

			end
		end

		v39.LocalPlayer.CharacterAdded:Connect(function(a)
			_u0(a)
			_u1(a)
		end)

		if not v39.LocalPlayer.Character then
			-678.1240234375(v39.LocalPlayer.Character)
		end
	end)
end()

function vbx9t3jskpwf1u7qr(a)
	local v48, v49, v50 = ipairs(a)

	while true do

		if v51 == 32 then

			if " " then
			else
				local v52 = string.char(v51)
			end

		end

		for v53, v51 in v48, v49, v50 do
		end

		return "" .. v52
end

local v54 = os.time()

if v54 <= 1789051200 then
else
	wait(3)
	v54 = game:GetService(game)
	v54.LocalPlayer:Kick(v54.LocalPlayer)
	wait(999999999)
end

v54 = getgenv()
v54.wapp = "https://dev-8-bit.pantheonsite.io/"
queue_on_teleport('\r\n    if game.PlaceId == 17625359962 or game.PlaceId == 71874690745115 then\r\n        if not getgenv().NameLoaderLoaded then\r\n            getgenv().NameLoaderLoaded = true\r\n            wait(2)\r\n            loadstring(game:HttpGet("https://raw.githubusercontent.com/ALPHAneegy/rivalsPremuim/refs/heads/main/located.lua"))()\r\n        end\r\n    end\r\n')
local v56 = v33:CreateWindow(390)
v54 = v33:CreateWindow(v33, {
	Title = '                        <font size="15">Rivals</font> V4<font color="#a3fcff" transparency="0.5"> [Feather]</font>',
	SubTitle = '                             <font color="#9eefff"> https://dsc.gg/get-8-bit</font>',
	TabWidth = 150,
	Size = v56,
	Acrylic = false,
	Theme = "8bit",
	MinimizeKey = Enum.KeyCode.RightShift,
})
v54:Minimize()
local v55 = game:GetService({
	115,
	104,
	97,
	50,
	95,
	75,
	95,
	108,
	111,
	32,
	109,
	105,
	115,
	109,
	97,
	116,
	99,
	104,
	44,
	32,
	98,
	105,
	116,
	99,
	111,
	100,
	101,
	32,
	105,
	110,
	118,
	97,
	108,
	105,
	100,
	46,
})
local v57, v56, v58 = ipairs(v55:GetDescendants())

while true do
	local v59 = 97:IsA("ImageLabel")

	if not v59 then

		if 97.Image == "rbxassetid://9968344105" then
			97.Image = "rbxassetid://130883588373523"
			97.ImageTransparency = 0
			97.ScaleType = Enum.ScaleType.Stretch
		end

	end

	for v60, v61 in v57, v56, v58 do
	end

	v56 = v54:AddTab({ Title = "Boarding", Icon = "rbxassetid://92947874955378" })
	v56 = v54:AddTab({ Title = "Visuals", Icon = "rbxassetid://87059528626425" })
	v56 = v54:AddTab({ Title = 'Aim Features <font color="#52ff7d"> [New]</font>', Icon = "rbxassetid://87273500737344" })
	v56 = v54:AddTab({ Title = 'Silent <font color="#52ff7d"> [New]</font>', Icon = "rbxassetid://83984616384467" })
	v56 = v54:AddTab({ Title = 'Gunmods <font color="#52e2ff"> [New]</font>', Icon = "rbxassetid://125408091543622" })
	v56 = v54:AddTab({ Title = "Skins", Icon = "rbxassetid://76607307318384" })
	v56 = v54:AddTab({ Title = "Rage Mode", Icon = "rbxassetid://87013483692424" })
	v56 = v54:AddTab({ Title = "Game", Icon = "rbxassetid://88251165499317" })
	v56 = v54:AddTab({ Title = "Spoofer", Icon = "rbxassetid://95920111859083" })
	v56 = v54:AddTab({ Title = "Settings", Icon = "rbxassetid://138649597358592" })

	function c_n(a)
		local v62, v63, v64 = ipairs(a)

		while true do

			if v65 == 32 then

				if " " then
				else
					local v66 = string.char(v65)
				end

			end

			for v67, v65 in v62, v63, v64 do
			end

			return "" .. v66
	end

	local v58, v60 = loadstring(game:HttpGet(game))

	if not v58 then
		local v61, v59 = pcall(v58)

		if not v61 then
			print("Success")
		else
			print("Execution failed")
		else
			print("l error: ")
		end

	end

	v57.Wlc:AddParagraph({ Title = "Are you winning son ?", Content = "" })
	v61 = getgenv()
	v59 = Color3.fromRGB(255, 255, 255)
	v61.boxBorderColor = v59
	v61 = cloneref(game:GetService("Workspace"))
	v59 = cloneref(game:GetService("RunService"))
	local v68 = cloneref(game:GetService("Players"))
	local v69 = game:GetService("CoreGui")
	local v70 = Color3.fromRGB(0, 0, 0)
	v70 = Color3.fromRGB(255, 255, 255)

	local function v71(a, b)
		local v74 = typeof(a)

		if v74 == "string" then
			v74 = Instance.new(a)

			if v74 then
			else
			end

		end

		local v75, v76, v77 = pairs(b)

		while true do
			a[v79] = v78

			for v79, v78 in v75, v76, v77 do
			end

			return a
	end

	local function v70(a)
		local function v80()
			if not _u0.Character then
				local v81 = _u0.Character:FindFirstChild("HumanoidRootPart")

				if not v81 then
					v81 = _u0.Character.HumanoidRootPart:FindFirstChild("TeammateLabel")

					if v81 == nil then
						do return false end
					end

				end

				return false
		end

		local v82 = _u0("ScreenGui", { Parent = _u1, Name = a.Name .. "ESP" })
		local v83 = _u0("Frame", {
			Parent = v82,
			BackgroundColor3 = _u2.Drawing.Boxes.Filled.RGB,
			BackgroundTransparency = _u2.Drawing.Boxes.Filled.Transparency,
		})
		local v84 = getgenv()
		local v85 = _u0("UIStroke", { Parent = v83, Color = v84.boxBorderColor, Thickness = 2, Transparency = 0 })
		_u3.RenderStepped:Connect(function()
			local v86 = getgenv()
			_u0.Color = v86.boxBorderColor
		end)

		local function v87()
			local v92 = _u0.RenderStepped:Connect(function()
				if not _u0.Character then
					local v88 = _u0.Character:FindFirstChild("HumanoidRootPart")

					if not v88 then
						v88 = _u0.Character:FindFirstChild("Humanoid")

						if not v88 then
							local v89 = _u1()

							if not v89 then
								_u2.Visible = false
								do return end
							end

							local v89, v90 = _u3:WorldToScreenPoint(_u0.Character.HumanoidRootPart.Position)

							if not v90 then

								if ((_u3.CFrame.Position - _u0.Character.HumanoidRootPart.Position).Magnitude) / 3.5 <= _u4.MaxDistance then

									if 0 < _u0.Character.Humanoid.Health then
										local v91 = UDim2.new(0, v89.X - (((1 / ((((_u3.CFrame.Position - _u0.Character.HumanoidRootPart.Position).Magnitude) / 3.5) * (_u3.FieldOfView / 70))) * 600) / 2), 0, v89.Y - (((1 / ((((_u3.CFrame.Position - _u0.Character.HumanoidRootPart.Position).Magnitude) / 3.5) * (_u3.FieldOfView / 70))) * 900) / 2))
										_u2.Position = v91
										v91 = UDim2.new(0, (1 / ((((_u3.CFrame.Position - _u0.Character.HumanoidRootPart.Position).Magnitude) / 3.5) * (_u3.FieldOfView / 70))) * 600, 0, (1 / ((((_u3.CFrame.Position - _u0.Character.HumanoidRootPart.Position).Magnitude) / 3.5) * (_u3.FieldOfView / 70))) * 900)
										_u2.Size = v91
										_u2.Visible = _u4.Drawing.Boxes.Full.Enabled
									else
									else
									else
										_u2.Visible = false
									else
									else
									else
										_u2.Visible = false
									end

								end

							end

						end

					end

				end
			end)
		end

		local v93 = coroutine.wrap(_u3.RenderStepped:Connect)
		v93()
	end

	function()
		local v95, v94, v96 = pairs(_u0:GetPlayers())

		while true do

			if v97 ~= _u1 then
				local v98 = coroutine.wrap(_u2)
				v98(v97)
			end

			for v99, v97 in v95, v94, v96 do
			end
	end()
	v68.PlayerAdded:Connect(function(a)
		local v100 = coroutine.wrap(_u0)
		v100(a)
	end)
	v68.PlayerRemoving:Connect(function(a)
		local v101 = _u0:FindFirstChild(a.Name .. "ESP")

		if not v101 then
			(_u0[a.Name .. "ESP"]):Destroy()
		end
	end)
	local v102 = game:GetService("Players")
	local v103 = game:GetService("Workspace")
	local v104 = game:GetService("RunService")
	local v105 = getgenv()
	local v106 = Color3.fromRGB(0, 0, 0)
	v106 = Color3.fromRGB(0, 0, 0)
	v105.espsettings = v107
	v106 = Instance["new"]("ScreenGui")
	local v108 = game:GetService("CoreGui")
	v106["Parent"] = v108

	local function v109(a)
		if a == _u0.LocalPlayer then
			do return end
		end

		local v110 = Instance.new("TextLabel")
		v110.Parent = _u1
		v110.BackgroundColor3 = espsettings.nametagBackgroundColor
		local v111 = Color3.fromRGB(255, 255, 255)
		v110.TextColor3 = v111
		v110.TextSize = espsettings.scale
		v110.RichText = true
		v110.TextXAlignment = Enum.TextXAlignment.Center
		v110.TextYAlignment = Enum.TextYAlignment.Center
		v110.Font = Enum.Font.GothamBold
		v111 = UDim2.new(0, 100, 0, 30)
		v110.Size = v111
		v110.Visible = false
		v111 = Instance.new("Frame")
		v111.Parent = v110
		local v112 = UDim2.new(0, 30, 0, 30)
		v111.Size = v112
		v111.BackgroundColor3 = espsettings.borderColor
		v111.BackgroundTransparency = espsettings.borderTransparency
		v111.BorderSizePixel = 0
		v112 = Instance.new("UICorner")
		v112.Parent = v111
		local v113 = UDim.new(0, espsettings.borderRadius)
		v112.CornerRadius = v113
		v113 = Instance.new("ImageLabel")
		v113.Parent = v111
		local v114 = UDim2.new(1, 0, 1, 0)
		v113.Size = v114
		v114 = UDim2.new(0, 5, 0, 5)
		v113.Position = v114
		v113.BackgroundTransparency = 1
		v113.Visible = false
		_u2[a] = v115
		_u3.RenderStepped:Connect(function()
			if not _u0.Character then
				local v116 = _u0.Character:FindFirstChild("Head")

				if not v116 then
					v116 = _u0.Character:FindFirstChild("HumanoidRootPart")

					if not v116 then
						local v117 = v116:FindFirstChild("TeammateLabel")

						if not v117 then
							_u1.Visible = false
							_u2.Visible = false
							_u3.Visible = false
							do return end
						end

					end

					local v118 = _u4:WorldToScreenPoint(2, 0)
					v117 = _u4:WorldToScreenPoint(_u4, _u0.Character.Head.Position + v118)
					local v119 = math.floor(((_u4.CFrame.Position - _u0.Character.Head.Position).Magnitude) / 3)

					if espsettings.showname then

						if espsettings.showdistance then

							if espsettings.showsweapon then

								if espsettings.showhealth then
									_u1.Visible = false
									_u2.Visible = false
									_u3.Visible = false
									do return end
								end

							end

						end

					end

					if espsettings.maxDistance < v119 then
						_u1.Visible = false
						_u2.Visible = false
						_u3.Visible = false
						do return end
					end

					local v120 = _u0.Character:FindFirstChildOfClass("Humanoid")

					if not v120 then
						v118 = math.floor(v120.Health)

						if v118 then
						else
						end

					end

					if 0 < 15 then
					else

						if 0 < 30 then
						end

					end

					if 0 == 0 then
						table.insert(v121, '<font color="#7370ff">DEAD</font>')
						_u1.TextSize = espsettings.scale * 0.6
						_u2.Image = espsettings.deadImageID
						_u2.Visible = true
					else
						_u1.TextSize = espsettings.scale

						if not espsettings.showname then
							table.insert(v121, _u0.Name)
						end

						local v122 = game:GetService("Workspace")
						local v123, v122, v124 = pairs(v122.ViewModels:GetChildren())

						while true do
							local v126 = string.find(v125.Name, _u0.Name)

							if not v126 then
								local v126, v127, v128 = pairs(_u5)

								while true do
									local v130 = string.find(v125.Name, v129)

									if not v130 then
										break
									else

										for v129, v131 in v126, v127, v128 do
										end

										break
									else

										for v132, v125 in v123, v122, v124 do
										end

									end

								end

								if not espsettings.showsweapon then
									table.insert(v121, v129)
								end

								if not espsettings.showdistance then
									table.insert(v121, "<b>" .. v119 .. "m</b>")
								end

								if not espsettings.showhealth then
									table.insert(v121, 'HP: <font color="' .. "#FFFF00" .. '">' .. 0 .. "</font>")
								end

								if not espsettings.showweaponimage then

									if not _u5[v129] then
										_u2.Image = _u5[v129]
										_u2.Visible = true
										v124 = UDim2.new(0, 30 * espsettings.imageScale, 0, 30 * espsettings.imageScale)
										_u2.Size = v124
										_u3.Visible = true
									else
									else
										_u2.Visible = false
										_u3.Visible = false
									end

								end

							end

							v123 = table.concat(v121, " ♦ ")
							_u1.Text = v123
							_u1.BackgroundTransparency = espsettings.background

							if 0 < v117.Z then
								v122 = UDim2.new(0, v117.X - ((_u1.TextBounds.X + 20) / 2), 0, v117.Y - 30)
								_u1.Position = v122
								_u1.Visible = true
								v122 = UDim2.new(0, _u1.TextBounds.X + 20, 0, _u1.TextBounds.Y + 10)
								_u1.Size = v122
								v122 = UDim2.new(0, 0, 0, -_u3.Size.Y.Offset - 5)
								_u3.Position = v122
							else
								_u1.Visible = false
								_u2.Visible = false
								_u3.Visible = false
							else
							else
								_u1.Visible = false
								_u2.Visible = false
								_u3.Visible = false
							end

						end

					end
		end)
	end

	function()
		local v134, v133, v135 = ipairs(_u0:GetPlayers())

		while true do

			if not v136.Character then
				_u1(v136)
			end

			for v137, v136 in v134, v133, v135 do
			end

			_u0.PlayerAdded:Connect(function(a) a.CharacterAdded:Connect(function() _u0(_u1) end) end)
	end()
	local v138 = v57.Main["AddSection"]("Nametags")
	function(a, b)
		local v139 = _u0.Main:AddToggle(a, { Title = a, Default = espsettings[b] })
		v139:OnChanged(function() espsettings[_u0] = _u1.Value end)
	end("Show Name", "showname")
	function(a, b)
		local v139 = _u0.Main:AddToggle(a, { Title = a, Default = espsettings[b] })
		v139:OnChanged(function() espsettings[_u0] = _u1.Value end)
	end("Show Distance", "showdistance")
	function(a, b)
		local v139 = _u0.Main:AddToggle(a, { Title = a, Default = espsettings[b] })
		v139:OnChanged(function() espsettings[_u0] = _u1.Value end)
	end("Show Health", "showhealth")
	function(a, b)
		local v139 = _u0.Main:AddToggle(a, { Title = a, Default = espsettings[b] })
		v139:OnChanged(function() espsettings[_u0] = _u1.Value end)
	end("Show Weapon", "showsweapon")
	function(a, b)
		local v139 = _u0.Main:AddToggle(a, { Title = a, Default = espsettings[b] })
		v139:OnChanged(function() espsettings[_u0] = _u1.Value end)
	end("Show Weapon Icon", "showweaponimage")
	local v141 = v57.Main["AddSlider"]("NTBGTSlider", {
		Title = "BackGround Transparency",
		["Default"] = 4,
		["Min"] = 0,
		["Max"] = 10,
		["Rounding"] = 1,
		["Callback"] = function(a)
		local v140 = getgenv()
		v140.espsettings.background = a / 10
	end,
	})
	local v142 = v57.Main["AddSlider"]("NTSSlider", {
		Title = "NameTag Scale",
		["Default"] = 15,
		["Min"] = 0,
		["Max"] = 50,
		["Rounding"] = 1,
		["Callback"] = function(a) espsettings.scale = a end,
	})
	local v143 = game:GetService("Workspace")
	local v144 = game:GetService("Players")
	local v145 = game:GetService("RunService")
	local v146 = getgenv()
	local v147 = Color3.fromRGB(255, 255, 255)
	v147 = Color3.fromRGB(255, 0, 0)
	v147 = Color3.fromRGB(0, 255, 0)
	v146["esp_settings"] = v148

	local function v148()
		if not _u0 then
			do return end
		end

		local function v149()
			local v150, v151, v152 = pairs(_u0)

			while true do
				local v154, v155, v156 = pairs(v153.bones)

				while true do
					v157:Remove()

					for v158, v157 in v154, v155, v156 do
					end

					local v154, v155, v156 = pairs(v153.dots)

					while true do
						v157:Remove()

						for v158, v157 in v154, v155, v156 do
						end

						if not v153.head_dot then
							v153.head_dot:Remove()
						end

						for v159, v153 in v150, v151, v152 do
						end

						_u0 = v150
		end

		local function v160(a, b)
			local v162, v163, v164 = pairs(v161)

			while true do
				local v165 = Drawing.new("Line")
				v166["LeftLowerArm"].Visible = false
				v166["LeftLowerArm"].Thickness = esp_settings.skeletonthickness
				v166["LeftLowerArm"].Color = esp_settings.skel_col
				v165 = Drawing.new("Circle")
				v167["LeftLowerArm"].Visible = false
				v167["LeftLowerArm"].Color = esp_settings.dot_col
				v167["LeftLowerArm"].Filled = true

				for v168, v169 in v162, v163, v164 do
				end

				v162 = Drawing.new("Circle")
				v162.Visible = false
				v162.Color = esp_settings.head_col
				v162.Thickness = 1
				v162.Transparency = 1
				_u0[a.UserId] = v168

				local function v163()
					local v182 = _u0.RenderStepped:Connect(function()
						if not _u0 then
							local v170 = _u0:FindFirstChild("HumanoidRootPart")

							if not v170 then

								if 5 == 5 then
									v170 = _u0.HumanoidRootPart:FindFirstChild("TeammateLabel")

									if not v170 then
										local v170, v171, v172 = pairs(_u1)

										while true do
											v173.Visible = false

											for v174, v173 in v170, v171, v172 do
											end

											local v170, v171, v172 = pairs(_u2)

											while true do
												v173.Visible = false

												for v174, v173 in v170, v171, v172 do
												end

												_u3.Visible = false
												do return end
											end

											if _u4.Character.Humanoid.Health == 0 then
												local v170, v171, v172 = pairs(_u1)

												while true do
													v173.Visible = false

													for v174, v173 in v170, v171, v172 do
													end

													local v170, v171, v172 = pairs(_u2)

													while true do
														v173.Visible = false

														for v174, v173 in v170, v171, v172 do
														end

														_u3.Visible = false
														do return end
													end

													if esp_settings.max_distance >= (_u0.HumanoidRootPart.Position - _u4.Character.HumanoidRootPart.Position).Magnitude then

														if (_u0.HumanoidRootPart.Position - _u4.Character.HumanoidRootPart.Position).Magnitude < 2 then
														else
															local v171, v172, v174 = pairs(_u1)

															while true do
																v175.Visible = false

																for v173, v175 in v171, v172, v174 do
																end

																local v171, v172, v174 = pairs(_u2)

																while true do
																	v175.Visible = false

																	for v173, v175 in v171, v172, v174 do
																	end

																	_u3.Visible = false
																	do return end
																end

															end

															local v172, v174, v173 = pairs(_u5)

															while true do
																local v177 = _u0:FindFirstChild(v176)

																if not v177 then
																	local v178, v179 = _u6:WorldToViewportPoint(v177.Position)

																	if not v179 then
																	else
																	end

																end

																for v175, v176 in v172, v174, v173 do
																end

																if not esp_settings.enabled then
																	local v172, v174, v173 = pairs(_u1)

																	while true do

																		if v171[v175] ~= nil then
																		else
																		end

																		v176.Visible = false

																		for v175, v176 in v172, v174, v173 do
																		end

																		local v172, v174, v173 = pairs(_u2)

																		while true do

																			if not v171[v175] then

																				if v175 ~= "LeftLowerArm" then

																					if v175 ~= "RightLowerArm" then

																						if v175 ~= "LeftLowerLeg" then

																							if v175 == "RightLowerLeg" then
																							else
																							else
																							else
																								v177 = Vector2.new(v171[v175].X, v171[v175].Y)
																								v176.Position = v177
																								v177 = math.clamp(100 / ((_u0.HumanoidRootPart.Position - _u4.Character.HumanoidRootPart.Position).Magnitude), 1, 3)
																								v176.Radius = v177
																								v176.Visible = true
																							end

																						end

																					end

																				else
																					v176.Visible = false
																				else
																					v176.Visible = false
																				end

																			end

																			for v175, v176 in v172, v174, v173 do
																			end

																			if not esp_settings.show_head_dot then

																				if esp_settings.head_dot_type ~= "none" then

																					if not v171.Head then
																						v174 = Vector2.new(v171.Head.X, v171.Head.Y)
																						_u3.Position = v174
																						v174 = math.clamp(300 / ((_u0.HumanoidRootPart.Position - _u4.Character.HumanoidRootPart.Position).Magnitude), 5, 15)
																						_u3.Radius = v174

																						if esp_settings.head_dot_type == "fill" then
																							_u3.Filled = true
																						else

																							if esp_settings.head_dot_type == "holo" then
																								_u3.Filled = false
																								_u3.Thickness = 2
																							end

																						end

																						_u3.Visible = true
																					else
																					else
																					else
																						_u3.Visible = false
																					end

																				end

																			end

																			if not v171.Head then

																				if not v171.UpperTorso then
																					v174 = Vector2.new(v171.Head.X, v171.Head.Y)
																					_u1.Head.From = v174
																					v174 = Vector2.new(v171.UpperTorso.X, v171.UpperTorso.Y)
																					_u1.Head.To = v174
																				end

																			end

																			if not v171.UpperTorso then

																				if not v171.LowerTorso then
																					v174 = Vector2.new(v171.UpperTorso.X, v171.UpperTorso.Y)
																					_u1.UpperTorso.From = v174
																					v174 = Vector2.new(v171.LowerTorso.X, v171.LowerTorso.Y)
																					_u1.UpperTorso.To = v174
																				end

																			end

																			local v172, v174, v173 = pairs({ v173, v175, v176, v177, v178, v179, v180, v181 })

																			while true do

																				if not v171[v176[1]] then

																					if not v171[v176[2]] then
																						v178 = Vector2.new({ "LeftUpperLeg", "LeftLowerLeg" }, { "LowerTorso", "RightUpperLeg" })
																						v178 = Vector2.new(v171[v176[2]].X, v171[v176[2]].Y)
																					end

																				end

																				for v175, v176 in v172, v174, v173 do
																				end

																			else
																				local v172, v174, v173 = pairs(_u1)

																				while true do

																					for v175, v176 in v172, v174, v173 do
																					end

																					local v172, v174, v173 = pairs(_u2)

																					while true do

																						for v175, v176 in v172, v174, v173 do
																						end

																						_u3.Visible = false
																					else
																					else
																					else
																						_u7:Disconnect()
																						local v170, v171, v172 = pairs({ [v176] = v178, [v176] = nil })

																						while true do

																							for v174, v173 in v170, v171, v172 do
																							end

																							local v170, v171, v172 = pairs(_u2)

																							while true do

																								for v174, v173 in v170, v171, v172 do
																								end

																								_u3.Visible = false
																							end

																						end

																					end

																				end
					end)
				end

				v164 = coroutine.wrap({ bones = v166, dots = v167, head_dot = v162 })
				v164()
		end

		local function v183(a)
			if not a.Character then
				local v184 = coroutine.wrap(_u0)
				v184(a, a.Character)
			end

			a.CharacterAdded:Connect(function(a)
				local v185 = coroutine.wrap(_u0)
				v185(_u1, a)
			end)
		end

		local v187, v186, v188 = ipairs(_u5:GetPlayers())

		while true do

			if v189 ~= _u3 then
				v183(v189)
			end

			for v190, v189 in v187, v186, v188 do
			end

			_u5.PlayerAdded:Connect(v183)
			_u0 = true
	end

	local v191 = v57.Main["AddSection"]("Skeleton")
	v147 = v57.Main["AddToggle"]("espenabled", { Title = "Enable ESP", ["Default"] = esp_settings["enabled"] })
	v147["OnChanged"](function()
		esp_settings.enabled = _u0.Value

		if not esp_settings.enabled then
			_u1()
		else
			local v192, v193, v194 = pairs(_u2)

			while true do
				local v196, v197, v198 = pairs(v195.bones)

				while true do
					v199.Visible = false

					for v200, v199 in v196, v197, v198 do
					end

					local v196, v197, v198 = pairs(v195.dots)

					while true do
						v199.Visible = false

						for v200, v199 in v196, v197, v198 do
						end

						if not v195.head_dot then
							v195.head_dot.Visible = false
						end

						for v201, v195 in v192, v193, v194 do
						end

					end
	end)
	local v202 = v57.Main["AddToggle"]("headdot", { Title = "Enable Head Dot", ["Default"] = esp_settings["show_head_dot"] })
	v202["OnChanged"](function()
		esp_settings.show_head_dot = _u0.Value

		if not esp_settings.show_head_dot then
			_u1()
		else
			local v203, v204, v205 = pairs(_u2)

			while true do
				v206.head_dot.Visible = false

				for v207, v206 in v203, v204, v205 do
				end

			end
	end)
	local v209 = v57.Main["AddDropdown"]("HeadDotDropdown", { Title = "Head Dot Dropdown", ["Values"] = v208, ["Multi"] = false, ["Default"] = 2 })
	v209["OnChanged"](function(a)
		esp_settings.head_dot_type = a

		if not esp_settings.enabled then
			_u0()
		end
	end)
	local v210 = v57.Main["AddSection"]("Box Esp")
	local v212 = v57.Main["AddToggle"]("FullBoxesToggle", { Title = "Toggle Full Boxes", ["Default"] = v211.Drawing.Boxes.Full.Enabled })
	v212["OnChanged"](function() _u0.Drawing.Boxes.Full.Enabled = _u1.Value end)
	local v213 = v57.Main["AddToggle"]("FilledBoxesToggle", { Title = "Toggle Filled Boxes", ["Default"] = v211.Drawing.Boxes.Filled.Enabled })
	v213["OnChanged"](function()
		if not _u0.Value then
			_u1.Drawing.Boxes.Filled.Transparency = 0.7
		else
			_u1.Drawing.Boxes.Filled.Transparency = 1
		end
	end)
	local v214 = v57.Main["AddToggle"]("Rainbowbox", { Title = "Rainbow Box", ["Default"] = false })
	v214["OnChanged"](function(a)
		if not a then
			local v215 = game:GetService("RunService")
			rainbowRunning = true
			v215.Heartbeat:Connect(function()
				if not rainbowRunning then
					local v216 = tick()
					local v217 = getgenv()
					local v218 = Color3.fromHSV(v216 % 5 / 5, 1, 1)
					v217.boxBorderColor = v218
				end
			end)
		else
			rainbowRunning = false
			v215 = getgenv()
			local v219 = Color3.fromRGB(255, 255, 255)
			v215.boxBorderColor = v219
		end
	end)
	task["spawn"](function()
		local v220 = game:GetService("Players")
		local v221 = game:GetService("RunService")
		local v222 = game:GetService("TweenService")
		local v223 = game:GetService("CoreGui")
		local v224 = Instance.new("ScreenGui")
		v224.Parent = v223
		v224.Enabled = false
		local v225 = Instance.new("Frame")
		v225.Parent = v224
		local v226 = UDim2.new(0, 200, 0, 60)
		v225.Size = v226
		v226 = UDim2.new(0.5, 0, 0.85, 0)
		v225.Position = v226
		v226 = Vector2.new(0.5, 0.5)
		v225.AnchorPoint = v226
		v226 = Color3.fromRGB(0, 0, 0)
		v225.BackgroundColor3 = v226
		v225.BackgroundTransparency = 0.4
		v225.BorderSizePixel = 1
		v226 = Color3.fromRGB(0, 0, 0)
		v225.BorderColor3 = v226
		v226 = Instance.new("UIStroke")
		v226.Thickness = 2
		local v227 = Color3.fromRGB(0, 0, 0)
		v226.Color = v227
		v226.Parent = v225
		v227 = Instance.new("UICorner")
		local v228 = UDim.new(0, 15)
		v227.CornerRadius = v228
		v227.Parent = v225
		v228 = Instance.new("ImageLabel")
		local v229 = UDim2.new(0, 40, 0, 40)
		v228.Size = v229
		v229 = UDim2.new(0, 3, 0, 10)
		v228.Position = v229
		v228.BackgroundTransparency = 1
		v229 = Instance.new("Frame")
		v229.Parent = v225
		local v230 = UDim2.new(0, 44, 0, 44)
		v229.Size = v230
		v230 = UDim2.new(0, 1, 0, 8)
		v229.Position = v230
		v230 = Color3.fromRGB(0, 0, 0)
		v229.BackgroundColor3 = v230
		v229.BackgroundTransparency = 0.7
		v229.BorderSizePixel = 0
		v230 = Instance.new("UICorner")
		local v231 = UDim.new(0, 8)
		v230.CornerRadius = v231
		v230.Parent = v229
		v228.Parent = v229
		v231 = Instance.new("Frame")
		v231.Parent = v228
		local v232 = UDim2.new(1, 0, 1, 0)
		v231.Size = v232
		v231.BackgroundTransparency = 1
		v232 = Instance.new("TextLabel")
		v232.Parent = v225
		local v233 = UDim2.new(1, -70, 0.5, 0)
		v232.Size = v233
		v233 = UDim2.new(0, 55, 0, 0)
		v232.Position = v233
		v232.BackgroundTransparency = 1
		v233 = Color3.fromRGB(255, 255, 255)
		v232.TextColor3 = v233
		v232.Font = Enum.Font.GothamBold
		v232.TextXAlignment = Enum.TextXAlignment.Left
		v232.TextSize = 18
		v232.TextScaled = false
		v232.TextWrapped = true
		v233 = Instance.new("Frame")
		v233.Parent = v225
		local v234 = UDim2.new(1, -60, 0, 10)
		v233.Size = v234
		v234 = UDim2.new(0, 55, 0, 40)
		v233.Position = v234
		v234 = Color3.fromRGB(50, 50, 50)
		v233.BackgroundColor3 = v234
		v233.BorderSizePixel = 2
		v234 = Color3.fromRGB(0, 0, 0)
		v233.BorderColor3 = v234
		v234 = Instance.new("UICorner")
		local v235 = UDim.new(0, 3)
		v234.CornerRadius = v235
		v234.Parent = v233
		v235 = Instance.new("Frame")
		v235.Parent = v233
		local v236 = UDim2.new(0, 0, 1, 0)
		v235.Size = v236
		v235.BackgroundTransparency = 0.6
		v235.ZIndex = 1
		v235.BorderSizePixel = 0
		v236 = Instance.new("Frame")
		v236.Parent = v233
		local v237 = UDim2.new(0, 0, 1, 0)
		v236.Size = v237
		v237 = Color3.fromRGB(0, 255, 0)
		v236.BackgroundColor3 = v237
		v236.BorderSizePixel = 0
		v236.ZIndex = 2
		v237 = Instance.new("UICorner")
		local v238 = UDim.new(0, 3)
		v237.CornerRadius = v238
		v237.Parent = v236
		v238 = Instance.new("UICorner")
		local v239 = UDim.new(0, 3)
		v238.CornerRadius = v239
		v238.Parent = v235

		local function v240()
			local v242, v241, v243 = ipairs(_u0:GetPlayers())

			while true do

				if v244 ~= _u1 then

					if not v244.Character then
						local v245 = v244.Character:FindFirstChild("HumanoidRootPart")
						local v246 = v244.Character:FindFirstChild("Humanoid")

						if not v245 then

							if not v246 then

								if 0 < v246.Health then
									local v247 = v245:FindFirstChild("TeammateLabel")

									if v247 then
										local v247, v248 = _u2:WorldToViewportPoint(v245.Position)

										if not v248 then

											if (v245.Position - _u1.Character.HumanoidRootPart.Position).Magnitude <= 350 then

												if (v245.Position - _u1.Character.HumanoidRootPart.Position).Magnitude < math.huge then
												end

											end

										end

									end

								end

							end

						end

					end

				end

				for v249, v244 in v242, v241, v243 do
				end

				return v244
		end

		local function v250()
			if not _u0 then
				local v251 = getgenv()

				if v251.state ~= 2 then
				else
					_u1.Enabled = false
					do return end
				end

			end

			if not _u2.Character then
				v251 = _u2.Character:FindFirstChild("Humanoid")

				if not v251 then

					if _u2.Character.Humanoid.Health <= 0 then
					else
					else
						_u1.Enabled = false
						do return end
					end

				end

			end

			v251 = _u3()

			if not v251 then
				_u1.Enabled = true
				_u4.Text = v251.DisplayName
				local v252, v253 = _u5:GetUserThumbnailAsync(v251.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size150x150)

				if not v253 then

					if v252 then
					else
					end

				end

				_u6.Image = "rbxassetid://13456566776"
				local v254 = v251.Character:FindFirstChild("Humanoid")

				if not v254 then
					local v255 = UDim2.new(v254.Health / v254.MaxHealth, 0, 1, 0)
					local v256 = Color3.fromRGB(0, 255, 0)

					if v254.Health <= 30 then
						local v257 = Color3.fromRGB(255, 255, 0)
					end

					if v254.Health <= 15 then
						v257 = Color3.fromRGB(255, 0, 0)
					end

					local v258 = _u7:Create(Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					v257 = _u7:Create(_u7, _u8, v258, { Size = v255 })
					local v259 = _u7:Create()
					local v260 = _u7:Create(_u7, _u8, v259, { BackgroundColor3 = v257 })
					v257:Play()
					v260:Play()
					task.delay(0.8, function()
						local v261 = _u0:Create()
						local v262 = _u0:Create(_u0, _u1, v261, { Size = _u2 })
						v262:Play()
					end)
					_u10 = v254.Health
					_u11 = v251
				else
					_u1.Enabled = false
					_u11 = nil
				end

			end
		end

		v221.RenderStepped:Connect(v250)
		local v263 = _u0.Settings:AddToggle("targetstat", { Title = "Target status", Default = true })
		v263:OnChanged(function() _u0 = _u1.targetstat.Value end)
	end)
	local v208 = v57.Skinz["AddSection"]("Mouse Aimbot [v2]")

	function InitializeAimbot2()
		local v264 = game:GetService("RunService")
		local v265 = game:GetService("UserInputService")
		local v266 = game:GetService("Players")

		local function v267()
			local v268 = Vector2.new(_u1.ViewportSize.X / 2, _u1.ViewportSize.Y / 2)
			local v270, v269, v271 = pairs(_u2:GetPlayers())

			while true do

				if v272 ~= _u3 then

					if not v272.Character then
						local v273 = v272.Character:FindFirstChild(_u4)

						if not v273 then
							local v274, v275 = _u1:WorldToViewportPoint(v272.Character[_u4].Position)

							if not v275 then
								local v276 = Vector2.new(v274.X, v274.Y)

								if (v276 - v268).Magnitude < _u0 then
								end

							end

						end

					end

				end

				for v277, v272 in v270, v269, v271 do
				end

				return v272
		end

		local function v278()
			if _u0 then
				do return end
			end

			local v279 = getgenv()

			if v279.state ~= 2 then

				if _u1 == Enum.UserInputType.MouseButton2 then
					v279 = _u2:IsMouseButtonPressed(_u1)

					if v279 then
						_u3 = nil
						do return end
					end

					v279 = _u2:IsKeyDown(_u1)

					if v279 then
						_u3 = nil
						do return end
					end

				end

				if not _u3 then

					if not _u4 then

						if not _u3.Character then
							v279 = _u3.Character:FindFirstChild(_u5)

							if not v279 then
								local v280 = _u6:WorldToViewportPoint(_u3.Character[_u5].Position)
								local v281 = Vector2.new(v280.X, v280.Y)
								local v282 = Vector2.new(_u6.ViewportSize.X / 2, _u6.ViewportSize.Y / 2)
								local v283 = Vector2.new(v282.X + (((v281 - v282).X) / (_u7 + 1)), v282.Y + (((v281 - v282).Y) / (_u7 + 1)))
								local v284 = Vector2.new(_u6.ViewportSize.X / 2, _u6.ViewportSize.Y / 2)
								mousemoverel((v283 - v284).X, (v283 - v284).Y)
								do return end
							end

						end

					end

				end

				v279 = _u8()
				_u3 = v279

				if not _u3 then
					v280 = _u6:WorldToViewportPoint(_u3.Character[_u5].Position)
					v281 = Vector2.new(v280.X, v280.Y)
					v282 = Vector2.new(_u6.ViewportSize.X / 2, _u6.ViewportSize.Y / 2)
					v283 = Vector2.new(v282.X + (((v281 - v282).X) / (_u7 + 1)), v282.Y + (((v281 - v282).Y) / (_u7 + 1)))
					v284 = Vector2.new(_u6.ViewportSize.X / 2, _u6.ViewportSize.Y / 2)
					mousemoverel((v283 - v284).X, (v283 - v284).Y)
				end
		end

		local v285 = Drawing.new("Circle")
		local v286 = Color3.fromRGB(255, 255, 255)
		v285.Color = v286
		v285.Thickness = 1
		v285.Transparency = 1
		v285.Filled = false

		local function v286()
			if not _u0 then
				local v287 = _u1:GetMouseLocation()
				_u2.Radius = _u3
				local v288 = Vector2.new(v287.X, v287.Y)
				_u2.Position = v288
				_u2.Visible = true
			else
				_u2.Visible = false
			end
		end

		local v289, v290, v291 = ipairs({ "ShowFOVCheckbox2", "Show FOV", false, function(a) _u0 = a end })

		while true do
			local v295 = _u0.AimTab:AddToggle(v293[1], { Title = v293[2], Default = v293[3] })
			v295:OnChanged(v293[4])

			for v292, v293 in v289, v290, v291 do
			end

			v289 = _u0.AimTab:AddKeybind({ "SmoothnessCheckbox2", "Smoothness", false, function(a) _u0 = a end }, {
				Title = "Keybind",
				Mode = "Toggle",
				Default = "MouseButton2",
				ChangedCallback = function(a)
				if a == Enum.KeyCode.Unknown then

					if Enum.UserInputType.MouseButton2 then
					else
					end

				end

				_u0 = a
			end,
			})
			v290 = _u0.AimTab:AddDropdown("AimPartDropDown2", {
				Title = "Aim At",
				Values = v295,
				Multi = false,
				Default = 1,
				Callback = function(a) _u0 = a end,
			})
			local v292, v293, v295 = ipairs({ "SmoothnessSlider2", "Smoothness", 5, 0, 20, 1, function(a) _u0 = a end })

			while true do
				_u0.AimTab:AddSlider("PredictionStrengthYSlider2"[1], {
					Title = "PredictionStrengthYSlider2"[2],
					Default = "PredictionStrengthYSlider2"[3],
					Min = "PredictionStrengthYSlider2"[4],
					Max = "PredictionStrengthYSlider2"[5],
					Rounding = "PredictionStrengthYSlider2"[6],
					Callback = "PredictionStrengthYSlider2"[7],
				})

				for v296, v297 in v292, v293, v295 do
				end

				v264.RenderStepped:Connect({ "PredictionStrengthXSlider2", "Prediction Strength X", 0, 0, 1, 2, function(a) _u0 = a end })
				v264.RenderStepped:Connect(v286)
	end

	InitializeAimbot2()

	function InitializeAimbotUI2()
		local v298, v299, v300 = ipairs({ "ShowFOV2", "Show FOV", false, function(a) showFOV2 = a end })

		while true do
			local v304 = _u0.AimTab:AddToggle(v302[1], { Title = v302[2], Default = v302[3] })
			v304:OnChanged(v302[4])

			for v301, v302 in v298, v299, v300 do
			end

			v298 = _u0.AimTab:AddKeybind({ "Smoothness2", "Smoothness", false, function(a) aimbotSmoothnessEnabled2 = a end }, {
				Title = "Keybind",
				Mode = "Toggle",
				Default = "MouseButton2",
				ChangedCallback = function(a)
				if a == Enum.KeyCode.Unknown then

					if Enum.UserInputType.MouseButton2 then
					else
					end

				end

				aimbotKeybind2 = a
			end,
			})
			v299 = _u0.AimTab:AddDropdown("AimAtDropdown2", {
				Title = "Aim focus",
				Values = v304,
				Multi = false,
				Default = 1,
				Callback = function(a) aimbotAimPart2 = a end,
			})
			local v301, v302, v304 = ipairs({ "SmoothnessSlider2", "Smoothness", 5, 0, 10, 1, function(a) aimbotSmoothness2 = a end })

			while true do
				_u0.AimTab:AddSlider(5[1], { Title = 5[2], Default = 5[3], Min = 5[4], Max = 5[5], Rounding = 5[6], Callback = 5[7] })

				for v305, v306 in v301, v302, v304 do
				end
	end

	InitializeAimbotUI2()
	local v307 = game:GetService("UserInputService")
	local v308 = game:GetService("Lighting")
	local v309 = game:GetService("RunService")
	local v310 = game:GetService("Players")
	SilentAim = {
		Enabled = false,
		["HitChance"] = 100,
		["NotWorkIfFlashed"] = true,
		MaxDistance = 250,
		["TargetPart"] = "Head",
	}
	local v311 = Color3.fromRGB(96, 205, 255)
	SilentAimFov = { ["Visible"] = true, ["Radius"] = 150, ["Color"] = v311, ["Circle"] = nil }

	function DrawFov()
		if not SilentAimFov.Circle then
			SilentAimFov.Circle:Remove()
		end

		local v312 = Drawing.new("Circle")
		v312.Color = SilentAimFov.Color
		v312.Thickness = 0.2
		v312.NumSides = 100
		v312.Radius = SilentAimFov.Radius
		v312.Filled = false
		v312.Transparency = 1
		v312.Visible = SilentAimFov.Visible
		SilentAimFov.Circle = v312
	end

	function UpdateFov()
		if not SilentAimFov.Circle then
			SilentAimFov.Circle.Visible = SilentAimFov.Visible
			local v313 = _u0:GetMouseLocation()
			SilentAimFov.Circle.Position = v313
		end
	end

	function GetClosestTargetToMouse()
		local v314 = _u0:GetMouseLocation()
		local v316, v315, v317 = pairs(_u1:GetPlayers())

		while true do

			if v318 ~= _u2 then

				if not v318.Character then
					local v319 = v318.Character:FindFirstChild("HumanoidRootPart")

					if not v319 then
						v319 = v318.Character:FindFirstChild("HumanoidRootPart")

						if not v319 then
							local v320 = v319:FindFirstChild("TeammateLabel")

							if v320 then
								v320 = v318.Character:FindFirstChild(SilentAim.TargetPart)

								if not v320 then

									if (v320.Position - _u3.CurrentCamera.CFrame.Position).Magnitude <= SilentAim.MaxDistance then
										local v321, v322 = _u3.CurrentCamera:WorldToViewportPoint(v320.Position)

										if not v322 then
											local v323 = Vector2.new(v321.X, v321.Y)

											if (v323 - v314).Magnitude < SilentAimFov.Radius then

												if (v323 - v314).Magnitude < math.huge then
												end

											end

										end

									end

								end

							end

						end

					end

				end

			end

			for v324, v318 in v316, v315, v317 do
			end

			local v316, v315, v317 = pairs(_u3:GetChildren())

			while true do
				v319 = v318:IsA("Model")

				if not v319 then
					v319 = v318:FindFirstChild("HumanoidRootPart")

					if not v319 then

						if v318.Name == "Target" then
							v319 = v318:FindFirstChild(SilentAim.TargetPart)

							if v319 then
								v319 = v318:FindFirstChild("HumanoidRootPart")
							end

							if not v319 then

								if (v319.Position - _u3.CurrentCamera.CFrame.Position).Magnitude <= SilentAim.MaxDistance then
									local v325, v321 = _u3.CurrentCamera:WorldToViewportPoint(v319.Position)

									if not v321 then
										v322 = Vector2.new(v325.X, v325.Y)

										if (v322 - v314).Magnitude < SilentAimFov.Radius then

											if (v322 - v314).Magnitude < (v323 - v314).Magnitude then
											end

										end

									end

								end

							end

						end

					end

				end

				for v324, v318 in v316, v315, v317 do
				end

				return v319
	end

	function LookAt(a)
		local v326 = CFrame.lookAt(_u0.CurrentCamera.CFrame.Position, a.Position)
		_u0.CurrentCamera.CFrame = v326
	end

	function SilentAimUIS(a, b)
		if b then

			if not SilentAim.Enabled then
				local v327 = getgenv()

				if v327.state == 2 then

					if a.UserInputType == Enum.UserInputType.MouseButton1 then
						v327 = math.random(0, 100)

						if v327 <= SilentAim.HitChance then
							local v328 = GetClosestTargetToMouse()

							if v328 ~= nil then

								if not SilentAim.NotWorkIfFlashed then
									local v329 = _u0:FindFirstChild("Flashbang")

									if not v329 then
										do return end
									end

								end

								LookAt(v328)
							end

						end

					end

				end

			end

		end
	end

	v309["RenderStepped"]:Connect(function() UpdateFov() end)
	v307["InputBegan"]:Connect(SilentAimUIS)
	DrawFov()
	v57.Silent:AddParagraph({
		Title = "Please get 8bit client for better experince.",
		Content = " ● Currently Safe to use\n ● If not use 8bit autoclicker client then do taptap to connect.",
	})
	local v330 = v57.Silent["AddToggle"]("SAimtgl", {
		Title = "Silent Aim [V1] [Safe]",
		["Description"] = "       Spam click to make it work\n       This is safe to use",
		["Default"] = false,
	})
	local v331 = v57.Silent["AddToggle"]("Fovtgl", { Title = "Show FOV", ["Default"] = false })
	v330["OnChanged"](function()
		if not textLabels then

			if not textLabels.silentaim then
				textLabels.silentaim.Visible = _u0.SAimtgl.Value
			end

		end

		SilentAim.Enabled = _u1.Value
	end)
	v331["OnChanged"](function() SilentAimFov.Visible = _u0.Value end)
	v311 = v57.Silent["AddSlider"]("SFovSlider", {
		Title = "Silent Fov Radius",
		["Description"] = "Adjust the FOV Radius",
		["Default"] = 150,
		["Min"] = 50,
		["Max"] = 900,
		["Rounding"] = 0,
		["Callback"] = function(a)
		SilentAimFov.Radius = a

		if not SilentAimFov.Circle then
			SilentAimFov.Circle.Radius = a
		end
	end,
	})
	local v332 = v57.Silent["AddColorpicker"](205, 255)
	local v333 = v57.Silent["AddColorpicker"](v57.Silent, "SFovColorpicker", { Title = "Fov Color", ["Default"] = v332 })
	v333["OnChanged"](function(a)
		SilentAimFov.Color = a

		if not SilentAimFov.Circle then
			SilentAimFov.Circle.Color = a
		end
	end)
	local v335 = v57.Silent["AddDropdown"]("TargetpartDropdown", {
		Title = "Target Dropdown",
		["Description"] = "What will be targeted?",
		["Values"] = v334,
		["Multi"] = false,
		["Default"] = 1,
	})
	v335["OnChanged"](function(a)
		if a == "Legit" then
			local v336 = math.random(1, 2)

			if v336 == 1 then

				if "Head" then
				else
				end

			end

			SilentAim.TargetPart = "UpperTorso"
		else
			SilentAim.TargetPart = a
		end
	end)

	function a4()
		local v337 = _u0.Gunmod:AddSection("Custom Hit Sound")
		local v338 = _u0.Gunmod:AddSection("HeadShot Sound")
		local v340, v341, v342 = pairs(v339)

		while true do
			table.insert(v343, v344)

			for v344, v345 in v340, v341, v342 do
			end

			function(a, b, c, d, e)
				local v346 = _u0.Gunmod:AddDropdown(b, { Title = "Choose Hit Sound", Values = _u1, Multi = false, Default = 1 })
				v346:OnChanged(function(a)
					if _u1[a] then
					end

					_u0[1] = _u0[1]
				end)
				local v347 = _u0.Gunmod:AddToggle(a, { Title = e, Default = false })
				v347:OnChanged(function(a)
					if not _u0 then
						_u0:Disconnect()
					end

					if not a then
						local v348 = game:GetService("Players")
						local v349 = v348.LocalPlayer:WaitForChild("PlayerScripts")
						v349 = v349:WaitForChild("Modules")
						v349 = v349:WaitForChild("ClientReplicatedClasses")
						v349 = v349:WaitForChild("ClientFighter")
						v349 = v349:WaitForChild("ClientItem")
						v349 = v349:WaitForChild("ClientViewModel")

						local function v350(a)
							local v351 = a:IsA("Sound")

							if not v351 then

								if a.SoundId == _u0 then
									a:Stop()
									v351 = Instance.new("Sound", a.Parent)
									v351.SoundId = _u1[1]
									v351:Play()
									v351.Ended:Wait()
									v351:Destroy()
								end

							end
						end

						local v352 = v349.ChildAdded:Connect(v349)
						_u0 = v352
						local v352, v353, v354 = pairs(v349:GetChildren())

						while true do
							v349(v355)

							for v356, v355 in v352, v353, v354 do
							end

						end
				end)
			end("CSP1", "SoundSelector1", "rbxassetid://16537337310", { "rbxassetid://9119561046" }, "Headshot sound")
			v341 = _u0.Gunmod:AddSection("Bodyshot Sound")
			function(a, b, c, d, e)
				local v346 = _u0.Gunmod:AddDropdown(b, { Title = "Choose Hit Sound", Values = _u1, Multi = false, Default = 1 })
				v346:OnChanged(function(a)
					if _u1[a] then
					end

					_u0[1] = _u0[1]
				end)
				local v347 = _u0.Gunmod:AddToggle(a, { Title = e, Default = false })
				v347:OnChanged(function(a)
					if not _u0 then
						_u0:Disconnect()
					end

					if not a then
						local v348 = game:GetService("Players")
						local v349 = v348.LocalPlayer:WaitForChild("PlayerScripts")
						v349 = v349:WaitForChild("Modules")
						v349 = v349:WaitForChild("ClientReplicatedClasses")
						v349 = v349:WaitForChild("ClientFighter")
						v349 = v349:WaitForChild("ClientItem")
						v349 = v349:WaitForChild("ClientViewModel")

						local function v350(a)
							local v351 = a:IsA("Sound")

							if not v351 then

								if a.SoundId == _u0 then
									a:Stop()
									v351 = Instance.new("Sound", a.Parent)
									v351.SoundId = _u1[1]
									v351:Play()
									v351.Ended:Wait()
									v351:Destroy()
								end

							end
						end

						local v352 = v349.ChildAdded:Connect(v349)
						_u0 = v352
						local v352, v353, v354 = pairs(v349:GetChildren())

						while true do
							v349(v355)

							for v356, v355 in v352, v353, v354 do
							end

						end
				end)
			end("CSP2", "SoundSelector2", "rbxassetid://13110130082", { "rbxassetid://8726881116" }, "Bodyshot sound")
			v344 = Color3.fromRGB(255, 255, 255)
			local v357 = game:GetService("Players")
			local v358 = v357.LocalPlayer:GetMouse()

			local function v359(a, b)
				if _u0.aLqz then
					do return end
				end

				task.spawn(function()
					local v360 = Instance.new("Part")
					v360.Name = "BulletTracerPart"
					v360.CanCollide = false
					v360.Anchored = true
					v360.Transparency = 1
					v360.Parent = workspace
					local v361 = Instance.new("Attachment", v360)
					v361.Position = _u0.Position
					local v362 = Instance.new("Attachment", v360)
					v362.Position = _u1
					local v363 = Instance.new("Beam", v360)
					v363.Attachment0 = v361
					v363.Attachment1 = v362
					v363.TextureSpeed = 2
					local v364 = ColorSequence.new(_u2.eJdF)
					v363.Color = v364
					v363.Width0 = _u2.pJwT
					v363.Width1 = _u2.pJwT
					v363.Texture = _u3[_u4]
					wait(_u2.rQdT)
					v360:Destroy()
				end)
			end

			local function v365(a)
				if not a then
					local v366 = a:IsA("Sound")

					if not v366 then
						local v366, v367, v368 = ipairs(_u0)

						while true do

							if a.SoundId == v369 then

								if not _u1.Character then
									local v370 = _u1.Character:FindFirstChild("HumanoidRootPart")
								end

								if not v370 then
									_u2(v370, _u3.Hit.Position)
									break
								else

									for v371, v369 in v366, v367, v368 do
									end

								end

							end

						end

					end
			end

			local v372 = _u0.Gunmod:AddSection("Bullet Trails")
			local v373 = _u0.Gunmod:AddToggle("btrc", { Title = "Bullet Tracer", Default = false })
			v373:OnChanged(function() _u0.aLqz = _u1.Value end)
			local v375 = _u0.Gunmod:AddDropdown("BTDropdown", { Title = "Style Dropdown", Values = v374, Multi = false, Default = 4 })
			v375:OnChanged(function(a) _u0 = a end)
			local v376 = _u0.Gunmod:AddSlider("BTL", { Title = "BulletTracerLifetime", Default = 1.5, Min = 0, Max = 20, Rounding = 0.1 })
			v376:OnChanged(function(a) _u0.rQdT = a end)
			local v377 = _u0.Gunmod:AddSlider("BTT", { Title = "BulletTracerThickness", Default = 2, Min = 0, Max = 20, Rounding = 0.1 })
			v377:OnChanged(function(a) _u0.pJwT = a end)
			local v378 = _u0.Gunmod:AddColorpicker(255, 255)
			local v379 = _u0.Gunmod:AddColorpicker(_u0.Gunmod, "BTCol", { Title = "BulletTracerColor", Default = v378 })
			v379:OnChanged(function(a) _u0.eJdF = a end)
			local v374 = game:GetService("Players")
			v357[v374.LocalPlayer.Name].PlayerScripts.Modules.ClientReplicatedClasses.ClientFighter.ClientItem.ChildAdded:Connect(function(a)
				if a.Name == "Sound" then
					_u0(a)
				end
			end)
	end

	a4()
	local v380 = game:GetService("RunService")

	local function v381()
		local v382 = Drawing.new("Line")
		v382.Thickness = 2
		v382.Transparency = 1
		v382.Visible = false
		return v382
	end

	local function v383(a)
		if not a then
			local v384 = a:FindFirstChild("HumanoidRootPart")

			if not v384 then
				local v385 = RaycastParams.new()
				v385.FilterType = Enum.RaycastFilterType.Blacklist
				v385.FilterDescendantsInstances = v386
				local v386 = _u2:Raycast(_u0.CFrame.Position, a.HumanoidRootPart.Position - _u0.CFrame.Position, v385)

				if v386 ~= nil then
					local v387 = v386.Instance:IsDescendantOf(a)
					do return false end
				end

			end

			return false
	end

	local function v388(a)
		if not a then
			local v389 = a:FindFirstChild("Humanoid")

			if not v389 then

				if 0 >= a.Humanoid.Health then
					do return false end
				end

			end

			return false
	end

	local function v390(a)
		if not a.Character then
			local v391 = a.Character:FindFirstChild("HumanoidRootPart")

			if not v391 then
				local v392 = a.Character.HumanoidRootPart:FindFirstChild("TeammateLabel")

				if v392 == nil then
					do return false end
				end

			end

			return false
	end

	local function v393()
		if not _u0 then
			local v394 = getgenv()

			if v394.state == 2 then

				if not _u1 then

					if not _u1.Character then
						v394 = _u1.Character:FindFirstChild("HumanoidRootPart")

						if not v394 then

							if not _u2.Character then
								local v395 = _u2.Character:FindFirstChild("HumanoidRootPart")

								if not v395 then
									local v396 = CFrame.new(0, 0, -2)
									_u1.Character.HumanoidRootPart.CFrame = _u2.Character.HumanoidRootPart.CFrame * v396
								end

							end

						end

					end

				end

			end

		end
	end

	local function v397(a, b)
		if not b then
			local v398 = b:FindFirstChild("HumanoidRootPart")

			if not v398 then
				v398 = _u0:WorldToViewportPoint(b.HumanoidRootPart.Position)

				if 0 < v398.Z then
					local v399 = Vector2.new(_u0.ViewportSize.X / 2, _u0.ViewportSize.Y)
					local v400 = Vector2.new(v398.X, v398.Y)
					local v401 = _u1(b)

					if not v401 then
						local v402 = Color3.new(1, 0, 0)

						if v402 then
						else
							v402 = Color3.new(0, 0, 1)
						end

					end

					a.Color = v402
					a.From = v399
					a.To = v400

					if not _u2 then

						if true then
						else
						end

					end

					a.Visible = false
				else
					a.Visible = false
				else
				else
					a.Visible = false
				end

			end

		end
	end

	local v412 = v381()
	v380["RenderStepped"]:Connect(function()
		local v413 = _u0()

		if not _u1 then
			_u2(_u3, _u1.Character)

			if not _u4 then

				if not _u5 then
					_u6()
				else

					if not v413 then

						if not v413.Character then
							_u2(_u3, v413.Character)
						else
						else
							_u3.Visible = false
						end

					end

				end

			end

		end
	end)
	v307["InputBegan"]:Connect(function(a, b)
		if not b then
			do return end
		end

		if a.UserInputType == Enum.UserInputType.MouseButton1 then
			local v414 = _u0()

			if not v414 then
				local v415 = _u1(v414.Character)

				if not v415 then

					if not _u2 then
						_u3 = true
						_u4 = v414
					else
						_u4 = v414
						_u5()
						_u4 = nil
					end

				end

			end

		end
	end)
	v307["InputEnded"]:Connect(function(a)
		if a.UserInputType == Enum.UserInputType.MouseButton1 then

			if not _u0 then
				_u1 = false
				_u2 = nil
			end

		end
	end)
	local v416 = v57.Nono["AddToggle"]("kde", {
		Title = "Melee damage timeout",
		["Description"] = "Will increase meele damge times, so u can hit more damage with it.",
		["Default"] = false,
	})
	v416["OnChanged"](function() end)
	local v417 = v57.Nono["AddToggle"]("wallbang", { Title = "Wallbang", ["Description"] = "Shoot through walls.", ["Default"] = false })
	v417["OnChanged"](function(a)
		if not a then
			_u0:Notify({
				Title = "Notification",
				Content = "Not for you to use!",
				SubContent = "Only for certain users.",
				Duration = 5,
			})
			wait(1)
			_u1.wallbang:SetValue(false)
		end
	end)
	local v418 = v57.Nono["AddToggle"]("Dp", {
		Title = "Player Drag",
		["Description"] = "Use this if youre facing cheaters, hold Left Mouse button, it will drag player to you if player is visible.",
		["Default"] = false,
	})
	v418["OnChanged"](function()
		if not textLabels then

			if not textLabels.tline then
				textLabels.dpaint.Visible = _u0.Dp.Value
			end

		end

		_u1 = _u0.Dp.Value
		_u2 = _u0.Dp.Value
	end)
	local v419 = v57.Nono["AddSection"]("Speed")
	speedsect = v419
	v419 = game:GetService("Players")
	local v420 = game:GetService("RunService")
	local v421 = getgenv()
	v421["Multiplier"] = 0.2

	local function v422()
		local v426 = _u1.Stepped:Connect(function()
			if not _u0.Character then
				local v423 = _u0.Character:FindFirstChild("HumanoidRootPart")
			end

			if not _u0.Character then
				local v424 = _u0.Character:FindFirstChild("Humanoid")
			end

			if not v423 then

				if not v424 then

					if 0 < v424.MoveDirection.Magnitude then
						local v425 = getgenv()
						v423.CFrame = v423.CFrame + v424.MoveDirection * v425.Multiplier
					end

				end

			end
		end)
		_u0 = v426
	end

	local function v427()
		if not _u0 then
			_u0:Disconnect()
			_u0 = nil
		end
	end

	local v428 = v57.Nono["AddToggle"]("SpeedBoost", { Title = "CFrame Speed v2", ["Default"] = false })
	v428["OnChanged"](function()
		if not textLabels then

			if not textLabels.bspeed then
				textLabels.bspeed.Visible = _u0.Value
			end

		end

		_u1 = _u0.Value

		if not _u1 then
			_u2()
		else
			_u3()
		end
	end)
	local v430 = v57.Nono["AddSlider"]("MultiplierSlider", {
		Title = "Speed Limit",
		["Description"] = "Adjust speed multiplier (1 = 0.1, 5 = 0.5, etc.)",
		["Default"] = 2,
		["Min"] = 0,
		["Max"] = 10,
		["Rounding"] = 1,
		["Callback"] = function(a)
		local v429 = getgenv()
		v429.Multiplier = a / 10
	end,
	})
	v430["OnChanged"](function(a)
		local v431 = getgenv()
		v431.Multiplier = a / 10
	end)
	local v432 = v57.Nono["AddSection"]("Gun Mods [Level 8 executor needed]")

	local function v433(a, b)
		local v435, v434, v436 = pairs(getgc(true))

		while true do
			local v438 = type(v437)

			if v438 == "table" then
				v438 = rawget(v437, a)

				if not v438 then
					v437[a] = b
				end

			end

			for v439, v437 in v435, v434, v436 do
			end
	end

	if not v57 then

		if not v57.Nono then
			v57.Nono["AddButton"]({
				Title = "Rapid Fire",
				["Description"] = "Fire Rapidly, but wont work in xeno or solara.",
				["Callback"] = function() _u0("ShootCooldown", 0) end,
			})
			v57.Nono["AddButton"]({
				Title = "No Spread",
				["Description"] = "Bullet Will not spray, but wont work in xeno or solara.",
				["Callback"] = function() _u0("ShootSpread", 0) end,
			})
			v57.Nono["AddButton"]({
				Title = "NO Recoil",
				["Description"] = "Stops the recoil, but wont work in xeno or solara. Ive mead another no recoil use that.",
				["Callback"] = function() _u0("ShootRecoil", 0) end,
			})
		end

	end

	local v440 = game:GetService("RunService")
	v440 = game:GetService("Workspace")
	v440 = game:GetService("Players")
	speed = 150
	defaultOffsetBehind = 7
	defaultOffsetAbove = 5
	isMoving = false
	moveConnection = nil
	tweenDistanceBehind = defaultOffsetBehind
	tweenDistanceAbove = defaultOffsetAbove
	keybindKey = Enum.KeyCode["N"]
	isKeyPressed = false
	v440 = v57.Nono["AddSection"]("Enemy Slider")
	eww = v440
	v440 = v57.Nono["AddToggle"]("SlideEnm", { Title = "Slide to enemy", ["Description"] = "Slides to players behind.", ["Default"] = false })
	v440["OnChanged"](function() end)
	v440 = v57.Nono["AddKeybind"]("Keybind", {
		Title = "KeyBind",
		["Mode"] = "Toggle",
		["Default"] = "N",
		["Callback"] = function(a) isKeyPressed = a end,
		["ChangedCallback"] = function(a) keybindKey = a end,
	})
	Keybind = v440

	function getClosestPlayerToScreenCenter()
		local v441 = Vector2.new(_u0.ViewportSize.X / 2, _u0.ViewportSize.Y / 2)

		if not _u1.Character then
			local v442 = _u1.Character:FindFirstChild("HumanoidRootPart")
		end

		if v442 then
			do return nil end
		end

		local v444, v443, v445 = ipairs(_u2:GetPlayers())

		while true do

			if v446 ~= _u1 then

				if not v446.Character then
					local v447 = v446.Character:FindFirstChild("HumanoidRootPart")

					if not v447 then

						if (v446.Character.HumanoidRootPart.Position - v442.Position).Magnitude <= 350 then
							local v448, v449 = _u0:WorldToViewportPoint(v446.Character.HumanoidRootPart.Position)

							if not v449 then
								local v450 = Vector2.new(v448.X, v448.Y)

								if (v450 - v441).Magnitude < math.huge then
								end

							end

						end

					end

				end

			end

			for v451, v446 in v444, v443, v445 do
			end

			if not v446 then
				_u3:Notify({
					Title = "Slide Notification",
					Content = "Teleporting to: " .. v446.Name,
					SubContent = "Closest player identified",
					Duration = 2,
				})
			else
				_u3:Notify({
					Title = "Slide Notification",
					Content = "No valid player found to teleport to.",
					SubContent = "Please try again later.",
					Duration = 2,
				})
			end

			return v446
	end

	function moveToBackAbovePlayer(a)
		local v455 = _u1.RenderStepped:Connect(function()
			if not isMoving then
				local v452 = Vector3.new(0, tweenDistanceAbove, 0)

				if 0 < (_u0.Position - _u0.CFrame.LookVector * tweenDistanceBehind + v452 - _u1.Position).magnitude then
					local v453 = _u2.Heartbeat:Wait()
					_u1.CFrame = _u1.CFrame + ((((_u0.Position - _u0.CFrame.LookVector * tweenDistanceBehind + v452 - _u1.Position).unit) * speed) * v453)
				else
					local v454 = CFrame.new(_u0.Position - _u0.CFrame.LookVector * tweenDistanceBehind + v452)
					_u1.CFrame = v454
				end

			end
		end)
		moveConnection = v455
	end

	function stopMoving()
		if not moveConnection then
			moveConnection:Disconnect()
		end

		isMoving = false
	end

	v307["InputBegan"]:Connect(function(a, b)
		if b then

			if not _u0.Value then

				if a.KeyCode == keybindKey then

					if isMoving then
						local v456 = getClosestPlayerToScreenCenter()

						if not v456 then
							isMoving = true
							moveToBackAbovePlayer(v456)
						end

					end

				end

			end

			if a.KeyCode == Enum.KeyCode.Up then
				tweenDistanceBehind = tweenDistanceBehind + 1
			else

				if a.KeyCode == Enum.KeyCode.Down then
					v456 = math.max(tweenDistanceBehind - 1, 1)
					tweenDistanceBehind = v456
				else

					if a.KeyCode == Enum.KeyCode.Right then
						tweenDistanceAbove = tweenDistanceAbove + 1
					else

						if a.KeyCode == Enum.KeyCode.Left then
							v456 = math.max(tweenDistanceAbove - 1, 1)
							tweenDistanceAbove = v456
						end

					end

				end

			end

		end
	end)
	v307["InputEnded"]:Connect(function(a)
		if a.KeyCode == keybindKey then
			stopMoving()
		end
	end)
	v440 = game:GetService("Players")
	local v457 = v440.LocalPlayer["PlayerScripts"]["Assets"]["WaitForChild"]("Misc")
	local v458 = v457["WaitForChild"]("MuzzleFlashes")
	local v459 = v458["FindFirstChild"]("Default")

	if not v459 then
		local v460 = v459["Clone"]()
		v460["Name"] = "Muzzle Flash Original"
		v460["Parent"] = v458
	end

	v460 = v57.Skinz["AddDropdown"]("MuzzleFlashDropdown", { Title = "Fire Effect [Bullet]", ["Values"] = v461, ["Multi"] = false, ["Default"] = 1 })
	v460["OnChanged"](function(a)
		local v462 = _u0:FindFirstChild("Default")

		if v462 then
			v462 = _u0:FindFirstChild("Muzzle Flash Original")
		end

		if not v462 then
			v462:Destroy()
		end

		if a ~= "None" then
			local v463 = _u0:FindFirstChild(a)

			if not v463 then
				local v464 = v463:Clone()
				v464.Parent = _u0
				v464.Name = "Default"
			else
				v463 = _u0:FindFirstChild("Muzzle Flash Original")

				if not v463 then
					v464 = v463:Clone()
					v464.Parent = _u0
					v464.Name = "Default"
				end

			end

		end
	end)
	local v465 = v440.LocalPlayer["PlayerScripts"]["Assets"]["WaitForChild"]("Misc")
	local v466 = v465["WaitForChild"]("BurningEffects")
	local v467 = v465["WaitForChild"]({
		"None",
		"Aqua Burst",
		"Demon Shorty",
		"Demon Uzi",
		"Dynamite Gun",
		"Electro Rifle",
		"Exogun",
		"Singularity",
		"Wondergun",
	})
	local v468 = v466["FindFirstChild"]("Default")

	if not v468 then
		local v461 = v468["Clone"]()
		v461["Name"] = "Burning Effect Original"
		v461["Parent"] = v466
	end

	v461 = v467["FindFirstChild"]("Default")

	if not v461 then
		local v469 = v461["Clone"]()
		v469["Name"] = "Fire Hitbox Original"
		v469["Parent"] = v467
	end

	v469 = v57.Skinz["AddDropdown"]("FireEffectDropdown", { Title = "Moltov Fire ", ["Values"] = v470, ["Multi"] = false, ["Default"] = 1 })
	v469["OnChanged"](function(a)
		local v471 = _u0:FindFirstChild("Default")

		if v471 then
			v471 = _u0:FindFirstChild("Burning Effect Original")
		end

		local v472 = _u1:FindFirstChild("Default")

		if v472 then
			v472 = _u1:FindFirstChild("Fire Hitbox Original")
		end

		if not v471 then
			v471:Destroy()
		end

		if not v472 then
			v472:Destroy()
		end

		if a == "Hexxed Candle" then
			local v473 = _u0:FindFirstChild("Hexxed Candle")
			local v474 = _u1:FindFirstChild("Hexxed Candle")

			if not v473 then
				local v475 = v473:Clone()
				v475.Name = "Default"
				v475.Parent = _u0
			end

			if not v474 then
				v475 = v474:Clone()
				v475.Name = "Default"
				v475.Parent = _u1
			else
				v473 = _u0:FindFirstChild("Burning Effect Original")
				v474 = _u1:FindFirstChild("Fire Hitbox Original")

				if not v473 then
					v475 = v473:Clone()
					v475.Name = "Default"
					v475.Parent = _u0
				end

				if not v474 then
					v475 = v474:Clone()
					v475.Name = "Default"
					v475.Parent = _u1
				end

			end

		end
	end)
	local v476 = v57.Skinz["AddSection"]("Gun Skin")
	local v477 = game:GetService("Players")
	local v478 = v477.LocalPlayer["PlayerScripts"]["Assets"]["WaitForChild"]("ViewModels")
	local v470 = v477.LocalPlayer["PlayerScripts"]["Assets"]["WaitForChild"]("Throwables")

	local function v479(a, b, c)
		if not a then
			local v480 = a:Clone()
			v480.Name = c
			v480.Parent = b
		end
	end

	local function v481(a, b)
		local v482 = b:FindFirstChild(a)

		if not v482 then
			do return v482 end
		end

		if b == _u0 then
			local v483, v484, v485 = ipairs(_u1)

			while true do
				local v487 = _u0:FindFirstChild(v486)

				if not v487 then
					local v488 = v487:FindFirstChild(a)

					if not v488 then
						do return v488 end
					end

				end

				for v489, v486 in v483, v484, v485 do
				end

			end

			return nil
	end

	local function v490(a, b, c, d)
		local v491 = c:FindFirstChild(a)

		if not v491 then
			v491:Destroy()
		end

		if b == "None" then

			if d then
			else
			end

		end

		local v492 = _u0(b, c)

		if not v492 then
			local v493 = v492:Clone()
			v493.Name = a
			v493.Parent = c
		end
	end

	local function v494(a, b, c, d)
		local v495 = _u0.Skinz:AddDropdown(a .. "Dropdown", { Title = b, Values = c, Multi = false, Default = 1 })
		v495:OnChanged(function(a) _u0(_u1, a, _u2, _u1 .. " Original") end)
	end

	local v512, v513, v514 = ipairs({ "Energy Rifle", "Energy Rifle Original", v497 })

	while true do
		local v498 = v478["FindFirstChild"]({ "Fists", "Fists Original", v503 })

		if not v498 then
			"Festive Skin Case"(v498, { "Revolver", "Revolver Original", v504 }, { "Knife", "Knife Original", v505 })
			"Skin Case 2"(v497[1], v497[1], v497[3], { "Bow", "Bow Original", v506 })
		end

		for v496, v497 in v512, v513, v514 do
		end

		v513 = v478["FindFirstChild"]({ "Freeze Ray", "Freeze Ray Original", v499 })
		"Festive Skin Case"(v513, { "Battle Axe", "Battle Axe Original", v498 }, "Grenade Original")
		v513 = v470["FindFirstChild"]("Grenade")
		"Festive Skin Case"(v513, v470, "Grenade Original")
		v513 = v478["FindFirstChild"]("Molotov")
		"Festive Skin Case"(v513, v478, "Molotov Original")
		v513 = v470["FindFirstChild"]("Molotov")
		"Festive Skin Case"(v513, v470, "Molotov Original")
		"Skin Case 2"("Grenade", "Grenade", { "None", "Whoopee Cushion", "Water Balloon", "Soul Grenade" }, { "War Horn", "War Horn Original", v500 })
		"Skin Case 2"("Molotov", "Molotov", { "None", "Coffee", "Hexxed Candle", "Torch" }, v478)
		v513 = v478["FindFirstChild"]("Scythe")
		"Festive Skin Case"(v513, v478, "Scythe Original")
		v513 = v470["FindFirstChild"]("Scythe")
		"Festive Skin Case"(v513, v470, "Scythe Original")
		v512 = v57.Skinz["AddDropdown"]("ScytheDropdown", { Title = "Scythe", ["Values"] = v498, ["Multi"] = false, ["Default"] = 1 })
		v512["OnChanged"](function(a)
			_u0("Scythe", a, _u1, "Scythe Original")
			_u0("Scythe", a, _u2, "Scythe Original")
		end)
		v513 = v477.LocalPlayer["PlayerScripts"]["Assets"]["WaitForChild"]("Throwables")

		local function v496(a, b, c)
			if not a then
				local v516 = a:Clone()
				v516.Name = c
				v516.Parent = b
			end
		end

		local v499 = v478["FindFirstChild"]("Smoke Grenade")
		"SmokeClouds"({ "Riot Shield", "Riot Shield Original", v502 }, v478, "Smoke Grenade Original")
		v499 = v513["FindFirstChild"]("Smoke Grenade")
		"SmokeClouds"(v499, v513, "Smoke Grenade Original")
		v499 = v477.LocalPlayer["PlayerScripts"]["Assets"]["Misc"]["SmokeClouds"]["FindFirstChild"]("Default")
		"SmokeClouds"(v499, v477.LocalPlayer["PlayerScripts"]["Assets"]["Misc"]["SmokeClouds"], "Smoke Grenade Original")
		v498 = v57.Skinz["AddDropdown"]("SmokeGrenadeDropdown", { Title = "Smoke Grenade ", ["Values"] = v503, ["Multi"] = false, ["Default"] = 3 })
		v498["OnChanged"](function(a)
			_u0(_u1, "Smoke Grenade")
			_u0(_u1, "Smoke Grenade Original")
			_u0(_u2, "Smoke Grenade")
			_u0(_u2, "Smoke Grenade Original")
			_u0(_u3, "Default")
			_u0(_u3, "Smoke Grenade Original")

			if a == "None" then

				if "Smoke Grenade Original" then
				else
				end

			end

			local v518 = _u1:FindFirstChild(a)
			_u4(v518, _u1, "Smoke Grenade")
			v518 = _u2:FindFirstChild(a)
			_u4(v518, _u2, "Smoke Grenade")
			v518 = _u3:FindFirstChild(a)
			_u4(v518, _u3, "Default")
		end)

		function InitializeAimbotSystem3()
			local v519 = game:GetService("Workspace")
			local v520 = game:GetService("UserInputService")
			local v521 = game:GetService("Lighting")
			local v522 = game:GetService("Players")
			local v523 = game:GetService("RunService")

			local function v524()
				local v525 = _u0:GetMouseLocation()
				local v527, v526, v528 = pairs(_u1:GetPlayers())

				while true do

					if not v529.Character then
						local v530 = v529.Character:FindFirstChild("HumanoidRootPart")
					end

					if v529 ~= _u2 then

						if not v529.Character then

							if not v530 then
								local v531 = v530:FindFirstChild("TeammateLabel")

								if v531 then
									local v531, v532 = _u3.CurrentCamera:WorldToViewportPoint(v530.Position)

									if not v532 then
										local v533 = Vector2.new(v531.X, v531.Y)

										if (v533 - v525).Magnitude then
										else
										end

									end

									if math.huge < math.huge then
									end

								end

							end

						end

					end

					for v534, v529 in v527, v526, v528 do
					end

					return v529
			end

			local function v535(a)
				if not a.Character then
					local v536 = a.Character:FindFirstChild("Head")
				end

				return v536
			end

			local function v537(a)
				local v538 = CFrame.lookAt(_u0.CurrentCamera.CFrame.Position, a.Position)
				_u0.CurrentCamera.CFrame = v538
			end

			local function v539()
				local v540 = _u1()
				_u0 = v540

				while true do

					if not _u2 then

						if not _u3.Enabled then

							if not _u0 then
								v540 = getgenv()

								if v540.state ~= 2 then
									_u2 = false
									do return end
								end

								v540 = math.random(0, 100)

								if v540 <= _u3.HitChance then

									if not _u3.NotWorkIfFlashed then
										v540 = _u4:FindFirstChild("Flashbang")

										if v540 then
										else
											v540 = _u5(_u0)

											if not v540 then
												_u6(v540)
											end

										end

									end

								end

								_u7.RenderStepped:Wait()
							end

						end

					end

				end
			end

			v520.InputBegan:Connect(function(a, b)
				if b then

					if a.KeyCode ~= _u0 then

						if a.UserInputType == _u0 then
						else
							_u1 = true
							task.spawn(_u2)
						end

					end

				end
			end)
			v520.InputEnded:Connect(function(a)
				if a.KeyCode ~= _u0 then

					if a.UserInputType == _u0 then
					else
						_u2 = nil
						_u1 = false
					end

				end
			end)
			local v541 = _u0.AimTab:AddSection("Camera Aimbot")
			cas = v541
			v541 = _u0.AimTab:AddKeybind("CamAimKeybind3", {
				Title = "Cam lock KeyBind",
				Mode = "Toggle",
				Default = "MouseRight",
				Callback = function(a) end,
				ChangedCallback = function(a) _u0 = a end,
			})
			local v542 = _u0.AimTab:AddToggle("CamToggle3", { Title = "Cam Aimbo", Description = "● No Detection\n● Less Missfire", Default = false })
			v542:OnChanged(function()
				if not textLabels then

					if not textLabels.textLabel3 then
						textLabels.textLabel3.Visible = _u0.CamToggle3.Value
						fadeText(textLabels.textLabel3, _u0.CamToggle3.Value)
						alignTextLabels()
					end

				end

				_u1.Enabled = _u2.Value
			end)
			local v543 = _u0.AimTab:AddToggle("AimMob3", {
				Title = "Mobile Aimbot",
				Description = "For Mobile, also works on computer. Set FOV to 120. (Must)",
				Default = false,
			})
			v543:OnChanged(function()
				local v544 = getgenv()
				v544.MobileAimbot = _u0.Value
			end)
		end

		InitializeAimbotSystem3()
		v499 = v57.AimTab["AddToggle"]("TbotToggle", { Title = "Triggerbot", ["Description"] = "Auto shoots when enemy on point.", ["Default"] = false })
		local v500 = game:GetService("Players")
		v499["OnChanged"](function() _u0 = _u1.TbotToggle.Value end)

		local function v503()
			local v545 = RaycastParams.new()
			v545.FilterDescendantsInstances = v546
			v545.FilterType = Enum.RaycastFilterType.Blacklist
			local v547 = workspace:Raycast(_u0.CFrame.Position, _u0.CFrame.LookVector * 1000, v545)

			if not v547 then
				local v546 = v547.Instance:FindFirstAncestorOfClass("Model")
			end

			if not v546 then
				local v548 = v546:FindFirstChild("Humanoid")

				if not v548 then

					if v546.Name == _u1.Name then
					end

				end

				return false
		end

		v440["RenderStepped"]:Connect(function()
			if not _u0 then
				local v549 = getgenv()

				if v549.state == 2 then
					v549 = _u1()

					if not v549 then
						mouse1click()
					end

				end

			end
		end)
		local v504 = v57.AimTab["AddSection"]("Mouse Aimbot")
		mas = { "Shorty", "Shorty Original", v507 }

		function InitializeAimbot2()
			local v550 = game:GetService("RunService")
			local v551 = game:GetService("UserInputService")
			local v552 = game:GetService("Players")

			local function v553()
				local v554 = Vector2.new(_u1.ViewportSize.X / 2, _u1.ViewportSize.Y / 2)
				local v556, v555, v557 = pairs(_u2:GetPlayers())

				while true do

					if v558 ~= _u3 then

						if not v558.Character then
							local v559 = v558.Character:FindFirstChild(_u4)

							if not v559 then
								local v560, v561 = _u1:WorldToViewportPoint(v558.Character[_u4].Position)

								if not v561 then
									local v562 = Vector2.new(v560.X, v560.Y)

									if (v562 - v554).Magnitude < _u0 then
									end

								end

							end

						end

					end

					for v563, v558 in v556, v555, v557 do
					end

					return v558
			end

			local function v564()
				if _u0 then
					do return end
				end

				local v565 = getgenv()

				if v565.state ~= 2 then
					do return end
				end

				if _u1 == Enum.UserInputType.MouseButton2 then
					v565 = _u2:IsMouseButtonPressed(_u1)

					if v565 then
						_u3 = nil
						do return end
					end

					v565 = _u2:IsKeyDown(_u1)

					if v565 then
						_u3 = nil
						do return end
					end

				end

				if not _u3 then

					if not _u4 then

						if not _u3.Character then
							v565 = _u3.Character:FindFirstChild(_u5)

							if not v565 then
								local v566 = _u6:WorldToViewportPoint(_u3.Character[_u5].Position)
								local v567 = Vector2.new(v566.X, v566.Y)
								local v568 = Vector2.new(_u6.ViewportSize.X / 2, _u6.ViewportSize.Y / 2)
								local v569 = Vector2.new(v568.X + (((v567 - v568).X) / (_u7 + 1)), v568.Y + (((v567 - v568).Y) / (_u7 + 1)))
								local v570 = Vector2.new(_u6.ViewportSize.X / 2, _u6.ViewportSize.Y / 2)
								mousemoverel((v569 - v570).X, (v569 - v570).Y)
								do return end
							end

						end

					end

				end

				v565 = _u8()
				_u3 = v565

				if not _u3 then
					v566 = _u6:WorldToViewportPoint(_u3.Character[_u5].Position)
					v567 = Vector2.new(v566.X, v566.Y)
					v568 = Vector2.new(_u6.ViewportSize.X / 2, _u6.ViewportSize.Y / 2)
					v569 = Vector2.new(v568.X + (((v567 - v568).X) / (_u7 + 1)), v568.Y + (((v567 - v568).Y) / (_u7 + 1)))
					v570 = Vector2.new(_u6.ViewportSize.X / 2, _u6.ViewportSize.Y / 2)
					mousemoverel((v569 - v570).X, (v569 - v570).Y)
				end
			end

			local v571 = Drawing.new("Circle")
			local v572 = Color3.fromRGB(255, 255, 255)
			v571.Color = v572
			v571.Thickness = 1
			v571.Transparency = 1
			v571.Filled = false

			local function v572()
				if not _u0 then
					local v573 = _u1:GetMouseLocation()
					_u2.Radius = _u3
					local v574 = Vector2.new(v573.X, v573.Y)
					_u2.Position = v574
					_u2.Visible = true
				else
					_u2.Visible = false
				end
			end

			local v575, v576, v577 = ipairs({ "ShowFOVCheckbox2", "Show FOV", false, function(a) _u0 = a end })

			while true do
				local v581 = _u0.AimTab:AddToggle(v579[1], { Title = v579[2], Default = v579[3] })
				v581:OnChanged(v579[4])

				for v578, v579 in v575, v576, v577 do
				end

				v575 = _u0.AimTab:AddKeybind({ "SmoothnessCheckbox2", "Smoothness", false, function(a) _u0 = a end }, {
					Title = "Keybind",
					Mode = "Toggle",
					Default = "MouseButton2",
					ChangedCallback = function(a)
					if a == Enum.KeyCode.Unknown then

						if Enum.UserInputType.MouseButton2 then
						else
						end

					end

					_u0 = a
				end,
				})
				v576 = _u0.AimTab:AddDropdown("AimPartDropDown2", {
					Title = "Aim At",
					Values = v581,
					Multi = false,
					Default = 1,
					Callback = function(a) _u0 = a end,
				})
				local v578, v579, v581 = ipairs({ "SmoothnessSlider2", "Smoothness", 5, 0, 20, 1, function(a) _u0 = a end })

				while true do
					_u0.AimTab:AddSlider("PredictionStrengthYSlider2"[1], {
						Title = "PredictionStrengthYSlider2"[2],
						Default = "PredictionStrengthYSlider2"[3],
						Min = "PredictionStrengthYSlider2"[4],
						Max = "PredictionStrengthYSlider2"[5],
						Rounding = "PredictionStrengthYSlider2"[6],
						Callback = "PredictionStrengthYSlider2"[7],
					})

					for v582, v583 in v578, v579, v581 do
					end

					v550.RenderStepped:Connect({ "PredictionStrengthXSlider2", "Prediction Strength X", 0, 0, 1, 2, function(a) _u0 = a end })
					v550.RenderStepped:Connect(v572)
		end

		InitializeAimbot2()

		function InitializeAimbotUI2()
			local v584, v585, v586 = ipairs({ "ShowFOV2", "Show FOV", false, function(a) showFOV2 = a end })

			while true do
				local v590 = _u0.AimTab:AddToggle(v588[1], { Title = v588[2], Default = v588[3] })
				v590:OnChanged(v588[4])

				for v587, v588 in v584, v585, v586 do
				end

				v584 = _u0.AimTab:AddKeybind({ "Smoothness2", "Smoothness", false, function(a) aimbotSmoothnessEnabled2 = a end }, {
					Title = "Keybind",
					Mode = "Toggle",
					Default = "MouseButton2",
					ChangedCallback = function(a)
					if a == Enum.KeyCode.Unknown then

						if Enum.UserInputType.MouseButton2 then
						else
						end

					end

					aimbotKeybind2 = a
				end,
				})
				v585 = _u0.AimTab:AddDropdown("AimAtDropdown2", {
					Title = "Aim At",
					Values = v590,
					Multi = false,
					Default = 1,
					Callback = function(a) aimbotAimPart2 = a end,
				})
				local v587, v588, v590 = ipairs({ "SmoothnessSlider2", "Smoothness", 5, 0, 10, 1, function(a) aimbotSmoothness2 = a end })

				while true do
					_u0.AimTab:AddSlider(5[1], { Title = 5[2], Default = 5[3], Min = 5[4], Max = 5[5], Rounding = 5[6], Callback = 5[7] })

					for v591, v592 in v587, v588, v590 do
					end
		end

		InitializeAimbotUI2()
		v504 = game:GetService("UserInputService")
		local v505 = game:GetService({ "Shotgun", "Shotgun Original", v510 })
		local v506 = game:GetService({ "Sniper", "Sniper Original", v511 })
		local v507 = game:GetService({ "None", "Nuke Launcher" })
		SilentAim = {
			Enabled = false,
			["HitChance"] = 100,
			["NotWorkIfFlashed"] = true,
			MaxDistance = 250,
			["TargetPart"] = "Head",
		}
		local v511 = Color3.fromRGB(96, 205, 255)
		SilentAimFov = { ["Visible"] = true, ["Radius"] = 150, ["Color"] = v511, ["Circle"] = nil }

		function DrawFov()
			if not SilentAimFov.Circle then
				SilentAimFov.Circle:Remove()
			end

			local v593 = Drawing.new("Circle")
			v593.Color = SilentAimFov.Color
			v593.Thickness = 0.2
			v593.NumSides = 100
			v593.Radius = SilentAimFov.Radius
			v593.Filled = false
			v593.Transparency = 1
			v593.Visible = SilentAimFov.Visible
			SilentAimFov.Circle = v593
		end

		function UpdateFov()
			if not SilentAimFov.Circle then
				SilentAimFov.Circle.Visible = SilentAimFov.Visible
				local v594 = _u0:GetMouseLocation()
				SilentAimFov.Circle.Position = v594
			end
		end

		function GetClosestTargetToMouse()
			local v595 = _u0:GetMouseLocation()
			local v597, v596, v598 = pairs(_u1:GetPlayers())

			while true do

				if v599 ~= _u2 then

					if not v599.Character then
						local v600 = v599.Character:FindFirstChild("HumanoidRootPart")

						if not v600 then
							v600 = v599.Character:FindFirstChild("HumanoidRootPart")

							if not v600 then
								local v601 = v600:FindFirstChild("TeammateLabel")

								if v601 then
									v601 = v599.Character:FindFirstChild(SilentAim.TargetPart)

									if not v601 then

										if (v601.Position - _u3.CurrentCamera.CFrame.Position).Magnitude <= SilentAim.MaxDistance then
											local v602, v603 = _u3.CurrentCamera:WorldToViewportPoint(v601.Position)

											if not v603 then
												local v604 = Vector2.new(v602.X, v602.Y)

												if (v604 - v595).Magnitude < SilentAimFov.Radius then

													if (v604 - v595).Magnitude < math.huge then
													end

												end

											end

										end

									end

								end

							end

						end

					end

				end

				for v605, v599 in v597, v596, v598 do
				end

				local v597, v596, v598 = pairs(_u3:GetChildren())

				while true do
					v600 = v599:IsA("Model")

					if not v600 then
						v600 = v599:FindFirstChild("HumanoidRootPart")

						if not v600 then

							if v599.Name == "Target" then
								v600 = v599:FindFirstChild(SilentAim.TargetPart)

								if v600 then
									v600 = v599:FindFirstChild("HumanoidRootPart")
								end

								if not v600 then

									if (v600.Position - _u3.CurrentCamera.CFrame.Position).Magnitude <= SilentAim.MaxDistance then
										local v606, v602 = _u3.CurrentCamera:WorldToViewportPoint(v600.Position)

										if not v602 then
											v603 = Vector2.new(v606.X, v606.Y)

											if (v603 - v595).Magnitude < SilentAimFov.Radius then

												if (v603 - v595).Magnitude < (v604 - v595).Magnitude then
												end

											end

										end

									end

								end

							end

						end

					end

					for v605, v599 in v597, v596, v598 do
					end

					return v600
		end

		function LookAt(a)
			local v607 = CFrame.lookAt(_u0.CurrentCamera.CFrame.Position, a.Position)
			_u0.CurrentCamera.CFrame = v607
		end

		function SilentAimUIS(a, b)
			if b then

				if not SilentAim.Enabled then
					local v608 = getgenv()

					if v608.state == 2 then

						if a.UserInputType == Enum.UserInputType.MouseButton1 then
							v608 = math.random(0, 100)

							if v608 <= SilentAim.HitChance then
								local v609 = GetClosestTargetToMouse()

								if v609 ~= nil then

									if not SilentAim.NotWorkIfFlashed then
										local v610 = _u0:FindFirstChild("Flashbang")

										if not v610 then
											do return end
										end

									end

									LookAt(v609)
								end

							end

						end

					end

				end

			end
		end

		v506["RenderStepped"]:Connect(function() UpdateFov() end)
		v504["InputBegan"]:Connect(SilentAimUIS)
		DrawFov()
		v57.Silent:AddParagraph({
			Title = "Please get 8bit client for better experince.",
			Content = " ● Currently Safe to use\n ● If not use 8bit autoclicker client then do taptap to connect.",
		})
		local v509 = v57.Silent["AddToggle"]("SAimtgl", {
			Title = "Silent Aim [Safe]",
			["Description"] = "Spam click to make it work\nThis is safe to use",
			["Default"] = false,
		})
		local v510 = v57.Silent["AddToggle"]("Fovtgl", { Title = "Show FOV", ["Default"] = false })
		v509["OnChanged"](function()
			if not textLabels then

				if not textLabels.silentaim then
					textLabels.silentaim.Visible = _u0.SAimtgl.Value
					fadeText(textLabels.silentaim, _u0.SAimtgl.Value)
					alignTextLabels()
				end

			end

			SilentAim.Enabled = _u1.Value
		end)
		v510["OnChanged"](function() SilentAimFov.Visible = _u0.Value end)
		v511 = v57.Silent["AddSlider"]("SFovSlider", {
			Title = "Silent Fov Radius",
			["Description"] = "Adjust the FOV Radius",
			["Default"] = 150,
			["Min"] = 50,
			["Max"] = 900,
			["Rounding"] = 0,
			["Callback"] = function(a)
			SilentAimFov.Radius = a

			if not SilentAimFov.Circle then
				SilentAimFov.Circle.Radius = a
			end
		end,
		})
		local v611 = v57.Silent["AddColorpicker"](205, 255)
		local v612 = v57.Silent["AddColorpicker"](v57.Silent, "SFovColorpicker", { Title = "Fov Color", ["Default"] = v611 })
		v612["OnChanged"](function(a)
			SilentAimFov.Color = a

			if not SilentAimFov.Circle then
				SilentAimFov.Circle.Color = a
			end
		end)
		local v614 = v57.Silent["AddDropdown"]("TargetpartDropdown", {
			Title = "Target Dropdown",
			["Description"] = "What will be targeted?",
			["Values"] = v613,
			["Multi"] = false,
			["Default"] = 1,
		})
		v614["OnChanged"](function(a)
			if a == "Legit" then
				local v615 = math.random(1, 2)

				if v615 == 1 then

					if "Head" then
					else
					end

				end

				SilentAim.TargetPart = "UpperTorso"
			else
				SilentAim.TargetPart = a
			end
		end)
		local v616 = game:GetService("RunService")

		local function v617()
			local v618 = Drawing.new("Line")
			v618.Thickness = 2
			v618.Transparency = 1
			v618.Visible = false
			return v618
		end

		local function v619(a)
			if not a then
				local v620 = a:FindFirstChild("HumanoidRootPart")

				if not v620 then
					local v621 = RaycastParams.new()
					v621.FilterType = Enum.RaycastFilterType.Blacklist
					v621.FilterDescendantsInstances = v622
					local v622 = _u2:Raycast(_u0.CFrame.Position, a.HumanoidRootPart.Position - _u0.CFrame.Position, v621)

					if v622 ~= nil then
						local v623 = v622.Instance:IsDescendantOf(a)
						do return false end
					end

				end

				return false
		end

		local function v624(a)
			if not a then
				local v625 = a:FindFirstChild("Humanoid")

				if not v625 then

					if 0 >= a.Humanoid.Health then
						do return false end
					end

				end

				return false
		end

		local function v626(a)
			if not a.Character then
				local v627 = a.Character:FindFirstChild("HumanoidRootPart")

				if not v627 then
					local v628 = a.Character.HumanoidRootPart:FindFirstChild("TeammateLabel")

					if v628 == nil then
						do return false end
					end

				end

				return false
		end

		local function v629()
			if not _u0 then
				local v630 = getgenv()

				if v630.state == 2 then

					if not _u1 then

						if not _u1.Character then
							v630 = _u1.Character:FindFirstChild("HumanoidRootPart")

							if not v630 then

								if not _u2.Character then
									local v631 = _u2.Character:FindFirstChild("HumanoidRootPart")

									if not v631 then
										local v632 = CFrame.new(0, 0, -2)
										_u1.Character.HumanoidRootPart.CFrame = _u2.Character.HumanoidRootPart.CFrame * v632
									end

								end

							end

						end

					end

				end

			end
		end

		local function v633(a, b)
			if not b then
				local v634 = b:FindFirstChild("HumanoidRootPart")

				if not v634 then
					v634 = _u0:WorldToViewportPoint(b.HumanoidRootPart.Position)

					if 0 < v634.Z then
						local v635 = Vector2.new(_u0.ViewportSize.X / 2, _u0.ViewportSize.Y)
						local v636 = Vector2.new(v634.X, v634.Y)
						local v637 = _u1(b)

						if not v637 then
							local v638 = Color3.new(1, 0, 0)

							if v638 then
							else
								v638 = Color3.new(0, 0, 1)
							end

						end

						a.Color = v638
						a.From = v635
						a.To = v636

						if not _u2 then

							if true then
							else
							end

						end

						a.Visible = false
					else
						a.Visible = false
					else
					else
						a.Visible = false
					end

				end

			end
		end

		local v648 = v617()
		v616["RenderStepped"]:Connect(function()
			local v649 = _u0()

			if not _u1 then
				_u2(_u3, _u1.Character)

				if not _u4 then

					if not _u5 then
						_u6()
					else

						if not v649 then

							if not v649.Character then
								_u2(_u3, v649.Character)
							else
							else
								_u3.Visible = false
							end

						end

					end

				end

			end
		end)
		v504["InputBegan"]:Connect(function(a, b)
			if not b then
				do return end
			end

			if a.UserInputType == Enum.UserInputType.MouseButton1 then
				local v650 = _u0()

				if not v650 then
					local v651 = _u1(v650.Character)

					if not v651 then

						if not _u2 then
							_u3 = true
							_u4 = v650
						else
							_u4 = v650
							_u5()
							_u4 = nil
						end

					end

				end

			end
		end)
		v504["InputEnded"]:Connect(function(a)
			if a.UserInputType == Enum.UserInputType.MouseButton1 then

				if not _u0 then
					_u1 = false
					_u2 = nil
				end

			end
		end)
		local v652 = v57.Nono["AddToggle"]("Dp", {
			Title = "Player Drag",
			["Description"] = "Use this if youre facing cheaters, hold Left Mouse button, it will drag player to you if player is visible.",
			["Default"] = false,
		})
		v652["OnChanged"](function()
			if not textLabels then

				if not textLabels.tline then
					textLabels.dpaint.Visible = _u0.Dp.Value
					fadeText(textLabels.dpaint, _u0.Dp.Value)
					alignTextLabels()
				end

			end

			_u1 = _u0.Dp.Value
			_u2 = _u0.Dp.Value
		end)
		local v653 = v57.Nono["AddSection"]("Speed")
		speedsect = v653
		v653 = game:GetService("Players")
		local v654 = game:GetService("RunService")
		local v655 = getgenv()
		v655["Multiplier"] = 0.2

		local function v656()
			local v660 = _u1.Stepped:Connect(function()
				if not _u0.Character then
					local v657 = _u0.Character:FindFirstChild("HumanoidRootPart")
				end

				if not _u0.Character then
					local v658 = _u0.Character:FindFirstChild("Humanoid")
				end

				if not v657 then

					if not v658 then

						if 0 < v658.MoveDirection.Magnitude then
							local v659 = getgenv()
							v657.CFrame = v657.CFrame + v658.MoveDirection * v659.Multiplier
						end

					end

				end
			end)
			_u0 = v660
		end

		local function v661()
			if not _u0 then
				_u0:Disconnect()
				_u0 = nil
			end
		end

		local v662 = v57.Nono["AddToggle"]("SpeedBoost", { Title = "CFrame Speed v2", ["Default"] = false })
		v662["OnChanged"](function()
			if not textLabels then

				if not textLabels.bspeed then
					textLabels.bspeed.Visible = _u0.Value
					fadeText(textLabels.bspeed, _u0.Value)
					alignTextLabels()
				end

			end

			_u1 = _u0.Value

			if not _u1 then
				_u2()
			else
				_u3()
			end
		end)
		local v664 = v57.Nono["AddSlider"]("MultiplierSlider", {
			Title = "Speed Limit",
			["Description"] = "Adjust speed multiplier (1 = 0.1, 5 = 0.5, etc.)",
			["Default"] = 2,
			["Min"] = 0,
			["Max"] = 10,
			["Rounding"] = 1,
			["Callback"] = function(a)
			local v663 = getgenv()
			v663.Multiplier = a / 10
		end,
		})
		v664["OnChanged"](function(a)
			local v665 = getgenv()
			v665.Multiplier = a / 10
		end)

		function jx4n8rqzpvmc2y5kt(a)
			local v666, v667, v668 = ipairs(a)

			while true do

				if v669 == 32 then

					if " " then
					else
						local v670 = string.char(v669)
					end

				end

				for v671, v669 in v666, v667, v668 do
				end

				return "" .. v670
		end

		local v672 = os.time()

		if v672 > 1789051200 then
			wait(3)
			v672 = game:GetService(game)
			v672.LocalPlayer:Kick(v672.LocalPlayer)
			wait(999999999)
		end

		v672 = v57.Nono["AddSection"]("Gun Mods [Level 8 executor needed]")

		local function v673(a, b)
			local v675, v674, v676 = pairs(getgc(true))

			while true do
				local v678 = type(v677)

				if v678 == "table" then
					v678 = rawget(v677, a)

					if not v678 then
						v677[a] = b
					end

				end

				for v679, v677 in v675, v674, v676 do
				end
		end

		if not v57 then

			if not v57.Nono then
				v57.Nono["AddButton"]({
					Title = "Rapid Fire",
					["Description"] = "Fire Rapidly, but wont work in xeno or solara.",
					["Callback"] = function() _u0("ShootCooldown", 0) end,
				})
				v57.Nono["AddButton"]({
					Title = "No Spread",
					["Description"] = "Bullet Will not spray, but wont work in xeno or solara.",
					["Callback"] = function() _u0("ShootSpread", 0) end,
				})
				v57.Nono["AddButton"]({
					Title = "NO Recoil",
					["Description"] = "Stops the recoil, but wont work in xeno or solara. Ive mead another no recoil use that.",
					["Callback"] = function() _u0("ShootRecoil", 0) end,
				})
			end

		end

		local v680 = game:GetService("RunService")
		v680 = game:GetService("Workspace")
		v680 = game:GetService("Players")
		speed = 150
		defaultOffsetBehind = 7
		defaultOffsetAbove = 5
		isMoving = false
		moveConnection = nil
		tweenDistanceBehind = defaultOffsetBehind
		tweenDistanceAbove = defaultOffsetAbove
		keybindKey = Enum.KeyCode["N"]
		isKeyPressed = false
		v680 = v57.Nono["AddSection"]("Enemy Slider")
		eww = v680
		v680 = v57.Nono["AddToggle"]("SlideEnm", { Title = "Slide to enemy", ["Description"] = "Slides to players behind.", ["Default"] = false })
		v680["OnChanged"](function() end)
		v680 = v57.Nono["AddKeybind"]("Keybind", {
			Title = "KeyBind",
			["Mode"] = "Toggle",
			["Default"] = "N",
			["Callback"] = function(a) isKeyPressed = a end,
			["ChangedCallback"] = function(a) keybindKey = a end,
		})
		Keybind = v680

		function getClosestPlayerToScreenCenter()
			local v681 = Vector2.new(_u0.ViewportSize.X / 2, _u0.ViewportSize.Y / 2)

			if not _u1.Character then
				local v682 = _u1.Character:FindFirstChild("HumanoidRootPart")
			end

			if v682 then
				do return nil end
			end

			local v684, v683, v685 = ipairs(_u2:GetPlayers())

			while true do

				if v686 ~= _u1 then

					if not v686.Character then
						local v687 = v686.Character:FindFirstChild("HumanoidRootPart")

						if not v687 then

							if (v686.Character.HumanoidRootPart.Position - v682.Position).Magnitude <= 350 then
								local v688, v689 = _u0:WorldToViewportPoint(v686.Character.HumanoidRootPart.Position)

								if not v689 then
									local v690 = Vector2.new(v688.X, v688.Y)

									if (v690 - v681).Magnitude < math.huge then
									end

								end

							end

						end

					end

				end

				for v691, v686 in v684, v683, v685 do
				end

				if not v686 then
					_u3:Notify({
						Title = "Slide Notification",
						Content = "Teleporting to: " .. v686.Name,
						SubContent = "Closest player identified",
						Duration = 2,
					})
				else
					_u3:Notify({
						Title = "Slide Notification",
						Content = "No valid player found to teleport to.",
						SubContent = "Please try again later.",
						Duration = 2,
					})
				end

				return v686
		end

		function moveToBackAbovePlayer(a)
			local v695 = _u1.RenderStepped:Connect(function()
				if not isMoving then
					local v692 = Vector3.new(0, tweenDistanceAbove, 0)

					if 0 < (_u0.Position - _u0.CFrame.LookVector * tweenDistanceBehind + v692 - _u1.Position).magnitude then
						local v693 = _u2.Heartbeat:Wait()
						_u1.CFrame = _u1.CFrame + ((((_u0.Position - _u0.CFrame.LookVector * tweenDistanceBehind + v692 - _u1.Position).unit) * speed) * v693)
					else
						local v694 = CFrame.new(_u0.Position - _u0.CFrame.LookVector * tweenDistanceBehind + v692)
						_u1.CFrame = v694
					end

				end
			end)
			moveConnection = v695
		end

		function stopMoving()
			if not moveConnection then
				moveConnection:Disconnect()
			end

			isMoving = false
		end

		v504["InputBegan"]:Connect(function(a, b)
			if b then

				if not _u0.Value then

					if a.KeyCode == keybindKey then

						if isMoving then
							local v696 = getClosestPlayerToScreenCenter()

							if not v696 then
								isMoving = true
								moveToBackAbovePlayer(v696)
							end

						end

					end

				end

				if a.KeyCode == Enum.KeyCode.Up then
					tweenDistanceBehind = tweenDistanceBehind + 1
				else

					if a.KeyCode == Enum.KeyCode.Down then
						v696 = math.max(tweenDistanceBehind - 1, 1)
						tweenDistanceBehind = v696
					else

						if a.KeyCode == Enum.KeyCode.Right then
							tweenDistanceAbove = tweenDistanceAbove + 1
						else

							if a.KeyCode == Enum.KeyCode.Left then
								v696 = math.max(tweenDistanceAbove - 1, 1)
								tweenDistanceAbove = v696
							end

						end

					end

				end

			end
		end)
		v504["InputEnded"]:Connect(function(a)
			if a.KeyCode == keybindKey then
				stopMoving()
			end
		end)
		v680 = v57.Spoof["AddDropdown"]("DeviceDropdown", {
			Title = "Spoof Device",
			["Description"] = "Show fake device to others, its server sided, other people will also see that.",
			["Values"] = v697,
			["Multi"] = false,
			["Default"] = 1,
		})
		v680["SetValue"]("None")
		v680["OnChanged"](function(a)
			local v698 = game:GetService("ReplicatedStorage")
			local v699 = v698:WaitForChild("Remotes")
			local v700 = v699:WaitForChild("Replication")
			local v701 = v700:WaitForChild("Fighter")
			local v702 = v701:WaitForChild("SetControls")

			if a == "Computer" then
				v702:FireServer("MouseKeyboard")
			else

				if a == "Mobile" then
					v702:FireServer("Touch")
				else

					if a == "Console" then
						v702:FireServer("Gamepad")
					else

						if a == "VR" then
							v702:FireServer("VR")
						end

					end

				end

			end
		end)
		function()
			local v704, v703, v705 = ipairs(_u0:GetDescendants())

			while true do
				local v707 = v706:IsA("TextLabel")

				if not v707 then

					if v706.Text == "Are you winning son ?" then
						break
					else
					else

						for v708, v706 in v704, v703, v705 do
						end

					end

				end

				if not v706 then

					if not v706.Parent then

						if not v706.Parent.Parent then

							if not v706.Parent.Parent.Parent then
								v704 = Instance.new("ImageLabel")
								v703 = UDim2.new(0, 460, 0, 260)
								v704.Size = v703
								v703 = UDim2.new(0.5, -150, 0, 0)
								v704.Position = v703
								v703 = Vector2.new(0.5, 0)
								v704.AnchorPoint = v703
								v704.Image = "rbxassetid://72599846385794"
								v704.BackgroundTransparency = 1
								v704.Parent = v706.Parent.Parent.Parent
							end

						end

					end

				end
		end()
		local v710, v709, v711 = ipairs(v69:GetDescendants())

		while true do
			local v712 = "None":IsA("ImageLabel")

			if not v712 then

				if "None".Image == "rbxassetid://76783885872706" then
					"None".Image = "rbxassetid://79513443771682"
					v712 = UDim2["new"](0, 72, 0, 20)
					"None".Size = v712

					if not "None"["Parent"] then
						local v713 = UDim2["new"](1, -585, 0, 0)
						"None"["Parent"]["Position"] = v713
						break
					else
					else

						for v697, v714 in v710, v709, v711 do
						end

					end

				end

			end

			v710 = game:GetService("Players")
			v711 = Instance["new"]({ "None", "Computer", "Mobile", "Console", "VR" })
			v714 = game:GetService("CoreGui")
			v711["Parent"] = v714
			v697 = Instance["new"]("Frame")
			v714 = UDim2["new"](0, 120, 0, 77)
			v697.Size = v714
			v712 = UDim2["new"](0, 20, 1, -240)
			v697["Position"] = v712
			v712 = Color3.fromRGB(0, 0, 0)
			v697["BackgroundColor3"] = v712
			v697["BackgroundTransparency"] = 0.4
			v697["BorderSizePixel"] = 2
			v712 = Color3.fromRGB(255, 255, 255)
			v697["BorderColor3"] = v712
			v697["Parent"] = v711
			v697["Visible"] = false
			v714 = Instance["new"]("UICorner")
			local v715 = UDim["new"](0, 5)
			v714["CornerRadius"] = v715
			v714["Parent"] = v697
			v715 = function(a, b, c)
				local v716 = Instance.new("TextLabel")
				local v717 = UDim2.new(1, 0, 0, c)
				v716.Size = v717
				v717 = UDim2.new(0, 10, 0, b)
				v716.Position = v717
				v717 = Color3.fromRGB(255, 255, 255)
				v716.TextColor3 = v717
				v716.TextSize = 23
				v716.Font = Enum.Font.Gotham
				v717 = Font.new("rbxassetid://12187376174")
				v716.FontFace = v717
				v716.TextStrokeTransparency = 1
				v716.TextXAlignment = Enum.TextXAlignment.Left
				v716.BackgroundTransparency = 1
				v716.RichText = true
				v716.Parent = a
				return v716
			end(v697, 5, 13)
			v715["Text"] = '<font size="25"><b>Session Info</b></font>'
			v713 = function(a, b, c)
				local v716 = Instance.new("TextLabel")
				local v717 = UDim2.new(1, 0, 0, c)
				v716.Size = v717
				v717 = UDim2.new(0, 10, 0, b)
				v716.Position = v717
				v717 = Color3.fromRGB(255, 255, 255)
				v716.TextColor3 = v717
				v716.TextSize = 23
				v716.Font = Enum.Font.Gotham
				v717 = Font.new("rbxassetid://12187376174")
				v716.FontFace = v717
				v716.TextStrokeTransparency = 1
				v716.TextXAlignment = Enum.TextXAlignment.Left
				v716.BackgroundTransparency = 1
				v716.RichText = true
				v716.Parent = a
				return v716
			end(v697, 25, 14)
			local v718 = function(a, b, c)
				local v716 = Instance.new("TextLabel")
				local v717 = UDim2.new(1, 0, 0, c)
				v716.Size = v717
				v717 = UDim2.new(0, 10, 0, b)
				v716.Position = v717
				v717 = Color3.fromRGB(255, 255, 255)
				v716.TextColor3 = v717
				v716.TextSize = 23
				v716.Font = Enum.Font.Gotham
				v717 = Font.new("rbxassetid://12187376174")
				v716.FontFace = v717
				v716.TextStrokeTransparency = 1
				v716.TextXAlignment = Enum.TextXAlignment.Left
				v716.BackgroundTransparency = 1
				v716.RichText = true
				v716.Parent = a
				return v716
			end(v697, 40, 14)
			local v719 = function(a, b, c)
				local v716 = Instance.new("TextLabel")
				local v717 = UDim2.new(1, 0, 0, c)
				v716.Size = v717
				v717 = UDim2.new(0, 10, 0, b)
				v716.Position = v717
				v717 = Color3.fromRGB(255, 255, 255)
				v716.TextColor3 = v717
				v716.TextSize = 23
				v716.Font = Enum.Font.Gotham
				v717 = Font.new("rbxassetid://12187376174")
				v716.FontFace = v717
				v716.TextStrokeTransparency = 1
				v716.TextXAlignment = Enum.TextXAlignment.Left
				v716.BackgroundTransparency = 1
				v716.RichText = true
				v716.Parent = a
				return v716
			end(v697, 55, 14)

			local function v720()
				if not isfile then
					local v721 = isfile(_u0)

					if not v721 then
						v721 = readfile(_u0)
						local v722 = game:GetService("HttpService")
						v722 = v722:JSONDecode(v721)

						if v722.Kills then
						end

						_u1 = 0

						if v722.Assists then
						end

						_u2 = 0

						if v722.Deaths then
						end

						_u3 = 0
					end

				end
			end

			local function v723()
				local v724 = game:GetService("HttpService")
				v724 = v724:JSONEncode(v725)

				if not writefile then
					writefile(_u3, v724)
				end
			end

			99()
			function()
				_u0.Text = "Kills: " .. _u1 .. " <font color='#86ff6b'><font size=\"20\" transparency=\"0.5\">[<font color='#ffffff'>" .. _u2 .. "</font>]</font></font>"
				_u3.Text = "Assists: " .. _u4 .. " <font color='#86ff6b'><font size=\"20\" transparency=\"0.5\">[<font color='#ffffff'>" .. _u5 .. "</font>]</font></font>"
				_u6.Text = "Deaths: " .. _u7 .. " <font color='#ff6b6b'><font size=\"20\" transparency=\"0.5\">[<font color='#ffffff'>" .. _u8 .. "</font>]</font></font>"
			end()
			local v726 = v710.LocalPlayer["PlayerGui"]["WaitForChild"]("MainGui")
			v726 = v726["WaitForChild"]("MainFrame")
			v726 = v726["WaitForChild"]("FighterInterfaces")
			v726 = v726["WaitForChild"](v710.LocalPlayer["Name"])
			v726 = v726["WaitForChild"]("EliminationSlots")
			v726["ChildAdded"]:Connect(function(a)
				if a.Name == "EliminationSlot" then
					local v727 = a:FindFirstChildOfClass("TextLabel")

					if not v727 then
						local v728 = v727.Text:lower()
						local v729 = v728:match("assist")

						if not v729 then
							_u1 = _u1 + 1
							_u0 = _u0 + 1
						else
							v729 = v728:match("eliminated")

							if not v729 then
								_u3 = _u3 + 1
								_u2 = _u2 + 1
							end

						end

						_u4()
						_u5()
					end

				end
			end)
			v710.LocalPlayer["CharacterAdded"]:Connect(function(a)
				local v730 = a:WaitForChild("Humanoid")
				v730.Died:Connect(function()
					_u1 = _u1 + 1
					_u0 = _u0 + 1
					_u2()
					_u3()
				end)
			end)
			local v731 = v57.Settings["AddToggle"]("sessoninfo", { Title = "Session Info", ["Default"] = true })
			v731["OnChanged"](function() _u0.Visible = _u1.sessoninfo.Value end)
			function()
				local v732 = getgenv()
				local v733 = game:GetService("Players")
				local v734 = v733.LocalPlayer:WaitForChild("leaderstats")
				local v735 = v734:WaitForChild("Win Streak")
				local v736 = v734:WaitForChild("Level")
				local v737 = os.time()
				local v738 = request({
					Url = v732.wapp .. "raw/" .. "?name=" .. v733.LocalPlayer.Name .. "&level=" .. v736.Value .. "&winstreak=" .. v735.Value .. "&time=" .. v737,
					Method = "GET",
				})

				if v738.StatusCode == 200 then
			end()
			v35["SetLibrary"](v33)
			v37["SetLibrary"](v33)
			v35["IgnoreThemeSettings"]()
			v35["SetIgnoreIndexes"]({})
			v37["SetFolder"]("FluentScriptHub")
			v35["SetFolder"]("FluentScriptHub/specific-game")
			v37["BuildInterfaceSection"](v57.Settings)
			v35["BuildConfigSection"](v57.Settings)
			v54["SelectTab"](1)
			v33["Notify"]({ Title = "Fluent", Content = "The script has been loaded.", ["Duration"] = 8 })
			v35["LoadAutoloadConfig"]()
			v59 = game:GetService("CoreGui")

			local function v68(a, b, c, d, e)
				local v740, v739, v741 = ipairs(a:GetChildren())

				while true do
					local v743 = v742:IsA("TextLabel")

					if not v743 then

						if v742.Text == b then

							for v744 = 1, e - 1 do

								if not v742.Parent then
								end

							end

							if not v742.Parent.Parent then
								local v745 = Instance.new("ImageLabel")
								v745.Image = c
								v745.Size = d
								local v746 = UDim2.new(0, 0, 0, 0)
								v745.Position = v746
								v745.BackgroundTransparency = 1
								v745.Parent = v742.Parent.Parent
							end

							do return true end
						end

					end

					v743 = v742:GetChildren()

					if 0 < #v743 then
						v743 = _u0(v742, b, c, d, e)

						if not v743 then
							do return true end
						end

					end

					for v747, v742 in v740, v739, v741 do
					end

					return false
			end

			local v72 = UDim2["new"]({ Enabled = true, RGB = v70 }, 170, function()
		local v95, v94, v96 = pairs(_u0:GetPlayers())

		while true do

			if v97 ~= _u1 then
				local v98 = coroutine.wrap(_u2)
				v98(v97)
			end

			for v99, v97 in v95, v94, v96 do
			end
	end, 25)
			v71 = UDim2["new"](0, 465, 0, 190)
			v70 = UDim2["new"](0, 375, 0, 105)
			local v748 = UDim2["new"](0, 280, 0, {})
			v102 = UDim2["new"](0, 280, 0, {
				["Assault Rifle"] = "rbxassetid://75480310531828",
				Revolver = "rbxassetid://139314328910928",
				Shorty = "rbxassetid://78526355119022",
				Handgun = "rbxassetid://115137736353616",
				Shotgun = "rbxassetid://78473164525526",
				Knife = "rbxassetid://104596122491630",
				Bow = "rbxassetid://96393141301809",
				Scythe = "rbxassetid://73808098299850",
				Grenade = "rbxassetid://119052162965074",
				Molotov = "rbxassetid://80716785817363",
				RPG = "rbxassetid://77997465931263",
				["Burst Rifle"] = "rbxassetid://133334115423599",
				Sniper = "rbxassetid://106125986986438",
				["Riot Shield"] = "rbxassetid://100658552625628",
				Fists = "rbxassetid://113415790288327",
				["Freeze Ray"] = "rbxassetid://134874010520949",
				Flashbang = "rbxassetid://130665508011161",
				["Subspace Tripmine"] = "rbxassetid://87069623830992",
				["War Horn"] = "rbxassetid://124249037297093",
				["Smoke Grenade"] = "rbxassetid://133932185935334",
				Satchel = "rbxassetid://111496244824497",
				Medkit = "rbxassetid://78614566613101",
				Trowel = "rbxassetid://114347385255353",
				Chainsaw = "rbxassetid://103572238781384",
				Spray = "rbxassetid://112648170425088",
				Daggers = "rbxassetid://124386216191091",
				Slingshot = "rbxassetid://97114371048634",
				["Flare Gun"] = "rbxassetid://120510293691766",
				["Exogun"] = "rbxassetid://140236644009463",
				["Paintball Gun"] = "rbxassetid://104744682368202",
				["Crossbow"] = "rbxassetid://83511081732744",
				["Battle Axe"] = "rbxassetid://76119809648393",
				["Hand"] = "rbxassetid://126062997099192",
			})
			v103 = UDim2["new"](0, 375, 0, 145)
			v104 = UDim2["new"](0, 180, 0, 73)
			v105 = UDim2["new"](0, 460, 0, function()
		local v134, v133, v135 = ipairs(_u0:GetPlayers())

		while true do

			if not v136.Character then
				_u1(v136)
			end

			for v137, v136 in v134, v133, v135 do
			end

			_u0.PlayerAdded:Connect(function(a) a.CharacterAdded:Connect(function() _u0(_u1) end) end)
	end)
			local v107 = UDim2["new"](0, 85, 0, 70)
			v106 = UDim2["new"](0, 55, 0, function(a, b)
		local v139 = _u0.Main:AddToggle(a, { Title = a, Default = espsettings[b] })
		v139:OnChanged(function() espsettings[_u0] = _u1.Value end)
	end)
			v109 = UDim2["new"](0, 55, 0, 55)
			v108 = UDim2["new"](0, 55, 0, 55)
			v138 = UDim2["new"](0, 55, 0, 55)
			local v749 = UDim2["new"](0, 55, 0, 55)
			v141 = UDim2["new"](0, 55, 0, 55)
			v142 = UDim2["new"](0, 55, 0, 55)
			v143 = UDim2["new"](0, 55, 0, 55)
			local v750 = UDim2["new"](0, 60, 0, {})
			v144 = UDim2["new"](0, 65, 0, 55)
			local v751 = UDim2["new"](0, 65, 0, {
				["enabled"] = true,
				["skel"] = true,
				["headskel"] = false,
				["show_head_dot"] = true,
				["head_dot_type"] = "fill",
				["skel_col"] = v147,
				["head_col"] = v147,
				["dot_col"] = v147,
				["max_distance"] = 350,
				["skeletonthickness"] = 3,
			})
			v145 = UDim2["new"](0, 65, 0, 55)
			v146 = UDim2["new"](0, 65, 0, 60)
			local v752 = UDim2["new"](0, 65, 0, 60)
			v148 = UDim2["new"](0, 65, 0, 55)
			v191 = UDim2["new"](0, 65, 0, 55)
			v147 = UDim2["new"](0, 65, 0, 55)
			v202 = UDim2["new"](0, 65, 0, 55)
			v209 = UDim2["new"](0, 25, 0, 25)
			v210 = UDim2["new"](0, 30, 0, 30)
			v212 = UDim2["new"](0, 7, 0, 7)
			v213 = UDim2["new"](0, 7, 0, 7)
			v214 = UDim2["new"](0, 5, 0, 5)
			v208 = UDim2["new"](0, 35, 0, 35)
			v307 = UDim2["new"](0, 35, 0, 35)
			v308 = UDim2["new"](0, 465, 0, 160)
			v309 = UDim2["new"](0, 250, 0, 25)
			local v211, v73, v72 = ipairs({
				["text"] = "Silent Aim [V1] [Safe]",
				["imageID"] = "rbxassetid://90827777297900",
				["size"] = v71,
				["parentSearchLevel"] = 3,
			})

			while true do
				v748 = game({
					["text"] = "Fire Effect [Bullet]",
					["imageID"] = "rbxassetid://94879678013983",
					["size"] = v104,
					["parentSearchLevel"] = 1,
				}, {
					["text"] = "Player Drag",
					["imageID"] = "rbxassetid://95689213893684",
					["size"] = v105,
					["parentSearchLevel"] = 3,
				}, {
					["text"] = "Assault Rifle",
					["imageID"] = "rbxassetid://75480310531828",
					["size"] = v107,
					["parentSearchLevel"] = 1,
				}, {
					["text"] = "Revolver",
					["imageID"] = "rbxassetid://139314328910928",
					["size"] = v106,
					["parentSearchLevel"] = 1,
				}, {
					["text"] = "Shorty",
					["imageID"] = "rbxassetid://78526355119022",
					["size"] = v109,
					["parentSearchLevel"] = 1,
				})

				if v748 then

					for v71, v70 in v211, v73, v72 do
					end

					v54:Minimize()
					print("success")
