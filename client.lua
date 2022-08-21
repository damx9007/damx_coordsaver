local points = {}
local coords = {}
local isCollecting = false

function startCollecting()
    points = {}

    AddTextEntry('coordsCollecting', '~r~ [E] ~w~ Kordináta gyüjtése')

    Citizen.CreateThread(function() 
        while true do
        Citizen.Wait(0)

        if not isCollecting then 
            return
        end 

        BeginTextCommandDisplayHelp('coordsCollecting')
        EndTextCommandDisplayHelp(0, false, false, -1)

        if IsControlJustReleased(0, 38) then 
            
            local playerCoord = GetEntityCoords(PlayerPedId())
            local heading = GetEntityHeading(PlayerPedId())
            print(playerCoord)

            playerCoord = (playerCoord - vector3(0.0, 0.0, 0.98))

            table.insert(points, playerCoord)

            
            ESX.ShowNotification(playerCoord .. "mentve")

            TriggerEvent('chat:addMessage', {
                color       =   {255, 0, 0},
                multiline   =   true,
                args        =   {
                    "Kordináta mentése",
                    ("vector3(%s, %s, %s)  :::: heading: %s"):format(
                        ESX.Math.Round(playerCoord.x, 2),
                        ESX.Math.Round(playerCoord.y, 2),
                        ESX.Math.Round(playerCoord.z, 2),
                        ESX.Math.Round(heading, 2)
                    )
                }
            })
        end
    end
    end)

end

RegisterCommand("coordSaving", function() 
    if not isCollecting then 
        isCollecting = true

        startCollecting()

        return
    end

    isCollecting = false

    TriggerServerEvent("damx_coordsaver:server:saveCoords", points)
end, false)


RegisterCommand("coordv3", function() 
    local co = {}

                local plyCoords = GetEntityCoords(PlayerPedId())

                SendNUIMessage({
                    type = 'coordv3',
                    coords = ""..ESX.Math.Round(plyCoords.x, 2) ..","..ESX.Math.Round(plyCoords.y,2)..","..ESX.Math.Round(plyCoords.z,2)..""
                })

end, false)



RegisterCommand("coordv3b", function() 
    local co = {}

                local plyCoords = GetEntityCoords(PlayerPedId())

                SendNUIMessage({
                    type = 'coordv3b',
                    coords = "['x'] = "..ESX.Math.Round(plyCoords.x, 2) ..", ['y']"..ESX.Math.Round(plyCoords.y,2)..", ['z'] = "..ESX.Math.Round(plyCoords.z,2)..""
                })

end, false)


RegisterCommand("coordv3bh", function() 
    local co = {}

    local plyCoords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    SendNUIMessage({
        type = 'coordv3bh',
        coords = "['x'] = "..ESX.Math.Round(plyCoords.x, 2) ..", ['y']"..ESX.Math.Round(plyCoords.y,2)..", ['z'] = "..ESX.Math.Round(plyCoords.z,2)..", ['h'] = " .. ESX.Math.Round(heading, 2)..""
    })

end, false)

