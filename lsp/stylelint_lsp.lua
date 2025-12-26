return {
  cmd = { "stylelint-lsp", "--stdio" },
  filetypes = { "css", "less", "scss", "sugarss" },
  root_markers = { ".stylelintrc", ".stylelintrc.json", ".stylelintrc.js", "stylelint.config.js", "package.json", ".git" },

  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      autoFixOnFormat = true,
      validateOnSave = true,
      validateOnType = false,
    },
  },
}
