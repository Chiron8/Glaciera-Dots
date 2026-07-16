-- General Stuff


-- Cursors
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")

-- Something
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")


-- Monitors
hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "1920x0",
    scale = 1
})

hl.monitor({
    output = "DP-1",
    mode = "preferred",
    position = "0x0",
    scale = 1
})

hl.monitor({
    output = "HDMI-A-2",
    mode = "preferred",
    position = "0x0",
    scale = 1
})

hl.monitor({
    output = "DP-4",
    mode = "preferred",
    position = "1920x0",
    scale = 1
})

-- Actual important stuff
hl.config({
    general {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 2

        col.active_border = rgba(323EA8aa) rgba(3441b4aa) 25deg,
        col.inactive_border = rgba(2f5280aa),

        resize_on_border = false,
        allow_tearing = false,
        layout = dwindle,
    },
    decoration {
        rounding = 10,
        active_opacity = 0.9,
        inactive_opacity = 0.8,

        shadow {
            enabled = true,
            range = 2,
            render_power = 10,
            color = rgba(1a1a1aee),
        },

        blur {
            enabled = true,
            size = 2,
            passes = 4,
            vibrancy = 1,
        },
    },
    dwindle {
        smart_split = true,
    },
    misc {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true
        vfr = true,
    },
    input {
        kb_layout = gb,
        follow_mouse = 1,
        sensitivity = 0.3,

    }
})

-- animation stuff :)
hl.curve( "easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve( "easeInOutQuint", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve( "linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve( "almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1} } })
hl.curve( "quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })
hl.curve( "chiron", { type = "bezier", points = { {0.88, 0.3}, {0.18, 0.86} } })

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    curve = "default"
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    curve = "easeOutQuint"
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    curve = "easeOutQuint"
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    curve = "easeOutQuint",
    style = "popin 87%"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    curve = "linear",
    style = "popin 87%"
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    curve = "almostLinear"
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    curve = "almostLinear"
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    curve = "quick"
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    curve = "easeOutQuint",
    style = "fade"
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    curve = "easeOutQuint",
    style = "fade"
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    curve = "linear",
    style = "slide"
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    curve = "almostLinear"
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    curve = "almostLinear"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 2.2,
    curve = "chiron",
    style = "slide"
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 2.2,
    curve = "chiron",
    style = "fade"
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 2.2,
    curve = "chiron",
    style = "fade"
})

-- autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swww-daemon")
    hl.exec_cmd("swaync")
    hl.exec_cmd("exec-once = pactl set-source-volume $(pactl get-default-source) 40%")
    hl.exec_cmd("exec-once = /usr/libexec/hyprpolkitagent")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("exec-once = openrgb --startminimized")
end)

-- ##########
-- # Define #
-- ##########

hl.set("$terminal", "kitty")
hl.set("$fileManager", "kitty ranger")
hl.set("$menu", "sherlock")
hl.set("$mainMod", "SUPER")

hl.bind({
    mods = "$mainMod SHIFT",
    key = "T",
    action = "exec",
    arg = "/home/chiron/Downloads/cool-retro-term-2.0.0-beta1.AppImage"
})

-- ###########
-- # Windows #
-- ###########

hl.bind({
    mods = "$mainMod",
    key = "left",
    action = "movefocus",
    arg = "l"
})

hl.bind({
    mods = "$mainMod",
    key = "right",
    action = "movefocus",
    arg = "r"
})

hl.bind({
    mods = "$mainMod",
    key = "up",
    action = "movefocus",
    arg = "u"
})

hl.bind({
    mods = "$mainMod",
    key = "down",
    action = "movefocus",
    arg = "d"
})

hl.bind({
    mods = "SUPER SHIFT",
    key = "Left",
    action = "movewindow",
    arg = "l"
})

hl.bind({
    mods = "SUPER SHIFT",
    key = "Right",
    action = "movewindow",
    arg = "r"
})

hl.bind({
    mods = "SUPER SHIFT",
    key = "Up",
    action = "movewindow",
    arg = "u"
})

hl.bind({
    mods = "SUPER SHIFT",
    key = "Down",
    action = "movewindow",
    arg = "d"
})

-- Workspaces

for i = 1, 9 do
    hl.bind({
        mods = "$mainMod",
        key = tostring(i),
        action = "workspace",
        arg = tostring(i)
    })
end

hl.bind({
    mods = "$mainMod",
    key = "0",
    action = "workspace",
    arg = "10"
})

for i = 1, 9 do
    hl.bind({
        mods = "$mainMod SHIFT",
        key = tostring(i),
        action = "movetoworkspace",
        arg = tostring(i)
    })
end

hl.bind({
    mods = "$mainMod SHIFT",
    key = "0",
    action = "movetoworkspace",
    arg = "10"
})

hl.bind({
    mods = "$mainMod",
    key = "S",
    action = "togglespecialworkspace",
    arg = "magic"
})

hl.bind({
    mods = "$mainMod",
    key = "mouse_down",
    action = "workspace",
    arg = "e+1"
})

