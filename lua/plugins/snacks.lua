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
      lazygit = {
        enabled = true,
        configure = false,
        config = {
          os = { editPreset = "nvim-remote" },
        },
        win = {
          backdrop = false,
          border = "rounded",
        },
      },
    },
    keys = {
      {
        "<leader>g",
        function()
          Snacks.lazygit()
        end,
        desc = "LazyGit",
      },
    },
  },
}
