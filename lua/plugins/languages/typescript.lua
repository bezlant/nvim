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
      max_join_length = 360,
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

  {
    "razak17/tailwind-fold.nvim",
    opts = {
      min_chars = 50,
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "svelte", "astro", "vue", "typescriptreact" },
  },

  {
    "MaximilianLloyd/tw-values.nvim",
    keys = {
      { "<Leader>cv", "<CMD>TWValues<CR>", desc = "Tailwind CSS values" },
    },
    opts = {
      show_unknown_classes = true, --
    },
  },

  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },
}
