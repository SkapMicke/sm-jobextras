local QBCore = exports['qb-core']:GetCoreObject()
local Config = require('config')

-- Function to set up a roadblock
local function SetupRoadblock()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job and PlayerData.job.type == 'leo' then
        -- Check if the player has the roadblock_item in their inventory
        local hasItem = false
        for _, v in ipairs(PlayerData.items) do
            if v.name == 'roadblock_item' then
                hasItem = true
                break
            end
        end

        if hasItem then
            -- Set up a progress bar for setting up the roadblock
            QBCore.Functions.Progressbar("SetupRoadblock", "Setting up Roadblock", 10000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
             }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 49,
             }, {}, {}, function()
                -- Done
             end, function()
                -- Cancel
             end)

            -- Load the roadblock props from the config.lua file
            local roadblockProps = Config.RoadblockProps

            for _, prop in ipairs(roadblockProps) do
                local posX = GetEntityCoords(PlayerPedId(), true).x + prop.X
                local posY = GetEntityCoords(PlayerPedId(), true).y + prop.Y
                local posZ = GetEntityCoords(PlayerPedId(), true).z + prop.Z
                local obj = CreateObject(prop.Model, posX, posY, posZ, true, true, true)
                prop.handle = obj
                FreezeEntityPosition(prop.handle, true) -- Freeze the roadblock prop in place
            end

            -- Make the player crouch behind the barriers for cover
            TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_COWER", 0, true)

            QBCore.Functions.Notify('Roadblock has been set up')

            -- Remove the roadblock_item from the player's inventory
            TriggerServerEvent('QBCore:Server:RemoveItem', PlayerData.source, 'roadblock_item')
        else
            -- Notify the player that they don't have the roadblock_item
            QBCore.Functions.Notify('You don\'t have the roadblock item!', 'error')
        end
    else
        -- Notify the player that they cannot set up a roadblock
        QBCore.Functions.Notify('You are not authorized to set up a roadblock', 'error')
    end
end

local function RemoveRoadblock()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job and PlayerData.job.type == 'leo' then
        -- Delete all props in the roadblockProps table
        for _, prop in ipairs(Config.RoadblockProps) do
            if prop.handle ~= nil then
                DeleteEntity(prop.handle)
                prop.handle = nil
            end
        end

        QBCore.Functions.Progressbar("RemoveRoadblock", "Removing Roadblock...", 10000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
         }, {
            animDict = "mini@repair",
            anim = "fixing_a_ped",
         }, {}, {}, function()

         end, function()

         end)
        
        QBCore.Functions.Notify('Roadblock has been removed')
    else
        QBCore.Functions.Notify('You are not authorized to remove a roadblock', 'error')
    end
end

RegisterNetEvent('sm-jobextras:client:setupRoadblock', function()
    SetupRoadblock()
end)

RegisterNetEvent('sm-jobextras:client:removeRoadblock', function()
    RemoveRoadblock()
end)

local function RemoveRoadblock()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job and PlayerData.job.type == 'leo' then
        for _, prop in ipairs(Config.RoadblockProps) do
            DeleteEntity(prop.handle)
        end
        QBCore.Functions.Notify('Roadblock has been removed')
    else
        QBCore.Functions.Notify('You are not authorized to remove a roadblock', 'error')
    end
end