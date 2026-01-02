---@type LazySpec
return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          backdrop = 100,
        },
      })
      require("config.lsp")
    end,
  },

  { "b0o/schemastore.nvim" },
}
