-- lua/plugins/trouble.lua
require("trouble").setup({
    warn_no_results = false,
    modes ={
        diagnostics ={
            auto_close = true,
            jump = true
        },
    },
    focus = true,

    throttle ={
        refresh = 20,
        update_view = 20,
    },
})

vim.keymap.set(
    "n",
    "<leader>tt",
    "<cmd>Trouble diagnostics toggle<CR>",
    { desc = "Open trouble workspace diagnostics" }
)
vim.keymap.set(
    "n",
    "<leader>td",
    "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
    { desc = "Open trouble document diagnostics" }
)
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Open trouble quickfix list" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Open trouble location list" })
vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo toggle<CR>", { desc = "Open todos in trouble" })
