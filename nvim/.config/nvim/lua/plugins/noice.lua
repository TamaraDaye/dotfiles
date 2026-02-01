return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			-- DISABLE Noice's message handling
			-- This puts messages back to the bottom command line area
			messages = {
				enabled = true,
			},
			cmdline = {
				enabled = true,
			},

			-- DISABLE Noice's LSP UI (Hover & Signature)
			-- This keeps your "K" documentation and typing hints standard
			lsp = {
				hover = {
					enabled = false,
				},
				signature = {
					enabled = false,
				},
				-- Keep these overrides for the command line completion docs
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
		})
	end,
}
