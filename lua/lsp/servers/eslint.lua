local M = {}

local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  if client.supports_method("textDocument/formatting") then
    require("lsp.functions").enable_format_on_save()
  end
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
    enable = false,
    mode = "all",
  },
  format = true,
  nodePath = "",
  onIgnoredFiles = "off",
  packageManager = "npm",
  quiet = false,
  rulesCustomizations = {},
  run = "onType",
  useESLintClass = false,
  validate = "on",
  workingDirectory = {
    mode = "location",
  },
}

return M
