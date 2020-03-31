local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')

local icons = require('theme.icons')

local tags = {
	{
		icon = icons.terminal,
		type = 'terminal',
		defaultApp = 'vim',
		screen = 1
	},
	{
		icon = icons.web_browser,
		type = 'chrome',
		defaultApp = 'firefox',
		screen = 1
	},
	{
		icon = icons.text_editor,
		type = 'code',
		defaultApp = 'vim',
		screen = 1
	},
	{
		icon = icons.file_manager,
		type = 'files',
		defaultApp = 'dolphin',
		screen = 1
	},
	{
		icon = icons.multimedia,
		type = 'music',
		defaultApp = 'vlc',
		screen = 1
	},
	{
		icon = icons.games,
		type = 'game',
		defaultApp = 'steam',
		screen = 1
	},
	{
		icon = icons.sandbox,
		type = 'virtualbox',
		defaultApp = 'virtualbox',
		screen = 1
	},
	{
		icon = icons.development,
		type = 'any',
		defaultApp = '',
		screen = 1
	}
}

-- https://github.com/awesomeWM/awesome/blob/master/lib/awful/layout/init.lua#L46
-- awful.layout.suit.floating,
-- awful.layout.suit.tile,
-- awful.layout.suit.tile.left,
-- awful.layout.suit.tile.bottom,
-- awful.layout.suit.tile.top,
-- awful.layout.suit.fair,
-- awful.layout.suit.fair.horizontal,
-- awful.layout.suit.spiral,
-- awful.layout.suit.spiral.dwindle,
-- awful.layout.suit.max,
-- awful.layout.suit.max.fullscreen,
-- awful.layout.suit.magnifier,
-- awful.layout.suit.corner.nw,
-- awful.layout.suit.corner.ne,
-- awful.layout.suit.corner.sw,
-- awful.layout.suit.corner.se,


tag.connect_signal(
  "request::default_layouts", 
  function()
  end
)

screen.connect_signal("request::desktop_decoration", function(s)
	for i, tag in pairs(tags) do
		awful.tag.add(
			i,
			{
				icon = tag.icon,
				icon_only = true,
				layout = awful.layout.suit.fair,
				gap_single_client = false,
				gap = beautiful.useless_gap,
				screen = s,
				defaultApp = tag.defaultApp,
				selected = i == 1
			}
		)
	end
end)


tag.connect_signal(
	'property::layout',
	function(t)
		local currentLayout = awful.tag.getproperty(t, 'layout')
		if (currentLayout == awful.layout.suit.max) then
			t.gap = 0
		else
			t.gap = beautiful.useless_gap
		end
	end
)
