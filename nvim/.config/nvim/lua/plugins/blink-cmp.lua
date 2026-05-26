require("blink.cmp").setup({
	keymap = { preset = "super-tab" }, -- or "default" for ctrl-y to accept
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = { auto_show = true },
		ghost_text = { enabled = false },
		accept = { auto_brackets = { enabled = true } },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	signature = { enabled = true },
	fuzzy = { implementation = "prefer_rust_with_warning" },
	cmdline = { enabled = false },
})
