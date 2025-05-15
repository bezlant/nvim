return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "mason-org/mason.nvim",
    },
    config = function()
      require("config.lsp.setup")
      require("config.lsp.config")
    end,
  },

  { "b0o/schemastore.nvim" },
}
