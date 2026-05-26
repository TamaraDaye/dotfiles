local M = {}

M.link_prefix = "https://github.com/"

M.plugins = {
	-- Core
	{ src = "nvim-lua/plenary.nvim" },
	{ src = "christoomey/vim-tmux-navigator" },
	{ src = "nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "windwp/nvim-ts-autotag" },
	{ src = "folke/persistence.nvim" },

	-- Completions
	{ src = "rafamadriz/friendly-snippets" },
	{ src = "L3MON4D3/LuaSnip" },
	{ src = "folke/lazydev.nvim.git" },
	{ src = "saghen/blink.cmp", version = "v1.10.0" },

	-- UI and pickers for selections e.g grep files, find files
	{ src = "nvim-telescope/telescope.nvim", branch = "master" },
	{ src = "andrew-george/telescope-themes" },
	{ src = "nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "ahmedkhalf/project.nvim" },
	{ src = "stevearc/dressing.nvim" },
	{ src = "Bekaboo/dropbar.nvim" },
	{ src = "NvChad/nvim-colorizer.lua" },
	{ src = "lukas-reineke/indent-blankline.nvim" },
	{ src = "nvim-lualine/lualine.nvim" }, --enabled

	-- File nav
	{ src = "stevearc/oil.nvim.git" },

	-- Icons
	{ src = "nvim-tree/nvim-web-devicons" },

	-- Git
	{ src = "lewis6991/gitsigns.nvim" },
	{ src = "tpope/vim-fugitive" },
	{ src = "kdheepak/lazygit.nvim" },

	-- LSP stack
	{ src = "neovim/nvim-lspconfig" },
	{ src = "mason-org/mason.nvim" },
	{ src = "mason-org/mason-lspconfig.nvim" },
	{ src = "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "j-hui/fidget.nvim", branch = "legacy" },
	{ src = "amrbashir/nvim-docs-view" },
	{ src = "stevearc/aerial.nvim" },
	{ src = "stevearc/conform.nvim" },

	-- Misc
	{ src = "MunifTanjim/nui.nvim" },
	{ src = "andweeb/presence.nvim" }, --enabled
	{ src = "folke/snacks.nvim" }, --enabled
	{ src = "JoosepAlviste/nvim-ts-context-commentstring" }, -- enabled
	{ src = "numToStr/Comment.nvim" }, --enabled
	{ src = "folke/noice.nvim" }, --enabled

	--Helpers
	{ src = "folke/todo-comments.nvim" }, --enabled
	{ src = "folke/trouble.nvim" }, --enabled
	{ src = "windwp/nvim-autopairs" }, --enabled

	--Colorschemes
	{ src = "rose-pine/neovim", name = "rose-pine" },
	{ src = "folke/tokyonight.nvim" },
	{ src = "datsfilipe/vesper.nvim.git" },
	{ src = "rebelot/kanagawa.nvim.git" },
	{ src = "tiagovla/tokyodark.nvim.git" },
	{ src = "bluz71/vim-moonfly-colors", name = "moonfly" },
}

return M
