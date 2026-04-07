return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				show_buffer_icons = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
				diagnostics = false,
				separator_style = "thin",
				numbers = "none",
				indicator = { style = "none" },
				always_show_bufferline = false,

				-- show only filename + icon
				name_formatter = function(buf)
					return vim.fn.fnamemodify(buf.name, ":t")
				end,
			},
		})
	end,
}
