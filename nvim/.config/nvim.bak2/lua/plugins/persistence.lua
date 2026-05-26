require("persistence").setup({
    dir = vim.fn.stdpath("state") .. "/sessions/",
    need = 1,
})

-- auto-restore session when opening Neovim with no arguments
vim.api.nvim_create_autocmd("VimEnter", {
    nested = true,
    callback = function()
        if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
            require("persistence").load()
        end
    end,
})

-- detect stdin
vim.api.nvim_create_autocmd("StdinReadPre", {
    callback = function()
        vim.g.started_with_stdin = true
    end,
})
