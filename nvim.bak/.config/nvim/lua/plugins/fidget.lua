return {
	"j-hui/fidget.nvim",
	tag = "legacy",
	event = "LspAttach",
	config = function()
		require("fidget").setup({
			text = {
				spinner = "dots", -- simple spinner
			},
			window = {
				blend = 0, -- fully opaque
			},
		})
	end,
}
