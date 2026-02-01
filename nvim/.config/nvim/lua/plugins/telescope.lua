return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"andrew-george/telescope-themes",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.load_extension("fzf")
		telescope.load_extension("themes")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			extensions = {
				themes = {
					enable_previewer = true,
					enable_live_preview = true,
					persist = {
						enabled = true,
						path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
					},
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })

		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({
				search = word,
				cwd = vim.fn.getcwd(),
			})
		end, { desc = "Find connected words under cursor (CWD)" })

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ cwd = vim.fn.getcwd() })
		end, { desc = "Find files (CWD)" })

		-- NEW: Live grep in current working directory
		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({ cwd = vim.fn.getcwd() })
		end, { desc = "Live grep (CWD)" })

		vim.keymap.set("n", "<leader>lp", builtin.lsp_definitions, { desc = "Show LSP definitions" })

		vim.keymap.set("n", "<C-s>", function()
			local word = vim.fn.expand("<cword>")
			local new = vim.fn.input("Replace '" .. word .. "' with: ")
			vim.cmd("%s/\\<" .. word .. "\\>/" .. new .. "/g")
		end, { noremap = true, silent = true, desc = "Replace word under cursor" })

		vim.keymap.set(
			"n",
			"<leader>ths",
			"<cmd>Telescope themes<CR>",
			{ noremap = true, silent = true, desc = "Theme switcher" }
		)
	end,
}
