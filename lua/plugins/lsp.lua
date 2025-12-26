return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = true,
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
