-- plugins/formatting.lua
return {
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff_format" }, -- use Ruff for formatting
					javascript = { "prettier" },
					typescript = { "prettier" },
					go = { "gofmt" },
					json = { "jq" },
					jsonc = { "prettier" },
					html = { "prettier" },
					yml = { "prettier" },
					yaml = { "prettier" },
				},
				format_on_save = {
					lsp_fallback = false, -- no LSP fallback needed
					timeout_ms = 500,
				},
			})

			-- Format manually
			vim.keymap.set("n", "<leader>f", function()
				conform.format({ async = true, lsp_fallback = false })
			end, { desc = "Format file" })
		end,
	},

	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")

			-- Use Ruff as Python linter
			lint.linters_by_ft = {
				python = { "ruff" },
			}

			-- Run linting on save
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
