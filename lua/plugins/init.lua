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
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("hardtime").setup({
        disable_mouse = false,
      })
    end,
  },

  {
    "tzachar/highlight-undo.nvim",
    keys = { { "u" }, { "<C-r>" } },
  },
}
