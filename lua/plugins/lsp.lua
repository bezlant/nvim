return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "mason-org/mason.nvim",
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "cssls",
          "cssmodules_ls",
          "eslint",
          "html",
          "jsonls",
          "lua_ls",
          "marksman",
          "stylelint_lsp",
          "gopls",
          "vtsls",
          "tailwindcss",
        },
      })

      require("config.lsp")
    end,
  },

  { "b0o/schemastore.nvim" },
}
