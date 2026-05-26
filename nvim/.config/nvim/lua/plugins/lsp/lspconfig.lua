local lspconfig = require("lspconfig")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings
		local opts = { buffer = ev.buf, silent = true, noremap = true }
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
		vim.keymap.set({ "n", "v" }, "<leader>ca", function()
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

local diagnostic_icon = {
	[vim.diagnostic.severity.ERROR] = " ",
	[vim.diagnostic.severity.WARN] = " ",
	[vim.diagnostic.severity.HINT] = "󰠠 ",
	[vim.diagnostic.severity.INFO] = " ",
}

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "●",
		-- Only show errors and warnings inline, no hints/info
		severity = { min = vim.diagnostic.severity.WARN },
	},
	signs = {
		text = diagnostic_icon,
		severity = { min = vim.diagnostic.severity.WARN },
	},
	underline = { severity = { min = vim.diagnostic.severity.ERROR } },
	update_in_insert = false,
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

-- Toggle virtual text
local virtual_text_on = true
vim.keymap.set("n", "<leader>ll", function()
	virtual_text_on = not virtual_text_on
	vim.diagnostic.config({
		virtual_text = virtual_text_on and {
			spacing = 4,
			prefix = "●",
			severity = { min = vim.diagnostic.severity.WARN },
		} or false,
	})
	local msg = virtual_text_on and "Virtual Text: ON" or "Virtual Text: OFF"
	vim.notify(msg, vim.log.levels.INFO)
end, { desc = "Toggle Diagnostic Virtual Text" })

-- lua_ls
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "hl" },
				disable = { "unused-local", "unused-parameter", "unused-function" },
			},
			completion = {
				callSnippet = "Replace",
			},
			workspace = {
				checkThirdParty = false,
			},
			hint = {
				enable = true,
				setType = true,
				paramType = true,
			},
			telemetry = { enable = false },
		},
	},
})

-- basedpyright
vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "standard",
				autoImportCompletions = true,
				diagnosticSeverityOverrides = {
					reportMissingTypeStubs = false,
					reportUnusedImport = "none",
					reportUnusedVariable = "none",
					reportUnknownVariableType = "none",
					reportUnknownMemberType = "none",
					reportUnknownArgumentType = "none",
				},
			},
		},
	},
})

-- rust_analyzer — full features
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
				loadOutDirsFromCheck = true,
				buildScripts = { enable = true },
			},
			checkOnSave = { command = "clippy" },
			procMacro = { enable = true },
			diagnostics = {
				enable = true,
				experimental = { enable = true },
			},
			inlayHints = {
				enable = true,
				bindingModeHints = { enable = true },
				closureCaptureHints = { enable = true },
				closureReturnTypeHints = { enable = "always" },
				closureStyle = "impl_fn",
				lifetimeElisionHints = { enable = "always", useParameterNames = true },
				parameterHints = { enable = true },
				typeHints = {
					enable = true,
					hideClosureInitialization = false,
					hideNamedConstructor = false,
				},
				maxLength = 120,
				chainingHints = { enable = true },
				reborrowHints = { enable = "always" },
			},
			completion = {
				fullFunctionSignatures = { enable = true },
				postfix = { enable = true },
				callable = { snippets = "fill_arguments" },
				autoimport = { enable = true },
			},
			lens = {
				enable = true,
				references = {
					adt = { enable = true },
					enumVariant = { enable = true },
					method = { enable = true },
					trait = { enable = true },
				},
				implementations = { enable = true },
				run = { enable = true },
			},
			hover = {
				actions = {
					references = { enable = true },
					run = { enable = true },
					debug = { enable = true },
				},
			},
			semanticHighlighting = {
				operator = { specialization = { enable = true } },
				punctuation = {
					separate = { macro = { bang = true } },
					enable = true,
				},
			},
		},
	},
})

-- gopls
vim.lsp.config("gopls", {
	settings = {
		gopls = {
			analyses = {
				unusedparams = false,
				unusedwrite = false,
				shadow = false,
				nilness = true,
				unusedvariable = false,
			},
			staticcheck = true,
			gofumpt = true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			completionBudget = "500ms",
			usePlaceholders = true,
			completeUnimported = true,
			semanticTokens = true,
		},
	},
})

-- ts_ls
vim.lsp.config("ts_ls", {
	workspace_required = false,
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	single_file_support = true,
	init_options = {
		preferences = {
			includeCompletionsForModuleExports = true,
			includeCompletionsForImportStatements = true,
			includeCompletionsWithSnippetText = true,
			includeAutomaticOptionalChainCompletions = true,
		},
	},
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
			validate = { enable = true },
		},
	},
})

-- emmet_language_server
vim.lsp.config("emmet_language_server", {
	filetypes = { "css", "html", "javascript", "javascriptreact", "less", "typescriptreact" },
	init_options = {
		showAbbreviationSuggestions = true,
		showExpandedAbbreviation = "always",
		showSuggestionsAsSnippets = true,
	},
})

-- emmet_ls
vim.lsp.config("emmet_ls", {
	filetypes = { "astro", "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- cssls
vim.lsp.config("cssls", {
	filetypes = { "css", "scss", "less" },
	init_options = { provideFormatter = true },
	single_file_support = true,
	settings = {
		css = { lint = { unknownAtRules = "ignore" }, validate = true },
		scss = { lint = { unknownAtRules = "ignore" }, validate = true },
		less = { lint = { unknownAtRules = "ignore" }, validate = true },
	},
})

-- tailwindcss
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
	init_options = { userLanguages = { astro = "html" } },
	settings = {
		tailwindCSS = {
			experimental = { classRegex = { { 'class[:]\\s*"([^"]*)"', '([^"\\s]*)' } } },
		},
	},
})

-- Enable all
vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"cssls",
	"emmet_language_server",
	"emmet_ls",
	"gopls",
	"astro",
	"tailwindcss",
	"rust_analyzer",
	"basedpyright",
})
