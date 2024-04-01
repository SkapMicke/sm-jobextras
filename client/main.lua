local QBCore = exports['qb-core']:GetCoreObject()

-- Police Menu
RegisterCommand('workmenus', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job and PlayerData.job.type == 'leo' then
        exports['qb-menu']:openMenu({
            {
                header = 'Police Menu',
                icon = 'fas fa-code',
                isMenuHeader = true,
            },
            {
                header = 'Show all menus',
                txt = 'Show all police menu',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'qb-menu:client:allMenu',
                }
            },
            {
                header = 'Panic Button',
                txt = 'Use your panic button',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'police:client:SendPoliceEmergencyAlert',
                }
            },
            {
                header = 'Send to Jail',
                txt = 'jail player',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'police:client:JailPlayer',
                }
            },
            {
                header = 'Release from Jail',
                txt = 'remove player!',
                icon = 'fas fa-code-pull-request',
                params = {
                    event = 'prison:client:UnjailPerson', 
                    args = {
                        number = 2,
                    }
                }
            },
            {
                header = 'Clean Blood',
                txt = 'Clean Blood',
                icon = 'fas fa-code-pull-request',
                params = {
                    event = 'evidence:client:ClearBlooddropsInArea',
                    args = {
                        number = 3,
                    }
                }
            },
            {
                header = 'Seize Money',
                txt = 'Seize Money',
                icon = 'fas fa-code-pull-request',
                params = {
                    event = 'police:client:SeizeCash',
                    args = {
                        number = 4,
                    }
                }
            },
            {
                header = 'Take License Driver',
                txt = 'Take license',
                icon = 'fas fa-code-pull-request',
                params = {
                    event = 'police:client:SeizeDriverLicense',
                    args = {
                        number = 5,
                    }
                }
            },
            {
                header = 'Escort',
                txt = 'Escort player',
                icon = 'fas fa-code-pull-request',
                params = {
                    event = 'police:client:EscortPlayer',
                    args = {
                        number = 6,
                    }
                }
            },
            {
                header = 'Cuff',
                txt = 'Cuff Player',
                icon = 'fas fa-code-pull-request',
                params = {
                    event = 'police:client:CuffPlayerSoft',
                    args = {
                        number = 7,
                    }
                }
            },
            {
                header = 'Check anklet',
                txt = 'Check players anklet',
                icon = 'fas fa-code-pull-request',
                params = {
                    event = 'police:client:CheckDistance',
                    args = {
                        number = 8,
                    }
                }
            },
            {
                header = 'Search Player',
                txt = 'Search the nearest players pockets!',
                icon = 'fas fa-code-pull-request',
                params = {
                    event = 'police:client:SearchPlayer',
                    args = {
                        number = 9,
                    }
                }
            },
            {
                header = 'Next',
                txt = 'Next Menu',
                icon = 'fas fa-code-pull-request',
                params = {
                    event = 'qb-menu:client:jobmenu',
                    args = {
                        number = 10,
                        
                    }
                }
            },
        })
    end
end, false)

RegisterKeyMapping('workmenus', 'Open Job Menu', 'keyboard', 'F6')

