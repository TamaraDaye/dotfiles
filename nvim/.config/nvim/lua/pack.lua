--native 0.12 vimpack plugin manager

require("plugins.pack-hook")

vim.pack.add({
    -- Core
    { src = "https://github.com/nvim-lua/plenary.nvim"},
    { src = "https://github.com/christoomey/vim-tmux-navigator"},
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" }, --enabled
    { src = "https://github.com/windwp/nvim-ts-autotag" },

    --completetions
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/saghen/blink.cmp.git" },
    { src = "https://github.com/folke/lazydev.nvim.git" },

    --File Nav
    { src = "https://github.com/dmtrKovalenko/fff.nvim.git" }, --enabled
    { src = "https://github.com/stevearc/oil.nvim.git" },

    -- all telescope
    { src = "https://github.com/nvim-telescope/telescope.nvim", branch = "master" },--enabled
    { src = "https://github.com/andrew-george/telescope-themes" }, --enabled
    { src = "https://github.com/windwp/nvim-autopairs" }, --enabled
    { src = "https://github.com/nvim-lualine/lualine.nvim" }, --enabled

    -- icons
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },

    { src = "https://github.com/b0o/incline.nvim.git" },
    -- git
    { src = "https://github.com/ThePrimeagen/git-worktree.nvim" }, --enabled
    { src = "https://github.com/lewis6991/gitsigns.nvim" }, --enabled
    { src = "https://github.com/tpope/vim-fugitive" }, --enabled
    { src = "https://github.com/kdheepak/lazygit.nvim" }, --enabled

    -- LSP stack
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/j-hui/fidget.nvim" },

    --misc
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" }, --enabled
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/folke/snacks.nvim" }, --enabled
    { src = "https://github.com/echasnovski/mini.nvim" }, --enabled
    { src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring" }, -- enabled
    { src = "https://github.com/numToStr/Comment.nvim" }, --enabled
    { src = "https://github.com/folke/noice.nvim", },--enabled
    { src = "https://github.com/andweeb/presence.nvim", },--enabled

    --editing Helpers
    { src = "https://github.com/folke/todo-comments.nvim" }, --enabled
    { src = "https://github.com/folke/trouble.nvim" }, --enabled
    { src = "https://github.com/mbbill/undotree" },--enabled
    { src = "https://github.com/NvChad/nvim-colorizer.lua" }, --enabled

    -- colorschemes
    { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = "https://github.com/craftzdog/solarized-osaka.nvim" },
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/loctvl842/monokai-pro.nvim" },
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin-nvim" },
    { src = "https://github.com/datsfilipe/vesper.nvim.git" },
    { src = "https://github.com/rebelot/kanagawa.nvim.git"},
    {src = "https://github.com/tiagovla/tokyodark.nvim.git"}

})

-- local function pack_clean()
--     local active_plugins = {}
--     local unused_plugins = {}

--     for _, plugin in iparis(vim.pack.get()) do
--         active_plugins[plugin.spec_name] = plugin.active
--     end

--     for _, plugin in iparis(vim.pack.get()) do
--         if not active_plugins[plugin.spec_name] then
--             table.insert(unused_plugins, plugin.spec_name)
--         end
--     end
-- end


require("plugins.auto-pairs")
require("plugins.treesitter")
require("plugins.trouble")
require("plugins.todo-comments")
require("plugins.telescope")
require("plugins.oil")
require("plugins.fff")
require("plugins.colorizer")
require("plugins.comment")
require("plugins.mini")
require("plugins.presence")
require("plugins.lualine")
require("plugins.lsp.mason")
require("plugins.lsp.lspconfig")
require("plugins.blink")
require("plugins.lazydev")
require("plugins.noice")
require("plugins.fidget")
require("plugins.snacks")
require("plugins.incline")
require("nvim-web-devicons")
require("plugins.colorscheme")
