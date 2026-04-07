local wk = require("which-key")

-- 1. Setup global options (Visuals, Triggers, etc.)
wk.setup({
    -- your UI preferences go here
    preset = "modern", -- or "classic"
    delay = 200, 
})

-- 2. Add your custom keymaps
wk.add({
    {
        "<leader>?",
        function()
            wk.show({ global = false })
        end,
        desc = "Buffer Local Keymaps",
    },
})