hl.bind({
    mods = "$mainMod",
    key = "mouse_up",
    action = "workspace",
    arg = "e-1"
})

hl.bindm({
    mods = "$mainMod",
    key = "mouse:272",
    action = "movewindow"
})

hl.bindm({
    mods = "$mainMod",
    key = "mouse:273",
    action = "resizewindow"
})

-- ###############
-- # Freaky keys #
-- ###############

hl.bindel({
    key = "XF86AudioRaiseVolume",
    action = "exec",
    arg = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
})

hl.bindel({
    key = "XF86AudioLowerVolume",
    action = "exec",
    arg = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
})

hl.bindel({
    key = "XF86AudioMute",
    action = "exec",
    arg = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
})

hl.bindel({
    key = "XF86AudioMicMute",
    action = "exec",
    arg = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
})

hl.bindel({
    key = "XF86MonBrightnessUp",
    action = "exec",
    arg = "brightnessctl s 10%+"
})

hl.bindel({
    key = "XF86MonBrightnessDown",
    action = "exec",
    arg = "brightnessctl s 10%-"
})

hl.bind({
    key = "XKB_KEY_F9",
    action = "exec",
    arg = "playerctl next"
})

hl.bindl({
    key = "XF86AudioNext",
    action = "exec",
    arg = "playerctl next"
})

hl.bindl({
    key = "XF86AudioPause",
    action = "exec",
    arg = "playerctl play-pause"
})

hl.bindl({
    key = "XF86AudioPlay",
    action = "exec",
    arg = "playerctl -p spotify play-pause || playerctl play-pause"
})

hl.bindl({
    key = "XF86AudioPrev",
    action = "exec",
    arg = "playerctl previous"
})

-- ##########################
-- # Applications and stuff #
-- ##########################

hl.bind({
    mods = "$mainMod",
    key = "B",
    action = "exec",
    arg = "~/.local/bin/swww-theme"
})

hl.bind({
    mods = "$mainMod",
    key = "S",
    action = "exec",
    arg = "pgrep -x spotify || spotify --enable-features=UseOzonePlatform --ozone-platform=wayland"
})

hl.bind({
    mods = "$mainMod SHIFT",
    key = "R",
    action = "exec",
    arg = "pkill waybar"
})

hl.bind({
    mods = "$mainMod SHIFT",
    key = "R",
    action = "exec",
    arg = "waybar"
})

hl.bind({
    mods = "CONTROLALT",
    key = "DELETE",
    action = "exec",
    arg = "wlogout"
})

hl.bind({
    mods = "SUPER",
    key = "E",
    action = "exec",
    arg = "kitty ranger"
})

hl.bind({
    mods = "SUPER SHIFT",
    key = "S",
    action = "exec",
    arg = [[grim -g "$(slurp -d)" - | wl-copy]]
})

hl.bind({
    mods = "SUPER",
    key = "L",
    action = "exec",
    arg = "sherlock"
})

hl.bind({
    mods = "SUPER",
    key = "A",
    action = "exec",
    arg = "swaync-client -t"
})

hl.bind({
    mods = "SUPER",
    key = "F",
    action = "fullscreen"
})

hl.bind({
    mods = "SUPER SHIFT",
    key = "L",
    action = "exec",
    arg = "hyprlock"
})

hl.bind({
    mods = "$mainMod",
    key = "T",
    action = "exec",
    arg = "$terminal"
})

hl.bind({
    mods = "$mainMod",
    key = "Q",
    action = "killactive"
})

hl.bind({
    mods = "$mainMod SHIFT",
    key = "Q",
    action = "killactive"
})

hl.bind({
    mods = "$mainMod",
    key = "M",
    action = "exit"
})

hl.bind({
    mods = "$mainMod",
    key = "V",
    action = "togglefloating"
})

hl.bind({
    mods = "$mainMod",
    key = "R",
    action = "exec",
    arg = "$menu"
})

hl.bind({
    mods = "$mainMod",
    key = "P",
    action = "pseudo"
})

hl.bind({
    mods = "$mainMod",
    key = "J",
    action = "togglesplit"
})

hl.bind({
    mods = "$mainMod",
    key = "W",
    action = "exec",
    arg = "firefox"
})

hl.windowrule({
    name = "suppress-maximize-events",

    match = {
        class = "*"
    },

    suppress_event = "maximize"
})

hl.windowrule({
    name = "opaque-writedoc",

    match = {
        class = "^(kitty)$",
        title = "(writedoc)(.*)"
    },

    opaque = true
})

hl.windowrule({
    name = "make-youtube-opaque",

    match = {
        title = "(.*)(YouTube)(.*)"
    },

    opaque = true
})

hl.windowrule({
    name = "make-cava-clear",

    match = {
        title = "^(cava)$"
    },

    no_blur = true
})

hl.layerrule({
    name = "make-swaync-layer-blur",

    match = {
        namespace = "swaync-control-center"
    },

    blur = true
})
