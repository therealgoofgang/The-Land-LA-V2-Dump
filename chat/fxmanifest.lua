-- Anti Cheat Hooks, do NOT touch [Quantum]
client_script '@quantum/client/clientHook.lua'
server_script '@quantum/server/serverHook.lua'
shared_script '@quantum/shared/sharedHook.lua'












lua54 "yes" -- needed for Reaper







description 'chat management stuff'

ui_page 'html/index.html'

client_scripts {
  'config.lua',
	'client/**.lua'
}

server_scripts {
  'config.lua',
	'server/**.lua'
}

lua54 'yes'
files {
    'html/index.html',
    'html/index.css',
    'html/config.js',
    'html/App.js',
    'html/Message.js',
    'html/Suggestions.js',
    'html/vendor/vue.2.3.3.min.js',
    'html/vendor/flexboxgrid.6.3.1.min.css',
    'html/vendor/animate.3.5.2.min.css',
    'html/vendor/latofonts.css',
    'style.css',
  }

fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

chat_theme 'gtao' {
  styleSheet = 'style.css',
  msgTemplates = {
      default = '{0} {1}'
  }
}
