local set_keymap = vim.keymap.set
local silent = { silent = true, noremap = true }
local is_mac = vim.fn.has("mac") == 1

-- fix for space leader (not sure why)
set_keymap("", "<Space>", "<Nop>", silent)
set_keymap("", "<Ctrl>/", "<Nop>", silent)

-- terminal mode
set_keymap("t", "<Esc>", "<C-\\><C-n>", silent)

-- nvim-tree
set_keymap("n", "<Leader>t", "<Cmd>:NvimTreeFindFileToggle<CR>", silent)

-- colorschems
set_keymap("n", "<Leader>cs", "<Cmd>:Telescope colorscheme<CR>", silent)

-- diagnostics
set_keymap("n", "<space>e", vim.diagnostic.open_float, silent)
set_keymap("n", "[d", vim.diagnostic.goto_prev, silent)
set_keymap("n", "]d", vim.diagnostic.goto_next, silent)
set_keymap("n", "<space>q", vim.diagnostic.setloclist, silent)

-- :GBrowse
vim.api.nvim_create_user_command("GL", function()
  require("gitlinker").link({ action = require("gitlinker.actions").system })
end, {})

-- avoid plugins conflicting with :G
vim.api.nvim_create_user_command('G', function(opts)
  vim.cmd('Gitsigns ' .. opts.args)
end, { nargs = '*' })
vim.api.nvim_create_user_command('Git', function(opts)
  vim.cmd('Gitsigns ' .. opts.args)
end, { nargs = '*' })


-- damn capital :W
-- Define the Lua function
local function save_current_buffer()
  local buf_name = vim.api.nvim_buf_get_name(0)
  vim.api.nvim_command("write " .. buf_name)
end

-- Register lua functions to vim commands
vim.api.nvim_create_user_command("W", save_current_buffer, {})
