return {
  {
    { import = "plugins.git" },
    { import = "plugins.languages" },
  },

  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  { "tpope/vim-repeat",              lazy = false },
  { "tpope/vim-speeddating",         lazy = false },
  { "AndrewRadev/switch.vim",        lazy = false },

  { "christoomey/vim-tmux-navigator" },
  { "b0o/schemastore.nvim" },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
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
    "cpea2506/relative-toggle.nvim",
    config = true,
  },

  {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    config = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
