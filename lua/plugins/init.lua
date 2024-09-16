return {
  {
    { import = "plugins.git" },
    { import = "plugins.languages" },
  },

  { "nvim-lua/plenary.nvim" },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },

  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-speeddating", lazy = false },
  { "AndrewRadev/switch.vim", lazy = false },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "cpea2506/relative-toggle.nvim",
    opts = {},
  },

  {
    "christoomey/vim-tmux-navigator",
  },

  {
    "b0o/schemastore.nvim",
  },

  {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
