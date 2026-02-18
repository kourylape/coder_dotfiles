vim.opt.termguicolors = true

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	local function swap_then_open_tab()
		local node = api.tree.get_node_under_cursor()

		api.tree.close()
		api.node.open.tab(node)
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "o", swap_then_open_tab, opts("Open Tab"))
end

require("nvim-tree").setup({
	disable_netrw = false,
	hijack_netrw = true,
	on_attach = my_on_attach,
	view = {
		cursorline = true,
		width = 30,
	},
	filters = {
		dotfiles = false,
		custom = {
			"^\\.git$",
		},
	},
})
