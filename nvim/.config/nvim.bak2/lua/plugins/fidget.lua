require("fidget").setup({
    progress = {
        display = {
            done_icon = "✓", -- Changes the default icon when finished
            render_limit = 16, -- How many LSP messages to show at once
            done_ttl = 3, -- How many seconds the checkmark stays on screen
        },
    },
    notification = {
        window = {
            winblend = 0, -- Makes the background completely solid (no transparency issues)
        },
    }
})
