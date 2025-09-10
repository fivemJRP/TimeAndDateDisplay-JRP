fx_version 'bodacious'
game 'gta5'

name 'TimeAndDateDisplay-JRP'
description 'A script that allows you to always show the real life time and real life date on the top right of your screen.'
version 'v2.0.0'

shared_script 'config.lua'

server_script {
    'server/server.lua'
}

client_scripts {
    'client/client.lua'
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/time.js"
}