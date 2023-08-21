ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('dx-jobcenter:server:GetAllWhitelistedJobs', function(source, cb, data)
    local gaj = MySQL.query.await('SELECT * FROM jobs WHERE whitelisted = 0')
    if gaj then 
        cb(gaj)
    end
end)

RegisterNetEvent('dx-jobcenter:server:setMeJobEvent')
AddEventHandler('dx-jobcenter:server:setMeJobEvent', function(data) 
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = data
    local grade = 0

    if ESX.DoesJobExist(job, grade) then 
        xPlayer.setJob(job, grade)
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'success',
            title = 'Munkaügyi Központ',
            description = 'Sikeresen felvetted a munkát ##' .. job .. '',
            position = 'top'
        })
        TriggerClientEvent('closeNUI', source)
    end
    print(data)
end)