RegisterNetEvent('qb-menu:client:jobmenu', function(data) --Object Menu
    exports['qb-menu']:openMenu({
        {
            header = 'Objects',
            icon = 'fa-solid fa-backward',
            params = {
                event = 'qb-menu:client:mainMenu',
            }
        },
        {
            header = 'Cone',
            txt = 'Spawn Cone!',
            icon = 'fas fa-code-merge',
            params = {
                event = 'police:client:spawnCone', 
                args = {
                    number = 1,
                }
            }
        },
        {
            header = 'Barrier',
            txt = 'Spawn Barrier!',
            icon = 'fas fa-code-merge',
            params = {
                event = 'police:client:spawnBarrier',
                args = {
                    number = 2,
                }
            }
        },
        {
            header = 'Road Sign',
            txt = 'Spawn Road Sign!',
            icon = 'fas fa-code-merge',
            params = {
                event = 'police:client:spawnRoadSign',
                args = {
                    number = 3,
                }
            }
        },
        {
            header = 'Tent',
            txt = 'Spawn Tent!',
            icon = 'fas fa-code-merge',
            params = {
                event = 'police:client:spawnTent',
                args = {
                    number = 4,
                }
            }
        },
        {
            header = 'Light',
            txt = 'Spawn Light!',
            icon = 'fas fa-code-merge',
            params = {
                event = 'police:client:spawnLight',
                args = {
                    number = 5,
                }
            }
        },
        {
            header = 'Spikes',
            txt = 'Spawn Spikes!',
            icon = 'fas fa-code-merge',
            params = {
                event = 'police:client:SpawnSpikeStrip',
                args = {
                    number = 6,
                }
            }
        },
        {
            header = 'Setup Roadblock',
            txt = 'Setup Roadblock',
            icon = 'fas fa-code-pull-request',
            params = {
                event = 'sm-jobextras:client:setupRoadblock',
                args = {
                    number = 7,
                },
                action = function()
                    TriggerEvent('sm-jobextras:client:setupRoadblock')
                end
            }
        },
        {
            header = 'Remove Roadblock',
            txt = 'Remove Roadblock',
            icon = 'fas fa-code-pull-request',
            params = {
                event = 'sm-jobextras:client:removeRoadblock',
                args = {
                    number = 8,
                },
                action = function()
                    TriggerEvent('sm-jobextras:client:removeRoadblock')
                end
            }
        },
        {
            header = 'Delete Object',
            txt = 'Delete Objects',
            icon = 'fas fa-code-merge',
            params = {
                event = 'police:client:deleteObject',
                args = {
                    number = 9,
                }
            }
        },
        {
            header = 'Next',
            txt = 'Next Menu',
            icon = 'fas fa-code-merge',
            params = {
                event = 'qb-menu:client:job2menu',
                args = {
                    number = 10,
                }
            }
        },
        {
            header = 'Back',
            txt = 'Return to previous menu',
            icon = 'fas fa-code-merge',
            params = {
                event = 'qb-menu:client:mainMenu',
                args = {
                    number = 11,
                }
            }
        }
    })
end)



RegisterNetEvent('qb-menu:client:job2menu', function(data) --Secondary Police Menu
    exports['qb-menu']:openMenu({
        {
            header = 'Secondary Police Menu',
            icon = 'fa-solid fa-backward',
            params = {
                event = 'qb-menu:client:secMenu',
            }
        },
        {
            header = 'Activate Cameras',
            txt = 'Activate Cameras',
            icon = 'fas fa-code-merge',
            params = {
                event = 'police:client:ActiveCamera',
            }
        },
        {
            header = 'Depot',
            txt = 'Activate Cameras',
            icon = 'fas fa-code-merge',
            params = {
                event = 'qb-menu:client:depot2Menu',
            }
        },
        {
            header = 'Back',
            txt = 'Back To The Second Menu',
            icon = 'fas fa-code-pull-request',
            params = {
                event = 'qb-menu:client:jobmenu',
                {
                }
            }
        }
    })
end)

RegisterNetEvent('qb-menu:client:depot2Menu', function(data)
    exports['qb-menu']:openMenu({
        {
            header = 'Impound',
            icon = 'fa-solid fa-backward',
            params = {
                event = 'qb-menu:client:depotMenu',
            }
        },
        {
            header = 'Depot',
            txt = 'Impound a vehicle for a specified price',
            icon = 'fas fa-code-merge',
            params = {
                event = 'police:client:ImpoundVehicle',
            },
            dialog = function()
                local setheader = "Impound Vehicle"
                local setinputs = {
                    {
                        text = "Citizen ID (#)",
                        name = "citizenid",
                        type = "text",
                        isRequired = true,
                    },
                    {
                        text = "Price",
                        name = "price",
                        type = "number",
                        isRequired = true,
                    },
                }
                return exports['qb-input']:ShowInput({ header = setheader, txt = "Enter the Citizen ID and Price to impound the vehicle", inputs = setinputs })
            end,
            event = function(data)
                if data.citizenid ~= nil and data.price ~= nil then
                    TriggerServerEvent('police:server:ImpoundVehicle', data.citizenid, data.price)
                else
                    QBCore.Functions.Notify("Citizten  ID or Price is missing!", "error")
                end
            end
        }
    })
end, false)

