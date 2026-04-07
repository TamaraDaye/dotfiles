local incline = require("incline")

incline.setup({
    -- "render" should be a top-level key in the setup table
    render = function(props)
        local devicons = require("nvim-web-devicons")
        local bufname = vim.api.nvim_buf_get_name(props.buf)
        local filename = vim.fn.fnamemodify(bufname, ":t")

        if filename == "" then
            filename = "[No Name]"
        end

        local ext = vim.fn.fnamemodify(bufname, ":e")
        local icon, icon_color = devicons.get_icon(filename, ext, { default = true })
        local modified = vim.bo[props.buf].modified

        -- Use nested tables to apply styling to specific segments
        return {
            { " ", icon, " ", guifg = icon_color }, -- Segment 1: The Icon
            { filename, gui = modified and "bold" or "none" }, -- Segment 2: Filename
            modified and { " [+]", guifg = "#ff9e64" } or "", -- Segment 3: Modified flag
            " ",
        }
    end,
    hide = {
        only_win = false, -- Keeps it visible even if only one window is open
    },
    window = {
        margin = { horizontal = 0, vertical = 0 },
        padding = 1,
        placement = { horizontal = "right", vertical = "top" },
    },
})
