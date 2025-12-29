---@type LazySpec
return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          backdrop = 100,
        },
      })
      -- Load LSP config after Mason is ready
      require("config.lsp")
    end,
  },

  { "b0o/schemastore.nvim" },
}
