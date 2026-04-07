return {
	"MeanderingProgrammer/render-markdown.nvim",
	enabled = true,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		-- Define only Foreground colors to keep the UI clean
		local colors = {
			["1"] = "#ff757f",
			["2"] = "#4fd6be",
			["3"] = "#7dcfff",
			["4"] = "#ff9e64",
			["5"] = "#7aa2f7",
			["6"] = "#c0caf5",
		}

		for i, col in pairs(colors) do
			vim.cmd(string.format("highlight Headline%sFg guifg=%s gui=bold", i, col))
		end
	end,
	opts = {
		-- Avoid rendering in any floating windows to ensure total consistency
		render_modes = { "n", "v" },
		exclude = {
			buftypes = { "nofile" },
		},
		heading = {
			sign = false,
			icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
			-- REMOVED backgrounds: This is what was causing the white/gray blocks
			backgrounds = {},
			foregrounds = {
				"Headline1Fg",
				"Headline2Fg",
				"Headline3Fg",
				"Headline4Fg",
				"Headline5Fg",
				"Headline6Fg",
			},
		},
		code = {
			sign = false,
			width = "block",
			right_pad = 2,
		},
		checkbox = {
			enabled = true,
			position = "inline",
			unchecked = { icon = "󰄱 " },
			checked = { icon = "󰱒 " },
		},
	},
}
