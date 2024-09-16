return {
  "folke/zen-mode.nvim",
  dependencies = { "folke/twilight.nvim" },
  opts = {
    window = {
      backdrop = 1,
      width = 120,
      height = 1,
    },
    plugins = {
      options = {
        enabled = false,
      },
      twilight = { enabled = false },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      wezterm = {
        enabled = true,
        font = "+2",
      },
    },
  },
}
