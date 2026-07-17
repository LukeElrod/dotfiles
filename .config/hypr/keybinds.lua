local mainMod = "SUPER"
local terminal = "ghostty"
local browser = "firefox"
local fileManager = "nautilus"
local ipc = "qs -c noctalia-shell ipc call"

local tapTimer = nil

local function on_double_tap(mods, key, callback, timeout, opts)
	timeout = timeout or 300
	local bindString
	if mods then
		bindString = mods .. " + " .. key
	else
		bindString = key
	end
	hl.bind(bindString, function()
		if tapTimer then
			tapTimer = nil
			callback()
		else
			tapTimer = hl.timer(function()
				tapTimer = nil
			end, { timeout = timeout, type = "oneshot" })
		end
	end, opts)
end

-- noctalia-shell
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(ipc .. " launcher toggle"))
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(ipc .. " settings toggle"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd(ipc .. " launcher emoji"))

hl.bind(
	mainMod .. " + SHIFT + S",
	hl.dsp.exec_cmd('grim -g "$(slurp)" - | tee "$HOME/Pictures/screenshots/$(date "+%y%m%d_%H-%M-%S").png" | wl-copy')
)
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + Escape", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind("F11", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + down", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + A", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + D", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + G", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + S", hl.dsp.layout("promote"))
hl.bind("ALT + Tab", hl.dsp.layout("focus right"))
hl.bind("ALT + grave", hl.dsp.layout("focus left"))

on_double_tap(mainMod, "SUPER_L", function()
	--hl.exec_cmd("notify-send 'Double tap detected!'")
	hl.dispatch(hl.dsp.layout("colresize 1"))
end, 300, { release = true })

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--extra
hl.bind("XF86Tools", hl.dsp.exec_cmd("spotify-launcher"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("gnome-calculator"))
hl.bind("XF86Mail", hl.dsp.exec_cmd("discord"))
hl.bind("XF86HomePage", hl.dsp.exec_cmd("steam"))
