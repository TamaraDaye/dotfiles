-- import mason and mason_lspconfig
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

-- local capabilities = cmp_nvim_lsp.default_capabilities() -- used to enable autocompletion (assign to every lsp server config) enable mason and configure icons
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

mason_tool_installer.setup({
    ensure_installed = {
        -- LSP Servers
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "gopls",
        "angularls",
        "astro",
        "emmet_ls",
        "emmet_language_server",
        "marksman",
        "basedpyright",
        "rust_analyzer",
        "clangd",
        "denols",

        -- Formatters
        "prettier",
        "stylua",
        "isort",
        "rustfmt",
        "gofumpt",
    },
})

mason_lspconfig.setup({
    ensure_installed = {}, -- Leave this empty!
    automatic_installation = false,
})
