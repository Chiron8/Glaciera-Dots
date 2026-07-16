-- General Stuff
-- Cursors
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")

-- Something
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- Colours
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")


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
    position = "1920x0",
    scale = 1
})

hl.monitor({
    output = "DP-4",
    mode = "preferred",
    position = "0x0",
    scale = 1
})

-- Actual important stuff
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 2,

        col = {
            active_border = { colors = { "rgba(323EA8aa)", "rgba(3441b4aa)" }, angle = 25 },
            inactive_border = "rgba(2f5280aa)",
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = dwindle,
    },
    decoration = {
        rounding = 10,
        active_opacity = 0.9,
        inactive_opacity = 0.8,

        shadow = {
            enabled = true,
            range = 2,
            render_power = 10,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 0,
            passes = 5,
            vibrancy = 1,
        },
    },
    dwindle = {
        --smart_split = true,
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
    input = {
        kb_layout = "gb",
        follow_mouse = 1,
        sensitivity = 0.3,

    },
    xwayland = {
        enabled = true
    }
})

-- animation stuff :)
hl.curve( "easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve( "easeInOutQuint", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve( "linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve( "almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1} } })
hl.curve( "quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })
hl.curve( "chiron", { type = "bezier", points = { {0.88, 0.3}, {0.18, 0.86} } })
hl.curve( "double bounce", { type = "bezier", points = { {0.48, 0.04}, {0.18, 1.15} } })

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 2,
    bezier = "double bounce"
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 2,
    bezier = "double bounce"
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 2,
    bezier = "double bounce"
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 2,
    bezier = "double bounce",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 2,
    bezier = "double bounce",
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 2,
    bezier = "double bounce",
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 2,
    bezier = "double bounce",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 2,
    bezier = "double bounce",
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 2,
    bezier = "double bounce",
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 2,
    bezier = "double bounce",
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 2,
    bezier = "double bounce",
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 2,
    bezier = "double bounce"
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 2,
    bezier = "double bounce",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 2,
    bezier = "double bounce",
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 2,
    bezier = "double bounce",
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 2,
    bezier = "double bounce",
})

-- autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpm reload")
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
    hl.exec_cmd("swww-daemon")
    hl.exec_cmd("pactl set-source-volume $(pactl get-default-source) 40%")
    hl.exec_cmd("/usr/libexec/hyprpolkitagent")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("openrgb --startminimized")
    hl.exec_cmd("/home/chiron/.local/bin/vibepanel")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"Adwaita-dark\"")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
    hl.exec_cmd("ulauncher")
end)

local terminal = "foot"
local fileManager = "foot ranger"
local menu = "ulauncher"
local mainMod = "SUPER"

hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("/home/chiron/Downloads/cool-retro-term-2.0.0-beta1.AppImage"))

-- ==========================================
-- Windows Management & Focus
-- ==========================================

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Move active window in a direction
hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

-- ==========================================
-- Workspaces & Mouse Actions
-- ==========================================

-- Combined dynamic Loop for focusing & moving to Workspaces 1-10
for i = 1, 10
do
    local key = i % 10 -- Correctly targets '0' key for Workspace 10
    
    -- Switch workspaces with mainMod + [0-9]
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    
    -- Move active window to a workspace with mainMod + SHIFT + [0-9]
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))

-- Move/resize windows with mainMod + LMB/RMB dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ==========================================
-- Multimedia & Freaky Keys (Locked + Repeatable)
-- ==========================================

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"))

-- Custom Functional F9 Media key
hl.bind("F9", hl.dsp.exec_cmd("playerctl next"))

-- Playerctl background media handling (Locked triggers)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl -p spotify play-pause || playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- ==========================================
-- Applications & System Utilities
-- ==========================================

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.local/bin/swww-theme"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("pgrep -x spotify || spotify --enable-features=UseOzonePlatform --ozone-platform=wayland"))
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd("wlogout"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("foot ranger"))

hl.bind("SUPER + SHIFT + S", function()
    hl.plugin.hyprcapture.open()
end)

hl.bind("SUPER + L", hl.dsp.exec_cmd("ulauncher-toggle"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen(0))
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))


-- Core Window Actions & Layout Toggle Actions
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float({}))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("librewolf"))

-- Restarting Waybar via Lua Function Wrapper instead of running duplicates
hl.bind(mainMod .. " + SHIFT + R", function()
    hl.dispatch(hl.dsp.exec_cmd("pkill waybar"))
    hl.dispatch(hl.dsp.exec_cmd("waybar"))
end)

hl.window_rule({
    name = "suppress-maximize-events",

    match = {
        class = "*"
    },

    suppress_event = "maximize"
})

hl.window_rule({
    name = "opaque-writedoc",

    match = {
        class = "^(kitty)$",
        title = "(writedoc)(.*)"
    },

    opaque = true
})

hl.window_rule({
    name = "make-youtube-opaque",

    match = {
        title = "(.*)(YouTube)(.*)"
    },

    opaque = true
})

hl.window_rule({
    name = "make-cava-clear",

    match = {
        title = "^(cava)$"
    },

    no_blur = true
})

hl.window_rule({
    name = ulauncher,
    match = {
        class = "ulauncher"
    },
    border_size = 0,
    border_color = "rgba(ff000000)"
})

hl.layer_rule({
    name = "vibepanel_blur",
    match = {
        namespace = "vibepanel"
    },
    blur = on,
    blur_popups = on,
    ignore_alpha = 0.2
})

hl.layer_rule({
    name = "ulauncher",
    match = {
        namespace = "ulauncher"
    },
    blur = off,
    ignore_alpha = 0
})
