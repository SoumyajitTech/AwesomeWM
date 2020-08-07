--[[

     Copland Awesome WM theme 2.0
     github.com/copycat-killer

--]]

local gears   				= require("gears")
local lain    				= require("lain")
local awful   				= require("awful")
local wibox   				= require("wibox")
local os      				= { getenv = os.getenv, setlocale = os.setlocale }
local awesome, client 		= awesome, client
local brightness_widget 	= require("widgets.brightness-widget.brightness")
local cpu_widget 			= require("widgets.cpu-widget")
local volumearc_widget 		= require("widgets.volumearc")
local batteryarc_widget		= require("widgets.batteryarc-widget.batteryarc")
local fs_widget				= require("widgets.fs-widget")
local ram_widget			= require("widgets.ram-widget.ram-widget")
local net_widgets 			= require("net_widgets")

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/msjche"
-- theme.wallpaper                                 = theme.dir .. "/wall.png"
theme.font                                      = "Mononoki Nerd Font 9"
theme.taglist_font                              = "Droid Sans Bold 7"
theme.fg_normal                                 = "#ffffff"
theme.fg_focus                                  = "#ffffff"
theme.fg_urgent                                 = "#fcfcfc"
theme.bg_normal                                 = "#282a36"
theme.bg_focus                                  = "#049bed"
theme.bg_urgent                                 = "#ed3e04"
theme.taglist_fg_focus                          = "#282a36"
theme.tasklist_bg_focus                         = "#282a36"
theme.tasklist_fg_focus                         = "#fcfcfc"
theme.border_width                              = 2
theme.border_normal                             = "#282a36"
theme.border_focus                              = "#f72504"
theme.border_marked                             = "#CC9393"
theme.titlebar_bg_focus                         = "#3F3F3F"
theme.titlebar_bg_normal                        = "#3F3F3F"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = 20
theme.menu_width                                = 140
theme.tasklist_disable_icon                     = true
theme.awesome_icon                              = theme.dir .."/icons/awesome.png"
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_unsel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.vol                                       = theme.dir .. "/icons/vol.png"
theme.vol_low                                   = theme.dir .. "/icons/vol_low.png"
theme.vol_no                                    = theme.dir .. "/icons/vol_no.png"
theme.vol_mute                                  = theme.dir .. "/icons/vol_mute.png"
theme.disk                                      = theme.dir .. "/icons/disk.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.ac                                        = theme.dir .. "/icons/ac.png"
theme.bat                                       = theme.dir .. "/icons/bat.png"
theme.bat_low                                   = theme.dir .. "/icons/bat_low.png"
theme.bat_no                                    = theme.dir .. "/icons/bat_no.png"
theme.bat_full									= theme.dir .. "/icons/bat_full.png"
theme.bat_90									= theme.dir .. "/icons/bat_90.png"
theme.bat_80        							= theme.dir .. "/icons/bat_80.png"
theme.bat_70									= theme.dir .. "/icons/bat_70.png"
theme.bat_60		        					= theme.dir .. "/icons/bat_60.png"
theme.bat_50         							= theme.dir .. "/icons/bat_50.png"
theme.bat_40 		    						= theme.dir .. "/icons/bat_40.png"
theme.bat_30 	        						= theme.dir .. "/icons/bat_30.png"
theme.bat_20									= theme.dir .. "/icons/bat_20.png"
theme.bat_10	            					= theme.dir .. "/icons/bat_10.png"
theme.bat_empty          						= theme.dir .. "/icons/bat_empty.png"
theme.charged_ac								= theme.dir .. "/icons/charged_ac.png"
theme.charge_full								= theme.dir .. "/icons/charge_full.png"
theme.charge_90									= theme.dir .. "/icons/charge_90.png"
theme.charge_80									= theme.dir .. "/icons/charge_80.png"
theme.charge_70									= theme.dir .. "/icons/charge_70.png"
theme.charge_60									= theme.dir .. "/icons/charge_60.png"
theme.charge_50									= theme.dir .. "/icons/charge_50.png"
theme.charge_40									= theme.dir .. "/icons/charge_40.png"
theme.charge_30									= theme.dir .. "/icons/charge_30.png"
theme.charge_20									= theme.dir .. "/icons/charge_20.png"
theme.charge_10									= theme.dir .. "/icons/charge_10.png"
theme.charge_empty								= theme.dir .. "/icons/charge_empty.png"
theme.play                                      = theme.dir .. "/icons/play.png"
theme.pause                                     = theme.dir .. "/icons/pause.png"
theme.stop                                      = theme.dir .. "/icons/stop.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.useless_gap                               = 4
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

