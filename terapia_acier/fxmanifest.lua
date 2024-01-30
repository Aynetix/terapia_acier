fx_version 'adamant'
game 'gta5'

lua54 'yes'
escrow_ignore {
    'config.lua',
	
}
server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'config.lua',
    'server/server.lua',
    'Menu/server/server.lua',
    
}

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
}


client_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'client/client.lua',
    'Menu/dependencies/jamsou_dep.lua'

}

dependencies {
    'rs_prog'
}
shared_script '@es_extended/imports.lua'