--monitors organized from left to right
--just change this to setup your monitors
MONITORS = {
	{
		output = "DP-2",
		mode = "2560x1440@144",
		position = "0x0",
		scale = 1,
	},
	{
		output = "DP-1",
		mode = "2560x1440@60",
		position = "2560x0",
		scale = 1,
	},
}

for _, value in ipairs(MONITORS) do
	hl.monitor({
		output = value.output,
		mode = value.mode,
		position = value.position,
		scale = value.scale,
	})
end
