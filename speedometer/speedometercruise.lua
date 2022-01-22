-- mph
local mph = 2.2369
-- kph
local kph = 3.6
-- cruise on
local cruise = false

function showText(text, x, y, r, g, b)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(1.3,1.3)
    SetTextOutline()
    SetTextColour(r, g, b, 255)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function notify(message)
    setTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        local speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*mph
        -- see if ped is in a vehicle
        if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            -- speedo
            if speed < 1 then
                showText("0", 0.80, 0.70, 155, 155, 155)
            elseif speed >=80 then
                showText(math.floor(speed), 0.80, 0.70, 185, 0, 0)
            else
                showText(math.floor(speed), 0.80, 0.70, 255, 255, 255)
            end

            -- cruise control
            if IsControlJustPressed(1, 246) then
                if cruise == false then 
                    cruise = true
                    local currentSpeed = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))) -- get speed
                    SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), currentSpeed) -- max speed is being done by cruise ctrl
                    notify("Cruise Enabled: " .. CurrentSpeed*mph .. " mph")
                elseif cruise == true then
                    cruise = false
                    SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0) -- reset speed
                    notify("Cruise Disabled.")
                end
            end
        end
    end
end)