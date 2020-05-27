local awful = require('awful')
local gears = require('gears')
local ruled = require("ruled")
local beautiful = require('beautiful')

local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
	-- All clients will match this rule.
	ruled.client.append_rule {
		id         = "global",
		rule       = { },
		properties = {
			focus     = awful.client.focus.filter,
			raise     = true,
			floating = false,
			maximized = false,
			above = false,
			below = false,
			ontop = false,
			sticky = false,
			maximized_horizontal = false,
			maximized_vertical = false,
			round_corners = true,
			keys = client_keys,
			buttons = client_buttons,
			screen    = awful.screen.preferred,
			placement = awful.placement.no_overlap+awful.placement.no_offscreen
		}
	}

	-- Dialogs
	ruled.client.append_rule {
		id         = "dialog",
		rule_any   = { 
			type = { "dialog" },
			class = { "Wicd-client.py", "calendar.google.com" },
		},
		properties = { 
			titlebars_enabled = true,
			floating = true,
			draw_backdrop = true,
			skip_decoration = true,
			shape = function(cr, width, height)
						gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
					end,
			placement = awful.placement.centered
		}
	}

	-- Modals
	ruled.client.append_rule {
		id         = "dialog",
		rule_any   = { 
			type = { "modal" },
		},
		properties = { 
			titlebars_enabled = true,
			floating = true,
			draw_backdrop = true,
			skip_decoration = true,
			shape = function(cr, width, height)
						gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
					end,
			placement = awful.placement.centered
		}
	}

	-- Utilities
	ruled.client.append_rule {
		id         = "utility",
		rule_any   = { 
			type = { "utility", "splash" }
		},
		properties = { 
			titlebars_enabled = false,
			floating = true,
			hide_titlebars = true,
			draw_backdrop = false,
			skip_decoration = true,
			placement = awful.placement.centered
		}
	}

	-- Splash
  ruled.client.append_rule {
		id         = "splash",
		rule_any   = { 
			type = { "splash" }
		},
		properties = { 
			titlebars_enabled = false,
			floating = true,
			hide_titlebars = true,
			draw_backdrop = false,
			skip_decoration = true,
			shape = function(cr, width, height)
						gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
					end,
			placement = awful.placement.centered
		}
	}

  -- terminal emulators
  ruled.client.append_rule {
  	id         = "terminals",
  	rule_any   = { 
  		class = { 
  			"Alacritty"
  		},
  	},
  	properties = {
  		tag =   '',
  		switchtotag = true,
  		draw_backdrop = false,
  		size_hints_honor = false
  	}
  }
  
  -- Browsers
  ruled.client.append_rule {
  	id         = "web",
  	rule_any   = {
  		class = {
  			"firefox",
  			"google-chrome",
  			"Google-chrome"
  		}
  	},
  	properties = {
  		tag =  '',
  		switchtotag = true
  	}
  }
  
  ruled.client.append_rule {
  	id         = 'mail',
  	-- Does not seem to work with above 'web' rule if I specify
  	-- class with rules_every. Have to leave matching on
  	-- window manager name for now.
  	rule_any = {
  		name = {
  		  'Outlook',
  		  'ProtonMail'
  		}
  	},
  	properties = { 
  		tag =  '﫯',
  		switchtotag = true
  	}
  }

	ruled.client.append_rule {
		id         = 'messaging',
		rule_any   = {
			class = {
				"microsoft teams - preview",
				"Microsoft Teams - Preview",
				"[s|S]ignal",
				"[s|S]lack"
			}
		},
		properties = { 
			tag =  '﬐',
			switchtotag = true
		}
	}

	-- Multimedia
	ruled.client.append_rule {
		id         = "media",
		rule_any   = {
			class = {
				"vlc",
				"[s|S]potify"
			}
		},
		properties = {
			tag =  '',
			draw_backdrop = false,
			switchtotag = true
		}
	}

	ruled.client.append_rule {
		id         = "virtualbox",
		rule_any   = {
			class = {
				"VirtualBox [Machine|Manage]"
			},
		},
		properties = {
			tag =  '',
			floating = true,
		}
	}

	-- Hide titlebars
	ruled.client.append_rule {
		id        = "hide_titlebars",
		rule_any  = {
			class    = {
				"Pulseeffects"
			},
		},
		properties = { 
			skip_decoration = true,
			hide_titlebars = true,
			floating = true,
			ontop = true,
			placement = awful.placement.centered
		}
	}
	-- Instances
	ruled.client.append_rule {
		id       = "instances",
		rule_any = {
			instance    = {
				"file_progress",
				"Popup",
				"VirtualBox Manage",
				"VirtualBox Machine",
				"nm-connection-editor"
			},
		},
			properties = { 
			skip_decoration = true,
			round_corners = true,
			ontop = true,
			floating = true,
			draw_backdrop = false,
			focus = awful.client.focus.filter,
			raise = true,
			keys = client_keys,
			buttons = client_buttons,
			placement = awful.placement.centered
		}
	}

end)


-- Normally we'd do this with a rule, but other apps like spotify and supertuxkart doesn't set its class or name
-- until after it starts up, so we need to catch that signal.

-- If the application is fullscreen in its settings, make sure to set `c.fullscreen = false` first
-- before moving to the desired tag or else the tag where the program spawn will cause panels to hide. 
-- After moving the program to specified tag you can set `c.fullscreen = true` now
-- See what I did in `SuperTuxKart`

client.connect_signal("property::class", function(c)
	if c.class == "Spotify" then
		-- Check if Spotify is already open
		local spotify = function (c)
			return ruled.client.match(c, { class = "Spotify" })
		end

		local spotify_count = 0
		for c in awful.client.iterate(spotify) do
			spotify_count = spotify_count + 1
		end

		-- If Spotify is already open, don't open a new instance
		if spotify_count > 1 then
			c:kill()

			-- Switch to previous instance
			for c in awful.client.iterate(spotify) do
				c:jump_to(false)
			end
		else

			-- Move the Spotify instance to "5" tag on this screen
			local t = awful.tag.find_by_name(awful.screen.focused(), "5")
			c:move_to_tag(t)
		end
	elseif c.class == "SuperTuxKart" then
		-- Disable fullscreen first
		c.fullscreen = false

		-- Check if SuperTuxKart is already open
		local stk = function (c)
			return ruled.client.match(c, { class = "SuperTuxKart" })
		end

		local stk_count = 0
		for c in awful.client.iterate(stk) do
			stk_count = stk_count + 1
		end

		-- If SuperTuxKart is already open, don't open a new instance
		if stk_count > 1 then
			c:kill()

			-- Switch to previous instance
			for c in awful.client.iterate(stk) do
				c:jump_to(false)
			end
		else

			-- Move the instance to specified tag tag on this screen
			local t = awful.tag.find_by_name(awful.screen.focused(), "6")
			c:move_to_tag(t)
			t:view_only()
			
			-- Enable fullscreeen again
			c.fullscreen = true
		end
	end
end)
