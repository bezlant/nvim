return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("config.lsp.setup")
      require("config.lsp.config")
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>M", "<cmd>Mason<cr>", desc = "mason ui" },
    },
  },

  { "b0o/schemastore.nvim" },
}
