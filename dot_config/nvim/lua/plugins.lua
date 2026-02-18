local fn = vim.fn
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- bootstrap and install lazy package manager
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    o("--filter=blob:none"),
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    -- version = false,
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("plugin.treesitter")
    end,
  },

  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugin.nvim-tree")
    end,
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
      require("plugin.telescope")
    end,
  },

  -- telescope extensions
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- bufdel
  {
    "ojroques/nvim-bufdel",
    config = function()
      require("bufdel").setup({
        quit = false,
      })
    end,
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugin.lualine")
    end,
  },

  -- indent sidebar lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("plugin.indent-blankline")
    end,
  },

  -- error diagnostics
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("trouble").setup({})
    end,
  },

  -- mason: lsp, formatting, and linting
  {
    "williamboman/mason.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "eslint",
          "html",
          "ts_ls",
          "rust_analyzer",
          "prismals",
          "cssls",
          "tailwindcss",
          "graphql",
          "jsonls",
        },
      })
      require("plugin.lsp-config")
    end,
  },

  -- autocomplete
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
    },
    ft = { "javascript", "typescript", "typescriptreact", "ruby", "eruby", "html", "css", "lua" },
    config = function()
      require("plugin.cmp")
    end,
  },

  -- formatter & linter
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      require("plugin.none-ls")
    end,
  },

  -- Copilot w/ Lua
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("plugin.copilot")
    end,
  },

  -- git plugins
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup({})
    end,
  },

  -- easy motion / searching
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require("plugin.flash")
    end,
  },

  -- surrounds
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- git plugins
  { "sindrets/diffview.nvim" },
  {
    "linrongbin16/gitlinker.nvim",
    config = function()
      require("gitlinker").setup({
        mappings = nil,
      })
    end,
  },

  -- comments
  { "numToStr/Comment.nvim" },

  -- tmux + vim
  { "christoomey/vim-tmux-navigator" },

  -- themes
  { "folke/tokyonight.nvim" },
  { "rose-pine/neovim" },
})
