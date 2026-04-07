local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
telescope.load_extension("themes")

telescope.setup({
    defaults = {
        path_display = { "smart" },
        -- This makes Telescope look much cleaner
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous, -- Home row navigation
                ["<C-j>"] = actions.move_selection_next,     -- Home row navigation
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
        },
    },
    -- Keep your themes extension as you had it
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


-- Navigation
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files (Root)" })
vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Grep Project (Live)" })
vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Switch Open Buffers" })

-- Advanced Search
vim.keymap.set("n", "<leader>ps", builtin.git_files, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Search Help Docs" })

-- Your existing recent files, but cleaned up
vim.keymap.set("n", "<leader>pr", builtin.oldfiles, { desc = "Recent Files" })

-- Primeagen's "Search word under cursor" (Corrected)
vim.keymap.set("n", "<leader>pws", function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word })
end, { desc = "Search word under cursor" })

vim.keymap.set("n", "<leader>pWs", function()
    local word = vim.fn.expand("<cWORD>")
    builtin.grep_string({ search = word })
end, { desc = "Search WHOLE word under cursor" })