-- lain related
theme.layout_centerfair                         = theme.dir .. "/icons/centerfair.png"
theme.layout_termfair                           = theme.dir .. "/icons/termfair.png"
theme.layout_centerwork                         = theme.dir .. "/icons/centerwork.png"

local markup = lain.util.markup
local blue   = "#049bed"
local red    = "#EB8F8F"
local green  = "#8FEB8F"
local white	 = "#fcfcfc"

-- Awesome WM Widgets
theme.widget_main_color 	= "#74aeab"
theme.widget_red 			= "#e53935"
theme.widget_yelow 			= "#c0ca33"
theme.widget_green 			= "#43a047"
theme.widget_black 			= "#000000"
theme.widget_transparent 	= "#00000000"

local mytextclock = wibox.widget.textclock(markup(blue, " %a") .. markup(white, " %d ") .. markup(blue, "%b ") .. markup(white, "| ") .. markup(white, "%I:%M%P "))
mytextclock.font = theme.font

--local corona = awful.widget.watch('corona', 15)
--corona.font = theme.font

--local uptimewidget = wibox.widget.textbox(vicious.widget.uptime, (markup(blue, "$1") .. markup(white, " D") .. markup(blue, " $2") ..  markup(white, " h"))
--lock.font = theme.font

-- Calendar
lain.widget.calendar({
    attach_to = { mytextclock },
    notification_preset = {
        font = "Mononoki Nerd Font 11",
        fg   = white,
        bg   = theme.bg_normal
}})

-- Launcher
local mylauncher = awful.widget.button({image = theme.awesome_icon})
mylauncher:connect_signal("button::press", function() awful.util.mymainmenu:toggle() end)

-- WiFi signal
net_wireless = net_widgets.wireless({
	-- onclick = terminal .. "-e sudo wifi-menu",
	interface="wlp1s0",
	popup_signal=true
})

local net = lain.widget.net({
    settings = function()
--		widget:set_units = mb
        widget:set_markup(
			markup("#7AC82E", " " .. net_now.received)
        .. " ")
			-- markup("#46A8C3", " " .. net_now.sent) .. " ")
    end
})

-- MPD
local mpdicon = wibox.widget.imagebox()
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            title  = markup("#1ed760", " " .. mpd_now.title)
            artist = mpd_now.artist
			spacer = " | "
            mpdicon:set_image(theme.play)
        elseif mpd_now.state == "pause" then
            title  = ""
            artist = ""
			spacer = ""
            mpdicon:set_image(theme.pause)
        else
            title  = ""
            artist = ""
			spacer = ""
            mpdicon._private.image = nil
            mpdicon:emit_signal("widget::redraw_needed")
            mpdicon:emit_signal("widget::layout_changed")
        end

        widget:set_markup(title .. spacer .. artist)
		theme.mpd.widget.font = theme.font
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
    end
})

-- Battery

local baticon = wibox.widget.imagebox(theme.bat)

