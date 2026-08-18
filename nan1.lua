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
    print('err')

    return
end

local v10 = readfile(v8)

local function v24(p11, p12)
    local v13 = {
        Url = c_n({
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
        }) .. p12,
        Method = 'GET',
    }
    local u14 = http_request(v13)

    if not (u14 and u14.Body) then
        return false, 'Request failed'
    end

    local v15, v16 = pcall(function()
        return _HttpService:JSONDecode(u14.Body)
    end)

    if not (v15 and v16) then
        return false, 'Invalid response'
    end
    if v16.error == 'HWID mismatch' then
        print('HWID Mismatch!')
        Fluent:Notify({
            Title = 'HWID Mismatch',
            Content = "Your HWID doesn't match. Please contact support for assistance.",
            Duration = 5,
        })

        return false, 'HWID mismatch'
    end
    if v16.key ~= p11 or v16.hwid ~= p12 then
        return false, 'Invalid key'
    end
    if v16.userlvl ~= 'ref' then
        if v16.userlvl ~= 'erp' then
            if v16.userlvl == 'pos' then
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

    return true, 'Valid Key (Server 2). Time left: ' .. table.concat(v23, ', ')
end

local v37, _ = (function(p25)
    local v26 = {
        Url = c_n({
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
        }) .. p25,
        Method = 'GET',
    }
    local u27 = http_request(v26)

    if not (u27 and u27.Body) then
        print('c')

        return false, 'Request failed'
    end

    local v28, v29 = pcall(function()
        return _HttpService:JSONDecode(u27.Body)
    end)

    if not (v28 and v29) then
        print('c')

        return false, 'Invalid response'
    end
    if v29.valid == false then
        return false, 'Expired'
    end
    if v29.valid ~= true or not v29.info or not v29.info.expiresAfter then
        print('c')

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

if not v37 then
    local v38, _ = v24(v10, v9)

    if not v38 then
        warn('La validación de Server 2 ha fallado.')
    end
end

local u39 = loadstring(game:HttpGet('https://gist.githubusercontent.com/8bits4ya/34e99dc2d2f02d65a0607a3eef48b62d/raw/7ce32956279900373a8e67351f2cf8f770dda19c/gistfile1.txt'))();

(function()
    if getgenv().executed then
        u39:Notify({
            Title = 'Notification',
            Content = 'Already Injected.Dont load twice.',
            SubContent = '',
            Duration = 5,
        })
        wait(999999999)
    end

    getgenv().executed = true
end)()

local v40 = loadstring(game:HttpGet('https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua'))()
local v41 = loadstring(game:HttpGet('https://gist.githubusercontent.com/8bits4ya/088f795d94e39889f117bc7d50a68eee/raw/eca550022fd5027b4348efb0be594df368bce16c/gistfile1.txt'))();

(function()
    task.spawn(function()
        local _LocalPlayer = game:GetService('Players').LocalPlayer
        local u43 = Vector3.new(106.47918701171875, -678.1240234375, 1185.37158203125)

        getgenv().state = 1

        local function u46(p44)
            local _HumanoidRootPart = p44:WaitForChild('HumanoidRootPart', 10)

            if _HumanoidRootPart then
                if (_HumanoidRootPart.Position - u43).Magnitude <= 300 then
                    getgenv().state = 1
                else
                    getgenv().state = 2
                end
            end
        end
        local function u51(p47)
            local _Humanoid = p47:FindFirstChild('Humanoid')

            if _Humanoid then
                _Humanoid.Died:Connect(function()
                    u46(p47)
                end)
            end

            local _HumanoidRootPart2 = p47:WaitForChild('HumanoidRootPart', 10)

            if _HumanoidRootPart2 then
                local _Position = _HumanoidRootPart2.Position

                while task.wait(1) do
                    if (_HumanoidRootPart2.Position - _Position).Magnitude > 300 then
                        u46(p47)
                    end

                    _Position = _HumanoidRootPart2.Position
                end
            end
        end

        _LocalPlayer.CharacterAdded:Connect(function(p52)
            u46(p52)
            u51(p52)
        end)

        if _LocalPlayer.Character then
            u51(_LocalPlayer.Character)
        end
    end)
end)()

function vbx9t3jskpwf1u7qr(p53)
    local v54, v55, v56 = ipairs(p53)
    local v57 = ''

    while true do
        local v58

        v56, v58 = v54(v55, v56)

        if v56 == nil then
            break
        end

        v57 = v57 .. (v58 == 32 and ' ' or string.char(v58))
    end

    return v57
end

if os.time() > 1789051200 then
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
end

getgenv().wapp = 'https://dev-8-bit.pantheonsite.io/'

queue_on_teleport('\r\n    if game.PlaceId == 17625359962 or game.PlaceId == 71874690745115 then\r\n        if not getgenv().NameLoaderLoaded then\r\n            getgenv().NameLoaderLoaded = true\r\n            wait(2)\r\n            loadstring(game:HttpGet("https://dev-8bitsforya.pantheonsite.io/nan.lua"))()\r\n        end\r\n    end\r\n')

local v59 = u39
local v60 = u39.CreateWindow(v59, {
    Title = '                        <font size="15">Rivals</font> V4<font color="#a3fcff" transparency="0.5"> [Feather]</font>',
    SubTitle = '                             <font color="#9eefff"> https://dsc.gg/get-8-bit</font>',
    TabWidth = 150,
    Size = UDim2.fromOffset(650, 390),
    Acrylic = false,
    Theme = '8bit',
    MinimizeKey = Enum.KeyCode.RightShift,
})

v60:Minimize()

local _CoreGui = game:GetService('CoreGui')
local v62, v63, v64 = ipairs(_CoreGui:GetDescendants())
local u65 = u39

while true do
    local v66

    v64, v66 = v62(v63, v64)

    if v64 == nil then
        break
    end
    if v66:IsA('ImageLabel') and v66.Image == 'rbxassetid://9968344105' then
        v66.Image = 'rbxassetid://17874360446'
        v66.ImageTransparency = 0
        v66.ScaleType = Enum.ScaleType.Stretch
    end
end

local u67 = {
    Wlc = v60:AddTab({
        Title = 'Info',
        Icon = 'rbxassetid://124620632231839',
    }),
    Main = v60:AddTab({
        Title = 'Visuals',
        Icon = 'rbxassetid://6523858394',
    }),
    AimTab = v60:AddTab({
        Title = 'Aim Features <font color="#52ff7d"> [New]</font>',
        Icon = 'rbxassetid://125143421594685',
    }),
    Silent = v60:AddTab({
        Title = 'Silent <font color="#52ff7d"> [New]</font>',
        Icon = 'rbxassetid://13557340523',
    }),
    Gunmod = v60:AddTab({
        Title = 'Gunmods <font color="#52e2ff"> [New]</font>',
        Icon = 'rbxassetid://6450238472',
    }),
    Skinz = v60:AddTab({
        Title = 'Skins',
        Icon = 'rbxassetid://6020038035',
    }),
    Nono = v60:AddTab({
        Title = 'Rage Mode',
        Icon = 'rbxassetid://15441239798',
    }),
    Essential = v60:AddTab({
        Title = 'Game',
        Icon = 'rbxassetid://83588998609796',
    }),
    Spoof = v60:AddTab({
        Title = 'Spoofer',
        Icon = 'rbxassetid://97682995973876',
    }),
    Settings = v60:AddTab({
        Title = 'Settings',
        Icon = 'rbxassetid://7145468831',
    }),
}
local _Options = u65.Options

function c_n(p69)
    local v70, v71, v72 = ipairs(p69)
    local v73 = ''

    while true do
        local v74

        v72, v74 = v70(v71, v72)

        if v72 == nil then
            break
        end

        v73 = v73 .. (v74 == 32 and ' ' or string.char(v74))
    end

    return v73
end

local v75, _ = loadstring(game:HttpGet(c_n({
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

if v75 then
    local v76, _ = pcall(v75)

    if v76 then
        print('Success')
    else
        print('Execution failed')
    end
else
    print('l error: ')
end

u67.Wlc:AddParagraph({
    Title = 'Szoo premium Rivals',
    Content = '',
})

u67.Wlc:AddParagraph({
    Title = 'Made by V.Roy',
    Content = '',
})

getgenv().boxBorderColor = Color3.fromRGB(255, 255, 255)

local v77 = cloneref(game:GetService('Workspace'))
local u78 = cloneref(game:GetService('RunService'))
local u79 = cloneref(game:GetService('Players'))
local _CoreGui2 = game:GetService('CoreGui')
local u81 = {MaxDistance = 350}
local v82 = {
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

u81.Drawing = v82

local _LocalPlayer2 = u79.LocalPlayer
local _CurrentCamera = v77.CurrentCamera

local function u91(p85, p86)
    if typeof(p85) == 'string' then
        p85 = Instance.new(p85) or p85
    end

    local v87, v88, v89 = pairs(p86)

    while true do
        local v90

        v89, v90 = v87(v88, v89)

        if v89 == nil then
            break
        end

        p85[v89] = v90
    end

    return p85
end
local function u105(p92)
    local function u93()
        if p92.Character and p92.Character:FindFirstChild('HumanoidRootPart') then
            return p92.Character.HumanoidRootPart:FindFirstChild('TeammateLabel') ~= nil
        else
            return false
        end
    end

    local _Frame = u91('Frame', {
        Parent = u91('ScreenGui', {
            Parent = _CoreGui2,
            Name = p92.Name .. 'ESP',
        }),
        BackgroundColor3 = u81.Drawing.Boxes.Filled.RGB,
        BackgroundTransparency = u81.Drawing.Boxes.Filled.Transparency,
    })
    local _UIStroke = u91('UIStroke', {
        Parent = _Frame,
        Color = getgenv().boxBorderColor,
        Thickness = 2,
        Transparency = 0,
    })

    u78.RenderStepped:Connect(function()
        _UIStroke.Color = getgenv().boxBorderColor
    end)

    local function v104()
        u78.RenderStepped:Connect(function()
            if p92.Character and (p92.Character:FindFirstChild('HumanoidRootPart') and p92.Character:FindFirstChild('Humanoid')) then
                local _HumanoidRootPart3 = p92.Character.HumanoidRootPart
                local _Humanoid2 = p92.Character.Humanoid

                if u93() then
                    _Frame.Visible = false

                    return
                end

                local v98, v99 = _CurrentCamera:WorldToScreenPoint(_HumanoidRootPart3.Position)
                local v100 = (_CurrentCamera.CFrame.Position - _HumanoidRootPart3.Position).Magnitude / 3.5
                local v101 = 1 / (v100 * (_CurrentCamera.FieldOfView / 70))
                local v102 = v101 * 600
                local v103 = v101 * 900

                if v99 and v100 <= u81.MaxDistance and _Humanoid2.Health > 0 then
                    _Frame.Position = UDim2.new(0, v98.X - v102 / 2, 0, v98.Y - v103 / 2)
                    _Frame.Size = UDim2.new(0, v102, 0, v103)
                    _Frame.Visible = u81.Drawing.Boxes.Full.Enabled
                else
                    _Frame.Visible = false
                end
            else
                _Frame.Visible = false
            end
        end)
    end

    coroutine.wrap(v104)()
end

(function()
    local v106 = u79
    local v107, v108, v109 = pairs(v106:GetPlayers())

    while true do
        local v110

        v109, v110 = v107(v108, v109)

        if v109 == nil then
            break
        end
        if v110 ~= _LocalPlayer2 then
            coroutine.wrap(u105)(v110)
        end
    end
end)()
u79.PlayerAdded:Connect(function(p111)
    coroutine.wrap(u105)(p111)
end)
u79.PlayerRemoving:Connect(function(p112)
    if _CoreGui2:FindFirstChild(p112.Name .. 'ESP') then
        _CoreGui2[p112.Name .. 'ESP']:Destroy()
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

local u116 = {}
local u117 = {
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

local function u143(p119)
    if p119 ~= _Players.LocalPlayer then
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
        u116[p119] = {
            nametag = _TextLabel,
            weaponImage = _ImageLabel,
            weaponBorder = _Frame2,
        }

        _RunService.RenderStepped:Connect(function()
            local _Character = p119.Character

            if _Character and _Character:FindFirstChild('Head') then
                local _HumanoidRootPart4 = _Character:FindFirstChild('HumanoidRootPart')

                if _HumanoidRootPart4 and _HumanoidRootPart4:FindFirstChild('TeammateLabel') then
                    _TextLabel.Visible = false
                    _ImageLabel.Visible = false
                    _Frame2.Visible = false

                    return
                end

                local v126 = _CurrentCamera2:WorldToScreenPoint(_Character.Head.Position + Vector3.new(0, 2, 0))
                local v127 = math.floor((_CurrentCamera2.CFrame.Position - _Character.Head.Position).Magnitude / 3)

                if not (espsettings.showname or espsettings.showdistance or (espsettings.showsweapon or espsettings.showhealth)) then
                    _TextLabel.Visible = false
                    _ImageLabel.Visible = false
                    _Frame2.Visible = false

                    return
                end
                if espsettings.maxDistance < v127 then
                    _TextLabel.Visible = false
                    _ImageLabel.Visible = false
                    _Frame2.Visible = false

                    return
                end

                local _Humanoid3 = _Character:FindFirstChildOfClass('Humanoid')
                local v129 = _Humanoid3 and math.floor(_Humanoid3.Health) or 0
                local v130 = v129 < 15 and '#de4433' or (v129 < 30 and '#FFFF00' or '#2fde4c')
                local v131 = {}

                if v129 == 0 then
                    table.insert(v131, '<font color="#7370ff">DEAD</font>')

                    _TextLabel.TextSize = espsettings.scale * 0.6
                    _ImageLabel.Image = espsettings.deadImageID
                    _ImageLabel.Visible = true
                else
                    _TextLabel.TextSize = espsettings.scale

                    if espsettings.showname then
                        table.insert(v131, p119.Name)
                    end

                    local v132, v133, v134 = pairs(game:GetService('Workspace').ViewModels:GetChildren())
                    local v135 = 'Hand'

                    while true do
                        local v136

                        v134, v136 = v132(v133, v134)

                        local v137

                        if v134 == nil then
                            v137 = v135
                        end
                        if string.find(v136.Name, p119.Name) then
                            local v138, v139

                            v138, v139, v137 = pairs(u117)

                            while true do
                                local v140

                                v137, v140 = v138(v139, v137)

                                if v137 == nil then
                                    v137 = v135

                                    break
                                end
                                if string.find(v136.Name, v137) then
                                    break
                                end
                            end

                            break
                        end
                    end

                    if espsettings.showsweapon then
                        table.insert(v131, v137)
                    end
                    if espsettings.showdistance then
                        table.insert(v131, '<b>' .. v127 .. 'm</b>')
                    end
                    if espsettings.showhealth then
                        table.insert(v131, 'HP: <font color="' .. v130 .. '">' .. v129 .. '</font>')
                    end
                    if espsettings.showweaponimage and u117[v137] then
                        _ImageLabel.Image = u117[v137]
                        _ImageLabel.Visible = true

                        local _imageScale = espsettings.imageScale

                        _ImageLabel.Size = UDim2.new(0, 30 * _imageScale, 0, 30 * _imageScale)
                        _Frame2.Visible = true
                    else
                        _ImageLabel.Visible = false
                        _Frame2.Visible = false
                    end
                end

                _TextLabel.Text = table.concat(v131, ' \u{2666} ')
                _TextLabel.BackgroundTransparency = espsettings.background

                if v126.Z <= 0 then
                    _TextLabel.Visible = false
                    _ImageLabel.Visible = false
                    _Frame2.Visible = false
                else
                    local v142 = _TextLabel.TextBounds.X + 20

                    _TextLabel.Position = UDim2.new(0, v126.X - v142 / 2, 0, v126.Y - 30)
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
    local v144 = _Players
    local v145, v146, v147 = ipairs(v144:GetPlayers())

    while true do
        local v148

        v147, v148 = v145(v146, v147)

        if v147 == nil then
            break
        end
        if v148.Character then
            u143(v148)
        end
    end

    _Players.PlayerAdded:Connect(function(p149)
        p149.CharacterAdded:Connect(function()
            u143(p149)
        end)
    end)
end)()
u67.Main:AddSection('Nametags')

local function v154(p150, p151)
    local u152 = u67.Main:AddToggle(p150, {
        Title = p150,
        Default = espsettings[p151],
    })
    local v153 = u152

    u152.OnChanged(v153, function()
        espsettings[p151] = u152.Value
    end)
end

v154('Show Name', 'showname')
v154('Show Distance', 'showdistance')
v154('Show Health', 'showhealth')
v154('Show Weapon', 'showsweapon')
v154('Show Weapon Icon', 'showweaponimage')
u67.Main:AddSlider('NTBGTSlider', {
    Title = 'BackGround Transparency',
    Default = 4,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Callback = function(p155)
        getgenv().espsettings.background = p155 / 10
    end,
})
u67.Main:AddSlider('NTSSlider', {
    Title = 'NameTag Scale',
    Default = 15,
    Min = 0,
    Max = 50,
    Rounding = 1,
    Callback = function(p156)
        espsettings.scale = p156
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

local u162 = {}
local u163 = false

local function u248()
    if not u163 then
        local function u239(p164, p165)
            local u166 = {
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
            local v167, v168, v169 = pairs(u166)
            local u170 = {}
            local u171 = {}

            while true do
                local v172

                v169, v172 = v167(v168, v169)

                if v169 == nil then
                    break
                end

                u170[v172] = Drawing.new('Line')
                u170[v172].Visible = false
                u170[v172].Thickness = esp_settings.skeletonthickness
                u170[v172].Color = esp_settings.skel_col
                u171[v172] = Drawing.new('Circle')
                u171[v172].Visible = false
                u171[v172].Color = esp_settings.dot_col
                u171[v172].Filled = true
            end

            local _Circle = Drawing.new('Circle')

            _Circle.Visible = false
            _Circle.Color = esp_settings.head_col
            _Circle.Thickness = 1
            _Circle.Transparency = 1

            local v174 = {
                bones = u170,
                dots = u171,
                head_dot = _Circle,
            }

            u162[p164.UserId] = v174

            local function v238()
                local u175 = nil
                local _ = _RunService2.RenderStepped:Connect(function()
                    if p165 and (p165:FindFirstChild('HumanoidRootPart') and 5 == 5) then
                        if p165.HumanoidRootPart:FindFirstChild('TeammateLabel') then
                            local v176, v177, v178 = pairs(u170)

                            while true do
                                local v179

                                v178, v179 = v176(v177, v178)

                                if v178 == nil then
                                    break
                                end

                                v179.Visible = false
                            end

                            local v180, v181, v182 = pairs(u171)

                            while true do
                                local v183

                                v182, v183 = v180(v181, v182)

                                if v182 == nil then
                                    break
                                end

                                v183.Visible = false
                            end

                            _Circle.Visible = false

                            return
                        end
                        if _LocalPlayer3.Character.Humanoid.Health == 0 then
                            local v184, v185, v186 = pairs(u170)

                            while true do
                                local v187

                                v186, v187 = v184(v185, v186)

                                if v186 == nil then
                                    break
                                end

                                v187.Visible = false
                            end

                            local v188, v189, v190 = pairs(u171)

                            while true do
                                local v191

                                v190, v191 = v188(v189, v190)

                                if v190 == nil then
                                    break
                                end

                                v191.Visible = false
                            end

                            _Circle.Visible = false

                            return
                        end

                        local _Magnitude = (p165.HumanoidRootPart.Position - _LocalPlayer3.Character.HumanoidRootPart.Position).Magnitude

                        if esp_settings.max_distance < _Magnitude or _Magnitude < 2 then
                            local v193, v194, v195 = pairs(u170)

                            while true do
                                local v196

                                v195, v196 = v193(v194, v195)

                                if v195 == nil then
                                    break
                                end

                                v196.Visible = false
                            end

                            local v197, v198, v199 = pairs(u171)

                            while true do
                                local v200

                                v199, v200 = v197(v198, v199)

                                if v199 == nil then
                                    break
                                end

                                v200.Visible = false
                            end

                            _Circle.Visible = false

                            return
                        end

                        local v201, v202, v203 = pairs(u166)
                        local v204 = {}

                        while true do
                            local v205

                            v203, v205 = v201(v202, v203)

                            if v203 == nil then
                                break
                            end

                            local v206 = p165:FindFirstChild(v205)

                            if v206 then
                                local v207, v208 = _CurrentCamera3:WorldToViewportPoint(v206.Position)

                                if v208 then
                                    v204[v205] = v207
                                else
                                    v204[v205] = nil
                                end
                            end
                        end

                        if esp_settings.enabled then
                            local v209, v210, v211 = pairs(u170)

                            while true do
                                local v212

                                v211, v212 = v209(v210, v211)

                                if v211 == nil then
                                    break
                                end

                                local v213

                                if v204[v211] == nil then
                                    v213 = false
                                else
                                    v213 = esp_settings.skel
                                end

                                v212.Visible = v213
                            end

                            local v214, v215, v216 = pairs(u171)

                            while true do
                                local v217

                                v216, v217 = v214(v215, v216)

                                if v216 == nil then
                                    break
                                end
                                if v204[v216] then
                                    if v216 == 'LeftLowerArm' or v216 == 'RightLowerArm' or (v216 == 'LeftLowerLeg' or v216 == 'RightLowerLeg') then
                                        v217.Position = Vector2.new(v204[v216].X, v204[v216].Y)
                                        v217.Radius = math.clamp(100 / _Magnitude, 1, 3)
                                        v217.Visible = true
                                    else
                                        v217.Visible = false
                                    end
                                else
                                    v217.Visible = false
                                end
                            end

                            if esp_settings.show_head_dot and esp_settings.head_dot_type ~= 'none' and v204.Head then
                                _Circle.Position = Vector2.new(v204.Head.X, v204.Head.Y)
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
                            if v204.Head and v204.UpperTorso then
                                u170.Head.From = Vector2.new(v204.Head.X, v204.Head.Y)
                                u170.Head.To = Vector2.new(v204.UpperTorso.X, v204.UpperTorso.Y)
                            end
                            if v204.UpperTorso and v204.LowerTorso then
                                u170.UpperTorso.From = Vector2.new(v204.UpperTorso.X, v204.UpperTorso.Y)
                                u170.UpperTorso.To = Vector2.new(v204.LowerTorso.X, v204.LowerTorso.Y)
                            end

                            local v218, v219, v220 = pairs({
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
                                local v221

                                v220, v221 = v218(v219, v220)

                                if v220 == nil then
                                    break
                                end
                                if v204[v221[1] ] and v204[v221[2] ] then
                                    u170[v221[2] ].From = Vector2.new(v204[v221[1] ].X, v204[v221[1] ].Y)
                                    u170[v221[2] ].To = Vector2.new(v204[v221[2] ].X, v204[v221[2] ].Y)
                                end
                            end
                        else
                            local v222, v223, v224 = pairs(u170)

                            while true do
                                local v225

                                v224, v225 = v222(v223, v224)

                                if v224 == nil then
                                    break
                                end

                                v225.Visible = false
                            end

                            local v226, v227, v228 = pairs(u171)

                            while true do
                                local v229

                                v228, v229 = v226(v227, v228)

                                if v228 == nil then
                                    break
                                end

                                v229.Visible = false
                            end

                            _Circle.Visible = false
                        end
                    else
                        u175:Disconnect()

                        local v230, v231, v232 = pairs(u170)

                        while true do
                            local v233

                            v232, v233 = v230(v231, v232)

                            if v232 == nil then
                                break
                            end

                            v233.Visible = false
                        end

                        local v234, v235, v236 = pairs(u171)

                        while true do
                            local v237

                            v236, v237 = v234(v235, v236)

                            if v236 == nil then
                                break
                            end

                            v237.Visible = false
                        end

                        _Circle.Visible = false
                    end
                end)
            end

            coroutine.wrap(v238)()
        end
        local function v242(p240)
            if p240.Character then
                coroutine.wrap(u239)(p240, p240.Character)
            end

            p240.CharacterAdded:Connect(function(p241)
                coroutine.wrap(u239)(p240, p241)
            end)
        end

        local v243 = _Players2
        local v244, v245, v246 = ipairs(v243:GetPlayers())

        while true do
            local v247

            v246, v247 = v244(v245, v246)

            if v246 == nil then
                break
            end
            if v247 ~= _LocalPlayer3 then
                v242(v247)
            end
        end

        _Players2.PlayerAdded:Connect(v242)

        u163 = true
    end
end

u67.Main:AddSection('Skeleton')

local _espenabled = u67.Main:AddToggle('espenabled', {
    Title = 'Enable ESP',
    Default = esp_settings.enabled,
})
local v250 = _espenabled

_espenabled.OnChanged(v250, function()
    esp_settings.enabled = _espenabled.Value

    if esp_settings.enabled then
        u248()
    else
        local v251, v252, v253 = pairs(u162)

        while true do
            local v254

            v253, v254 = v251(v252, v253)

            if v253 == nil then
                break
            end

            local v255, v256, v257 = pairs(v254.bones)

            while true do
                local v258

                v257, v258 = v255(v256, v257)

                if v257 == nil then
                    break
                end

                v258.Visible = false
            end

            local v259, v260, v261 = pairs(v254.dots)

            while true do
                local v262

                v261, v262 = v259(v260, v261)

                if v261 == nil then
                    break
                end

                v262.Visible = false
            end

            if v254.head_dot then
                v254.head_dot.Visible = false
            end
        end
    end
end)

local _headdot = u67.Main:AddToggle('headdot', {
    Title = 'Enable Head Dot',
    Default = esp_settings.show_head_dot,
})
local v264 = _headdot

_headdot.OnChanged(v264, function()
    esp_settings.show_head_dot = _headdot.Value

    if esp_settings.show_head_dot then
        u248()
    else
        local v265, v266, v267 = pairs(u162)

        while true do
            local v268

            v267, v268 = v265(v266, v267)

            if v267 == nil then
                break
            end

            v268.head_dot.Visible = false
        end
    end
end)
u67.Main:AddDropdown('HeadDotDropdown', {
    Title = 'Head Dot Dropdown',
    Values = {
        'none',
        'fill',
        'holo',
    },
    Multi = false,
    Default = 2,
}):OnChanged(function(p269)
    esp_settings.head_dot_type = p269

    if esp_settings.enabled then
        u248()
    end
end)
u67.Main:AddSection('Box Esp')

local _FullBoxesToggle = u67.Main:AddToggle('FullBoxesToggle', {
    Title = 'Toggle Full Boxes',
    Default = u81.Drawing.Boxes.Full.Enabled,
})
local v271 = _FullBoxesToggle

_FullBoxesToggle.OnChanged(v271, function()
    u81.Drawing.Boxes.Full.Enabled = _FullBoxesToggle.Value
end)

local _FilledBoxesToggle = u67.Main:AddToggle('FilledBoxesToggle', {
    Title = 'Toggle Filled Boxes',
    Default = u81.Drawing.Boxes.Filled.Enabled,
})
local v273 = _FilledBoxesToggle

_FilledBoxesToggle.OnChanged(v273, function()
    if _FilledBoxesToggle.Value then
        u81.Drawing.Boxes.Filled.Transparency = 0.7
    else
        u81.Drawing.Boxes.Filled.Transparency = 1
    end
end)
u67.Main:AddToggle('Rainbowbox', {
    Title = 'Rainbow Box',
    Default = false,
}):OnChanged(function(p274)
    if p274 then
        local _RunService3 = game:GetService('RunService')

        rainbowRunning = true

        _RunService3.Heartbeat:Connect(function()
            if rainbowRunning then
                local v276 = tick() % 5

                getgenv().boxBorderColor = Color3.fromHSV(v276 / 5, 1, 1)
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

    local u298 = nil
    local u299 = nil
    local u300 = false

    local function u313()
        local _huge = math.huge
        local v302 = _Players3
        local v303, v304, v305 = ipairs(v302:GetPlayers())
        local v306 = nil

        while true do
            local v307

            v305, v307 = v303(v304, v305)

            if v305 == nil then
                break
            end
            if v307 ~= _LocalPlayer4 and v307.Character then
                local _Character2 = v307.Character
                local _HumanoidRootPart5 = _Character2:FindFirstChild('HumanoidRootPart')
                local _Humanoid4 = _Character2:FindFirstChild('Humanoid')

                if _HumanoidRootPart5 and _Humanoid4 and (_Humanoid4.Health > 0 and not _HumanoidRootPart5:FindFirstChild('TeammateLabel')) then
                    local _, v311 = _CurrentCamera4:WorldToViewportPoint(_HumanoidRootPart5.Position)

                    if v311 then
                        local _Magnitude2 = (_HumanoidRootPart5.Position - _LocalPlayer4.Character.HumanoidRootPart.Position).Magnitude

                        if _Magnitude2 <= 350 then
                            if _Magnitude2 < _huge then
                                v306 = v307
                                _huge = _Magnitude2
                            end
                        end
                    end
                end
            end
        end

        return v306
    end
    local function v324()
        if u300 and getgenv().state == 2 then
            if _LocalPlayer4.Character and (_LocalPlayer4.Character:FindFirstChild('Humanoid') and _LocalPlayer4.Character.Humanoid.Health > 0) then
                local v314 = u313()

                if v314 then
                    _ScreenGui2.Enabled = true
                    _TextLabel2.Text = v314.DisplayName

                    local v315, v316 = _Players3:GetUserThumbnailAsync(v314.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size150x150)

                    _ImageLabel2.Image = v316 and v315 and v315 or 'rbxassetid://13456566776'

                    local _Humanoid5 = v314.Character:FindFirstChild('Humanoid')

                    if _Humanoid5 then
                        local v318 = _Humanoid5.Health / _Humanoid5.MaxHealth
                        local u319 = UDim2.new(v318, 0, 1, 0)
                        local v320 = Color3.fromRGB(0, 255, 0)

                        if _Humanoid5.Health <= 30 then
                            v320 = Color3.fromRGB(255, 255, 0)
                        end
                        if _Humanoid5.Health <= 15 then
                            v320 = Color3.fromRGB(255, 0, 0)
                        end

                        local v321 = _TweenService:Create(_Frame8, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = u319})
                        local v322 = _TweenService:Create(_Frame8, TweenInfo.new(0.3), {BackgroundColor3 = v320})

                        v321:Play()
                        v322:Play()
                        task.delay(0.8, function()
                            local v323 = {Size = u319}

                            _TweenService:Create(_Frame7, TweenInfo.new(0.3), v323):Play()
                        end)

                        u298 = _Humanoid5.Health
                        u299 = v314
                    end
                else
                    _ScreenGui2.Enabled = false
                    u299 = nil
                end
            else
                _ScreenGui2.Enabled = false
            end
        else
            _ScreenGui2.Enabled = false

            return
        end
    end

    _RunService4.RenderStepped:Connect(v324)
    u67.Settings:AddToggle('targetstat', {
        Title = 'Target status',
        Default = true,
    }):OnChanged(function()
        u300 = _Options.targetstat.Value
    end)
end)
u67.Skinz:AddSection('Mouse Aimbot [v2]')

function InitializeAimbot2()
    local u325 = false
    local _MouseButton2 = Enum.UserInputType.MouseButton2
    local u327 = 'Head'
    local u328 = 100
    local u329 = 5
    local u330 = false
    local u331 = false
    local u332 = 0
    local u333 = 0
    local u334 = false
    local u335 = false
    local u336 = nil
    local _RunService5 = game:GetService('RunService')
    local _UserInputService = game:GetService('UserInputService')
    local _Players4 = game:GetService('Players')
    local _LocalPlayer5 = _Players4.LocalPlayer
    local _CurrentCamera5 = workspace.CurrentCamera

    local function u353()
        local v342 = u328
        local v343 = Vector2.new(_CurrentCamera5.ViewportSize.X / 2, _CurrentCamera5.ViewportSize.Y / 2)
        local v344 = _Players4
        local v345, v346, v347 = pairs(v344:GetPlayers())
        local v348 = nil

        while true do
            local v349

            v347, v349 = v345(v346, v347)

            if v347 == nil then
                break
            end
            if v349 ~= _LocalPlayer5 and v349.Character and v349.Character:FindFirstChild(u327) then
                local v350, v351 = _CurrentCamera5:WorldToViewportPoint(v349.Character[u327].Position)

                if v351 then
                    local _Magnitude3 = (Vector2.new(v350.X, v350.Y) - v343).Magnitude

                    if _Magnitude3 < v342 then
                        v348 = v349
                        v342 = _Magnitude3
                    end
                end
            end
        end

        return v348
    end
    local function v364()
        if u325 then
            local _ = getgenv().state == 2

            if _MouseButton2 ~= Enum.UserInputType.MouseButton2 then
                if not _UserInputService:IsKeyDown(_MouseButton2) then
                    u336 = nil

                    return
                end
            elseif not _UserInputService:IsMouseButtonPressed(_MouseButton2) then
                u336 = nil

                return
            end
            if u336 and u334 and u336.Character and u336.Character:FindFirstChild(u327) then
                local v354 = _CurrentCamera5:WorldToViewportPoint(u336.Character[u327].Position)
                local v355 = Vector2.new(v354.X, v354.Y)
                local v356 = Vector2.new(_CurrentCamera5.ViewportSize.X / 2, _CurrentCamera5.ViewportSize.Y / 2)
                local v357 = v355 - v356
                local v358 = Vector2.new(v356.X + v357.X / (u329 + 1), v356.Y + v357.Y / (u329 + 1)) - Vector2.new(_CurrentCamera5.ViewportSize.X / 2, _CurrentCamera5.ViewportSize.Y / 2)

                mousemoverel(v358.X, v358.Y)
            else
                u336 = u353()

                if u336 then
                    local v359 = _CurrentCamera5:WorldToViewportPoint(u336.Character[u327].Position)
                    local v360 = Vector2.new(v359.X, v359.Y)
                    local v361 = Vector2.new(_CurrentCamera5.ViewportSize.X / 2, _CurrentCamera5.ViewportSize.Y / 2)
                    local v362 = v360 - v361
                    local v363 = Vector2.new(v361.X + v362.X / (u329 + 1), v361.Y + v362.Y / (u329 + 1)) - Vector2.new(_CurrentCamera5.ViewportSize.X / 2, _CurrentCamera5.ViewportSize.Y / 2)

                    mousemoverel(v363.X, v363.Y)
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

    local function v367()
        if u335 then
            local v366 = _UserInputService:GetMouseLocation()

            _Circle2.Radius = u328
            _Circle2.Position = Vector2.new(v366.X, v366.Y)
            _Circle2.Visible = true
        else
            _Circle2.Visible = false
        end
    end

    local v373 = {
        {
            'EnableAimbot2',
            'Enable',
            false,
            function(p368)
                u325 = p368
            end,
        },
        {
            'ShowFOVCheckbox2',
            'Show FOV',
            false,
            function(p369)
                u335 = p369
            end,
        },
        {
            'SmoothnessCheckbox2',
            'Smoothness',
            false,
            function(p370)
                u330 = p370
            end,
        },
        {
            'EnablePrediction2',
            'Enable Prediction',
            false,
            function(p371)
                u331 = p371
            end,
        },
        {
            'StickyAimCheckbox2',
            'Sticky Aim',
            false,
            function(p372)
                u334 = p372
            end,
        },
    }
    local v374, v375, v376 = ipairs(v373)
    local u377 = u329
    local u378 = u328
    local u379 = u327
    local u380 = _MouseButton2

    while true do
        local v381

        v376, v381 = v374(v375, v376)

        if v376 == nil then
            break
        end

        u67.AimTab:AddToggle(v381[1], {
            Title = v381[2],
            Default = v381[3],
        }):OnChanged(v381[4])
    end

    u67.AimTab:AddKeybind('Keybind2', {
        Title = 'Keybind',
        Mode = 'Toggle',
        Default = 'MouseButton2',
        ChangedCallback = function(p382)
            if p382 == Enum.KeyCode.Unknown then
                p382 = Enum.UserInputType.MouseButton2 or p382
            end

            u380 = p382
        end,
    })
    u67.AimTab:AddDropdown('AimPartDropDown2', {
        Title = 'Aim At',
        Values = {
            'Head',
            'UpperTorso',
            'LowerTorso',
        },
        Multi = false,
        Default = 1,
        Callback = function(p383)
            u379 = p383
        end,
    })

    local v388, v389, v390 = ipairs({
        {
            'FOVSizeSlider2',
            'FOV Size',
            100,
            0,
            900,
            0,
            function(p384)
                u378 = p384
            end,
        },
        {
            'SmoothnessSlider2',
            'Smoothness',
            5,
            0,
            20,
            1,
            function(p385)
                u377 = p385
            end,
        },
        {
            'PredictionStrengthXSlider2',
            'Prediction Strength X',
            0,
            0,
            1,
            2,
            function(p386)
                u332 = p386
            end,
        },
        {
            'PredictionStrengthYSlider2',
            'Prediction Strength Y',
            0,
            0,
            1,
            2,
            function(p387)
                u333 = p387
            end,
        },
    })

    while true do
        local v391

        v390, v391 = v388(v389, v390)

        if v390 == nil then
            break
        end

        u67.AimTab:AddSlider(v391[1], {
            Title = v391[2],
            Default = v391[3],
            Min = v391[4],
            Max = v391[5],
            Rounding = v391[6],
            Callback = v391[7],
        })
    end

    _RunService5.RenderStepped:Connect(v364)
    _RunService5.RenderStepped:Connect(v367)
end

InitializeAimbot2()

function InitializeAimbotUI2()
    local v397, v398, v399 = ipairs({
        {
            'EnableAimbot2',
            'Enable Aimbot',
            false,
            function(p392)
                aimbotEnabled2 = p392
            end,
        },
        {
            'ShowFOV2',
            'Show FOV',
            false,
            function(p393)
                showFOV2 = p393
            end,
        },
        {
            'Smoothness2',
            'Smoothness',
            false,
            function(p394)
                aimbotSmoothnessEnabled2 = p394
            end,
        },
        {
            'EnablePrediction2',
            'Enable Prediction',
            false,
            function(p395)
                aimbotPredictionEnabled2 = p395
            end,
        },
        {
            'StickyAim2',
            'Sticky Aim',
            false,
            function(p396)
                aimbotStickyAimEnabled2 = p396
            end,
        },
    })

    while true do
        local v400

        v399, v400 = v397(v398, v399)

        if v399 == nil then
            break
        end

        u67.AimTab:AddToggle(v400[1], {
            Title = v400[2],
            Default = v400[3],
        }):OnChanged(v400[4])
    end

    u67.AimTab:AddKeybind('Keybind2', {
        Title = 'Keybind',
        Mode = 'Toggle',
        Default = 'MouseButton2',
        ChangedCallback = function(p401)
            if p401 == Enum.KeyCode.Unknown then
                p401 = Enum.UserInputType.MouseButton2 or p401
            end

            aimbotKeybind2 = p401
        end,
    })
    u67.AimTab:AddDropdown('AimAtDropdown2', {
        Title = 'Aim focus',
        Values = {
            'Head',
            'UpperTorso',
            'LowerTorso',
        },
        Multi = false,
        Default = 1,
        Callback = function(p402)
            aimbotAimPart2 = p402
        end,
    })

    local v405, v406, v407 = ipairs({
        {
            'FovSizeSlider2',
            'FOV Size',
            100,
            0,
            900,
            0,
            function(p403)
                aimbotFOVSize2 = p403
            end,
        },
        {
            'SmoothnessSlider2',
            'Smoothness',
            5,
            0,
            10,
            1,
            function(p404)
                aimbotSmoothness2 = p404
            end,
        },
    })

    while true do
        local v408

        v407, v408 = v405(v406, v407)

        if v407 == nil then
            break
        end

        u67.AimTab:AddSlider(v408[1], {
            Title = v408[2],
            Default = v408[3],
            Min = v408[4],
            Max = v408[5],
            Rounding = v408[6],
            Callback = v408[7],
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

        local v415 = _UserInputService2

        SilentAimFov.Circle.Position = v415:GetMouseLocation()
    end
end
function GetClosestTargetToMouse()
    local v416 = _UserInputService2:GetMouseLocation()
    local _huge2 = math.huge
    local v418 = _Players5
    local v419, v420, v421 = pairs(v418:GetPlayers())
    local v422 = nil

    while true do
        local v423

        v421, v423 = v419(v420, v421)

        if v421 == nil then
            break
        end
        if v423 ~= _LocalPlayer6 and v423.Character and v423.Character:FindFirstChild('HumanoidRootPart') then
            local _HumanoidRootPart6 = v423.Character:FindFirstChild('HumanoidRootPart')

            if _HumanoidRootPart6 and not _HumanoidRootPart6:FindFirstChild('TeammateLabel') then
                local v425 = v423.Character:FindFirstChild(SilentAim.TargetPart)

                if v425 and (v425.Position - _Workspace.CurrentCamera.CFrame.Position).Magnitude <= SilentAim.MaxDistance then
                    local v426, v427 = _Workspace.CurrentCamera:WorldToViewportPoint(v425.Position)

                    if v427 then
                        local _Magnitude4 = (Vector2.new(v426.X, v426.Y) - v416).Magnitude

                        if _Magnitude4 < SilentAimFov.Radius then
                            if _Magnitude4 < _huge2 then
                                v422 = v425
                                _huge2 = _Magnitude4
                            end
                        end
                    end
                end
            end
        end
    end

    local v429 = _Workspace
    local v430, v431, v432 = pairs(v429:GetChildren())

    while true do
        local v433

        v432, v433 = v430(v431, v432)

        if v432 == nil then
            break
        end
        if v433:IsA('Model') and v433:FindFirstChild('HumanoidRootPart') and v433.Name == 'Target' then
            local v434 = v433:FindFirstChild(SilentAim.TargetPart) or v433:FindFirstChild('HumanoidRootPart')

            if v434 and (v434.Position - _Workspace.CurrentCamera.CFrame.Position).Magnitude <= SilentAim.MaxDistance then
                local v435, v436 = _Workspace.CurrentCamera:WorldToViewportPoint(v434.Position)

                if v436 then
                    local _Magnitude5 = (Vector2.new(v435.X, v435.Y) - v416).Magnitude

                    if _Magnitude5 < SilentAimFov.Radius then
                        if _Magnitude5 < _huge2 then
                            v422 = v434
                            _huge2 = _Magnitude5
                        end
                    end
                end
            end
        end
    end

    return v422
end
function LookAt(p438)
    _Workspace.CurrentCamera.CFrame = CFrame.lookAt(_Workspace.CurrentCamera.CFrame.Position, p438.Position)
end
function SilentAimUIS(p439, p440)
    if not p440 and (SilentAim.Enabled and getgenv().state == 2) and (p439.UserInputType == Enum.UserInputType.MouseButton1 and math.random(0, 100) <= SilentAim.HitChance) then
        local v441 = GetClosestTargetToMouse()

        if v441 ~= nil then
            if SilentAim.NotWorkIfFlashed and _Lighting:FindFirstChild('Flashbang') then
                return
            end

            LookAt(v441)
        end
    end
end

_RunService6.RenderStepped:Connect(function()
    UpdateFov()
end)
_UserInputService2.InputBegan:Connect(SilentAimUIS)
DrawFov()
u67.Silent:AddParagraph({
    Title = 'Please get Szoo client for better experince.',
    Content = ' \u{25cf} Currently Safe to use\n \u{25cf} If not use Szoo autoclicker client then do taptap to connect.',
})

local _SAimtgl = u67.Silent:AddToggle('SAimtgl', {
    Title = 'Silent Aim [V1] [Safe]',
    Description = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} Spam click to make it work\n\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} This is safe to use',
    Default = false,
})
local _Fovtgl = u67.Silent:AddToggle('Fovtgl', {
    Title = 'Show FOV',
    Default = false,
})
local v444 = _SAimtgl

_SAimtgl.OnChanged(v444, function()
    if textLabels and textLabels.silentaim then
        textLabels.silentaim.Visible = _Options.SAimtgl.Value
    end

    SilentAim.Enabled = _SAimtgl.Value
end)

local v445 = _Fovtgl

_Fovtgl.OnChanged(v445, function()
    SilentAimFov.Visible = _Fovtgl.Value
end)
u67.Silent:AddSlider('SFovSlider', {
    Title = 'Silent Fov Radius',
    Description = 'Adjust the FOV Radius',
    Default = 150,
    Min = 50,
    Max = 900,
    Rounding = 0,
    Callback = function(p446)
        SilentAimFov.Radius = p446

        if SilentAimFov.Circle then
            SilentAimFov.Circle.Radius = p446
        end
    end,
})
u67.Silent:AddColorpicker('SFovColorpicker', {
    Title = 'Fov Color',
    Default = Color3.fromRGB(96, 205, 255),
}):OnChanged(function(p447)
    SilentAimFov.Color = p447

    if SilentAimFov.Circle then
        SilentAimFov.Circle.Color = p447
    end
end)
u67.Silent:AddDropdown('TargetpartDropdown', {
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
}):OnChanged(function(p448)
    if p448 == 'Legit' then
        SilentAim.TargetPart = math.random(1, 2) == 1 and 'Head' or 'UpperTorso'
    else
        SilentAim.TargetPart = p448
    end
end)

function a4()
    u67.Gunmod:AddSection('Custom Hit Sound')
    u67.Gunmod:AddSection('HeadShot Sound')

    local u449 = {
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
    local v450, v451, v452 = pairs(u449)
    local u453 = {}
    local v454 = 'rbxassetid://16537337310'
    local v455 = 'rbxassetid://9119561046'
    local v456 = 'rbxassetid://13110130082'
    local v457 = 'rbxassetid://8726881116'

    while true do
        local v458

        v452, v458 = v450(v451, v452)

        if v452 == nil then
            break
        end

        table.insert(u453, v452)
    end

    local function v475(p459, p460, p461, p462, p463)
        u67.Gunmod:AddDropdown(p460, {
            Title = 'Choose Hit Sound',
            Values = u453,
            Multi = false,
            Default = 1,
        }):OnChanged(function(p464)
            p462[1] = u449[p464] or p462[1]
        end)

        local u465 = nil

        u67.Gunmod:AddToggle(p459, {
            Title = p463,
            Default = false,
        }):OnChanged(function(p466)
            if u465 then
                u465:Disconnect()
            end
            if p466 then
                local _ClientViewModel = game:GetService('Players').LocalPlayer:WaitForChild('PlayerScripts'):WaitForChild('Modules'):WaitForChild('ClientReplicatedClasses'):WaitForChild('ClientFighter'):WaitForChild('ClientItem'):WaitForChild('ClientViewModel')

                local function v470(p468)
                    if p468:IsA('Sound') and p468.SoundId == p461 then
                        p468:Stop()

                        local _Sound = Instance.new('Sound', p468.Parent)

                        _Sound.SoundId = p462[1]

                        _Sound:Play()
                        _Sound.Ended:Wait()
                        _Sound:Destroy()
                    end
                end

                u465 = _ClientViewModel.ChildAdded:Connect(v470)

                local v471, v472, v473 = pairs(_ClientViewModel:GetChildren())

                while true do
                    local v474

                    v473, v474 = v471(v472, v473)

                    if v473 == nil then
                        break
                    end

                    v470(v474)
                end
            end
        end)
    end

    v475('CSP1', 'SoundSelector1', v454, {v455}, 'Headshot sound')
    u67.Gunmod:AddSection('Bodyshot Sound')
    v475('CSP2', 'SoundSelector2', v456, {v457}, 'Bodyshot sound')

    local u476 = {
        aLqz = false,
        eJdF = Color3.fromRGB(255, 255, 255),
        rQdT = 1.5,
        pJwT = 2,
    }
    local u477 = {
        ['Lightning Bolt'] = 'rbxassetid://12781806168',
        ['Lightning Bolt2'] = 'rbxassetid://7151778302',
        Laser = 'rbxassetid://5864341017',
        ['Red Laser'] = 'rbxassetid://6333823534',
        DNA = 'rbxassetid://6511613786',
    }
    local u478 = 'Lightning Bolt'
    local u479 = {
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
    local v482 = _LocalPlayer7
    local u483 = _LocalPlayer7.GetMouse(v482)

    local function u490(p484, p485)
        if u476.aLqz then
            task.spawn(function()
                local _Part = Instance.new('Part')

                _Part.Name = 'BulletTracerPart'
                _Part.CanCollide = false
                _Part.Anchored = true
                _Part.Transparency = 1
                _Part.Parent = workspace

                local _Attachment = Instance.new('Attachment', _Part)

                _Attachment.Position = p484.Position

                local _Attachment2 = Instance.new('Attachment', _Part)

                _Attachment2.Position = p485

                local _Beam = Instance.new('Beam', _Part)

                _Beam.Attachment0 = _Attachment
                _Beam.Attachment1 = _Attachment2
                _Beam.TextureSpeed = 2
                _Beam.Color = ColorSequence.new(u476.eJdF)
                _Beam.Width0 = u476.pJwT
                _Beam.Width1 = u476.pJwT
                _Beam.Texture = u477[u478]

                wait(u476.rQdT)
                _Part:Destroy()
            end)
        end
    end
    local function u497(p491)
        if p491 and p491:IsA('Sound') then
            local v492, v493, v494 = ipairs(u479)

            while true do
                local v495

                v494, v495 = v492(v493, v494)

                if v494 == nil then
                    break
                end
                if p491.SoundId == v495 then
                    local _Character3 = _LocalPlayer7.Character

                    if _Character3 then
                        _Character3 = _LocalPlayer7.Character:FindFirstChild('HumanoidRootPart')
                    end
                    if _Character3 then
                        u490(_Character3, u483.Hit.Position)
                    end

                    break
                end
            end
        end
    end

    u67.Gunmod:AddSection('Bullet Trails')

    local _btrc = u67.Gunmod:AddToggle('btrc', {
        Title = 'Bullet Tracer',
        Default = false,
    })
    local v499 = _btrc

    _btrc.OnChanged(v499, function()
        u476.aLqz = _btrc.Value
    end)
    u67.Gunmod:AddDropdown('BTDropdown', {
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
    }):OnChanged(function(p500)
        u478 = p500
    end)
    u67.Gunmod:AddSlider('BTL', {
        Title = 'BulletTracerLifetime',
        Default = 1.5,
        Min = 0,
        Max = 20,
        Rounding = 0.1,
    }):OnChanged(function(p501)
        u476.rQdT = p501
    end)
    u67.Gunmod:AddSlider('BTT', {
        Title = 'BulletTracerThickness',
        Default = 2,
        Min = 0,
        Max = 20,
        Rounding = 0.1,
    }):OnChanged(function(p502)
        u476.pJwT = p502
    end)
    u67.Gunmod:AddColorpicker('BTCol', {
        Title = 'BulletTracerColor',
        Default = Color3.fromRGB(255, 255, 255),
    }):OnChanged(function(p503)
        u476.eJdF = p503
    end)
    _Players6[game:GetService('Players').LocalPlayer.Name].PlayerScripts.Modules.ClientReplicatedClasses.ClientFighter.ClientItem.ChildAdded:Connect(function(p504)
        if p504.Name == 'Sound' then
            u497(p504)
        end
    end)
end

a4()

local _RunService7 = game:GetService('RunService')
local _LocalPlayer8 = _Players5.LocalPlayer
local _CurrentCamera6 = _Workspace.CurrentCamera
local u508 = nil
local u509 = false
local u510 = true
local u511 = 350
local u512 = false
local u513 = false

local function u519(p514)
    if not (p514 and p514:FindFirstChild('HumanoidRootPart')) then
        return false
    end

    local _Position2 = _CurrentCamera6.CFrame.Position
    local _Position3 = p514.HumanoidRootPart.Position
    local v517 = RaycastParams.new()

    v517.FilterType = Enum.RaycastFilterType.Blacklist
    v517.FilterDescendantsInstances = {
        _LocalPlayer8.Character,
        _CurrentCamera6,
    }

    local v518 = _Workspace:Raycast(_Position2, _Position3 - _Position2, v517)

    return v518 == nil and true or v518.Instance:IsDescendantOf(p514)
end
local function u521(p520)
    if p520 and p520:FindFirstChild('Humanoid') then
        return p520.Humanoid.Health > 0
    else
        return false
    end
end
local function u523(p522)
    if p522.Character and p522.Character:FindFirstChild('HumanoidRootPart') then
        return p522.Character.HumanoidRootPart:FindFirstChild('TeammateLabel') ~= nil
    else
        return false
    end
end
local function u526()
    if u512 and (getgenv().state == 2 and u508) and (u508.Character and u508.Character:FindFirstChild('HumanoidRootPart')) then
        local _Character4 = _LocalPlayer8.Character

        if _Character4 and _Character4:FindFirstChild('HumanoidRootPart') then
            local v525 = _Character4.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)

            u508.Character.HumanoidRootPart.CFrame = v525
        end
    end
end
local function u532(p527, p528)
    if p528 and p528:FindFirstChild('HumanoidRootPart') then
        local v529 = _CurrentCamera6:WorldToViewportPoint(p528.HumanoidRootPart.Position)

        if v529.Z <= 0 then
            p527.Visible = false
        else
            local v530 = Vector2.new(_CurrentCamera6.ViewportSize.X / 2, _CurrentCamera6.ViewportSize.Y)
            local v531 = Vector2.new(v529.X, v529.Y)

            p527.Color = u519(p528) and Color3.new(1, 0, 0) or Color3.new(0, 0, 1)
            p527.From = v530
            p527.To = v531
            p527.Visible = u513 and true or false
        end
    else
        p527.Visible = false
    end
end
local function u544()
    local _huge3 = math.huge
    local v534 = Vector2.new(_CurrentCamera6.ViewportSize.X / 2, _CurrentCamera6.ViewportSize.Y / 2)
    local v535 = _Players5
    local v536, v537, v538 = pairs(v535:GetPlayers())
    local v539 = nil

    while true do
        local v540

        v538, v540 = v536(v537, v538)

        if v538 == nil then
            break
        end
        if v540 ~= _LocalPlayer8 and v540.Character and (v540.Character:FindFirstChild('HumanoidRootPart') and not u523(v540)) then
            local _Position4 = v540.Character.HumanoidRootPart.Position

            if (_LocalPlayer8.Character.HumanoidRootPart.Position - _Position4).Magnitude <= u511 and u521(v540.Character) then
                local v542 = _CurrentCamera6:WorldToViewportPoint(_Position4)

                if v542.Z > 0 then
                    local _Magnitude6 = (Vector2.new(v542.X, v542.Y) - v534).Magnitude

                    if _Magnitude6 < _huge3 then
                        v539 = v540
                        _huge3 = _Magnitude6
                    end
                end
            end
        end
    end

    return v539
end

local u546 = (function()
    local _Line = Drawing.new('Line')

    _Line.Thickness = 2
    _Line.Transparency = 1
    _Line.Visible = false

    return _Line
end)()

_RunService7.RenderStepped:Connect(function()
    local v547 = u544()

    if u508 then
        u532(u546, u508.Character)

        if u509 and u510 then
            u526()
        end
    elseif v547 and v547.Character then
        u532(u546, v547.Character)
    else
        u546.Visible = false
    end
end)
_UserInputService2.InputBegan:Connect(function(p548, p549)
    if not p549 then
        if p548.UserInputType == Enum.UserInputType.MouseButton1 then
            local v550 = u544()

            if v550 and u519(v550.Character) then
                if u510 then
                    u509 = true
                    u508 = v550
                else
                    u508 = v550

                    u526()

                    u508 = nil
                end
            end
        end
    end
end)
_UserInputService2.InputEnded:Connect(function(p551)
    if p551.UserInputType == Enum.UserInputType.MouseButton1 and u510 then
        u509 = false
        u508 = nil
    end
end)
u67.Nono:AddToggle('kde', {
    Title = 'Melee damage timeout',
    Description = 'Will increase meele damge times, so u can hit more damage with it.',
    Default = false,
}):OnChanged(function() end)
u67.Nono:AddToggle('wallbang', {
    Title = 'Wallbang',
    Description = 'Shoot through walls.',
    Default = false,
}):OnChanged(function(p552)
    if p552 then
        u65:Notify({
            Title = 'Notification',
            Content = 'Not for you to use!',
            SubContent = 'Only for certain users.',
            Duration = 5,
        })
        wait(1)
        _Options.wallbang:SetValue(false)
    end
end)
u67.Nono:AddToggle('Dp', {
    Title = 'Player Drag',
    Description = 'Use this if youre facing cheaters, hold Left Mouse button, it will drag player to you if player is visible.',
    Default = false,
}):OnChanged(function()
    if textLabels and textLabels.tline then
        textLabels.dpaint.Visible = _Options.Dp.Value
    end

    u512 = _Options.Dp.Value
    u513 = _Options.Dp.Value
end)

speedsect = u67.Nono:AddSection('Speed')

local _LocalPlayer9 = game:GetService('Players').LocalPlayer
local _RunService8 = game:GetService('RunService')

getgenv().Multiplier = 0.2

local u555 = false
local u556 = nil

local function u560()
    u556 = _RunService8.Stepped:Connect(function()
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
local function u561()
    if u556 then
        u556:Disconnect()

        u556 = nil
    end
end

local _SpeedBoost = u67.Nono:AddToggle('SpeedBoost', {
    Title = 'CFrame Speed v2',
    Default = false,
})
local v563 = _SpeedBoost

_SpeedBoost.OnChanged(v563, function()
    if textLabels and textLabels.bspeed then
        textLabels.bspeed.Visible = _SpeedBoost.Value
    end

    u555 = _SpeedBoost.Value

    if u555 then
        u560()
    else
        u561()
    end
end)
u67.Nono:AddSlider('MultiplierSlider', {
    Title = 'Speed Limit',
    Description = 'Adjust speed multiplier (1 = 0.1, 5 = 0.5, etc.)',
    Default = 2,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Callback = function(p564)
        getgenv().Multiplier = p564 / 10
    end,
}):OnChanged(function(p565)
    getgenv().Multiplier = p565 / 10
end)
u67.Nono:AddSection('Gun Mods [Level 8 executor needed]')

local function u572(p566, p567)
    local v568, v569, v570 = pairs(getgc(true))

    while true do
        local v571

        v570, v571 = v568(v569, v570)

        if v570 == nil then
            break
        end
        if type(v571) == 'table' and rawget(v571, p566) then
            v571[p566] = p567
        end
    end
end

if u67 and u67.Nono then
    u67.Nono:AddButton({
        Title = 'Rapid Fire',
        Description = 'Fire Rapidly, but wont work in xeno or solara.',
        Callback = function()
            u572('ShootCooldown', 0)
        end,
    })
    u67.Nono:AddButton({
        Title = 'No Spread',
        Description = 'Bullet Will not spray, but wont work in xeno or solara.',
        Callback = function()
            u572('ShootSpread', 0)
        end,
    })
    u67.Nono:AddButton({
        Title = 'NO Recoil',
        Description = 'Stops the recoil, but wont work in xeno or solara. Ive mead another no recoil use that.',
        Callback = function()
            u572('ShootRecoil', 0)
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
eww = u67.Nono:AddSection('Enemy Slider')

local _SlideEnm = u67.Nono:AddToggle('SlideEnm', {
    Title = 'Slide to enemy',
    Description = 'Slides to players behind.',
    Default = false,
})
local v575 = _SlideEnm

_SlideEnm.OnChanged(v575, function() end)

Keybind = u67.Nono:AddKeybind('Keybind', {
    Title = 'KeyBind',
    Mode = 'Toggle',
    Default = 'N',
    Callback = function(p576)
        isKeyPressed = p576
    end,
    ChangedCallback = function(p577)
        keybindKey = p577
    end,
})

function getClosestPlayerToScreenCenter()
    local v578 = nil
    local _huge4 = math.huge
    local v580 = Vector2.new(_CurrentCamera2.ViewportSize.X / 2, _CurrentCamera2.ViewportSize.Y / 2)
    local _Character7 = _LocalPlayer8.Character

    if _Character7 then
        _Character7 = _Character7:FindFirstChild('HumanoidRootPart')
    end
    if not _Character7 then
        return nil
    end

    local v582 = _Players7
    local v583, v584, v585 = ipairs(v582:GetPlayers())

    while true do
        local v586

        v585, v586 = v583(v584, v585)

        if v585 == nil then
            break
        end
        if v586 ~= _LocalPlayer8 and v586.Character and v586.Character:FindFirstChild('HumanoidRootPart') then
            local _HumanoidRootPart7 = v586.Character.HumanoidRootPart

            if (_HumanoidRootPart7.Position - _Character7.Position).Magnitude <= 350 then
                local v588, v589 = _CurrentCamera2:WorldToViewportPoint(_HumanoidRootPart7.Position)

                if v589 then
                    local _Magnitude7 = (Vector2.new(v588.X, v588.Y) - v580).Magnitude

                    if _Magnitude7 < _huge4 then
                        v578 = v586
                        _huge4 = _Magnitude7
                    end
                end
            end
        end
    end

    if v578 then
        u65:Notify({
            Title = 'Slide Notification',
            Content = 'Teleporting to: ' .. v578.Name,
            SubContent = 'Closest player identified',
            Duration = 2,
        })
    else
        u65:Notify({
            Title = 'Slide Notification',
            Content = 'No valid player found to teleport to.',
            SubContent = 'Please try again later.',
            Duration = 2,
        })
    end

    return v578
end
function moveToBackAbovePlayer(p591)
    local _HumanoidRootPart8 = p591.Character.HumanoidRootPart
    local _HumanoidRootPart9 = _LocalPlayer8.Character.HumanoidRootPart

    moveConnection = _RunService8.RenderStepped:Connect(function()
        if isMoving then
            local v594 = _HumanoidRootPart8.Position - _HumanoidRootPart8.CFrame.LookVector * tweenDistanceBehind + Vector3.new(0, tweenDistanceAbove, 0)
            local _unit = (v594 - _HumanoidRootPart9.Position).unit

            if (v594 - _HumanoidRootPart9.Position).magnitude <= 0 then
                _HumanoidRootPart9.CFrame = CFrame.new(v594)
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

_UserInputService2.InputBegan:Connect(function(p596, p597)
    if not p597 then
        local v598 = _SlideEnm.Value and p596.KeyCode == keybindKey and not isMoving and getClosestPlayerToScreenCenter()

        if v598 then
            isMoving = true

            moveToBackAbovePlayer(v598)
        end
        if p596.KeyCode ~= Enum.KeyCode.Up then
            if p596.KeyCode ~= Enum.KeyCode.Down then
                if p596.KeyCode ~= Enum.KeyCode.Right then
                    if p596.KeyCode == Enum.KeyCode.Left then
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
_UserInputService2.InputEnded:Connect(function(p599)
    if p599.KeyCode == keybindKey then
        stopMoving()
    end
end)

local _LocalPlayer10 = game:GetService('Players').LocalPlayer
local _MuzzleFlashes = _LocalPlayer10.PlayerScripts.Assets:WaitForChild('Misc'):WaitForChild('MuzzleFlashes')
local _Default = _MuzzleFlashes:FindFirstChild('Default')

if _Default then
    local v603 = _Default:Clone()

    v603.Name = 'Muzzle Flash Original'
    v603.Parent = _MuzzleFlashes
end

u67.Skinz:AddDropdown('MuzzleFlashDropdown', {
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
}):OnChanged(function(p604)
    local v605 = _MuzzleFlashes:FindFirstChild('Default') or _MuzzleFlashes:FindFirstChild('Muzzle Flash Original')

    if v605 then
        v605:Destroy()
    end
    if p604 == 'None' then
        local _MuzzleFlashOriginal = _MuzzleFlashes:FindFirstChild('Muzzle Flash Original')

        if _MuzzleFlashOriginal then
            local v607 = _MuzzleFlashOriginal:Clone()

            v607.Parent = _MuzzleFlashes
            v607.Name = 'Default'
        end
    else
        local v608 = _MuzzleFlashes:FindFirstChild(p604)

        if v608 then
            local v609 = v608:Clone()

            v609.Parent = _MuzzleFlashes
            v609.Name = 'Default'
        end
    end
end)

local _Misc = _LocalPlayer10.PlayerScripts.Assets:WaitForChild('Misc')
local _BurningEffects = _Misc:WaitForChild('BurningEffects')
local _FireHitboxes = _Misc:WaitForChild('FireHitboxes')
local _Default2 = _BurningEffects:FindFirstChild('Default')

if _Default2 then
    local v614 = _Default2:Clone()

    v614.Name = 'Burning Effect Original'
    v614.Parent = _BurningEffects
end

local _Default3 = _FireHitboxes:FindFirstChild('Default')

if _Default3 then
    local v616 = _Default3:Clone()

    v616.Name = 'Fire Hitbox Original'
    v616.Parent = _FireHitboxes
end

u67.Skinz:AddDropdown('FireEffectDropdown', {
    Title = 'Moltov Fire ',
    Values = {
        'None',
        'Hexxed Candle [Purple]',
    },
    Multi = false,
    Default = 1,
}):OnChanged(function(p617)
    local v618 = _BurningEffects:FindFirstChild('Default') or _BurningEffects:FindFirstChild('Burning Effect Original')
    local v619 = _FireHitboxes:FindFirstChild('Default') or _FireHitboxes:FindFirstChild('Fire Hitbox Original')

    if v618 then
        v618:Destroy()
    end
    if v619 then
        v619:Destroy()
    end
    if p617 == 'Hexxed Candle' then
        local _HexxedCandle = _BurningEffects:FindFirstChild('Hexxed Candle')
        local _HexxedCandle2 = _FireHitboxes:FindFirstChild('Hexxed Candle')

        if _HexxedCandle then
            local v622 = _HexxedCandle:Clone()

            v622.Name = 'Default'
            v622.Parent = _BurningEffects
        end
        if _HexxedCandle2 then
            local v623 = _HexxedCandle2:Clone()

            v623.Name = 'Default'
            v623.Parent = _FireHitboxes
        end
    else
        local _BurningEffectOriginal = _BurningEffects:FindFirstChild('Burning Effect Original')
        local _FireHitboxOriginal = _FireHitboxes:FindFirstChild('Fire Hitbox Original')

        if _BurningEffectOriginal then
            local v626 = _BurningEffectOriginal:Clone()

            v626.Name = 'Default'
            v626.Parent = _BurningEffects
        end
        if _FireHitboxOriginal then
            local v627 = _FireHitboxOriginal:Clone()

            v627.Name = 'Default'
            v627.Parent = _FireHitboxes
        end
    end
end)
u67.Skinz:AddSection('Gun Skin')

local _LocalPlayer11 = game:GetService('Players').LocalPlayer
local _Assets = _LocalPlayer11.PlayerScripts.Assets
local _ViewModels = _Assets:WaitForChild('ViewModels')
local _Throwables = _Assets:WaitForChild('Throwables')
local u632 = {
    'Festive Skin Case',
    'Other',
    'Skin Case',
    'Skin Case 2',
    'Spooky Skin Case',
}

local function v637(p633, p634, p635)
    if p633 then
        local v636 = p633:Clone()

        v636.Name = p635
        v636.Parent = p634
    end
end
local function u647(p638, p639)
    local v640 = p639:FindFirstChild(p638)

    if v640 then
        return v640
    end
    if p639 == _ViewModels then
        local v641, v642, v643 = ipairs(u632)

        while true do
            local v644

            v643, v644 = v641(v642, v643)

            if v643 == nil then
                break
            end

            local v645 = _ViewModels:FindFirstChild(v644)

            if v645 then
                local v646 = v645:FindFirstChild(p638)

                if v646 then
                    return v646
                end
            end
        end
    end

    return nil
end
local function u655(p648, p649, p650, p651)
    local v652 = p650:FindFirstChild(p648)

    if v652 then
        v652:Destroy()
    end

    local v653 = u647(p649 == 'None' and p651 and p651 or p649, p650)

    if v653 then
        local v654 = v653:Clone()

        v654.Name = p648
        v654.Parent = p650
    end
end
local function v661(p656, p657, p658, p659)
    u67.Skinz:AddDropdown(p656 .. 'Dropdown', {
        Title = p657,
        Values = p658,
        Multi = false,
        Default = 1,
    }):OnChanged(function(p660)
        u655(p656, p660, p659, p656 .. ' Original')
    end)
end

local v662, v663, v664 = ipairs({
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
local u665 = _CoreGui2
local u666 = u655
local v667 = _RunService8
local u668 = _Workspace
local u669 = _ViewModels

while true do
    local v670, v671 = v662(v663, v664)

    if v670 == nil then
        break
    end

    v664 = v670

    local v672 = u669:FindFirstChild(v671[1])

    if v672 then
        v637(v672, u669, v671[2])
        v661(v671[1], v671[1], v671[3], u669)
    end
end

v637(u669:FindFirstChild('Grenade'), u669, 'Grenade Original')
v637(_Throwables:FindFirstChild('Grenade'), _Throwables, 'Grenade Original')
v637(u669:FindFirstChild('Molotov'), u669, 'Molotov Original')
v637(_Throwables:FindFirstChild('Molotov'), _Throwables, 'Molotov Original')
v661('Grenade', 'Grenade', {
    'None',
    'Whoopee Cushion',
    'Water Balloon',
    'Soul Grenade',
}, u669)
v661('Molotov', 'Molotov', {
    'None',
    'Coffee',
    'Hexxed Candle',
    'Torch',
}, u669)
v637(u669:FindFirstChild('Scythe'), u669, 'Scythe Original')
v637(_Throwables:FindFirstChild('Scythe'), _Throwables, 'Scythe Original')
u67.Skinz:AddDropdown('ScytheDropdown', {
    Title = 'Scythe',
    Values = {
        'None',
        'Keythe',
        'Anchor',
    },
    Multi = false,
    Default = 1,
}):OnChanged(function(p673)
    u666('Scythe', p673, u669, 'Scythe Original')
    u666('Scythe', p673, _Throwables, 'Scythe Original')
end)

local _Throwables2 = _LocalPlayer11.PlayerScripts.Assets:WaitForChild('Throwables')
local _SmokeClouds = _LocalPlayer11.PlayerScripts.Assets.Misc.SmokeClouds

local function u680(p676, p677, p678)
    if p676 then
        local v679 = p676:Clone()

        v679.Name = p678
        v679.Parent = p677
    end
end
local function u684(p681, p682)
    local v683 = p681:FindFirstChild(p682)

    if v683 then
        v683:Destroy()
    end
end

u680(u669:FindFirstChild('Smoke Grenade'), u669, 'Smoke Grenade Original')

local v685 = _Throwables2

u680(_Throwables2.FindFirstChild(v685, 'Smoke Grenade'), _Throwables2, 'Smoke Grenade Original')

local v686 = _SmokeClouds

u680(_SmokeClouds.FindFirstChild(v686, 'Default'), _SmokeClouds, 'Smoke Grenade Original')
u67.Skinz:AddDropdown('SmokeGrenadeDropdown', {
    Title = 'Smoke Grenade ',
    Values = {
        'None',
        'Eyeball',
        'Balance',
    },
    Multi = false,
    Default = 3,
}):OnChanged(function(p687)
    u684(u669, 'Smoke Grenade')
    u684(u669, 'Smoke Grenade Original')
    u684(_Throwables2, 'Smoke Grenade')
    u684(_Throwables2, 'Smoke Grenade Original')
    u684(_SmokeClouds, 'Default')
    u684(_SmokeClouds, 'Smoke Grenade Original')

    local v688 = p687 == 'None' and ('Smoke Grenade Original' or p687) or p687

    u680(u669:FindFirstChild(v688), u669, 'Smoke Grenade')
    u680(_Throwables2:FindFirstChild(v688), _Throwables2, 'Smoke Grenade')
    u680(_SmokeClouds:FindFirstChild(v688), _SmokeClouds, 'Default')
end)

function InitializeAimbotSystem3()
    local _Workspace2 = game:GetService('Workspace')
    local _UserInputService3 = game:GetService('UserInputService')
    local _Lighting2 = game:GetService('Lighting')
    local _Players8 = game:GetService('Players')
    local _RunService9 = game:GetService('RunService')
    local _LocalPlayer12 = _Players8.LocalPlayer
    local u695 = {
        Enabled = false,
        HitChance = 100,
        NotWorkIfFlashed = true,
    }
    local u696 = false
    local u697 = nil
    local _MouseButton22 = Enum.UserInputType.MouseButton2

    local function u712()
        local v699 = _UserInputService3:GetMouseLocation()
        local _huge5 = math.huge
        local v701 = _Players8
        local v702, v703, v704 = pairs(v701:GetPlayers())
        local v705 = nil

        while true do
            local v706

            v704, v706 = v702(v703, v704)

            if v704 == nil then
                break
            end

            local _Character8 = v706.Character
            local _Character9 = v706.Character

            if _Character9 then
                _Character9 = v706.Character:FindFirstChild('HumanoidRootPart')
            end
            if v706 ~= _LocalPlayer12 and _Character8 and (_Character9 and not _Character9:FindFirstChild('TeammateLabel')) then
                local v709, v710 = _Workspace2.CurrentCamera:WorldToViewportPoint(_Character9.Position)
                local v711 = v710 and (Vector2.new(v709.X, v709.Y) - v699).Magnitude or math.huge

                if v711 < _huge5 then
                    v705 = v706
                    _huge5 = v711
                end
            end
        end

        return v705
    end
    local function u715(p713)
        local _Character10 = p713.Character

        if _Character10 then
            _Character10 = p713.Character:FindFirstChild('Head')
        end

        return _Character10
    end
    local function u717(p716)
        _Workspace2.CurrentCamera.CFrame = CFrame.lookAt(_Workspace2.CurrentCamera.CFrame.Position, p716.Position)
    end
    local function u719()
        u697 = u712()

        while u696 and (u695.Enabled and u697) do
            if getgenv().state ~= 2 then
                u696 = false

                return
            end

            local v718 = (math.random(0, 100) <= u695.HitChance and not (u695.NotWorkIfFlashed and _Lighting2:FindFirstChild('Flashbang')) and true or false) and u715(u697)

            if v718 then
                u717(v718)
            end

            _RunService9.RenderStepped:Wait()
        end
    end

    _UserInputService3.InputBegan:Connect(function(p720, p721)
        if not p721 and (p720.KeyCode == _MouseButton22 or p720.UserInputType == _MouseButton22) then
            u696 = true

            task.spawn(u719)
        end
    end)
    _UserInputService3.InputEnded:Connect(function(p722)
        if p722.KeyCode == _MouseButton22 or p722.UserInputType == _MouseButton22 then
            u697 = nil
            u696 = false
        end
    end)

    cas = u67.AimTab:AddSection('Camera Aimbot')

    u67.AimTab:AddKeybind('CamAimKeybind3', {
        Title = 'Cam lock KeyBind',
        Mode = 'Toggle',
        Default = 'MouseRight',
        Callback = function(_) end,
        ChangedCallback = function(p723)
            _MouseButton22 = p723
        end,
    })

    local _CamToggle3 = u67.AimTab:AddToggle('CamToggle3', {
        Title = 'Cam Aimbo',
        Description = '\u{25cf} No Detection\n\u{25cf} Less Missfire',
        Default = false,
    })
    local v725 = _CamToggle3

    _CamToggle3.OnChanged(v725, function()
        if textLabels and textLabels.textLabel3 then
            textLabels.textLabel3.Visible = _Options.CamToggle3.Value

            fadeText(textLabels.textLabel3, _Options.CamToggle3.Value)
            alignTextLabels()
        end

        u695.Enabled = _CamToggle3.Value
    end)

    local _AimMob3 = u67.AimTab:AddToggle('AimMob3', {
        Title = 'Mobile Aimbot',
        Description = 'For Mobile, also works on computer. Set FOV to 120. (Must)',
        Default = false,
    })
    local v727 = _AimMob3

    _AimMob3.OnChanged(v727, function()
        getgenv().MobileAimbot = _AimMob3.Value
    end)
end

InitializeAimbotSystem3()

local _TbotToggle = u67.AimTab:AddToggle('TbotToggle', {
    Title = 'Triggerbot',
    Description = 'Auto shoots when enemy on point.',
    Default = false,
})
local _LocalPlayer13 = game:GetService('Players').LocalPlayer
local _CurrentCamera7 = u668.CurrentCamera
local u731 = false

_TbotToggle:OnChanged(function()
    u731 = _Options.TbotToggle.Value
end)

local function u738()
    local _Position5 = _CurrentCamera7.CFrame.Position
    local v733 = _CurrentCamera7.CFrame.LookVector * 1000
    local v734 = RaycastParams.new()
    local _Blacklist = Enum.RaycastFilterType.Blacklist

    v734.FilterDescendantsInstances = {
        _LocalPlayer13.Character,
    }
    v734.FilterType = _Blacklist

    local v736 = workspace:Raycast(_Position5, v733, v734)

    if v736 then
        v736 = v736.Instance:FindFirstAncestorOfClass('Model')
    end

    local v737 = v736 and v736:FindFirstChild('Humanoid')

    if v737 then
        v737 = v736.Name ~= _LocalPlayer13.Name
    end

    return v737
end

v667.RenderStepped:Connect(function()
    if u731 and (getgenv().state == 2 and u738()) then
        mouse1click()
    end
end)

mas = u67.AimTab:AddSection('Mouse Aimbot')

function InitializeAimbot2()
    local u739 = false
    local _MouseButton23 = Enum.UserInputType.MouseButton2
    local u741 = 'Head'
    local u742 = 100
    local u743 = 5
    local u744 = false
    local u745 = false
    local u746 = 0
    local u747 = 0
    local u748 = false
    local u749 = false
    local u750 = nil
    local _RunService10 = game:GetService('RunService')
    local _UserInputService4 = game:GetService('UserInputService')
    local _Players9 = game:GetService('Players')
    local _LocalPlayer14 = _Players9.LocalPlayer
    local _CurrentCamera8 = workspace.CurrentCamera

    local function u767()
        local v756 = u742
        local v757 = Vector2.new(_CurrentCamera8.ViewportSize.X / 2, _CurrentCamera8.ViewportSize.Y / 2)
        local v758 = _Players9
        local v759, v760, v761 = pairs(v758:GetPlayers())
        local v762 = nil

        while true do
            local v763

            v761, v763 = v759(v760, v761)

            if v761 == nil then
                break
            end
            if v763 ~= _LocalPlayer14 and v763.Character and v763.Character:FindFirstChild(u741) then
                local v764, v765 = _CurrentCamera8:WorldToViewportPoint(v763.Character[u741].Position)

                if v765 then
                    local _Magnitude8 = (Vector2.new(v764.X, v764.Y) - v757).Magnitude

                    if _Magnitude8 < v756 then
                        v762 = v763
                        v756 = _Magnitude8
                    end
                end
            end
        end

        return v762
    end
    local function v778()
        if u739 then
            if getgenv().state == 2 then
                if _MouseButton23 ~= Enum.UserInputType.MouseButton2 then
                    if not _UserInputService4:IsKeyDown(_MouseButton23) then
                        u750 = nil

                        return
                    end
                elseif not _UserInputService4:IsMouseButtonPressed(_MouseButton23) then
                    u750 = nil

                    return
                end
                if u750 and u748 and u750.Character and u750.Character:FindFirstChild(u741) then
                    local v768 = _CurrentCamera8:WorldToViewportPoint(u750.Character[u741].Position)
                    local v769 = Vector2.new(v768.X, v768.Y)
                    local v770 = Vector2.new(_CurrentCamera8.ViewportSize.X / 2, _CurrentCamera8.ViewportSize.Y / 2)
                    local v771 = v769 - v770
                    local v772 = Vector2.new(v770.X + v771.X / (u743 + 1), v770.Y + v771.Y / (u743 + 1)) - Vector2.new(_CurrentCamera8.ViewportSize.X / 2, _CurrentCamera8.ViewportSize.Y / 2)

                    mousemoverel(v772.X, v772.Y)
                else
                    u750 = u767()

                    if u750 then
                        local v773 = _CurrentCamera8:WorldToViewportPoint(u750.Character[u741].Position)
                        local v774 = Vector2.new(v773.X, v773.Y)
                        local v775 = Vector2.new(_CurrentCamera8.ViewportSize.X / 2, _CurrentCamera8.ViewportSize.Y / 2)
                        local v776 = v774 - v775
                        local v777 = Vector2.new(v775.X + v776.X / (u743 + 1), v775.Y + v776.Y / (u743 + 1)) - Vector2.new(_CurrentCamera8.ViewportSize.X / 2, _CurrentCamera8.ViewportSize.Y / 2)

                        mousemoverel(v777.X, v777.Y)
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

    local function v781()
        if u749 then
            local v780 = _UserInputService4:GetMouseLocation()

            _Circle4.Radius = u742
            _Circle4.Position = Vector2.new(v780.X, v780.Y)
            _Circle4.Visible = true
        else
            _Circle4.Visible = false
        end
    end

    local v787 = {
        {
            'EnableAimbot2',
            'Enable',
            false,
            function(p782)
                u739 = p782
            end,
        },
        {
            'ShowFOVCheckbox2',
            'Show FOV',
            false,
            function(p783)
                u749 = p783
            end,
        },
        {
            'SmoothnessCheckbox2',
            'Smoothness',
            false,
            function(p784)
                u744 = p784
            end,
        },
        {
            'EnablePrediction2',
            'Enable Prediction',
            false,
            function(p785)
                u745 = p785
            end,
        },
        {
            'StickyAimCheckbox2',
            'Sticky Aim',
            false,
            function(p786)
                u748 = p786
            end,
        },
    }
    local v788, v789, v790 = ipairs(v787)
    local u791 = u743
    local u792 = u742
    local u793 = u741
    local u794 = _MouseButton23

    while true do
        local v795

        v790, v795 = v788(v789, v790)

        if v790 == nil then
            break
        end

        u67.AimTab:AddToggle(v795[1], {
            Title = v795[2],
            Default = v795[3],
        }):OnChanged(v795[4])
    end

    u67.AimTab:AddKeybind('Keybind2', {
        Title = 'Keybind',
        Mode = 'Toggle',
        Default = 'MouseButton2',
        ChangedCallback = function(p796)
            if p796 == Enum.KeyCode.Unknown then
                p796 = Enum.UserInputType.MouseButton2 or p796
            end

            u794 = p796
        end,
    })
    u67.AimTab:AddDropdown('AimPartDropDown2', {
        Title = 'Aim At',
        Values = {
            'Head',
            'UpperTorso',
            'LowerTorso',
        },
        Multi = false,
        Default = 1,
        Callback = function(p797)
            u793 = p797
        end,
    })

    local v802, v803, v804 = ipairs({
        {
            'FOVSizeSlider2',
            'FOV Size',
            100,
            0,
            900,
            0,
            function(p798)
                u792 = p798
            end,
        },
        {
            'SmoothnessSlider2',
            'Smoothness',
            5,
            0,
            20,
            1,
            function(p799)
                u791 = p799
            end,
        },
        {
            'PredictionStrengthXSlider2',
            'Prediction Strength X',
            0,
            0,
            1,
            2,
            function(p800)
                u746 = p800
            end,
        },
        {
            'PredictionStrengthYSlider2',
            'Prediction Strength Y',
            0,
            0,
            1,
            2,
            function(p801)
                u747 = p801
            end,
        },
    })

    while true do
        local v805

        v804, v805 = v802(v803, v804)

        if v804 == nil then
            break
        end

        u67.AimTab:AddSlider(v805[1], {
            Title = v805[2],
            Default = v805[3],
            Min = v805[4],
            Max = v805[5],
            Rounding = v805[6],
            Callback = v805[7],
        })
    end

    _RunService10.RenderStepped:Connect(v778)
    _RunService10.RenderStepped:Connect(v781)
end

InitializeAimbot2()

function InitializeAimbotUI2()
    local v811, v812, v813 = ipairs({
        {
            'EnableAimbot2',
            'Enable Aimbot',
            false,
            function(p806)
                aimbotEnabled2 = p806
            end,
        },
        {
            'ShowFOV2',
            'Show FOV',
            false,
            function(p807)
                showFOV2 = p807
            end,
        },
        {
            'Smoothness2',
            'Smoothness',
            false,
            function(p808)
                aimbotSmoothnessEnabled2 = p808
            end,
        },
        {
            'EnablePrediction2',
            'Enable Prediction',
            false,
            function(p809)
                aimbotPredictionEnabled2 = p809
            end,
        },
        {
            'StickyAim2',
            'Sticky Aim',
            false,
            function(p810)
                aimbotStickyAimEnabled2 = p810
            end,
        },
    })

    while true do
        local v814

        v813, v814 = v811(v812, v813)

        if v813 == nil then
            break
        end

        u67.AimTab:AddToggle(v814[1], {
            Title = v814[2],
            Default = v814[3],
        }):OnChanged(v814[4])
    end

    u67.AimTab:AddKeybind('Keybind2', {
        Title = 'Keybind',
        Mode = 'Toggle',
        Default = 'MouseButton2',
        ChangedCallback = function(p815)
            if p815 == Enum.KeyCode.Unknown then
                p815 = Enum.UserInputType.MouseButton2 or p815
            end

            aimbotKeybind2 = p815
        end,
    })
    u67.AimTab:AddDropdown('AimAtDropdown2', {
        Title = 'Aim At',
        Values = {
            'Head',
            'UpperTorso',
            'LowerTorso',
        },
        Multi = false,
        Default = 1,
        Callback = function(p816)
            aimbotAimPart2 = p816
        end,
    })

    local v819, v820, v821 = ipairs({
        {
            'FovSizeSlider2',
            'FOV Size',
            100,
            0,
            900,
            0,
            function(p817)
                aimbotFOVSize2 = p817
            end,
        },
        {
            'SmoothnessSlider2',
            'Smoothness',
            5,
            0,
            10,
            1,
            function(p818)
                aimbotSmoothness2 = p818
            end,
        },
    })

    while true do
        local v822

        v821, v822 = v819(v820, v821)

        if v821 == nil then
            break
        end

        u67.AimTab:AddSlider(v822[1], {
            Title = v822[2],
            Default = v822[3],
            Min = v822[4],
            Max = v822[5],
            Rounding = v822[6],
            Callback = v822[7],
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

        local v829 = _UserInputService5

        SilentAimFov.Circle.Position = v829:GetMouseLocation()
    end
end
function GetClosestTargetToMouse()
    local v830 = _UserInputService5:GetMouseLocation()
    local _huge6 = math.huge
    local v832 = _Players10
    local v833, v834, v835 = pairs(v832:GetPlayers())
    local v836 = nil

    while true do
        local v837

        v835, v837 = v833(v834, v835)

        if v835 == nil then
            break
        end
        if v837 ~= _LocalPlayer15 and v837.Character and v837.Character:FindFirstChild('HumanoidRootPart') then
            local _HumanoidRootPart10 = v837.Character:FindFirstChild('HumanoidRootPart')

            if _HumanoidRootPart10 and not _HumanoidRootPart10:FindFirstChild('TeammateLabel') then
                local v839 = v837.Character:FindFirstChild(SilentAim.TargetPart)

                if v839 and (v839.Position - u668.CurrentCamera.CFrame.Position).Magnitude <= SilentAim.MaxDistance then
                    local v840, v841 = u668.CurrentCamera:WorldToViewportPoint(v839.Position)

                    if v841 then
                        local _Magnitude9 = (Vector2.new(v840.X, v840.Y) - v830).Magnitude

                        if _Magnitude9 < SilentAimFov.Radius then
                            if _Magnitude9 < _huge6 then
                                v836 = v839
                                _huge6 = _Magnitude9
                            end
                        end
                    end
                end
            end
        end
    end

    local v843 = u668
    local v844, v845, v846 = pairs(v843:GetChildren())

    while true do
        local v847

        v846, v847 = v844(v845, v846)

        if v846 == nil then
            break
        end
        if v847:IsA('Model') and v847:FindFirstChild('HumanoidRootPart') and v847.Name == 'Target' then
            local v848 = v847:FindFirstChild(SilentAim.TargetPart) or v847:FindFirstChild('HumanoidRootPart')

            if v848 and (v848.Position - u668.CurrentCamera.CFrame.Position).Magnitude <= SilentAim.MaxDistance then
                local v849, v850 = u668.CurrentCamera:WorldToViewportPoint(v848.Position)

                if v850 then
                    local _Magnitude10 = (Vector2.new(v849.X, v849.Y) - v830).Magnitude

                    if _Magnitude10 < SilentAimFov.Radius then
                        if _Magnitude10 < _huge6 then
                            v836 = v848
                            _huge6 = _Magnitude10
                        end
                    end
                end
            end
        end
    end

    return v836
end
function LookAt(p852)
    u668.CurrentCamera.CFrame = CFrame.lookAt(u668.CurrentCamera.CFrame.Position, p852.Position)
end
function SilentAimUIS(p853, p854)
    if not p854 and (SilentAim.Enabled and getgenv().state == 2) and (p853.UserInputType == Enum.UserInputType.MouseButton1 and math.random(0, 100) <= SilentAim.HitChance) then
        local v855 = GetClosestTargetToMouse()

        if v855 ~= nil then
            if SilentAim.NotWorkIfFlashed and _Lighting3:FindFirstChild('Flashbang') then
                return
            end

            LookAt(v855)
        end
    end
end

_RunService11.RenderStepped:Connect(function()
    UpdateFov()
end)
_UserInputService5.InputBegan:Connect(SilentAimUIS)
DrawFov()
u67.Silent:AddParagraph({
    Title = 'Please get Szoo client for better experince.',
    Content = ' \u{25cf} Currently Safe to use\n \u{25cf} If not use Szoo autoclicker client then do taptap to connect.',
})

local _SAimtgl2 = u67.Silent:AddToggle('SAimtgl', {
    Title = 'Silent Aim [Safe]',
    Description = 'Spam click to make it work\nThis is safe to use',
    Default = false,
})
local _Fovtgl2 = u67.Silent:AddToggle('Fovtgl', {
    Title = 'Show FOV',
    Default = false,
})
local v858 = _SAimtgl2

_SAimtgl2.OnChanged(v858, function()
    if textLabels and textLabels.silentaim then
        textLabels.silentaim.Visible = _Options.SAimtgl.Value

        fadeText(textLabels.silentaim, _Options.SAimtgl.Value)
        alignTextLabels()
    end

    SilentAim.Enabled = _SAimtgl2.Value
end)

local v859 = _Fovtgl2

_Fovtgl2.OnChanged(v859, function()
    SilentAimFov.Visible = _Fovtgl2.Value
end)
u67.Silent:AddSlider('SFovSlider', {
    Title = 'Silent Fov Radius',
    Description = 'Adjust the FOV Radius',
    Default = 150,
    Min = 50,
    Max = 900,
    Rounding = 0,
    Callback = function(p860)
        SilentAimFov.Radius = p860

        if SilentAimFov.Circle then
            SilentAimFov.Circle.Radius = p860
        end
    end,
})
u67.Silent:AddColorpicker('SFovColorpicker', {
    Title = 'Fov Color',
    Default = Color3.fromRGB(96, 205, 255),
}):OnChanged(function(p861)
    SilentAimFov.Color = p861

    if SilentAimFov.Circle then
        SilentAimFov.Circle.Color = p861
    end
end)
u67.Silent:AddDropdown('TargetpartDropdown', {
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
}):OnChanged(function(p862)
    if p862 == 'Legit' then
        SilentAim.TargetPart = math.random(1, 2) == 1 and 'Head' or 'UpperTorso'
    else
        SilentAim.TargetPart = p862
    end
end)

local _RunService12 = game:GetService('RunService')
local _LocalPlayer16 = _Players10.LocalPlayer
local _CurrentCamera9 = u668.CurrentCamera
local u866 = nil
local u867 = false
local u868 = true
local u869 = 350
local u870 = false
local u871 = false

local function u877(p872)
    if not (p872 and p872:FindFirstChild('HumanoidRootPart')) then
        return false
    end

    local _Position6 = _CurrentCamera9.CFrame.Position
    local _Position7 = p872.HumanoidRootPart.Position
    local v875 = RaycastParams.new()

    v875.FilterType = Enum.RaycastFilterType.Blacklist
    v875.FilterDescendantsInstances = {
        _LocalPlayer16.Character,
        _CurrentCamera9,
    }

    local v876 = u668:Raycast(_Position6, _Position7 - _Position6, v875)

    return v876 == nil and true or v876.Instance:IsDescendantOf(p872)
end
local function u879(p878)
    if p878 and p878:FindFirstChild('Humanoid') then
        return p878.Humanoid.Health > 0
    else
        return false
    end
end
local function u881(p880)
    if p880.Character and p880.Character:FindFirstChild('HumanoidRootPart') then
        return p880.Character.HumanoidRootPart:FindFirstChild('TeammateLabel') ~= nil
    else
        return false
    end
end
local function u884()
    if u870 and (getgenv().state == 2 and u866) and (u866.Character and u866.Character:FindFirstChild('HumanoidRootPart')) then
        local _Character11 = _LocalPlayer16.Character

        if _Character11 and _Character11:FindFirstChild('HumanoidRootPart') then
            local v883 = _Character11.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)

            u866.Character.HumanoidRootPart.CFrame = v883
        end
    end
end
local function u890(p885, p886)
    if p886 and p886:FindFirstChild('HumanoidRootPart') then
        local v887 = _CurrentCamera9:WorldToViewportPoint(p886.HumanoidRootPart.Position)

        if v887.Z <= 0 then
            p885.Visible = false
        else
            local v888 = Vector2.new(_CurrentCamera9.ViewportSize.X / 2, _CurrentCamera9.ViewportSize.Y)
            local v889 = Vector2.new(v887.X, v887.Y)

            p885.Color = u877(p886) and Color3.new(1, 0, 0) or Color3.new(0, 0, 1)
            p885.From = v888
            p885.To = v889
            p885.Visible = u871 and true or false
        end
    else
        p885.Visible = false
    end
end
local function u902()
    local _huge7 = math.huge
    local v892 = Vector2.new(_CurrentCamera9.ViewportSize.X / 2, _CurrentCamera9.ViewportSize.Y / 2)
    local v893 = _Players10
    local v894, v895, v896 = pairs(v893:GetPlayers())
    local v897 = nil

    while true do
        local v898

        v896, v898 = v894(v895, v896)

        if v896 == nil then
            break
        end
        if v898 ~= _LocalPlayer16 and v898.Character and (v898.Character:FindFirstChild('HumanoidRootPart') and not u881(v898)) then
            local _Position8 = v898.Character.HumanoidRootPart.Position

            if (_LocalPlayer16.Character.HumanoidRootPart.Position - _Position8).Magnitude <= u869 and u879(v898.Character) then
                local v900 = _CurrentCamera9:WorldToViewportPoint(_Position8)

                if v900.Z > 0 then
                    local _Magnitude11 = (Vector2.new(v900.X, v900.Y) - v892).Magnitude

                    if _Magnitude11 < _huge7 then
                        v897 = v898
                        _huge7 = _Magnitude11
                    end
                end
            end
        end
    end

    return v897
end

local u904 = (function()
    local _Line2 = Drawing.new('Line')

    _Line2.Thickness = 2
    _Line2.Transparency = 1
    _Line2.Visible = false

    return _Line2
end)()

_RunService12.RenderStepped:Connect(function()
    local v905 = u902()

    if u866 then
        u890(u904, u866.Character)

        if u867 and u868 then
            u884()
        end
    elseif v905 and v905.Character then
        u890(u904, v905.Character)
    else
        u904.Visible = false
    end
end)
_UserInputService5.InputBegan:Connect(function(p906, p907)
    if not p907 then
        if p906.UserInputType == Enum.UserInputType.MouseButton1 then
            local v908 = u902()

            if v908 and u877(v908.Character) then
                if u868 then
                    u867 = true
                    u866 = v908
                else
                    u866 = v908

                    u884()

                    u866 = nil
                end
            end
        end
    end
end)
_UserInputService5.InputEnded:Connect(function(p909)
    if p909.UserInputType == Enum.UserInputType.MouseButton1 and u868 then
        u867 = false
        u866 = nil
    end
end)
u67.Nono:AddToggle('Dp', {
    Title = 'Player Drag',
    Description = 'Use this if youre facing cheaters, hold Left Mouse button, it will drag player to you if player is visible.',
    Default = false,
}):OnChanged(function()
    if textLabels and textLabels.tline then
        textLabels.dpaint.Visible = _Options.Dp.Value

        fadeText(textLabels.dpaint, _Options.Dp.Value)
        alignTextLabels()
    end

    u870 = _Options.Dp.Value
    u871 = _Options.Dp.Value
end)

speedsect = u67.Nono:AddSection('Speed')

local _LocalPlayer17 = game:GetService('Players').LocalPlayer
local _RunService13 = game:GetService('RunService')

getgenv().Multiplier = 0.2

local u912 = false
local u913 = nil

local function u917()
    u913 = _RunService13.Stepped:Connect(function()
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
local function u918()
    if u913 then
        u913:Disconnect()

        u913 = nil
    end
end

local _SpeedBoost2 = u67.Nono:AddToggle('SpeedBoost', {
    Title = 'CFrame Speed v2',
    Default = false,
})
local v920 = _SpeedBoost2

_SpeedBoost2.OnChanged(v920, function()
    if textLabels and textLabels.bspeed then
        textLabels.bspeed.Visible = _SpeedBoost2.Value

        fadeText(textLabels.bspeed, _SpeedBoost2.Value)
        alignTextLabels()
    end

    u912 = _SpeedBoost2.Value

    if u912 then
        u917()
    else
        u918()
    end
end)
u67.Nono:AddSlider('MultiplierSlider', {
    Title = 'Speed Limit',
    Description = 'Adjust speed multiplier (1 = 0.1, 5 = 0.5, etc.)',
    Default = 2,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Callback = function(p921)
        getgenv().Multiplier = p921 / 10
    end,
}):OnChanged(function(p922)
    getgenv().Multiplier = p922 / 10
end)

function jx4n8rqzpvmc2y5kt(p923)
    local v924, v925, v926 = ipairs(p923)
    local v927 = ''

    while true do
        local v928

        v926, v928 = v924(v925, v926)

        if v926 == nil then
            break
        end

        v927 = v927 .. (v928 == 32 and ' ' or string.char(v928))
    end

    return v927
end

u67.Nono:AddSection('Gun Mods [Level 8 executor needed]')

local function u935(p929, p930)
    local v931, v932, v933 = pairs(getgc(true))

    while true do
        local v934

        v933, v934 = v931(v932, v933)

        if v933 == nil then
            break
        end
        if type(v934) == 'table' and rawget(v934, p929) then
            v934[p929] = p930
        end
    end
end

if u67 and u67.Nono then
    u67.Nono:AddButton({
        Title = 'Rapid Fire',
        Description = 'Fire Rapidly, but wont work in xeno or solara.',
        Callback = function()
            u935('ShootCooldown', 0)
        end,
    })
    u67.Nono:AddButton({
        Title = 'No Spread',
        Description = 'Bullet Will not spray, but wont work in xeno or solara.',
        Callback = function()
            u935('ShootSpread', 0)
        end,
    })
    u67.Nono:AddButton({
        Title = 'NO Recoil',
        Description = 'Stops the recoil, but wont work in xeno or solara. Ive mead another no recoil use that.',
        Callback = function()
            u935('ShootRecoil', 0)
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
eww = u67.Nono:AddSection('Enemy Slider')

local _SlideEnm2 = u67.Nono:AddToggle('SlideEnm', {
    Title = 'Slide to enemy',
    Description = 'Slides to players behind.',
    Default = false,
})
local v938 = _SlideEnm2

_SlideEnm2.OnChanged(v938, function() end)

Keybind = u67.Nono:AddKeybind('Keybind', {
    Title = 'KeyBind',
    Mode = 'Toggle',
    Default = 'N',
    Callback = function(p939)
        isKeyPressed = p939
    end,
    ChangedCallback = function(p940)
        keybindKey = p940
    end,
})

function getClosestPlayerToScreenCenter()
    local v941 = nil
    local _huge8 = math.huge
    local v943 = Vector2.new(_CurrentCamera2.ViewportSize.X / 2, _CurrentCamera2.ViewportSize.Y / 2)
    local _Character14 = _LocalPlayer16.Character

    if _Character14 then
        _Character14 = _Character14:FindFirstChild('HumanoidRootPart')
    end
    if not _Character14 then
        return nil
    end

    local v945 = _Players11
    local v946, v947, v948 = ipairs(v945:GetPlayers())

    while true do
        local v949

        v948, v949 = v946(v947, v948)

        if v948 == nil then
            break
        end
        if v949 ~= _LocalPlayer16 and v949.Character and v949.Character:FindFirstChild('HumanoidRootPart') then
            local _HumanoidRootPart11 = v949.Character.HumanoidRootPart

            if (_HumanoidRootPart11.Position - _Character14.Position).Magnitude <= 350 then
                local v951, v952 = _CurrentCamera2:WorldToViewportPoint(_HumanoidRootPart11.Position)

                if v952 then
                    local _Magnitude12 = (Vector2.new(v951.X, v951.Y) - v943).Magnitude

                    if _Magnitude12 < _huge8 then
                        v941 = v949
                        _huge8 = _Magnitude12
                    end
                end
            end
        end
    end

    if v941 then
        u65:Notify({
            Title = 'Slide Notification',
            Content = 'Teleporting to: ' .. v941.Name,
            SubContent = 'Closest player identified',
            Duration = 2,
        })
    else
        u65:Notify({
            Title = 'Slide Notification',
            Content = 'No valid player found to teleport to.',
            SubContent = 'Please try again later.',
            Duration = 2,
        })
    end

    return v941
end
function moveToBackAbovePlayer(p954)
    local _HumanoidRootPart12 = p954.Character.HumanoidRootPart
    local _HumanoidRootPart13 = _LocalPlayer16.Character.HumanoidRootPart

    moveConnection = _RunService13.RenderStepped:Connect(function()
        if isMoving then
            local v957 = _HumanoidRootPart12.Position - _HumanoidRootPart12.CFrame.LookVector * tweenDistanceBehind + Vector3.new(0, tweenDistanceAbove, 0)
            local _unit2 = (v957 - _HumanoidRootPart13.Position).unit

            if (v957 - _HumanoidRootPart13.Position).magnitude <= 0 then
                _HumanoidRootPart13.CFrame = CFrame.new(v957)
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

_UserInputService5.InputBegan:Connect(function(p959, p960)
    if not p960 then
        local v961 = _SlideEnm2.Value and p959.KeyCode == keybindKey and not isMoving and getClosestPlayerToScreenCenter()

        if v961 then
            isMoving = true

            moveToBackAbovePlayer(v961)
        end
        if p959.KeyCode ~= Enum.KeyCode.Up then
            if p959.KeyCode ~= Enum.KeyCode.Down then
                if p959.KeyCode ~= Enum.KeyCode.Right then
                    if p959.KeyCode == Enum.KeyCode.Left then
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
_UserInputService5.InputEnded:Connect(function(p962)
    if p962.KeyCode == keybindKey then
        stopMoving()
    end
end)

local _DeviceDropdown = u67.Spoof:AddDropdown('DeviceDropdown', {
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
_DeviceDropdown:OnChanged(function(p964)
    local _SetControls = game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Replication'):WaitForChild('Fighter'):WaitForChild('SetControls')

    if p964 == 'Computer' then
        _SetControls:FireServer('MouseKeyboard')
    elseif p964 == 'Mobile' then
        _SetControls:FireServer('Touch')
    elseif p964 == 'Console' then
        _SetControls:FireServer('Gamepad')
    elseif p964 == 'VR' then
        _SetControls:FireServer('VR')
    end
end);
(function()
    local v966 = u665
    local v967, v968, v969 = ipairs(v966:GetDescendants())
    local v970 = nil

    while true do
        local v971

        v969, v971 = v967(v968, v969)

        if v969 == nil then
            v971 = v970

            break
        end
        if v971:IsA('TextLabel') and v971.Text == 'Are you winning son ?' then
            break
        end
    end

    if v971 and v971.Parent and (v971.Parent.Parent and v971.Parent.Parent.Parent) then
        local _ImageLabel3 = Instance.new('ImageLabel')

        _ImageLabel3.Size = UDim2.new(0, 460, 0, 260)
        _ImageLabel3.Position = UDim2.new(0.5, -150, 0, 0)
        _ImageLabel3.AnchorPoint = Vector2.new(0.5, 0)
        _ImageLabel3.Image = 'rbxassetid://15764946683'
        _ImageLabel3.BackgroundTransparency = 1
        _ImageLabel3.Parent = v971.Parent.Parent.Parent
    end
end)()

local v973, v974, v975 = ipairs(u665:GetDescendants())

while true do
    local v976

    v975, v976 = v973(v974, v975)

    if v975 == nil then
        break
    end
    if v976:IsA('ImageLabel') and v976.Image == 'rbxassetid://16686579408' then
        v976.Image = 'rbxassetid://16686579408'
        v976.Size = UDim2.new(0, 72, 0, 20)

        if v976.Parent then
            v976.Parent.Position = UDim2.new(1, -585, 0, 0)
        end

        break
    end
end

local _LocalPlayer18 = game:GetService('Players').LocalPlayer
local u978 = 'PlayerStats_' .. _LocalPlayer18.Name .. '.txt'
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

local function v986(p982, p983, p984)
    local _TextLabel3 = Instance.new('TextLabel')

    _TextLabel3.Size = UDim2.new(1, 0, 0, p984)
    _TextLabel3.Position = UDim2.new(0, 10, 0, p983)
    _TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel3.TextSize = 23
    _TextLabel3.Font = Enum.Font.Gotham
    _TextLabel3.FontFace = Font.new('rbxassetid://12187376174')
    _TextLabel3.TextStrokeTransparency = 1
    _TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
    _TextLabel3.BackgroundTransparency = 1
    _TextLabel3.RichText = true
    _TextLabel3.Parent = p982

    return _TextLabel3
end

v986(_Frame9, 5, 13).Text = '<font size="25"><b>Session Info</b></font>'

local u987 = v986(_Frame9, 25, 14)
local u988 = v986(_Frame9, 40, 14)
local u989 = v986(_Frame9, 55, 14)
local u990 = 0
local u991 = 0
local u992 = 0
local u993 = 0
local u994 = 0
local u995 = 0

local function v998()
    if isfile and isfile(u978) then
        local v996 = readfile(u978)
        local v997 = game:GetService('HttpService'):JSONDecode(v996)

        u993 = v997.Kills or 0
        u994 = v997.Assists or 0
        u995 = v997.Deaths or 0
    end
end
local function u1001()
    local v999 = {
        Kills = u993,
        Assists = u994,
        Deaths = u995,
    }
    local v1000 = game:GetService('HttpService'):JSONEncode(v999)

    if writefile then
        writefile(u978, v1000)
    end
end
local function u1002()
    u987.Text = 'Kills: ' .. u990 .. ' <font color=\'#86ff6b\'><font size="20" transparency="0.5">[<font color=\'#ffffff\'>' .. u993 .. '</font>]</font></font>'
    u988.Text = 'Assists: ' .. u991 .. ' <font color=\'#86ff6b\'><font size="20" transparency="0.5">[<font color=\'#ffffff\'>' .. u994 .. '</font>]</font></font>'
    u989.Text = 'Deaths: ' .. u992 .. ' <font color=\'#ff6b6b\'><font size="20" transparency="0.5">[<font color=\'#ffffff\'>' .. u995 .. '</font>]</font></font>'
end

v998()
u1002()
_LocalPlayer18.PlayerGui:WaitForChild('MainGui'):WaitForChild('MainFrame'):WaitForChild('FighterInterfaces'):WaitForChild(_LocalPlayer18.Name):WaitForChild('EliminationSlots').ChildAdded:Connect(function(p1003)
    local v1004 = p1003.Name == 'EliminationSlot' and p1003:FindFirstChildOfClass('TextLabel')

    if v1004 then
        local v1005 = v1004.Text:lower()

        if v1005:match('assist') then
            local v1006 = u991 + 1

            u994 = u994 + 1
            u991 = v1006
        elseif v1005:match('eliminated') then
            local v1007 = u990 + 1

            u993 = u993 + 1
            u990 = v1007
        end

        u1002()
        u1001()
    end
end)
_LocalPlayer18.CharacterAdded:Connect(function(p1008)
    p1008:WaitForChild('Humanoid').Died:Connect(function()
        local v1009 = u992 + 1

        u995 = u995 + 1
        u992 = v1009

        u1002()
        u1001()
    end)
end)
u67.Settings:AddToggle('sessoninfo', {
    Title = 'Session Info',
    Default = true,
}):OnChanged(function()
    _Frame9.Visible = _Options.sessoninfo.Value
end);
(function()
    local v1010 = getgenv().wapp .. 'raw/'
    local _LocalPlayer19 = game:GetService('Players').LocalPlayer
    local _leaderstats = _LocalPlayer19:WaitForChild('leaderstats')
    local _Value = _leaderstats:WaitForChild('Win Streak').Value
    local _Value2 = _leaderstats:WaitForChild('Level').Value
    local v1015 = os.time()
    local v1016 = {
        Url = v1010 .. '?name=' .. _LocalPlayer19.Name .. '&level=' .. _Value2 .. '&winstreak=' .. _Value .. '&time=' .. v1015,
        Method = 'GET',
    }
    local _ = request(v1016).StatusCode ~= 200
end)()
v40:SetLibrary(u65)
v41:SetLibrary(u65)
v40:IgnoreThemeSettings()
v40:SetIgnoreIndexes({})
v41:SetFolder('FluentScriptHub')
v40:SetFolder('FluentScriptHub/specific-game')
v41:BuildInterfaceSection(u67.Settings)
v40:BuildConfigSection(u67.Settings)
v60:SelectTab(1)
u65:Notify({
    Title = 'Fluent',
    Content = 'The script has been loaded.',
    Duration = 8,
})
v40:LoadAutoloadConfig()

local _CoreGui4 = game:GetService('CoreGui')

local function u1029(p1018, p1019, p1020, p1021, p1022)
    local v1023, v1024, v1025 = ipairs(p1018:GetChildren())

    while true do
        local v1026

        v1025, v1026 = v1023(v1024, v1025)

        if v1025 == nil then
            break
        end
        if v1026:IsA('TextLabel') and v1026.Text == p1019 then
            local _Parent = v1026.Parent

            for _ = 1, p1022 - 1 do
                if _Parent then
                    _Parent = _Parent.Parent
                end
            end

            if _Parent then
                local _ImageLabel4 = Instance.new('ImageLabel')

                _ImageLabel4.Image = p1020
                _ImageLabel4.Size = p1021
                _ImageLabel4.Position = UDim2.new(0, 0, 0, 0)
                _ImageLabel4.BackgroundTransparency = 1
                _ImageLabel4.Parent = _Parent
            end

            return true
        end
        if #v1026:GetChildren() > 0 and u1029(v1026, p1019, p1020, p1021, p1022) then
            return true
        end
    end

    return false
end

local v1030 = {
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
local v1031, v1032, v1033 = ipairs(v1030)
local v1034 = u1029

while true do
    local v1035

    v1033, v1035 = v1031(v1032, v1033)

    if v1033 == nil then
        break
    end

    v1034(_CoreGui4, v1035.text, v1035.imageID, v1035.size, v1035.parentSearchLevel)
end

v60:Minimize()
print('success')
