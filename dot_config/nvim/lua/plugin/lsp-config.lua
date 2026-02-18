-- do not load up plugin when in diff mode
if vim.opt.diff:get() then
  return
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local map = vim.keymap.set

-- Configure diagnostics
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  map("n", "gD", vim.lsp.buf.declaration, bufopts)
  map("n", "gd", vim.lsp.buf.definition, bufopts)
  map("n", "K", vim.lsp.buf.hover, bufopts)
  map("n", "gi", vim.lsp.buf.implementation, bufopts)
  map("n", "<space>k", vim.lsp.buf.signature_help, bufopts)
  map("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  map("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  map("n", "gr", vim.lsp.buf.references, bufopts)
  map("n", "<space>DS", vim.lsp.buf.document_symbol, bufopts)
end

-- Configure servers
local servers = {
  ts_ls = {
    on_attach = function(client, buffnr)
      if client.name == "ts_ls" then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
      on_attach(client, buffnr)
    end,
    capabilities = capabilities,
  },

  eslint = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      format = false,
    }
  },

  prismals = {
    on_attach = on_attach,
    capabilities = capabilities,
  },

  solargraph = {
    on_attach = on_attach,
    capabilities = capabilities,
  },

  rust_analyzer = {
    on_attach = on_attach,
    capabilities = capabilities,
  },

  html = {
    on_attach = on_attach,
    capabilities = capabilities,
  },

  cssls = {
    on_attach = on_attach,
    capabilities = capabilities,
  },

  tailwindcss = {
    on_attach = on_attach,
    capabilities = capabilities,
  },

  jsonls = {
    on_attach = on_attach,
    capabilities = capabilities,
  },

  graphql = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}

-- Configure and enable all servers
for server_name, config in pairs(servers) do
  vim.lsp.config(server_name, config)
  vim.lsp.enable(server_name)
end
