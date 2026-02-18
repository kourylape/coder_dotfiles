local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = {
    "bash",
    "c",
    "css",
    "graphql",
    "html",
    "java",
    "javascript",
    "markdown",
    "terraform",
    "lua",
    "python",
    "http",
    "ruby",
    "rust",
    "scss",
    "toml",
    "tsx",
    "php",
    "typescript",
    "vue",
    "yaml",
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  highlight = {
    enable = true,
    disable = { "vim", "vimdoc", "markdown" },
  },
  indent = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
})
