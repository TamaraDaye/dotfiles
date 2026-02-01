return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		-- 1. ADD THIS INIT FUNCTION
		init = function()
			-- Create an autocommand that runs EVERY time a colorscheme is loaded
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = function()
					-- Force Vesper Gold (#FFC799) on the Header
					vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#FFC799" })

					-- Optional: Force it on the icons/keys too if you want full gold
					vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#FFC799" })
					vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#FFC799" })
					vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#FFC799" })
				end,
			})
		end,
		opts = {
			explorer = {
				enabled = true,
				replace_netrw = false, -- Add this line!
				layout = {
					cycle = false,
				},
			},
			-- ... rest of your opts
			dashboard = {
				preset = {
					header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢌⠢⡸⡪⡮⡳⣱⡀⠀⠀⢐⠱⡨⣳⢝⡵⡀⠀⠀⠰⡡⡹⣝⡮⡯⣞⣧⠰⠀⠀⠸⡽⡵⣇⢢⠀⠀⠀⠀⠀⠀⢻⡽⣽⢽⢧⡊⢔⠀⠀⠙⣉⣤⢴⠴⡳⠡⢃⠂⠀⠀⠘⠬⠢⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢆⠢⡸⠬⠬⡉⡌⢒⠀⠀⠐⠕⣸⢕⢯⡺⣆⠀⠀⠨⡢⢹⡳⡽⡽⣵⣫⢷⡱⢄⠀⠹⣽⢽⣲⡑⠄⠀⠀⠀⠀⠈⣯⡯⠟⠓⢉⡀⡐⠄⢘⡵⠶⠕⠓⠛⠑⠁⠙⠀⠀⠈⣎⢪⠣⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡡⡂⢮⠺⠪⠖⠞⠖⠦⠀⡐⡀⠤⣉⡉⠙⠚⠆⠀⠀⡎⣸⢯⢯⣻⢮⡯⣿⢵⡂⢆⠀⢻⡽⣳⢿⡔⢄⠀⠀⠀⠀⢀⣠⣴⠞⡫⠆⠂⠋⢀⠀⠤⠤⠴⢴⣴⣤⣦⣤⡄⠀⠀⠀⠑⢄⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢀⣀⣠⣤⣤⣤⡤⠤⠀⠀⠀⠈⠱⢢⠩⡛⠶⣦⡄⠀⠈⠊⠻⡽⣽⣳⡯⡿⣽⣻⣌⢢⡀⢻⣯⡯⣿⣕⢄⠀⠀⠀⠀⠏⡔⠜⠈⣠⡴⠊⡁⠀⢠⠾⠀⡀⡉⢿⣿⣿⣿⡀⢸⠂⢀⢣⢡⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⠟⡁⡀⠀⠞⠆⣀⣀⠠⣄⡁⠣⡣⢄⠫⡀⠹⣌⠙⢯⢷⣗⣿⣻⣳⣗⣿⣂⢺⣄⢻⡽⣾⣺⢇⢅⠀⠀⠀⠸⠈⣠⣾⣿⠃⠀⠻⢋⡦⠲⣅⠹⠁⠀⣿⣿⣿⣧⠀⠅⣾⡐⢅⠆⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⡏⠀⠙⢍⢱⠃⢣⢘⠊⠀⢸⣿⣦⡈⠌⡓⢤⠀⡏⡾⣦⣙⡺⣾⣺⣳⢗⣷⣻⣄⢻⣳⣟⢗⣕⡯⠣⢡⠀⠀⠀⣰⣿⣿⣿⡂⢀⣶⡀⠳⢒⡃⣴⡀⠀⣾⣿⣿⣿⢃⢸⡺⣎⠢⠩⡂
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣧⠀⣰⢦⠨⢒⠩⠰⢧⠀⣼⣿⣿⣷⡀⡑⢕⢅⠌⡒⡌⡷⡯⣗⡯⣞⡯⣗⣟⣞⣯⡗⣗⣯⢎⢜⢌⠎⡕⠀⠀⠸⣿⣿⣿⣧⡈⠀⠁⠚⡶⠀⠈⢈⣼⣿⣿⡿⠁⡐⡨⣞⡽⡌⢕⠨
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣷⣄⠀⠀⠻⠁⢀⣠⣾⣿⣿⣿⣿⣷⠘⡔⡡⠣⡣⣕⢍⡿⡮⡯⣏⡯⣗⣗⣗⢷⢡⣟⣞⡰⡡⡃⡇⡣⢅⡀⠀⢿⣿⣿⣿⣿⣷⣦⣤⣤⣴⣾⣿⣿⠿⠋⠀⡐⠀⡯⣳⣝⢧⢘⠄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢀⠀⠙⠛⠿⢿⣶⣶⣿⣿⣿⣿⣿⢿⠿⠿⠛⠼⡨⡂⠇⡆⣦⡻⡮⣫⢯⡺⣝⢞⢮⡺⡽⢸⣺⢺⡨⠪⡊⢎⢪⠪⡠⠀⠈⡙⠛⠛⠛⠛⠛⡛⠟⠛⠋⠉⢀⢀⢀⢈⠠⢐⣯⡳⡽⡵⡐⠨
⠀⠀⠀⠀⠀⠀⡆⠀⠀⠀⠀⢁⣂⢷⢤⣅⢄⠠⡀⠠⢠⠠⡀⣀⣀⠄⡠⢐⢐⠢⣱⢕⣗⢽⡪⡮⣫⡳⣝⢞⢎⣏⢧⡫⡧⡹⡮⡳⣝⢶⢬⢌⡢⣑⡘⢄⠀⠢⠌⢤⣌⢤⣅⣢⡰⡬⡴⣺⢽⢽⠄⠠⡐⣝⡮⣞⡽⡺⠁⠀
⠀⠀⠀⠀⠀⠀⢽⡀⠀⠀⠀⠐⣜⢮⡳⣳⡫⡯⣞⢽⡪⣏⢯⡳⣕⢯⢆⣂⠒⡼⣸⢕⣗⣝⢮⡫⡮⡺⣪⢳⢝⣜⢮⡚⡮⡫⣞⢽⡸⡪⡧⣛⢮⢳⢕⡧⡂⠡⠨⣣⢷⢝⣞⢮⢯⣫⢯⢞⡽⣝⠆⢅⢆⢞⡮⣳⢝⠅⠀⠀
⠀⠀⠀⠀⠀⠀⠳⠽⠄⠀⠀⠀⠨⠷⠽⠵⠽⠵⠯⠳⠽⠮⠳⠝⠮⠗⠷⠐⠕⠪⠗⠵⠕⠮⠣⠳⠝⠼⠪⠧⠳⠵⠵⠵⠹⠵⠕⠧⠫⠳⠽⠜⠵⠫⠳⠽⠔⠠⠹⠮⠳⠽⠮⠯⠳⠱⠯⠗⠯⠮⠕⠅⠪⠷⠽⠪⠏⠀⠀⠀
					]],
				},
				sections = {
					{ section = "header" },
					{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
					{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{ section = "startup" },
				},
			},
		},
		keys = {
			{
				"<leader>es",
				function()
					require("snacks").explorer()
				end,
				desc = "Open snacks explorer",
			},
			{
				"<leader>rN",
				function()
					require("snacks").rename.rename_file()
				end,
				desc = "Fast file rename current file",
			},
			{
				"<leader>dB",
				function()
					require("snacks").bufdelete()
				end,
				desc = "Delete or close Buffer (Confirm)",
			},

			-- Snacks Picker
			{
				"<leader>pf",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find Files (Snacks Picker)",
			},
			{
				"<leader>pc",
				function()
					require("snacks").picker.files({ cwd = "~/dotfiles/nvim/.config/nvim/lua" })
				end,
				desc = "Find Config File",
			},
			{
				"<leader>ps",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Grep word",
			},
			{
				"<leader>pws",
				function()
					require("snacks").picker.grep_word()
				end,
				desc = "Search Visual selection or Word",
				mode = { "n", "x" },
			},
			{
				"<leader>pk",
				function()
					require("snacks").picker.keymaps({ layout = "ivy" })
				end,
				desc = "Search Keymaps (Snacks Picker)",
			},
			{
				"<leader>,",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},

			-- Git Stuff
			{
				"<leader>gbr",
				function()
					require("snacks").picker.git_branches({ layout = "select" })
				end,
				desc = "Pick and Switch Git Branches",
			},
			{
				"<leader>gb",
				function()
					Snacks.picker.git_branches()
				end,
				desc = "Git Branches",
			},
			{
				"<leader>gl",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>gL",
				function()
					Snacks.picker.git_log_line()
				end,
				desc = "Git Log Line",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},
			{
				"<leader>gS",
				function()
					Snacks.picker.git_stash()
				end,
				desc = "Git Stash",
			},
			{
				"<leader>gd",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "Git Diff (Hunks)",
			},
			{
				"<leader>gf",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "Git Log File",
			},

			-- Other Utils
			{
				"<leader>th",
				function()
					require("snacks").picker.colorschemes({ layout = "ivy" })
				end,
				desc = "Pick Color Schemes",
			},
			{
				"<leader>vh",
				function()
					require("snacks").picker.help()
				end,
				desc = "Help Pages",
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>pt",
				function()
					require("snacks").picker.todo_comments()
				end,
				desc = "Todo",
			},
			{
				"<leader>pT",
				function()
					require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
				end,
				desc = "Todo/Fix/Fixme",
			},
		},
	},
}
