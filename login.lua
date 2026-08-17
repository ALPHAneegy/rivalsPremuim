if getgenv().nrklvl ~= 3 then
    u1:Notify({
        Title = 'Loading...',
        Content = 'Preloading modules...',
        SubContent = '',
        Duration = 5,
    })

    task.wait(2)
    u1.Destroy()

    loadstring(game:HttpGet(
        'https://raw.githubusercontent.com/ALPHAneegy/rivalsPremuim/refs/heads/main/nan1.lua'
    ))()
else
    u1:Notify({
        Title = 'Oh no..',
        Content = 'For premium users only.',
        SubContent = '',
        Duration = 5,
    })
end
