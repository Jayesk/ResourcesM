Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        SetTrafficDensity(0.7)
        SetPedDensity(0.6)
    end
end)

function SetTrafficDensity(density)
    SetParkedVehicleDensityMultiplierThisFrame(density)
    SetVehicleDensityMultiplierThisFrame(density)
    SetRandomVehicleDensityMultiplierThisFrame(density)
end

function SetPedDensity(density)
    SetPedDensityMultiplierThisFrame(density)
    SetScenarioPedDensityMultiplierThisFrame(density)
end