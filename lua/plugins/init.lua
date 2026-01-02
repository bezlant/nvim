return {
  {
    { import = "plugins.languages" },
  },

  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  { "tpope/vim-repeat", lazy = false },
  { "christoomey/vim-tmux-navigator" },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },

  {
    "cpea2506/relative-toggle.nvim",
    config = true,
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "tzachar/highlight-undo.nvim",
    keys = { { "u" }, { "<C-r>" } },
  },
}
