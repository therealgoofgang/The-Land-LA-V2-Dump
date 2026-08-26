-- CORE MULTIJOB

local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

local job = "unemployed"
local grade = 0

Citizen.CreateThread(function()
    while ESX == nil do
        if not Config.NewESX then
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    ESX = obj
                end
            )
        else
            ESX = exports["es_extended"]:getSharedObject()
        end
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    job = ESX.GetPlayerData().job.name
    grade = ESX.GetPlayerData().job.grade
end)

RegisterNetEvent("esx:setJob", function(j)
    job = j.name
    grade = j.grade
    if Config.AllowAutoJobSavining then
        TriggerServerEvent("core_multijob:checkForJob")
    end
end)

function openCenter()
    ESX.TriggerServerCallback("core_multijob:getJobs", function(jobs)
        TriggerScreenblurFadeIn(1000)

        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "openCenter",
            job = {job = job, grade = grade},
            jobs = json.encode(jobs),
            center = json.encode(Config.DefaultJobsInJobCenter)
        })
    end)
end

function openUI()
    ESX.TriggerServerCallback("core_multijob:getJobs", function(jobs)
        local offduty_avalable = Config.OffdutyForEveryone

        for _, v in ipairs(Config.JobsThatCanUseOffduty) do
            if v == job then
                offduty_avalable = true
            end
        end

        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "open",
            job = {job = job, grade = grade},
            jobs = json.encode(jobs),
            offduty = offduty_avalable,
            isFemale = LocalPlayer.state.isFemale or false
        })
    end)
end

RegisterKeyMapping(Config.OpenJobUICommand, "Show Job Management", "keyboard", Config.OpenJobUIKey)

RegisterNUICallback("close", function(data)
    TriggerScreenblurFadeOut(1000)
    SetNuiFocus(false, false)
end)

RegisterNUICallback("removejob", function(data)
    TriggerServerEvent("core_multijob:removeJob", data["job"], data["grade"])
end)

RegisterNUICallback("addjob", function(data)
    TriggerServerEvent("core_multijob:addJob", data["job"])
end)

RegisterNUICallback("changejob", function(data)
    TriggerServerEvent("core_multijob:changeJob", data["job"], data["grade"])
end)

RegisterNUICallback("cantoffduty", function(data)
    SendTextMessage(Config.Text["cant_offduty"])
end)

RegisterCommand(Config.OpenJobUICommand, function()
    openUI()
end)

RegisterNetEvent("core_multijob:sendMessage", function(msg)
    SendTextMessage(msg)
end)