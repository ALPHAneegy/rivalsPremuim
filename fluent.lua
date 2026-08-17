-- ts file was generated at discord.gg/25ms

game:GetService('Players')
game:GetService('HttpService')

local u1 = loadstring(game:HttpGet('https://raw.githubusercontent.com/perfectBlue0X/the-rivals/refs/heads/main/8bitfluent.lua'))()
local u2 = ''
local v3 = u1
local u4 = u1.CreateWindow(v3, {
    Title = '       Rivals',
    SubTitle = '',
    TabWidth = 160,
    Size = UDim2.fromOffset(650, 390),
    Acrylic = false,
    Theme = '8bit',
    MinimizeKey = Enum.KeyCode.LeftControl,
})
local v5 = {}
local v6 = u4

v5.KeySys = u4.AddTab(v6, {
    Title = '',
    Icon = 'circle',
})

v5.KeySys:AddInput('Input', {
    Title = 'Enter Key',
    Description = 'Enter Key Here',
    Default = '',
    Placeholder = 'Enter key\u{2026}',
    Numeric = false,
    Finished = false,
    Callback = function(p7)
        u2 = p7
    end,
})

local v8 = u4

u4.SelectTab(v8, 1)

local _HttpService = game:GetService('HttpService')
local u10 = game:GetService('RbxAnalyticsService'):GetClientId()

local function u34(p11)
    local v12 = 'https://work.ink/_api/v2/token/isValid/' .. p11

    print('Checking Server 1: ' .. v12)

    local u13 = http_request({
        Url = v12,
        Method = 'GET',
    })

    if u13 and u13.Body then
        local v14, v15 = pcall(function()
            return _HttpService:JSONDecode(u13.Body)
        end)

        if v14 and v15 then
            if v15.valid ~= false then
                if v15.valid == true and v15.info and (v15.info.expiresAfter and v15.info.linkId == 777453) then
                    local v16 = v15.info.expiresAfter - os.time() * 1000
                    local v17 = math.floor(v16 / 1000)
                    local v18 = math.floor(v17 / 86400)
                    local v19 = math.floor(v17 % 86400 / 3600)
                    local v20 = math.floor(v17 % 3600 / 60)
                    local v21 = v17 % 60
                    local v22 = {}

                    if v18 > 0 then
                        table.insert(v22, v18 .. ' days')
                    end
                    if v19 > 0 then
                        table.insert(v22, v19 .. ' hours')
                    end
                    if v20 > 0 then
                        table.insert(v22, v20 .. ' minutes')
                    end
                    if v21 > 0 then
                        table.insert(v22, v21 .. ' seconds')
                    end

                    return 'valid', 'Time left: ' .. table.concat(v22, ', ')
                end
                if v15.info and v15.info.linkId ~= 777453 then
                    return 'invalid_link'
                end
            else
                print('Key expired in Server 1. Checking Server 2...')
            end
        end
    else
        print('Server 1 did not respond properly. Checking Server 2...')
    end

    local v23 = 'https://dev-8bitsforya.pantheonsite.io/auth.php?key=' .. p11 .. '&hwid=' .. u10

    print('Checking Server 2: ' .. v23)

    local u24 = http_request({
        Url = v23,
        Method = 'GET',
    })

    if u24 and u24.Body then
        print('Server 2 response: ' .. u24.Body)

        local v25, v26 = pcall(function()
            return _HttpService:JSONDecode(u24.Body)
        end)

        if v25 and v26 then
            if v26.error == 'HWID mismatch' then
                u1:Notify({
                    Title = 'HWID Mismatch',
                    Content = "Your HWID doesn't match. Please contact support for assistance.",
                    SubContent = '',
                    Duration = 5,
                })

                return 'error', 'HWID mismatch'
            end
            if v26.key == p11 and v26.hwid == u10 then
                if v26.userlvl ~= 'free' then
                    if v26.userlvl ~= 'premium' then
                        if v26.userlvl == 'sponsor' then
                            getgenv().nrklvl = 1

                            u1:Notify({
                                Title = 'Thanks for Supporting Us',
                                Content = 'Thank you for investing in this project as a sponsor!',
                                SubContent = '',
                                Duration = 5,
                            })
                        end
                    else
                        getgenv().nrklvl = 2

                        u1:Notify({
                            Title = 'Thanks for Getting Premium',
                            Content = 'You have activated a premium key.',
                            SubContent = '',
                            Duration = 5,
                        })
                    end
                else
                    getgenv().nrklvl = 3

                    u1:Notify({
                        Title = 'Using Free Key',
                        Content = 'You are using a free key.',
                        SubContent = '',
                        Duration = 5,
                    })
                end

                local v27 = v26.expiry - os.time()
                local v28 = math.floor(v27)
                local v29 = math.floor(v28 / 86400)
                local v30 = math.floor(v28 % 86400 / 3600)
                local v31 = math.floor(v28 % 3600 / 60)
                local v32 = v28 % 60
                local v33 = {}

                if v29 > 0 then
                    table.insert(v33, v29 .. ' days')
                end
                if v30 > 0 then
                    table.insert(v33, v30 .. ' hours')
                end
                if v31 > 0 then
                    table.insert(v33, v31 .. ' minutes')
                end
                if v32 > 0 then
                    table.insert(v33, v32 .. ' seconds')
                end

                return 'valid', 'Time left: ' .. table.concat(v33, ', ')
            end
        else
            print('Failed to decode Server 2 response.')
        end
    else
        print('Failed to contact Server 2.')
    end

    return 'error'
