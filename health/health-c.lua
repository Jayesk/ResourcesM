RegisterCommand("heal", function()
    SetEntityHealth(PlayerPedId(), 200)
    notify("~r~You have been healed.")
end)