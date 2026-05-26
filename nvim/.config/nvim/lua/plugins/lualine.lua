local lualine = require("lualine")

local colors = {
	bg = "#1c1c1c",
	bg_dark = "#141414",
	fg = "#c3ccdc",
	fg_dim = "#828697",
	accent = "#1bfd9c",
	slate = "#708090",
	teal = "#66b2b2",
	purple = "#ae81ff",
	red = "#ff5874",
}

local my_lualine_theme = {
	normal = {
		a = { fg = colors.bg, bg = colors.slate, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg_dark },
		c = { fg = colors.fg_dim, bg = colors.bg },
	},
	insert = {
		a = { fg = colors.bg, bg = colors.accent, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg_dark },
	},
	visual = {
		a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg_dark },
	},
	replace = {
		a = { fg = colors.bg, bg = colors.red, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg_dark },
	},
	command = {
		a = { fg = colors.bg, bg = colors.teal, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg_dark },
	},
	inactive = {
		a = { fg = colors.fg_dim, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg_dim, bg = colors.bg },
		c = { fg = colors.fg_dim, bg = colors.bg },
	},
}

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
}

local filename = {
	"filename",
	file_status = true,
	path = 0,
}

local branch = { "branch", icon = { "", color = { fg = "#A6D4DE" } }, "|" }

lualine.setup({
	icons_enabled = true,
	options = {
		theme = my_lualine_theme,
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "|", right = "" },
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { diff, filename },
		lualine_x = {
			{
				function()
					return "󰏗 "
				end,
				color = { fg = "#ff9e64" },
				cond = function()
					return true
				end,
				on_click = function()
					vim.cmd("PackUpdate")
				end,
			},
			-- { "encoding" },
			-- { "fileformat" },
			{ "filetype" },
		},
	},
})
