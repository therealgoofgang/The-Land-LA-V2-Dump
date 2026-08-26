if not Config.BossManagedOutfits then
    return
end

if not Management.IsQBX() then
    return
end

function Management.AddItems()
    local outfitMenuItem = {
        title = _L("outfitManagement.title"),
        icon = "fa-solid fa-shirt",
        event = "illenium-appearance:client:OutfitManagementMenu",
        args = {},
    }

    -- Add boss outfit menu item
    outfitMenuItem.description = _L("outfitManagement.jobText")
    outfitMenuItem.args.type = "Job"
    Management.ItemIDs.Boss = exports[Management.ResourceName]:AddBossMenuItem(outfitMenuItem)

    -- Add gang outfit menu item
    outfitMenuItem.description = _L("outfitManagement.gangText")
    outfitMenuItem.args.type = "Gang"
    Management.ItemIDs.Gang = exports[Management.ResourceName]:AddGangMenuItem(outfitMenuItem)
end