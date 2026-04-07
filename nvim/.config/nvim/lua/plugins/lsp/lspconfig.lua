-- NOTE: LSP Keybinds
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Buffer local mappings
        local opts = { buffer = ev.buf, silent = true }
        -- Keymaps
        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>vca", function()
            vim.lsp.buf.code_action()
        end, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show line diagnostics"
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Next diagnostic"
        vim.keymap.set("n", "<leader>dj", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, opts)

        opts.desc = "Prev diagnostic"
        vim.keymap.set("n", "<leader>dk", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, opts)

        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

        vim.keymap.set("i", "<C-h>", function()
            vim.lsp.buf.signature_help()
        end, opts)
    end,
})

-- NOTE: Diagnostic Setup
-- Define sign icons for each severity
local diagnostic_icon = {
    [vim.diagnostic.severity.ERROR] = " ",
    [vim.diagnostic.severity.WARN] = " ",
    [vim.diagnostic.severity.HINT] = "󰠠 ",
    [vim.diagnostic.severity.INFO] = " ",
}


vim.diagnostic.config({
    virtual_text = true, -- Start with it on
    signs = {
        text = diagnostic_icon
    },
    underline = true,
    update_in_insert = false, -- NEVER update while typing
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
    },
})

local virtual_text_on = true

vim.keymap.set("n", "<leader>ll", function()
    virtual_text_on = not virtual_text_on
    vim.diagnostic.config({ virtual_text = virtual_text_on })
    -- Visual feedback so you know what happened
    local msg = virtual_text_on and "Virtual Text: ON" or "Virtual Text: OFF (Clean Mode)"
    vim.notify(msg, vim.log.levels.INFO, { title = "LSP Diagnostics" })
end, { desc = "Toggle Diagnostic Virtual Text" })


-- Configure and enable LSP servers
-- lua_ls
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                -- We use the 'disable' list for lua_ls specific codes
                disable = {
                    "unused-local",
                    "unused-parameter",
                    "unused-function"
                },
                -- lazydev handles 'vim' now, so you can actually remove this
                -- if you want a cleaner config, but keeping it doesn't hurt.
                globals = { "vim" },
            },
            completion = {
                callSnippet = "Replace",
            },
            -- This tells the server not to spend CPU cycles
            -- checking files outside your project
            workspace = {
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
-- Python: Basedpyright (SOLO)
vim.lsp.config("basedpyright", {
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "standard",
                -- FIXED: Disabling unused import/variable warnings
                -- (Let Ruff handle these to avoid double linting)
                diagnosticSeverityOverrides = {
                    reportMissingTypeStubs = false,
                    reportUnusedImport = "none",
                    reportUnusedVariable = "none",
                    reportUnknownVariableType = "none",
                },
            },
        },
    },
})

-- emmet_language_server
vim.lsp.config("emmet_language_server", {
    filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "typescriptreact",
    },
    init_options = {
        includeLanguages = {},
        excludeLanguages = {},
        extensionsPath = {},
        preferences = {},
        showAbbreviationSuggestions = true,
        showExpandedAbbreviation = "always",
        showSuggestionsAsSnippets = false,
        syntaxProfiles = {},
        variables = {},
    },
})

-- emmet_ls
vim.lsp.config("emmet_ls", {
    filetypes = {
        "astro",
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "svelte",
    },
})

-- ts_ls (TypeScript/JavaScript)
vim.lsp.config("ts_ls", {
    workspace_required = false,
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    single_file_support = true,
    init_options = {
        preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
        },
    },
    settings = {
        javascript = {
            validate = {
                enable = true,
            },
        },
    },
})

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
            },
            checkOnSave = {
                command = "clippy",
            },
            procMacro = {
                enable = true,
            },
        },
    },
})

-- gopls
vim.lsp.config("gopls", {
    settings = {
        gopls = {
            anaylses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
})

-- css
vim.lsp.config("cssls", {
    filetypes = { "css", "scss", "less" },
    init_options = { provideFormatter = true },
    single_file_support = true,
    settings = {
        css = {
            lint = {
                unknownAtRules = "ignore",
            },
            validate = true,
        },
        scss = {
            lint = {
                unknownAtRules = "ignore",
            },
            validate = true,
        },
        less = {
            lint = {
                unknownAtRules = "ignore",
            },
            validate = true,
        },
    },
})

-- tailwind
vim.lsp.config("tailwindcss", {
    filetypes = {
        "html",
        "css",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "astro",
    },
    init_options = {
        userLanguages = {
            astro = "html",
        },
    },
})

-- Instead of using mason enable all configured LSP via `automatic_enable=true`
-- Prefer more control, enable manual server call below via vim.lsp.enable("")
-- mason config: lua/sethy/plugins/lsp/mason.lua:22
vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("cssls")
vim.lsp.enable("emmet_language_server")
vim.lsp.enable("emmet_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("astro")
vim.lsp.enable("tailwindcss")
