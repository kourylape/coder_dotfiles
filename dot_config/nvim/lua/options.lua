-- main editor options/configs
local g = vim.g
local opt = vim.opt

-- set globals
local function set_globals()
  g.mapleader = " "
  g.copilot_no_tab_map = true
end

-- set multiple options
local function set_options()
  local options = {
    termguicolors = true,
    expandtab = true,
    tabstop = 2,
    shiftwidth = 2,
    signcolumn = "yes",
    number = true,
    relativenumber = true,
    laststatus = 2,
    showmode = false,
    clipboard = "unnamed,unnamedplus",
    smartindent = true,
    mouse = "a",
  }
  for key, val in pairs(options) do
    opt[key] = val
  end
end

set_globals()
set_options()

-- formating
opt.formatoptions:remove("o")
opt.formatoptions:remove("r")
