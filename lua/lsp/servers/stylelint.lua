local M = {}

M.filetypes = { "css", "less", "scss", "sugarss" }

M.settings = {
  stylelintplus = {
    autoFixOnSave = true,
    autoFixOnFormat = true,
    validateOnSave = true,
    validateOnType = false,
  },
}

return M
