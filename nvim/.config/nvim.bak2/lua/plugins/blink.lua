local blink = require("blink.cmp")

blink.setup({
    keymap = {
        preset = "super-tab",
    },

    appearance = {
        nerd_font_variant = "mono",
    },

    completion = {
        keyword = { range = "prefix" },
        trigger = {
            show_on_keyword = true,
            show_on_trigger_character = true,
        },
        documentation = {
            auto_show = false,
        },
        accept = {
            auto_brackets = { enabled = true },
        },
    },

    sources = {
        -- Add lazydev to your default providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },

        providers = {
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                -- make lazydev completions top priority (see `:h blink.cmp`)
                score_offset = 100,
            },
        },
    },
})
