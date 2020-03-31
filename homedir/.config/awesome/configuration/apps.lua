local filesystem = require('gears.filesystem')

local config_dir = filesystem.get_configuration_dir()
local bin_dir = config_dir .. 'binaries/'


return {
	-- The default applications in keybindings and widgets
	default = {
		terminal 										= 'terminal',                                  -- Terminal Emulator
		text_editor 									= 'vim',                                  -- GUI Text Editor
		web_browser 									= 'firefox',                                -- Web browser
		file_manager 									= 'ranger',                                -- GUI File manager
		network_manager 								= 'networkmanager_dmenu',					-- Network manager
		bluetooth_manager 								= 'blueman-manager',						-- Bluetooth manager
		package_manager 								= 'pamac-manager',							-- GUI Package manager
		lock 											= 'awesome-client "_G.show_lockscreen()"',  -- Lockscreen
		rofiweb											= 'rofi -dpi ' .. screen.primary.dpi .. 
														  ' -show Search -modi Search:' .. config_dir .. 
														  '/configuration/rofi/sidebar/rofi-web-search.py' .. 
														  ' -theme ' .. config_dir ..
														  '/configuration/rofi/sidebar/rofi.rasi', 	-- Rofi Web Search

		rofiappmenu 									= 'rofi -dpi ' .. screen.primary.dpi ..
														  ' -show drun -theme ' .. config_dir ..
														  '/configuration/rofi/appmenu/rofi.rasi'   -- Application Menu
	},
	
	run_on_start_up = {
		'picom -b --experimental-backends --dbus --config ' .. 
		config_dir .. '/configuration/picom.conf',   												-- Compositor
		'blueman-applet',                                                                           -- Bluetooth tray icon
		'xrdb $HOME/.Xresources',                                                                   -- Load X Colors
		'nm-applet',                                                                                -- NetworkManager Applet
		'pulseeffects --gapplication-service',                                                      -- Sound Equalizer
		'xidlehook --not-when-fullscreen --not-when-audio --timer 600 '..
		' "awesome-client \'_G.show_lockscreen()\'" ""'  											-- Auto lock timer
	},

	-- List of binaries that will execute a certain task

	bins = {
		full_screenshot = bin_dir .. 'snap full',              					                    -- Full Screenshot
		area_screenshot = bin_dir .. 'snap area',			                                        -- Area Selected Screenshot
		capslock_status = bin_dir .. 'capschecker'													-- Returns CapsLock Status
	}
}