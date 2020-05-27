local gears = require('gears')
local beautiful = require('beautiful')
local filesystem = require('gears.filesystem')
local dpi = beautiful.xresources.apply_dpi
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local titlebar_theme = "stoplight"
local titlebar_icon_path = theme_dir .. "/icons/titlebar/" .. titlebar_theme .. '/'
local tip = titlebar_icon_path
local xrdb = beautiful.xresources.get_current_theme()

local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.lain_icons = os.getenv("HOME") .. "/.config/awesome/lain/icons/layout/default/"

theme.background = xrdb.background
theme.transparent = '#00000000'

-- Font
theme.font = 'SFNS Display 16'
theme.font_bold = 'SFNS Display Bold 16'

-- Menu icon theme
theme.icon_theme = 'Papirus'
theme.dir = theme_dir
theme.icons = theme.dir .. '/icons/'

-- Wallpaper

theme.wallpaper = theme.dir .. '/wallpapers/forest.jpg'

-- Foreground

theme.font = 'SFNS Display 16'
theme.title_font = 'SFNS Display 16'

theme.fg_normal = xrdb.foreground
theme.fg_focus = xrdb.background
theme.fg_urgent = xrdb.background

theme.bg_normal = xrdb.background
theme.bg_focus = xrdb.color12
theme.bg_urgent = xrdb.color9
theme.bg_minimize = xrdb.color8

-- System tray

theme.bg_systray = theme.background
theme.systray_icon_spacing = dpi(16)

-- Titlebar

theme.titlebar_size = dpi(34)
theme.titlebar_bg_focus = xrdb.color12
theme.titlebar_bg_normal = xrdb.background
theme.titlebar_fg_focus = xrdb.background
theme.titlebar_fg_normal = xrdb.foreground

-- Close Button
theme.titlebar_close_button_normal = tip .. "close_normal.svg"
theme.titlebar_close_button_focus  = tip .. "close_focus.svg"

-- Minimize Button
theme.titlebar_minimize_button_normal = tip .. "minimize_normal.svg"
theme.titlebar_minimize_button_focus  = tip .. "minimize_focus.svg"

-- Ontop Button
theme.titlebar_ontop_button_normal_inactive = tip .. "ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive  = tip .. "ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active = tip .. "ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active  = tip .. "ontop_focus_active.svg"

-- Sticky Button
theme.titlebar_sticky_button_normal_inactive = tip .. "sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive  = tip .. "sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active = tip .. "sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active  = tip .. "sticky_focus_active.svg"

-- Floating Button
theme.titlebar_floating_button_normal_inactive = tip .. "floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive  = tip .. "floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active = tip .. "floating_normal_active.svg"
theme.titlebar_floating_button_focus_active  = tip .. "floating_focus_active.svg"

-- Maximized Button
theme.titlebar_maximized_button_normal_inactive = tip .. "maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive  = tip .. "maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = tip .. "maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active  = tip .. "maximized_focus_active.svg"

-- Hovered Close Button
theme.titlebar_close_button_normal_hover = tip .. "close_normal_hover.svg"
theme.titlebar_close_button_focus_hover  = tip .. "close_focus_hover.svg"

-- Hovered Minimize Buttin
theme.titlebar_minimize_button_normal_hover = tip .. "minimize_normal_hover.svg"
theme.titlebar_minimize_button_focus_hover  = tip .. "minimize_focus_hover.svg"

-- Hovered Ontop Button
theme.titlebar_ontop_button_normal_inactive_hover = tip .. "ontop_normal_inactive_hover.svg"
theme.titlebar_ontop_button_focus_inactive_hover  = tip .. "ontop_focus_inactive_hover.svg"
theme.titlebar_ontop_button_normal_active_hover = tip .. "ontop_normal_active_hover.svg"
theme.titlebar_ontop_button_focus_active_hover  = tip .. "ontop_focus_active_hover.svg"

-- Hovered Sticky Button
theme.titlebar_sticky_button_normal_inactive_hover = tip .. "sticky_normal_inactive_hover.svg"
theme.titlebar_sticky_button_focus_inactive_hover  = tip .. "sticky_focus_inactive_hover.svg"
theme.titlebar_sticky_button_normal_active_hover = tip .. "sticky_normal_active_hover.svg"
theme.titlebar_sticky_button_focus_active_hover  = tip .. "sticky_focus_active_hover.svg"

-- Hovered Floating Button
theme.titlebar_floating_button_normal_inactive_hover = tip .. "floating_normal_inactive_hover.svg"
theme.titlebar_floating_button_focus_inactive_hover  = tip .. "floating_focus_inactive_hover.svg"
theme.titlebar_floating_button_normal_active_hover = tip .. "floating_normal_active_hover.svg"
theme.titlebar_floating_button_focus_active_hover  = tip .. "floating_focus_active_hover.svg"

-- Hovered Maximized Button
theme.titlebar_maximized_button_normal_inactive_hover = tip .. "maximized_normal_inactive_hover.svg"
theme.titlebar_maximized_button_focus_inactive_hover  = tip .. "maximized_focus_inactive_hover.svg"
theme.titlebar_maximized_button_normal_active_hover = tip .. "maximized_normal_active_hover.svg"
theme.titlebar_maximized_button_focus_active_hover  = tip .. "maximized_focus_active_hover.svg"

