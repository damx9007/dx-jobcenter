fx_version 'cerulean'
games      { 'gta5' }
lua54      'yes'

author      'DamX Projects <dam9007@gmail.com>'
description 'Vue + Tailwind Boilerplate for FiveM'


--[[ Shared ]]

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'shared/*'
}

--[[ Server ]]

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*'
}

--
-- Client
--

client_scripts {
    'client/*',
}

--
-- NUI
--

ui_page 'nui/dist/nui.html'

files {
    'nui/dist/nui.html',
    'nui/dist/app.js',
    'nui/dist/app.css',
}
export 'OpenJobCenter'