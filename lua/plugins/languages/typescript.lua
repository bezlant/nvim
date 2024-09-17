return {
  {
    "yioneko/nvim-vtsls",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
  },

  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    opts = {
      watch = true,
      auto_start_watch_mode = true,
    },
  },

  {
    "axelvc/template-string.nvim",
    event = "InsertEnter",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = true,
  },

  {
    "Wansmer/treesj",
    lazy = true,
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    keys = {
      { "gJ", "<cmd>TSJToggle<CR>", desc = "toggle formatting" },
    },
    opts = {
      use_default_keymaps = false,
      max_join_length = 240,
    },
  },

  {
    "dmmulroy/ts-error-translator.nvim",
    config = true,
  },
}
