require("dressing").setup({
	input = {
		enabled = false,
		default_prompt = "➤ ",
		border = "rounded",
		relative = "cursor",
		prefer_width = 40,
		min_width = 20,
	},
	select = {
		enabled = true,
		backend = { "telescope", "builtin" },
		telescope = require("telescope.themes").get_dropdown(),
		builtin = {
			border = "rounded",
			relative = "editor",
		},
	},
})
