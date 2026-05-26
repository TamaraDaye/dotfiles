vim.api.nvim_create_autocmd("BufRead", {
	once = true,
	callback = function()
		require("colorizer").setup()
	end,
})
