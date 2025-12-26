local icons = require("config.constants").icons

---@type LazySpec
return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = {
    auto_close = true, -- auto close when there are no items
    max_items = 300, -- limit number of items that can be displayed per section
    modes = {
      diagnostics = {
        auto_open = false, -- auto open when there are items
      },
    },

    signs = {
      error = icons.errorOutline,
      warning = icons.warningTriangleNoBg,
      hint = icons.lightbulbOutline,
      information = icons.infoOutline,
    },
  },
}
