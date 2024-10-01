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
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    opts = {
      watch = true,
      auto_start_watch_mode = true,
    },
  },

  {
    "dmmulroy/ts-error-translator.nvim",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    config = function()
      require("ts-error-translator").setup()
    end,
  },

  { "artemave/workspace-diagnostics.nvim" },
}
