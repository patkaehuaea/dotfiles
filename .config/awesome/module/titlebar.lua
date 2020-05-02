local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")

local dpi = beautiful.xresources.apply_dpi

awful.titlebar.enable_tooltip = false
awful.titlebar.fallback_name  = 'Client\'s name'


local titlebar_size = beautiful.titlebar_size


--  ▄▄▄▄▄▄▄   ▀      ▄    ▀▀█           █                   
--     █    ▄▄▄    ▄▄█▄▄    █     ▄▄▄   █▄▄▄    ▄▄▄    ▄ ▄▄ 
--     █      █      █      █    █▀  █  █▀ ▀█  ▀   █   █▀  ▀
--     █      █      █      █    █▀▀▀▀  █   █  ▄▀▀▀█   █    
--     █    ▄▄█▄▄    ▀▄▄    ▀▄▄  ▀█▄▄▀  ██▄█▀  ▀▄▄▀█   █  



function double_click_event_handler(double_click_event)
    if double_click_timer then
        double_click_timer:stop()
        double_click_timer = nil

        double_click_event()
        
        return
    end
  
    double_click_timer = gears.timer.start_new(0.20, function()
        double_click_timer = nil
        return false
    end)
end



client.connect_signal("request::titlebars", function(c)

	-- Buttons for moving/resizing functionality 
	local buttons = gears.table.join(
		awful.button(
			{}, 
			1, 
			function()
				double_click_event_handler(function()
					if c.floating then
						c.floating = false
						return
					end

                    c.maximized = not c.maximized
                    c:raise()
                    return
				end)

				c:activate {context = "titlebar", action = "mouse_move"}
			end
		),
		awful.button(
			{}, 
			3, 
			function()
				c:activate {context = "titlebar", action = "mouse_resize"}
			end
		)
	)
	local naughty = require('naughty')
wibox.widget {
    notification = notif,
    base_layout = wibox.widget {
        spacing        = 3,
        spacing_widget = wibox.widget {
            orientation = 'vertical',
            widget      = wibox.widget.separator,
        },
        layout         = wibox.layout.flex.horizontal
    },
    widget_template = {
        {
            {
                {
                    id            = 'icon_role',
                    forced_height = 16,
                    forced_width  = 16,
                    widget        = wibox.widget.imagebox
                },
                {
                    id     = 'text_role',
                    widget = wibox.widget.textbox
                },
                spacing = 5,
                layout = wibox.layout.fixed.horizontal
            },
            id = 'background_role',
            widget             = wibox.container.background,
        },
        margins = 4,
        widget  = wibox.container.margin,
    },
    widget = naughty.list.actions,
}


	local decorate_titlebar = function(c, pos, bg, size)

    print('titlebar position:', pos)
		c.titlebar_position = pos

		if pos == 'left' or pos == 'right' then

			-- Creates left or right titlebars
			awful.titlebar(c, {position = pos, bg = bg, size = size or titlebar_size}) : setup {
				{
					{
						awful.titlebar.widget.closebutton(c),
						awful.titlebar.widget.maximizedbutton(c),
						awful.titlebar.widget.minimizebutton (c),
						spacing = dpi(7),
						layout  = wibox.layout.fixed.vertical
					},
					margins = dpi(10),
					widget = wibox.container.margin
				},
				{
					buttons = buttons,
					layout = wibox.layout.flex.vertical
				},
				{
					awful.titlebar.widget.floatingbutton (c),
					margins = dpi(10),
					widget = wibox.container.margin
				},
				layout = wibox.layout.align.vertical
				
			}

		elseif pos == 'top' or pos == 'bottom' then

			-- Creates top or bottom titlebars
			awful.titlebar(c, {position = pos, bg = bg, size = size or titlebar_size}) : setup {
				{
					{
						awful.titlebar.widget.closebutton(c),
						awful.titlebar.widget.maximizedbutton(c),
						awful.titlebar.widget.minimizebutton (c),
						spacing = dpi(7),
						layout  = wibox.layout.fixed.horizontal
					},
					margins = dpi(10),
					widget = wibox.container.margin
				},
				{
					buttons = buttons,
					layout = wibox.layout.flex.horizontal
				},
				{
					awful.titlebar.widget.floatingbutton (c),
					margins = dpi(10),
					widget = wibox.container.margin
				},
				layout = wibox.layout.align.horizontal			
			}

		else

			-- Create a left titlebar (default in this setup)
			awful.titlebar(c, {position = 'left', size = titlebar_size}) : setup {
				{
					{
						awful.titlebar.widget.closebutton(c),
						awful.titlebar.widget.maximizedbutton(c),
						awful.titlebar.widget.minimizebutton (c),
						spacing = dpi(7),
						layout  = wibox.layout.fixed.vertical
					},
					margins = dpi(10),
					widget = wibox.container.margin
				},
				{
					buttons = buttons,
					layout = wibox.layout.flex.vertical
				},
				{
					awful.titlebar.widget.floatingbutton (c),
					margins = dpi(10),
					widget = wibox.container.margin
				},
				layout = wibox.layout.align.vertical
			}

		end

	end

	--     ▄▄▄                  ▄                    ▀                 
	--   ▄▀   ▀ ▄   ▄   ▄▄▄   ▄▄█▄▄   ▄▄▄   ▄▄▄▄▄  ▄▄▄    ▄▄▄▄▄   ▄▄▄  
	--   █      █   █  █   ▀    █    █▀ ▀█  █ █ █    █       ▄▀  █▀  █ 
	--   █      █   █   ▀▀▀▄    █    █   █  █ █ █    █     ▄▀    █▀▀▀▀ 
	--    ▀▄▄▄▀ ▀▄▄▀█  ▀▄▄▄▀    ▀▄▄  ▀█▄█▀  █ █ █  ▄▄█▄▄  █▄▄▄▄  ▀█▄▄▀ 
	
	-- Generate a custom titlabar for each class, roles, type, etc., etc.
	-- The titlebar's position can now be set differently

  -- TODO: This is messy and should be cleaned up if I always want the titlebar to be on top.
  print('c.class:', c.class)
  print('c.role:', c.role)
	if c.role == "GtkFileChooserDialog" or c.type == 'dialog' or c.type == 'modal' then
		-- Let's use the gtk theme's bg_color as titlebar's bg then add some transparency
		-- Let's set the titlebar's position to top
		-- Isn't it neat? lol
		decorate_titlebar(c, 'top', beautiful.gtk.get_theme_variables().bg_color:sub(1,7) .. '66', titlebar_size)
	
	elseif c.class == 'Alacritty' then
		-- Let's use the xresources' background color as the titlebar color for xterm
		decorate_titlebar(c, 'top', beautiful.xresources.get_current_theme().background, titlebar_size)

	elseif c.class == 'Thunar' then

		decorate_titlebar(c, 'top', beautiful.background, titlebar_size)

	else
		-- Default titlebar
		decorate_titlebar(c, 'top')

	end

end)


