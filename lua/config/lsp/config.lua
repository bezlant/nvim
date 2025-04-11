-- Diagnostic config
local constants = require("config.constants")

vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  underline = false,
  update_in_insert = false,
  virtual_text = { prefix = constants.icons.circle },
})
