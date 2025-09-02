vim.lsp.config.bashls = {
  filetypes = { "sh", "bash", "zsh" },
  on_attach = function(client)
    -- allow formatting from bashls if desired
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true
  end,
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)",
      shellcheckPath = "shellcheck",
      enableSourceErrorDiagnostics = true,
    },
  },
}
