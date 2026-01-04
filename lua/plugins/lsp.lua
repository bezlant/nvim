---@type LazySpec
return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          backdrop = 100,
        },
      })

      local servers = require("config.lsp.servers")

      require("mason-lspconfig").setup({
        ensure_installed = servers.mason,
      })

      require("config.lsp")
    end,
  },

  { "b0o/schemastore.nvim" },
}
