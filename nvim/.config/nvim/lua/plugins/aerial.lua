require("aerial").setup({
	backends = { "treesitter", "lsp" },
	layout = {
		max_width = { 40, 0.2 },
		min_width = 20,
		default_direction = "prefer_right",
	},
	show_guides = true,
	filter_kind = false, -- show all symbol kinds
	on_attach = function(bufnr)
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,
})

vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial" })
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope aerial<CR>", { desc = "Search Symbols" })