end

v5.KeySys:AddButton({
    Title = 'Check Key',
    Description = 'Enter the key before pressing this button',
    Callback = function()
        u1:Notify({
            Title = 'Checking server...',
            Content = 'Validating key...',
            SubContent = '',
            Duration = 5,
        })

        local v35, v36 = u34(u2)

        if v35 == 'valid' then
            u1:Notify({
                Title = 'Success!',
                Content = 'Key is valid.',
                SubContent = '',
                Duration = 5,
            })
            u1:Notify({
                Title = 'Time Left',
                Content = v36,
                SubContent = '',
                Duration = 5,
            })
            writefile('8bit.txt', u2)
            wait(2)
            u4:Dialog({
                Title = 'Which Version you want to load?',
                Content = 'For now you can only use Full version, Lite will release soon.',
                Buttons = {
                    {
                        Title = 'Feather',
                        Callback = function()
                            u1:Notify({
                                Title = 'Loading...',
                                Content = 'Preloading modules...',
                                SubContent = '',
                                Duration = 5,
                            })
                            wait(2)
                            u1.Destroy()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/8bits4ya/rivals-v3/refs/heads/main/hopper.lua'))()
                        end,
                    },
                    {
                        Title = 'Full [Risky]',
                        Callback = function()
                            if getgenv().nrklvl ~= 3 then
                                u1:Notify({
                                    Title = 'Loading...',
                                    Content = 'Preloading modules...',
                                    SubContent = '',
                                    Duration = 5,
                                })
                                wait(2)
                                u1.Destroy()
                                loadstring(game:HttpGet('https://raw.githubusercontent.com/ALPHAneegy/rivalsPremuim/refs/heads/main/nan1.lua'))()
                            else
                                u1:Notify({
                                    Title = 'Oh no..',
                                    Content = 'For premium users only.',
                                    SubContent = '',
                                    Duration = 5,
                                })
                            end
                        end,
                    },
                },
            })
        elseif v35 == 'expired' then
            u1:Notify({
                Title = 'Error',
                Content = 'Key is expired.',
                SubContent = '',
                Duration = 5,
            })
        elseif v35 == 'invalid_link' then
            u1:Notify({
                Title = 'Error',
                Content = 'Invalid key linkId.',
                SubContent = 'Your key is not linked to the correct ID.',
                Duration = 5,
            })
        else
            u1:Notify({
                Title = 'Error',
                Content = 'Invalid key.',
                SubContent = '',
                Duration = 5,
            })
        end
    end,
})
v5.KeySys:AddButton({
    Title = 'Get Key',
    Description = 'Get Key from here',
    Callback = function()
        setclipboard('https://discord.gg/rQ38TCfw55')
    end,
})

local v37 = u4

u4.SelectTab(v37, 1)

local v38 = game:GetService('CoreGui'):GetDescendants()
local v39, v40, v41 = ipairs(v38)
local u42 = u34
local u43 = u1
local u44 = u4

while true do
    local v45, v46 = v39(v40, v41)

    if v45 == nil then
        break
    end

    v41 = v45

    if v46.Name == 'Icon' and v46:IsA('GuiObject') then
        local _Parent = v46.Parent

        if _Parent and _Parent:IsA('TextButton') and _Parent.Position == UDim2.new(1, -540, 0, 4) then
            v46.Size = UDim2.new(0, 28, 0, 28)

            break
        end
    end
