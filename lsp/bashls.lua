return {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash", "zsh" },
  root_markers = { ".git" },

  on_attach = function(client)
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