local batwidget = lain.widget.bat({

    settings = function()
        if bat_now.status == "N/A" or type(bat_now.perc) ~= "number" then return end

        if bat_now.status == "Charging" then
            baticon:set_image(theme.ac)
            if bat_now.perc >= 92 then
				baticon:set_image(theme.charge_full)
            elseif bat_now.perc >= 85 and bat_now.perc < 92 then
				baticon:set_image(theme.charge_90)
            elseif bat_now.perc >= 75 and bat_now.perc < 85 then
				baticon:set_image(theme.charge_80)
            elseif bat_now.perc >= 65 and bat_now.perc < 75 then
				baticon:set_image(theme.charge_70)
            elseif bat_now.perc >= 55 and bat_now.perc < 65 then
				baticon:set_image(theme.charge_60)
            elseif bat_now.perc >= 45 and bat_now.perc < 55 then
				baticon:set_image(theme.charge_50)
            elseif bat_now.perc >= 35 and bat_now.perc < 45 then
				baticon:set_image(theme.charge_40)
            elseif bat_now.perc >= 25 and bat_now.perc < 35 then
				baticon:set_image(theme.charge_30)
            elseif bat_now.perc >= 15 and bat_now.perc < 25 then
				baticon:set_image(theme.charge_20)
            elseif bat_now.perc >= 7 and bat_now.perc < 15 then
				baticon:set_image(theme.charge_10)
            else
				baticon:set_image(theme.charge_empty)
            end
        else
			if bat_now.status == "Full" then
				baticon:set_image(theme.charged_ac)
			elseif bat_now.perc >= 92 then
				baticon:set_image(theme.bat_full)
				batwidget = widget:set_markup(" " .. markup(green, bat_now.perc) .. markup("#ADADAD", "% "))
			elseif bat_now.perc >= 85 and bat_now.perc < 92 then
				baticon:set_image(theme.bat_90)
				batwidget = widget:set_markup(" " .. markup(blue, bat_now.perc) .. markup("#ADADAD", "% "))
			elseif bat_now.perc >= 75 and bat_now.perc < 85 then
				baticon:set_image(theme.bat_80)
				batwidget = widget:set_markup(" " .. markup(blue, bat_now.perc) .. markup("#ADADAD", "% "))
			elseif bat_now.perc >= 65 and bat_now.perc < 75 then
				baticon:set_image(theme.bat_70)
				batwidget = widget:set_markup(" " .. markup(blue, bat_now.perc) .. markup("#ADADAD", "% "))
			elseif bat_now.perc >= 55 and bat_now.perc < 65 then
				baticon:set_image(theme.bat_60)
				batwidget = widget:set_markup(" " .. markup(blue, bat_now.perc) .. markup("#ADADAD", "% "))
			elseif bat_now.perc >= 45 and bat_now.perc < 55 then
				baticon:set_image(theme.bat_50)
				batwidget = widget:set_markup(" " .. markup(blue, bat_now.perc) .. markup("#ADADAD", "% "))
			elseif bat_now.perc >= 35 and bat_now.perc < 45 then
				baticon:set_image(theme.bat_40)
				batwidget = widget:set_markup(" " .. markup(blue, bat_now.perc) .. markup("#ADADAD", "% "))
			elseif bat_now.perc >= 25 and bat_now.perc < 35 then
				baticon:set_image(theme.bat_30)
				batwidget = widget:set_markup(" " .. markup(blue, bat_now.perc) .. markup("#ADADAD", "% "))
			elseif bat_now.perc >= 15 and bat_now.perc < 25 then
				baticon:set_image(theme.bat_20)
				batwidget = widget:set_markup(" " .. markup(blue, bat_now.perc) .. markup("#ADADAD", "% "))
			elseif bat_now.perc >= 7 and bat_now.perc < 15 then
				baticon:set_image(theme.bat_10)
				batwidget = widget:set_markup(" " .. markup(red, bat_now.perc) .. markup("#ADADAD", "% "))
			else
				baticon:set_image(theme.bat_empty)
				batwidget = widget:set_markup(" " .. markup(red, bat_now.perc) .. markup("#ADADAD", "% "))
            end
        end
    end
})
--batwidget.font = theme.font

-- ALSA volume
theme.volume = lain.widget.alsabar({
    -- togglechannel = "IEC958,3",
    notification_preset = { font = theme.font, fg = theme.fg_normal },
})

volumearc_widget({
    main_color = '#af13f7',
    mute_color = '#ff0000',
    thickness = 5,
    height = 15
})