-- Ambulance Menu
RegisterCommand('ambulance', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job and PlayerData.job.type == 'ems' then
        exports['qb-menu']:openMenu({
            {
                header = 'Ambulance Menu',
                icon = 'fa-solid fa-backward',
                params = {
                    event = 'qb-menu:client:ambulanceMenu',
                    args = {
                        number = 1,
                    }
                }
            },
            {
                header = 'Check Status',
                txt = 'Check Status',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'hospital:client:CheckStatus',
                }
            },
            {
                header = 'Heal',
                txt = 'Heal Player',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'hospital:client:TreatWounds',
                }
            },
            {
                header = 'Revive',
                txt = 'Revive Player',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'hospital:client:RevivePlayer',
                }
            },
            {
                header = 'Heal wounds',
                txt = 'Heal wounds!',
                icon = 'fas fa-code-pull-request',
                params = {
                    event = 'hospital:client:TreatWounds',
                    args = {
                        number = 2,
                    }
                }
            },
            {
                header = 'Escort',
                txt = 'Escort Player',
                icon = 'fas fa-code-pull-request',
                params = {
                    event = 'police:client:EscortPlayer',
                    args = {
                        number = 3,
                    }
                }
            },
            {
                header = 'Panic Button',
                txt = 'Panic Button',
                icon = 'fas fa-code-pull-request',
                params = {
                    event = 'police:client:SendPoliceEmergencyAlert',
                    args = {
                        number = 4,
                    }
                }
            },
            {
                header = 'Next',
                txt = 'Stretcher Menu',
                icon = 'fas fa-code-pull-request',
                params = {
                    event = 'qb-menu:client:stretcherMenu',
                    args = {
                        number = 6,
                        
                    }
                }
            },
        })
    end
end, false)

RegisterKeyMapping('ambulance', 'Open ambulance Menu', 'keyboard', 'F6')

RegisterNetEvent('qb-menu:client:stretcherMenu', function(data) --Stretcher Menu
    exports['qb-menu']:openMenu({
        {
            header = 'Stretcher',
            icon = 'fa-solid fa-backward',
            params = {
                event = 'qb-menu:client:stretcherMenu',
                args = {
                    number = 1,
                }
            }
        },
        {
            header = 'Stretcher',
            txt = 'Spawn Stretcher!',
            icon = 'fas fa-code-merge',
            params = {
                event = 'qb-radialmenu:client:TakeStretcher', 
                args = {
                    number = 2,
                }
            }
        },
        {
            header = 'Remove Stretcher',
            txt = 'Remove Stretcher!',
            icon = 'fas fa-code-merge',
            params = {
                event = 'qb-radialmenu:client:RemoveStretcher', 
                args = {
                    number = 3,
    
                }
            }
        },
        {
            header = 'Back',
            txt = 'Return to previous menu',
            icon = 'fas fa-code-merge',
            params = {
                event = 'qb-menu:client:mainnMenu',
                args = {
                    number = 4,
                }
            }
        }
    })
end)

-- Taxi Menu
RegisterCommand('taxi', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job and PlayerData.job.name == 'taxi' then
        exports['qb-menu']:openMenu({
            {
                header = 'Taxi Menu',
                icon = 'fa-solid fa-backward',
                params = {
                    event = 'qb-menu:client:taxiMenu',
                    args = {
                        number = 1,
                    }
                }
            },
            {
                header = 'Show/Hide Meter',
                txt = 'Show/Hide Meter',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'qb-taxi:client:toggleMeter',
                }
            },
            {
                header = 'Start/Stop Meter',
                txt = 'Start/Stop Meter',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'qb-taxi:client:enableMeter',
                }
            },
            {
                header = 'NPC Mission',
                txt = 'NPC Mission',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'qb-taxi:client:DoTaxiNpc',
                }
            }
        })
    end
end)
RegisterKeyMapping('taxi', 'Open Taxi Menu', 'keyboard', 'F6')


-- Hotdog Menu
RegisterCommand('hotdog', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job.name == 'hotdog' then
        exports['qb-menu']:openMenu({
            {
                header = 'Hotdog Menu',
                icon = 'fa-solid fa-backward',
                params = {
                    event = 'qb-menu:client:hotdogeMenu',
                    args = {
                        number = 1,
                    }
                }
            },
            {
                header = 'Remove Stand',
                txt = 'Remove Stand',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'qb-hotdogjob:staff:DeletStand',
                }
            },
        })
    end
end, false)
RegisterKeyMapping('hotdog', 'Open ambulance Menu', 'keyboard', 'F6')



local Config = require('config')

