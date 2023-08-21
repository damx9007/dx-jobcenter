ESX = exports['es_extended']:getSharedObject()

local isVisible = false

RegisterCommand('jobs', function()
    OpenJobCenter(true)
end)


exports('OpenJobCenter', OpenJobCenter)

OpenJobCenter = function(bool) 
    isVisible = bool

    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = 'jobs',
        value = bool,
    })

end



RegisterNetEvent('closeNUI', function() 
    OpenJobCenter(false)
end)


RegisterNUICallback('GetAllJobs', function(body, resultCallback)
    ESX.TriggerServerCallback('dx-jobcenter:server:GetAllWhitelistedJobs', function(data)
            resultCallback(json.encode(data))
    end)
end)

RegisterNUICallback('SetMeJob', function(body, resultCallback)
    print(ESX.DumpTable(body))
    TriggerServerEvent('dx-jobcenter:server:setMeJobEvent', body.job)
    
end)


--[[ RegisterNuiCallback('close', function(data)
    SetNuiFocus(false, false)
    data({})
end)
 ]]
