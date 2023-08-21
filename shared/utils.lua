TableIsEmpty = function(table) 
    if next(table) == nil then 
        return true
    else
        return false
    end
end

--[[ Same as TableIsEmpty ]]
TableHasNoIndex = function(table) 
    for i=0,#table do
        if table <= i then 
            return true
        end
    end
    return false
end
--[[ Currently Only OX Supported ]]
exports('ShowNotifyError', ShowNotifyError)

ShowNotifyError = function(title, message) 
    if Config.OX then 
        return lib.notify({
            title = title,
            description = message,
            type = message
        })
    end
end