-- UI Groups

theme.groups_title_bg = "#ffffff" .. "15"
theme.groups_bg = "#ffffff" .. "10"
theme.groups_radius = dpi(12)

-- Client Decorations

-- Borders
theme.border_focus = xrdb.color12
theme.border_normal = xrdb.color0
theme.border_marked = xrdb.color10
theme.border_width = dpi(0)
theme.border_radius = dpi(0)

-- Decorations
theme.client_radius = dpi(9)
theme.useless_gap = dpi(4)

-- Menu
theme.menu_font = "SFNS Display 14"
theme.menu_submenu = '' -- ➤

theme.menu_height = dpi(34)
theme.menu_width = dpi(200)
theme.menu_border_width = dpi(0)
theme.menu_bg_focus = theme.background

theme.menu_bg_normal = xrdb.background
theme.menu_fg_normal = xrdb.foreground
theme.menu_fg_focus = '#ffffff'
theme.menu_border_color = xrdb.background:sub(1,7) .. '5C'

-- Tooltips

theme.tooltip_bg = xrdb.background
theme.tooltip_font = 'SFNS Display 14'
theme.tooltip_fg = xrdb.foreground
theme.tooltip_border_color = theme.transparent
theme.tooltip_border_width = 0
theme.tooltip_shape = function(cr, w, h)
	gears.shape.rounded_rect(cr, w, h, dpi(6))

-- Separators

theme.separator_color = '#f2f2f244'

-- Layoutbox icons

theme.layout_fairh = theme.icons.."layouts/fairhw.png"
theme.layout_fairv = theme.icons.."layouts/fairvw.png"
theme.layout_floating  = theme.icons.."layouts/floatingw.png"
theme.layout_magnifier = theme.icons.."layouts/magnifierw.png"
theme.layout_max = theme.icons.."layouts/maxw.png"
theme.layout_fullscreen = theme.icons.."layouts/fullscreenw.png"
theme.layout_tilebottom = theme.icons.."layouts/tilebottomw.png"
theme.layout_tileleft   = theme.icons.."layouts/tileleftw.png"
theme.layout_tile = theme.icons.."layouts/tilew.png"
theme.layout_tiletop = theme.icons.."layouts/tiletopw.png"
theme.layout_spiral  = theme.icons.."layouts/spiralw.png"
theme.layout_dwindle = theme.icons.."layouts/dwindlew.png"
theme.layout_cornernw = theme.icons.."layouts/cornernww.png"
theme.layout_cornerne = theme.icons.."layouts/cornernew.png"
theme.layout_cornersw = theme.icons.."layouts/cornersww.png"
theme.layout_cornerse = theme.icons.."layouts/cornersew.png"

-- Lain Layoutbox icons
theme.layout_termfair    = theme.lain_icons .. "termfair.png"
theme.layout_centerfair  = theme.lain_icons .. "centerfairw.png"  -- termfair.center
theme.layout_cascade     = theme.lain_icons .. "cascade.png"
theme.layout_cascadetile = theme.lain_icons .. "cascadetile.png" -- cascade.tile
theme.layout_centerwork  = theme.lain_icons .. "centerworkw.png"
theme.layout_centerworkh = theme.lain_icons .. "centerworkh.png" -- centerwork.horizontal
	-- Taglist
  -- Adjust size of glyphs here.
	theme.taglist_font = 'Source Code Pro for Powerline 16'
	theme.taglist_bg_empty = theme.background .. '99'
	-- Set to background since setting is redundant given
	-- empty tags are filtered.
	theme.taglist_bg_occupied = theme.background --'#ffffff' .. '1A'
	theme.taglist_bg_urgent = "#E91E63" .. '99'
  theme.taglist_bg_focus = theme.background
-- Changes font color rather than background.
--	theme.taglist_fg_focus =  '#A3BE8C'
theme.taglist_bg_focus =  '#81A1C1' -- color4: nord9 - blue
--theme.taglist_bg_focus =  '#A3BE8C'-- color10: nord14 - light green
	theme.taglist_spacing = dpi(2)

	-- Tasklist

	theme.tasklist_font = 'SFNS Display 10'
	theme.tasklist_bg_normal = theme.background .. '99'
	theme.tasklist_bg_focus = theme.background
	theme.tasklist_bg_urgent = "#E91E63" .. '99'
	theme.tasklist_fg_focus = '#DDDDDD'
	theme.tasklist_fg_urgent = "#ffffff"
	theme.tasklist_fg_normal = '#AAAAAA'

	-- Notification

	theme.notification_position = 'top_right'
	theme.notification_bg = theme.transparent
	theme.notification_margin = dpi(5)
	theme.notification_border_width = dpi(0)
	theme.notification_border_color = theme.transparent
	theme.notification_spacing = dpi(0)
	theme.notification_icon_resize_strategy = 'center'
	theme.notification_icon_size = dpi(32)
	
	-- Client Snap Theme

	theme.snap_bg = theme.background
	theme.snap_shape = gears.shape.rectangle
	theme.snap_border_width = dpi(15)

	-- Hotkey popup

	theme.hotkeys_font = 'SFNS Display Bold'
	theme.hotkeys_description_font   = 'SFNS Display'
	theme.hotkeys_bg = theme.background
	theme.hotkeys_group_margin = dpi(20)

end

return theme
