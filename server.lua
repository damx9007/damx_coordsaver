--- event regisztrálás

RegisterNetEvent("damx_coordsaver:server:saveCoords")
AddEventHandler("damx_coordsaver:server:saveCoords", function(points) 
    local saveTextTemplate = ''

        for k, v in pairs(points) do 
            saveTextTemplate = saveTextTemplate .. ("vector3(%s, %s, %s) \n%s, %s, %s \n['x'] = %s, ['y'] = %s, ['z'] = %s \n{x=%s, y=%s, z=%s} \n--------------------------------------------\n"):format(
                ESX.Math.Round(v.x, 2),
                ESX.Math.Round(v.y, 2),
                ESX.Math.Round(v.z, 2),
                ESX.Math.Round(v.x, 2),
                ESX.Math.Round(v.y, 2),
                ESX.Math.Round(v.z, 2),
                ESX.Math.Round(v.x, 2),
                ESX.Math.Round(v.y, 2),
                ESX.Math.Round(v.z, 2),
                ESX.Math.Round(v.x, 2),
                ESX.Math.Round(v.y, 2),
                ESX.Math.Round(v.z, 2)
            )
        end
        local time = os.time(os.date('*t'))

        SaveResourceFile(GetCurrentResourceName(), '/coords/vec3-' .. time .. '.txt', saveTextTemplate)

end)