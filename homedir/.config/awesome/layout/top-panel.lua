local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')

local icons = require('theme.icons')
local dpi = beautiful.xresources.apply_dpi

local clickable_container = require('widget.clickable-container')
local tag_list = require('widget.tag-list')
local task_list = require('widget.task-list')



local TopPanel = function(s)

	local separator =  wibox.widget {
		orientation = 'vertical',
		forced_height = dpi(1),
		forced_width = dpi(1),
		span_ratio = 0.55,
		widget = wibox.widget.separator
	}

	local panel = wibox
	{
		type = 'dock',
		screen = s,
		ontop = true,
		visible = true,
		height = dpi(28),
		width = s.geometry.width,
		x = s.geometry.x,
		y = s.geometry.y,
		stretch = false,
		bg = beautiful.background,
		fg = beautiful.fg_normal
	}
	

	panel:struts
	{
		top = dpi(28)
	}


	panel:connect_signal(
		'mouse::enter',
		function() 
			local w = mouse.current_wibox
			if w then
				w.cursor = 'left_ptr'
			end
		end

	)


	s.add_button = wibox.widget {
		{
			{
				{
					{
						image = icons.plus,
						resize = true,
						widget = wibox.widget.imagebox
					},
					margins = dpi(4),
					widget = wibox.container.margin
				},
				widget = clickable_container
			},
			bg = beautiful.transparent,
			shape = gears.shape.circle,
			widget = wibox.container.background
		},
		margins = dpi(4),
		widget = wibox.container.margin
	}

	s.add_button:buttons(
		gears.table.join(
			awful.button(
				{},
				1,
				nil,
				function()
					awful.spawn(
						awful.screen.focused().selected_tag.defaultApp,
						{
							tag = mouse.screen.selected_tag,
							placement = awful.placement.bottom_right
						}
					)
				end
			)
		)
	)

	s.updater 		= require('widget.package-updater')()
	s.screen_rec 	= require('widget.screen-recorder')()
	s.music       	= require('widget.music')()
	s.end_session	= require('widget.end-session')()
	s.float_panel  	= require('layout.floating-panel')()


	panel : setup {
		layout = wibox.layout.align.horizontal,
		expand = "none",
		{
			layout = wibox.layout.fixed.horizontal,
			task_list(s),
			s.add_button
		}, 
		-- s.clock_widget,
		s.float_panel ,
-- displays words with no icon for layoutbox
--		awful.widget.layoutbox(s),
		{
			layout = wibox.layout.fixed.horizontal,
			spacing = dpi(5),
			s.updater,
			s.screen_rec,
			s.music,
			s.end_session,
			spacing = dpi(5)
		},
    spacing = dpi(5)
	}

	return panel
end


return TopPanel