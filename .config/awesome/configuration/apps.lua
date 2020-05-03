local filesystem = require('gears.filesystem')

local config_dir = filesystem.get_configuration_dir()
local bin_dir = config_dir .. 'binaries/'


return {
	-- The default applications in keybindings and widgets
	default = {
		terminal 										= 'alacritty',                                  -- Terminal Emulator
		text_editor 									= 'vim',                                  -- GUI Text Editor
		web_browser 									= 'firefox',                                -- Web browser
		file_manager 									= 'ranger',                                -- GUI File manager
		network_manager 								= 'networkmanager_dmenu',					-- Network manager
		bluetooth_manager 								= 'blueman-manager',						-- Bluetooth manager
		package_manager 								= 'pamac-manager',							-- GUI Package manager
		--lock 											= 'awesome-client "_G.show_lockscreen()"',  -- Lockscreen
		rofiweb											= 'rofi -dpi ' .. screen.primary.dpi .. 
														  ' -show Search -modi Search:' .. config_dir .. 
														  '/configuration/rofi/sidebar/rofi-web-search.py' .. 
														  ' -theme ' .. config_dir ..
														  '/configuration/rofi/sidebar/rofi.rasi', 	-- Rofi Web Search

		rofiappmenu 									= 'rofi -dpi ' .. screen.primary.dpi ..
														  ' -show drun -theme ~/.config/rofi/launchers/simple.rasi'   -- Application Menu
	},
	
	run_on_start_up = {
		'xrdb $HOME/.Xresources',                                                                   -- Load X Colors
		'xfce4-clipman',
	  'xfce4-power-manager',
	  'xfce4-screensaver --no-daemon',
		'blueman-applet',                                                                           -- Bluetooth tray icon
		'nm-applet',                                                                                -- NetworkManager Applet
		'pasystray',
		'xrdb $HOME/.Xresources',                                                                   -- Load X Colors
		'picom -b --experimental-backends --dbus --config ~/.config/picom.conf',
	},

	-- List of binaries that will execute a certain task

	bins = {
		full_screenshot = bin_dir .. 'snap full',              					                    -- Full Screenshot
		area_screenshot = bin_dir .. 'snap area',			                                        -- Area Selected Screenshot
		capslock_status = bin_dir .. 'capschecker'													-- Returns CapsLock Status
	}
}
