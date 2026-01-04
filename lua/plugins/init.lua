return {
  {
    { import = "plugins.languages" },
  },

  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  { "tpope/vim-repeat", lazy = false },
  {
    "christoomey/vim-tmux-navigator",
    init = function()
      -- Disable default mappings so we can exclude terminal mode
      vim.g.tmux_navigator_no_mappings = 1
    end,
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", mode = "n", desc = "Tmux Left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", mode = "n", desc = "Tmux Down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", mode = "n", desc = "Tmux Up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", mode = "n", desc = "Tmux Right" },
    },
  },

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