--    ▄▄▄▄    ▀                         ▀▀█          
--   █▀   ▀ ▄▄▄     ▄▄▄▄  ▄ ▄▄    ▄▄▄     █     ▄▄▄  
--   ▀█▄▄▄    █    █▀ ▀█  █▀  █  ▀   █    █    █   ▀ 
--       ▀█   █    █   █  █   █  ▄▀▀▀█    █     ▀▀▀▄ 
--   ▀▄▄▄█▀ ▄▄█▄▄  ▀█▄▀█  █   █  ▀▄▄▀█    ▀▄▄  ▀▄▄▄▀ 
--                  ▄  █                             
--                   ▀▀  


client.connect_signal(
	"manage", 
	function(c)
		
		if not c.max and not c.hide_titlebars then
			awful.titlebar.show(c, c.titlebar_position or 'top')
		else
			awful.titlebar.hide(c, c.titlebar_position or 'top')
		end

	end
)

-- Catch the signal when a client's layout is changed
screen.connect_signal(
	"arrange", 
	function(s)
		
		for _, c in pairs(s.clients) do

			if (#s.tiled_clients > 1 or c.floating) and c.first_tag.layout.name ~= 'max' then

				if not c.hide_titlebars then
					awful.titlebar.show(c, c.titlebar_position or 'top')
				else 
					awful.titlebar.hide(c, c.titlebar_position or 'top')
				end

				if c.maximized or not c.round_corners or c.fullscreen then
					c.shape = function(cr, w, h)
						gears.shape.rectangle(cr, w, h)
					end
				else 
					c.shape = function(cr, width, height)
						gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
					end
				end

			elseif (#s.tiled_clients == 1 or c.first_tag.layout.name == 'max') and not c.fullscreen then

				awful.titlebar.hide(c, c.titlebar_position or 'top')

				c.shape = function(cr, w, h)
					gears.shape.rectangle(cr, w, h)
				end

			end

		end
	end
)


client.connect_signal("property::maximized", function(c)
	c.shape = gears.shape.rectangle

	if not c.maximized then
		c.shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
		end
	end
end)
