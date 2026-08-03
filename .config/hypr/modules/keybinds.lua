local terminal     = "kitty"
local file_manager = "thunar"
local menu         = "rofi -show drun"
local color_picker = "hyprpicker -a -n -f rgb"

local mainMod = "SUPER"

hl.bind(mainMod .. " + C", hl.dsp.window.close())

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(file_manager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(color_picker))
hl.bind(mainMod .. " + B", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Screenshotting
local ss_store_location = "~/Pictures/Screenshots"
local ss_name_format 	= "Screenshot_$(date +%d-%m-%y_%H-%M-%S).png"

hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("hyprshot -m region -o " .. ss_store_location .. " -f" .. ss_name_format))
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.exec_cmd("hyprshot -m output -o " .. ss_store_location .. " -f" .. ss_name_format))

-- Scripts
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/dotfiles/.config/rofi/scripts/sys-state.sh"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("~/dotfiles/.config/rofi/scripts/power-profile.sh"))

-- Wallpaper
hl.bind(mainMod .. " + W", function() _G.set_wallpaper() end)

-- Shut down hyprland
hl.bind(mainMod .. " + SHIFT + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move workspace to another monitor
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.workspace.move({ monitor = "DP-1" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.workspace.move({ monitor = "HDMI-A-2" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/dotfiles/.config/waybar/scripts/audio.sh output 5%+"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/dotfiles/.config/waybar/scripts/audio.sh output 5%-"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/dotfiles/.config/waybar/scripts/audio.sh output mute"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("~/dotfiles/.config/waybar/scripts/audio.sh input mute"),
	{ locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Playback (requires "playerctl")
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
