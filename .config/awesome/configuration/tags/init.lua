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
		icon = icons.development,
		type = 'code',
		defaultApp = '',
		screen = 1
	},
	{
		icon = icons.file_manager,
		type = 'files',
		defaultApp = 'ranger',
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
	}
}

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
