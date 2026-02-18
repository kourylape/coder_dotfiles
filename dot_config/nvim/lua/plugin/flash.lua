local flash = require("flash")

flash.setup({
  search = {
    trigger = "/",
  },
  modes = {
    search = {
      enabled = true,
    },
    char = {
      jump_labels = true,
      multi_line = false,
    },
  },
})
