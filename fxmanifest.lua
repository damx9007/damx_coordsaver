fx_version 'cerulean'
game 'gta5'
lua54 'yes'

Author 'damx9007'

Description 'Coord saver for developers (damx900@gmail.com) (Vislóczki Ádám#6812)'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

shared_scripts {
    --'@es_extended/imports.lua',
    '@snycore/imports.lua',
    'config.lua'
}

ui_page 'ui/index.html'

files {
    'ui/**',
    'coords/**'
}