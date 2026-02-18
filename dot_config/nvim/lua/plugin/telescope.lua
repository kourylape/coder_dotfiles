local telescope = require("telescope")
local builtin = require("telescope.builtin")

local set_keymap = vim.keymap.set
local silent = { silent = true, noremap = true }

local function find_files()
  builtin.find_files({
    hidden = true,
    no_ignore = false,
  })
end

-- Get the default vimgrep_arguments and add --hidden
local conf = require("telescope.config").values
local vimgrep_arguments = { unpack(conf.vimgrep_arguments) }
table.insert(vimgrep_arguments, "--hidden")

set_keymap("n", "<leader>ff", find_files, silent)
set_keymap("n", "<leader>fg", function()
  builtin.live_grep({
    vimgrep_arguments = vimgrep_arguments,
  })
end, silent)
set_keymap("n", "<leader>fb", builtin.buffers, silent)
set_keymap("n", "<leader>fh", builtin.help_tags, silent)

set_keymap("n", "<leader>ft", builtin.treesitter, silent)
set_keymap("n", "<leader>fr", builtin.lsp_references, silent)

set_keymap("n", "<leader>fG", function()
  telescope.extensions.live_grep_args.live_grep_args({
    vimgrep_arguments = vimgrep_arguments,
  })
end, silent)

telescope.setup({
  defaults = {
    file_ignore_patterns = { ".git/", "node_modules/" },
  },
  extensions = {
    colorscheme = {
      enable_preview = true,
    },
    fzf = {
      fuzzy = true,
      case_mode = "smart_case",
      override_generic_sorter = true,
      override_file_sorter = true,
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")
