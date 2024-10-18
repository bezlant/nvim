return {
  {
    { import = "plugins.git" },
    { import = "plugins.languages" },
  },

  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-speeddating", lazy = false },
  { "AndrewRadev/switch.vim", lazy = false },

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
    "stevearc/oil.nvim",
    config = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
}