end

local v48, v49, v50 = ipairs(v38)

while true do
    local v51

    v50, v51 = v48(v49, v50)

    if v50 == nil then
        break
    end
    if v51:IsA('ImageLabel') and v51.Image == 'rbxassetid://9968344105' then
        v51.Image = 'rbxassetid://130883588373523'
        v51.ScaleType = Enum.ScaleType.Fit
        v51.ImageTransparency = 0

        break
    end
end

local _CoreGui = game:GetService('CoreGui')

local function u54(p53)
    if p53 and p53:IsA('CanvasGroup') then
        p53.Position = UDim2.new(0, 20, 0, 94)
        p53.Size = UDim2.new(1, -30, 1, -102)
    end
end
local function v58(p55)
    local u57 = p55.Changed:Connect(function(p56)
        if p56 == 'Position' or p56 == 'Size' then
            u54(p55)
        end
    end)

    p55:GetPropertyChangedSignal('Position'):Connect(function()
        u54(p55)
        u57:Disconnect()
    end)
end

local v59, v60, v61 = ipairs(_CoreGui:GetChildren())
local v62 = u54

while true do
    local v63

    v61, v63 = v59(v60, v61)

    if v61 == nil then
        break
    end
    if v63:IsA('ScreenGui') then
        local v64, v65, v66 = ipairs(v63:GetDescendants())

        while true do
            local v67

            v66, v67 = v64(v65, v66)

            if v66 == nil then
                break
            end
            if v67:IsA('Frame') and v67.Size == UDim2.new(0, 160, 1, -66) then
                v67.Size = UDim2.new(0, 0, 1, -66)
            end
            if v67:IsA('CanvasGroup') then
                v62(v67)
                v58(v67)
            end
        end
    end
end

local u68 = pcall(function()
    return readfile('8bit.txt')
end) and readfile('8bit.txt')

if u68 then
    u44:Dialog({
        Title = 'Old Key Found',
        Content = 'Do you want to use the saved key?',
        Buttons = {
            {
                Title = 'Yes',
                Callback = function()
                    u43:Notify({
                        Title = 'Using Old Key',
                        Content = 'Validating old key...',
                        SubContent = '',
                        Duration = 5,
                    })

                    local v69, v70 = u42(u68)

                    if v69 == 'valid' then
                        u43:Notify({
                            Title = 'Success!',
                            Content = 'Old key is valid.',
                            SubContent = '',
                            Duration = 5,
                        })
                        u43:Notify({
                            Title = 'Time Left',
                            Content = v70,
                            SubContent = '',
                            Duration = 5,
                        })
                        wait(2)
                        u44:Dialog({
                            Title = 'Which Version you want to load?',
                            Content = 'For now you can only use Full version, Lite will release soon.',
                            Buttons = {
                                {
                                    Title = 'Feather',
                                    Callback = function()
                                        u43:Notify({
                                            Title = 'Loading...',
                                            Content = 'Preloading modules...',
                                            SubContent = '',
                                            Duration = 5,
                                        })
                                        wait(2)
                                        u43.Destroy()
                                        loadstring(game:HttpGet('https://raw.githubusercontent.com/8bits4ya/rivals-v3/refs/heads/main/hopper.lua'))()
                                    end,
                                },
                                {
                                    Title = 'Full [Risky]',
                                    Callback = function()
                                        if getgenv().nrklvl ~= 3 then
                                            u43:Notify({
                                                Title = 'Loading...',
                                                Content = 'Preloading modules...',
                                                SubContent = '',
                                                Duration = 5,
                                            })
                                            wait(2)
                                            u43.Destroy()
                                            loadstring(game:HttpGet('https://raw.githubusercontent.com/ALPHAneegy/rivalsPremuim/refs/heads/main/nan1.lua'))()
                                        else
                                            u43:Notify({
                                                Title = 'Oh no..',
                                                Content = 'For premium users only.',
                                                SubContent = '',
                                                Duration = 5,
                                            })
                                        end
                                    end,
                                },
                            },
                        })
                    else
                        u43:Notify({
                            Title = 'Error',
                            Content = 'Old key is invalid.',
                            SubContent = '',
                            Duration = 5,
                        })
                    end
                end,
            },
            {
                Title = 'No',
                Callback = function()
                    print('User declined to use old key.')
                end,
            },
        },
    })
end
