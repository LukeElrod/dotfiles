hl.monitor({
	output = "DP-2",
	mode = "2560x1440@144",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "DP-1",
	mode = "2560x1440@60",
	position = "2560x0",
	scale = 1,
})

hl.workspace_rule({
	workspace = 1,
	monitor = "DP-2",
	default = true,
})

hl.workspace_rule({
	workspace = 5,
	monitor = "DP-1",
	default = true,
})
