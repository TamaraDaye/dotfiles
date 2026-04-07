vim.opt.guicursor = ""

--line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

--indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Always hard wrap at 80 characters in every file
local wrap_group = vim.api.nvim_create_augroup("HardWrap", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    group = wrap_group,
    pattern = "*",
    callback = function()
        vim.opt_local.textwidth = 150
        vim.opt_local.formatoptions:append("t") --wraps text
        vim.opt_local.smartindent = false
    end,
})

--backup and undo
vim.opt.fillchars:append({ eob = " " })
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- search
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- UI
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
-- Make snippet placeholders look like subtle underlines instead of solid blocks
vim.api.nvim_set_hl(0, "SnippetTabstop", { underline = true, bg = "NONE" })
vim.opt.backspace = { "start", "eol", "indent" }

--window splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- misc
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = "a"
vim.g.editorconfig = true
vim.opt.updatetime = 250
