return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- 1. Vesper Palette (Corrected)
		local colors = {
			black = "#101010", -- Background
			white = "#F0F0F0", -- Text
			red = "#FF5D62", -- Errors/Command
			green = "#99FFE4", -- Insert/Success
			blue = "#9CACFF", -- Visual/Branch
			gold = "#FFC799", -- Normal Mode (Matches cursor)
			grey = "#252525", -- Inactive
			dark_grey = "#1C1C1C", -- Middle sections
		}

		-- 2. The Vesper Theme (Applied to your config)
		local vesper_theme = {
			normal = {
				a = { bg = colors.gold, fg = colors.black, gui = "bold" },
				b = { bg = colors.dark_grey, fg = colors.white },
				c = { bg = colors.black, fg = colors.white },
			},
			insert = {
				a = { bg = colors.green, fg = colors.black, gui = "bold" },
				b = { bg = colors.dark_grey, fg = colors.white },
				c = { bg = colors.black, fg = colors.white },
			},
			visual = {
				a = { bg = colors.blue, fg = colors.black, gui = "bold" },
				b = { bg = colors.dark_grey, fg = colors.white },
				c = { bg = colors.black, fg = colors.white },
			},
			command = {
				a = { bg = colors.red, fg = colors.black, gui = "bold" },
				b = { bg = colors.dark_grey, fg = colors.white },
				c = { bg = colors.black, fg = colors.white },
			},
			replace = {
				a = { bg = colors.red, fg = colors.black, gui = "bold" },
				b = { bg = colors.dark_grey, fg = colors.white },
				c = { bg = colors.black, fg = colors.white },
			},
			inactive = {
				a = { bg = colors.black, fg = colors.white, gui = "bold" },
				b = { bg = colors.black, fg = colors.white },
				c = { bg = colors.black, fg = colors.white },
			},
		}

		-- 3. Custom Components
		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
			end,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " },
			-- Ensure diff colors match the theme
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.gold },
				removed = { fg = colors.red },
			},
		}

		local filename = {
			"filename",
			file_status = true,
			path = 0,
		}

		-- Updated Branch Color to match Vesper Blue
		local branch = {
			"branch",
			icon = { "", color = { fg = colors.blue } },
		}

		-- 4. Setup
		lualine.setup({
			icons_enabled = true,
			options = {
				theme = vesper_theme,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "|", right = "" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { diff, filename },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = colors.gold }, -- Updated to Gold
					},
					{ "filetype" },
				},
			},
		})
	end,
}
