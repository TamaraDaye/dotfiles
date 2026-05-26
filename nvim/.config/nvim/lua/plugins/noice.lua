local noice = require("noice")
noice.setup({
	cmdline = {
		enabled = true,
		view = "cmdline_popup",
		format = {
			cmdline = { pattern = "", icon = "󱐌 :", lang = "vim" },
			help = { pattern = "^:%s*he?l?p?%s+", icon = " 󰮦 :" },
			search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = "/", lang = "regex" },
			filter = { pattern = "^:%s*!", icon = " $ :", lang = "bash" },
			lua = {
				pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
				icon = "  :",
				lang = "lua",
			},
			input = { view = "cmdline_input", icon = " 󰥻 :" },
		},
	},

	messages = {
		enabled = true,
		view = "mini",
		view_error = "mini",
		view_warn = "mini",
	},

	health = {
		checker = true,
	},

	popupmenu = {
		enabled = true,
		backend = "nui",
	},

	signature = {
		enabled = true,
	},
})
