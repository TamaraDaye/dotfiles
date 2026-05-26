local view = require("docs-view").setup({ position = "bottom", update_mode = true })

vim.keymap.set("n", "<leader>dv", "<cmd>DocsViewToggle<CR>", { desc = "Toggle Docs View" })
