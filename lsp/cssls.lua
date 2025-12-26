return {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { "package.json", ".git" },

  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore",
        validProperties = { "composes" },
      },
    },
    scss = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },

  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true
  end,
}