-- cpu_widget({
--     width = 70,
--     step_width = 2,
--     step_spacing = 0,
--     color = '#434c5e'
-- })

brightness_widget({
		color = '#43C5E'
})


-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
    end
})
-- ALSA volume
local volicon = wibox.widget.imagebox(theme.vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(theme.vol_mute)
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_image(theme.vol_no)
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_image(theme.vol_low)
        else
            volicon:set_image(theme.vol)
        end

        widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
    end
})

vpnwidget = wibox.widget.textbox()
vpnwidget:set_text(" ")
vpnwidgettimer = timer({ timeout = 2 })
vpnwidgettimer:connect_signal("timeout",
  function()
    status = io.popen("ifconfig | grep tun0")
    if status:read() == nil then
        vpnwidget:set_markup(markup(red, "VPN down "))
    else
        vpnwidget:set_markup(markup(green, " VPN "))
    end
    status:close()    
  end    
)    
--vpnwidget.font = theme.font
vpnwidgettimer:start()

bbswidget = wibox.widget.textbox()
bbswidget:set_text(" ")
bbswidgettimer = timer({ timeout = 2 })
bbswidgettimer:connect_signal("timeout",
  function()
    status = io.popen("cat /proc/acpi/bbswitch | grep ON")
    if status:read() == nil then
        bbswidget:set_markup(markup(blue, "Intel"))
    else
        bbswidget:set_markup(markup(green, "NVIDIA"))
    end
    status:close()    
  end    
)    
bbswidget.font = theme.font
bbswidgettimer:start()

-- Weather
theme.weather = lain.widget.weather({
    --city_id = 2643743, -- placeholder (London)
    city_id = 1275004, -- placeholder (Kolkata)
	notification_preset = { font = "Mononoki Nerd Font 11" },
    settings = function()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(" " .. markup.font(theme.font, markup(blue,units) .. "°C") .. " ")
    end
})

-- Separators
local first     = wibox.widget.textbox(markup.font("Tamzen 3", " "))
local spr       = wibox.widget.textbox(' ')
local small_spr = wibox.widget.textbox(markup.font("Tamzen 6", " | "))
local bar_spr   = wibox.widget.textbox(markup.font("Tamzen 3", " ") .. markup.fontfg(theme.font, "#333333", "|") .. markup.font("Tamzen 5", " "))

-- Eminent-like task filtering
local orig_filter = awful.widget.taglist.filter.all

-- Taglist label functions
awful.widget.taglist.filter.all = function (t, args)
    if t.selected or #t:clients() > 0 then
        return orig_filter(t, args)
    end
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- -- Tag names and layouts
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the horizontal wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 19, bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- small_spr,
            s.mylayoutbox,
            --first,
            small_spr,
            bbswidget,
            small_spr,
            s.mytaglist,
            small_spr,
            theme.weather.icon,
            theme.weather,
            small_spr,
            first,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mpdicon,
            theme.mpd.widget,
            small_spr,
            corona,
            -- vpnwidget,
            net_wireless,
			      net,
            small_spr,
            -- cpu_widget(),
            cpuicon,
            cpu,
            small_spr,
            fs_widget({ mounts = { '/', '/home' } }),
            small_spr,
            volicon,
            theme.volume,
            small_spr,
            brightness_widget(),
            small_spr,
            -- ram_widget(),
            memicon,
            mem,
            small_spr,
            baticon,
            batwidget,
            small_spr,
            mytextclock,
            wibox.widget.systray(),
        },
    }

--	-- Create the vertical wibox
  --  s.myverticalwibox = awful.wibar({ position = "left", screen = s, width = 50, bg = theme.bg_normal, fg = theme.fg_normal })

  --  -- Add widgets to the wibox
  --  s.myverticalwibox:setup {
  --      layout = wibox.layout.align.vertical,
  --      { -- Top widgets
  --          layout = wibox.layout.fixed.vertical,
  --   		mylauncher,
  --      },
  -- }

end

return theme
