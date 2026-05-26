--Custom commands for pack

--Add plugin function
local function add_plugin(opts)
	vim.pack.add(opts.fargs)
end
vim.api.nvim_create_user_command("PackAdd", add_plugin, { nargs = "+", desc = "Add Plugins (PackAdd user/repo)" })

--Delete a plugin function
local function del_plugin(opts)
	vim.pack.del(opts.fargs)
end
vim.api.nvim_create_user_command("PackDel", del_plugin, { nargs = "+", desc = "Delete Plugins (PackDel user/repo)" })

--Update a plugin
local function update_plugin(opts)
	vim.pack.update(opts.fargs)
end
vim.api.nvim_create_user_command(
	"PackUpdate",
	update_plugin,
	{ nargs = "+", desc = "PackUpdate Plugins (PackUpdate user/repo)" }
)

local function check_plugins()
	local non_active = vim.iter(vim.pack.get())
		:filter(function(x)
			return not x.active
		end)
		:map(function(x)
			return x.spec.name
		end)
		:totable()

	if #non_active == 0 then
		vim.notify("🆗 No non-active plugins found!", vim.log.levels.INFO)
	end
	vim.print("😴 Non-active plugins :")
	print(" ")
	for _, name in ipairs(non_active) do
		print(name)
	end

	print(" ")

	local choice = vim.fn.confirm(
		"Delete ALL non-active plugins from disk?",
		"&Yes\n&No",
		2 -- default = No
	)

	if choice == 1 then
		vim.pack.del(non_active)
		vim.notify("🗑️  Deleted " .. #non_active .. " non-active plugin(s)", vim.log.levels.INFO)
		print("Non-active plugins deleted!")
		vim.api.nvim_exec_autocmds("User", { pattern = "PackChanged" })
	else
		vim.notify("Cancelled. No plugins were deleted!", vim.log.levels.INFO)
	end
end
vim.api.nvim_create_user_command("PackCheck", check_plugins, { desc = "List NOne active plugins and selct to delete" })

--Plugin installation
local setup = require("setup")
for _, plugin in ipairs(setup.plugins) do
	plugin.src = setup.link_prefix .. plugin.src
	vim.pack.add({ plugin })
end

--Enabled plugins
require("plugins.oil")
require("plugins.lualine")
require("plugins.autopairs")
require("plugins.comments")
require("plugins.fidget")
require("plugins.colorscheme")
require("plugins.presence")
require("plugins.telescope")
require("plugins.conform")
require("plugins.colorizer")
require("plugins.dressing")
require("plugins.aerial")
require("plugins.docview")
require("plugins.todocomments")
require("plugins.trouble")
require("plugins.noice")
require("plugins.treesitter")
require("plugins.snacks")
require("plugins.lsp.lspconfig")
require("plugins.lsp.mason")
require("plugins.blink-cmp")
require("plugins.lazydev")
