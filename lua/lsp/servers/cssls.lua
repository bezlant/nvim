local M = {}

M.settings = {
  css = {
    lint = {
      unknownAtRules = 'ignore',
    },
  },
  scss = {
    lint = {
      unknownAtRules = 'ignore',
    },
  },
}

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true

  if client.supports_method("textDocument/formatting") then
    require("lsp.functions").enable_format_on_save()
  end
end

return M
