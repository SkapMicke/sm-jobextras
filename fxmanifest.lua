fx_version 'cerulean'
game 'gta5'

description 'F6 Menus for all jobs for QBCore.'
author 'SkapMicke'
version '1.0.0'

server_scripts {
    "server/*.lua",
}

client_scripts {
	"client/*.lua",
    "cl_roadblock/*.lua",
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
}

lua54 'yes'