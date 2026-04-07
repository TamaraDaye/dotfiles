-- Set subtle grey borders for all floating windows
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#585b70" })
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"f3fora/cmp-spell",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local kind_icons = {
			Text = "󰉿 ",
			Method = "󰆧 ",
			Function = "󰡱 ",
			Constructor = " ",
			Field = "󰜢 ",
			Variable = " ",
			Class = "󰠱 ",
			Interface = " ",
			Module = " ",
			Property = " ",
			Unit = "󰑭 ",
			Value = "󰎠 ",
			Enum = " ",
			Keyword = "󰌋",
			Snippet = " ",
			Color = "󰏘",
			File = "󰈙",
			Reference = "󰈇 ",
			Folder = " ",
			EnumMember = " ",
			Constant = "󰏿 ",
			Struct = "󰙅 ",
			Event = " ",
			Operator = "󰆕 ",
			TypeParameter = " ",
		}

		cmp.setup({
			-- 1. ADDED: This stops LSPs from forcing a selection as you type
			preselect = cmp.PreselectMode.None,

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = {
					border = "rounded",
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
					col_offset = -3,
					side_padding = 0,
				},
				documentation = {
					border = "rounded",
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
				},
			},
			-- 2. FIXED: Changed 'noinsert' to 'noselect' to prevent auto-completion
			completion = {
				completeopt = "menu,menuone,noselect",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),

				-- 3. FIXED: CR only confirms if you have manually selected an item
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false, -- Critical: do not select first item automatically
				}),

				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s", "c" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s", "c" }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "luasnip", priority = 750 },
				{ name = "buffer", priority = 500, keyword_length = 3 },
				{ name = "path", priority = 250 },
				{
					name = "spell",
					priority = 300,
					option = {
						enable_in_context = function()
							local context = require("cmp.config.context")
							return not context.in_treesitter_capture("comment")
								and not context.in_syntax_group("Comment")
						end,
					},
				},
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						symbol_map = kind_icons,
					})(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"
					if entry.source.name == "nvim_lsp" then
						kind = require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
					end
					return kind
				end,
			},
			experimental = {
				ghost_text = false,
			},
		})
		local types = require("cmp.types")

		-- Search completion (/)
		cmp.setup.cmdline("/", {
			completion = {
				autocomplete = { types.cmp.TriggerEvent.TextChanged },
			},
			mapping = cmp.mapping.preset.cmdline({
				["<Tab>"] = {
					c = function()
						if cmp.visible() then
							cmp.select_next_item()
						else
							cmp.complete()
						end
					end,
				},
				["<S-Tab>"] = {
					c = function()
						if cmp.visible() then
							cmp.select_prev_item()
						end
					end,
				},
				["<CR>"] = {
					c = function(fallback)
						if cmp.visible() and cmp.get_selected_entry() then
							cmp.confirm({ select = false })
						else
							fallback()
						end
					end,
				},
			}),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Command-line completion (:)
		cmp.setup.cmdline(":", {
			completion = {
				autocomplete = { types.cmp.TriggerEvent.TextChanged },
			},
			mapping = cmp.mapping.preset.cmdline({
				["<Tab>"] = {
					c = function()
						if cmp.visible() then
							cmp.select_next_item()
						else
							cmp.complete()
						end
					end,
				},
				["<S-Tab>"] = {
					c = function()
						if cmp.visible() then
							cmp.select_prev_item()
						end
					end,
				},
				["<CR>"] = {
					c = function(fallback)
						if cmp.visible() and cmp.get_selected_entry() then
							cmp.confirm({ select = false })
						else
							fallback()
						end
					end,
				},
			}),
			sources = cmp.config.sources(
				{ { name = "path" } },
				{ { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
			),
		})
	end,
}
