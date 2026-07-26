hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		numlock_by_default = true,
		tablet = {
			output = "DP-2",
		},

		follow_mouse = 1,

		sensitivity = -0.1,
		accel_profile = "flat",

		touchpad = {
			natural_scroll = false,
		},
	},
	cursor = {
		default_monitor = "DP-2",
	},
	ecosystem = {
		no_donation_nag = false,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
