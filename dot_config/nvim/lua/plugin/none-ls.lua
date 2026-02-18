local null_ls = require("null-ls")

null_ls.setup({
  debug = false,
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
    null_ls.builtins.formatting.prettierd,

    -- ruby
    null_ls.builtins.diagnostics.rubocop.with({
      command = "bundle",
      args = { "exec", "rubocop", "-f", "json", "--force-exclusion", "--stdin", "$FILENAME" },
    }),

    -- requires none-ls-extras.nvim
    require("none-ls.formatting.trim_whitespace"),
    require("none-ls.formatting.trim_newlines"),
    require("none-ls.diagnostics.eslint"),
  },
})
