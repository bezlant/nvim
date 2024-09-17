-- Diagnostic config
local constants = require("config.constants")

vim.diagnostic.config({
  float = constants.border,
  severity_sort = true,
  signs = true,
  underline = false,
  update_in_insert = false,
  virtual_text = { prefix = constants.icons.circle },
})

-- UI
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local lspui_ok, lspui = pcall(require, "lspconfig.ui.windows")
if not lspui_ok then
  return
end

lspui.default_options.border = constants.border.border
