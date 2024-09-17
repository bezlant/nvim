local M = {}

local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true

  vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
end

M.on_attach = on_attach

M.settings = {
  codeAction = {
    disableRuleComment = {
      enable = true,
      location = "separateLine",
    },
    showDocumentation = {
      enable = true,
    },
  },
  codeActionOnSave = {
    enable = true,
    mode = "all",
  },
  format = true,
  nodePath = "",
  onIgnoredFiles = "off",
  packageManager = "npm",
  quiet = false,
  rulesCustomizations = {},
  run = "onSave",
  useESLintClass = false,
  validate = "on",
  workingDirectory = {
    mode = "location",
  },
}

return M
