--windows
hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	match = {
		title = "Steam",
	},
	tile = true,
})

hl.window_rule({
	match = {
		title = "Diablo IV",
	},
	fullscreen = true,
})

--workspaces

hl.workspace_rule({
	workspace = "1",
	monitor = MONITORS[1].output,
	default = true,
	persistent = true,
	default_name = "chat",
})

hl.workspace_rule({
	workspace = "5",
	monitor = MONITORS[2].output,
	persistent = true,
	default = true,
	default_name = "code",
})

hl.workspace_rule({ workspace = "2", monitor = MONITORS[1].output, persistent = true, default_name = "web" })
hl.workspace_rule({ workspace = "3", monitor = MONITORS[1].output, persistent = true, default_name = "misc" })
hl.workspace_rule({ workspace = "4", monitor = MONITORS[1].output, persistent = true, default_name = "notes" })
