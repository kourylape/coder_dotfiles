require("copilot").setup({
  panel = {
    enable = false,
  },
  suggestion = {
    enable = true,
    auto_trigger = true,
    hide_during_completion = true,
    debounce = 800,
    keymap = {
      accept = "<M-l>",
    },
  },
})
