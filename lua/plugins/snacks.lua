return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
      input = {
        enabled = true,
      },
      picker = {
        enabled = true,
        ui_select = true,
      },
      notifier = {
        style = "fancy",
        enabled = true,
        timeout = 3000,
      },
    },
  },
}
