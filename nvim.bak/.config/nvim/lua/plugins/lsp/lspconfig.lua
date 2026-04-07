return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- LSP Keybinds on attach
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- Navigation
				vim.keymap.set(
					"n",
					"gR",
					"<cmd>Telescope lsp_references<CR>",
					vim.tbl_extend("force", opts, { desc = "Show LSP references" })
				)
				vim.keymap.set(
					"n",
					"gD",
					vim.lsp.buf.declaration,
					vim.tbl_extend("force", opts, { desc = "Go to declaration" })
				)
				vim.keymap.set(
					"n",
					"gd",
					"<cmd>Telescope lsp_definitions<CR>",
					vim.tbl_extend("force", opts, { desc = "Show LSP definitions" })
				)
				vim.keymap.set(
					"n",
					"gi",
					"<cmd>Telescope lsp_implementations<CR>",
					vim.tbl_extend("force", opts, { desc = "Show LSP implementations" })
				)
				vim.keymap.set(
					"n",
					"gt",
					"<cmd>Telescope lsp_type_definitions<CR>",
					vim.tbl_extend("force", opts, { desc = "Show LSP type definitions" })
				)

				-- Actions
				vim.keymap.set(
					{ "n", "v" },
					"<leader>vca",
					vim.lsp.buf.code_action,
					vim.tbl_extend("force", opts, { desc = "See available code actions" })
				)
				vim.keymap.set(
					"n",
					"<leader>rn",
					vim.lsp.buf.rename,
					vim.tbl_extend("force", opts, { desc = "Smart rename" })
				)

				-- Diagnostics
				vim.keymap.set(
					"n",
					"<leader>D",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					vim.tbl_extend("force", opts, { desc = "Show buffer diagnostics" })
				)
				vim.keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					vim.tbl_extend("force", opts, { desc = "Show line diagnostics" })
				)

				-- Documentation
				vim.keymap.set(
					"n",
					"K",
					vim.lsp.buf.hover,
					vim.tbl_extend("force", opts, { desc = "Show documentation for what is under cursor" })
				)
				vim.keymap.set(
					"i",
					"<C-h>",
					vim.lsp.buf.signature_help,
					vim.tbl_extend("force", opts, { desc = "Show signature help" })
				)

				-- Utility
				vim.keymap.set(
					"n",
					"<leader>rs",
					":LspRestart<CR>",
					vim.tbl_extend("force", opts, { desc = "Restart LSP" })
				)
			end,
		})

		-- Diagnostic configuration
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			virtual_text = {
				spacing = 4,
				-- FIXED: set source to false to hide "ruff:" label
				source = false,
				prefix = "●",
				format = function(diagnostic)
					return diagnostic.message
				end,
			},
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				-- FIXED: set source to false here as well for consistency
				source = false,
				header = "",
				prefix = "",
				format = function(diagnostic)
					return string.format("%s", diagnostic.message)
				end,
			},
		})

		-- Enhanced capabilities with nvim-cmp
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Global default configuration for all servers
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- Lua
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						library = {
							vim.fn.expand("$VIMRUNTIME/lua"),
							vim.fn.stdpath("config") .. "/lua",
						},
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- TypeScript/JavaScript
		vim.lsp.config("ts_ls", {
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
		})

		-- Python: Basedpyright (SOLO)
		vim.lsp.config("basedpyright", {
			settings = {
				basedpyright = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
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

		-- Rust
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

		-- Go
		vim.lsp.config("gopls", {
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					gofumpt = true,
				},
			},
		})

		-- HTML
		vim.lsp.config("html", {})

		-- CSS
		vim.lsp.config("cssls", {
			settings = {
				css = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				scss = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				less = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
			},
		})

		-- TailwindCSS
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

		-- Emmet Language Server
		vim.lsp.config("emmet_language_server", {
			filetypes = {
				"css",
				"html",
				"javascript",
				"javascriptreact",
				"less",
				"sass",
				"scss",
				"typescriptreact",
			},
		})

		-- Emmet LS
		vim.lsp.config("emmet_ls", {
			filetypes = {
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

		-- Astro
		vim.lsp.config("astro", {})

		-- Angular
		vim.lsp.config("angularls", {})

		-- Markdown
		vim.lsp.config("marksman", {})

		-- Enable all configured servers
		local servers = {
			"lua_ls",
			"ts_ls",
			"basedpyright",
			"rust_analyzer",
			"gopls",
			"html",
			"cssls",
			"tailwindcss",
			"emmet_language_server",
			"emmet_ls",
			"astro",
			"angularls",
			"marksman",
		}

		for _, server in ipairs(servers) do
			vim.lsp.enable(server)
		end
	end,
}
