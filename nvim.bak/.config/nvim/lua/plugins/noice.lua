return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			messages = {
				enabled = false,
			},
			cmdline = {
				enabled = true,
			},
			-- ADD THIS SECTION:
			popupmenu = {
				enabled = false, -- Let nvim-cmp/native UI handle the completion menu
			},
			lsp = {
				progress = {
					enabled = false,
				},
				hover = { enabled = false },
				signature = { enabled = false },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
		})
	end,
}
