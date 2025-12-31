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
    "stevearc/oil.nvim",
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Oil File Browser" },
    },
    opts = {
      keymaps = {
        -- Disable defaults that conflict with tmux navigator
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        -- Keep useful oil keymaps
        ["<C-r>"] = "actions.refresh",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-v>"] = { "actions.select", opts = { horizontal = true } },
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
