vim.lsp.config.stylelint_lsp = {
  filetypes = { "css", "less", "scss", "sugarss" },

  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      autoFixOnFormat = true,
      validateOnSave = true,
      validateOnType = false,
    },
  },
}
