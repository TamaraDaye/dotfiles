return {
	"andweeb/presence.nvim",
	config = function()
		local presence = require("presence").setup({
			auto_update = true,
			neovim_image_text = "The one true Text Editor",
			main_image = "vim",
			show_time = true,

			--Rich presence text options--
			editing_text = "Editiing %s",
			workspace_text = "Working on %s",
			reading_text = "Reading %s",
			file_explorer_text = "Browsing %s",
		})
	end,
}
