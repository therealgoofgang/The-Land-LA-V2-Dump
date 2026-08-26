if not Config.BossManagedOutfits then
    return
end

Management = {}

Management.ItemIDs = {
    Gang = nil,
    Boss = nil,
}

function Management.IsQB()
    local resourceName = "qb-management"
    if GetResourceState(resourceName) ~= "missing" then
        Management.ResourceName = resourceName
        return true
    end
    return false
end

function Management.IsQBX()
    local resourceName = "qbx_management"
    if GetResourceState(resourceName) ~= "missing" then
        Management.ResourceName = resourceName
        return true
    end
    return false
end