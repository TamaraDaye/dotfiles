return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	-- Force load at startup so it handles "nvim ."
	lazy = false,

	-- Keybindings
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
		{ "<leader>-", "<CMD>Oil --float<CR>", desc = "Open parent directory (Float)" },
	},

	config = function()
		require("oil").setup({
			-- 1. Customize columns
			columns = {
				"icon",
				-- "permissions",
				-- "size",
			},

			-- 2. Buffer window settings
			win_options = {
				signcolumn = "yes",
				number = false,
				relativenumber = false,
				cursorline = true,
				foldcolumn = "0",
				spell = false,
				list = false,
				wrap = false,
			},

			-- 3. Float window settings
			float = {
				padding = 2,
				max_width = 100,
				max_height = 0,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
			},

			-- 4. Keymaps inside Oil
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
			},

			-- 5. View options
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, bufnr)
					return name == ".." or name == ".git"
				end,
			},
		})

		-- ==========================================================
		--  VESPER GIT HIGHLIGHTS
		-- ==========================================================
		-- This manually forces the colors to match your Lualine theme

		-- Modified Files -> Vesper Gold
		vim.api.nvim_set_hl(0, "OilGitStatusModified", { fg = "#FFC799", bold = true })

		-- New/Untracked Files -> Vesper Green
		vim.api.nvim_set_hl(0, "OilGitStatusUntracked", { fg = "#99FFE4" })
		vim.api.nvim_set_hl(0, "OilGitStatusNew", { fg = "#99FFE4" })

		-- Ignored Files -> Dark Grey
		vim.api.nvim_set_hl(0, "OilGitStatusIgnored", { fg = "#505050" })
	end,
}
