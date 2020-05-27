local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')

local icons = require('theme.icons')

local tags = {
	{
		name = '',
		--icon = icons.terminal,
		layout = awful.layout.suit.tile,
		type = 'terminal',
		defaultApp = 'Alacritty',
		screen = 1
	},
	{
		name = '',
		--icons.web_browser,
		layout = awful.layout.suit.tile,
		-- Don't think we need type.
		type = 'web',
		defaultApp = 'google-chrome',
		screen = 1
	},
	{
	  name ='﫯',
		--icon = icons.file_manager,
		layout = awful.layout.suit.tile,
		type = 'mail',
		defaultApp = 'google-chrome',
		screen = 1
	},
	{
	  name ='﬐',
		--icon = '/usr/share/icons/ePapirus/16x16/apps/slack.svg',
		layout = awful.layout.suit.tile,
		type = 'chat',
		defaultApp = 'slack',
		screen = 1
	},
	{
	  name = '',
		--icon = icons.multimedia,
		layout = awful.layout.suit.tile,
		type = 'media',
		defaultApp = 'Spotify',
		screen = 1
	},
	{
		name = '',
		--icon = icons.sandbox,
		layout = awful.layout.suit.floating,
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
			tag.name,
			{
        --icon = tag.icon,
        --icon_only = true,
				layout = tag.layout,
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
