local todo_comments = require("todo-comments")
--HACK:
--TODO:
--WARN:
--FIX:
--PERF:
--NOTE:
--FORGETNOT:
--TEST:
todo_comments.setup({
    keywords = {
        FIX = {
            icon = " ",  --icon used as the to repr the comment keyword
            color = "error", -- can be a hex color or named color
            alt = {"FIXME", "BUG", "FIXIT", "ISSUE"} -- alternate keywords for the primary keyword
        },
        TODO = { icon = " ", color = "info" , alt = {"Personal"} },
        HACK = { icon = " ", color = "warning", alt = { "DON SKIP" } },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO", "READ", "COLORS", "Custom" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        FORGETNOT = { icon = " ", color = "hint" },
    },
    search = {
        command = "rg",
        args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    },
})
