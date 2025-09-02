vim.lsp.config.cssls = {
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
    -- enable formatting capabilities if you want the server to provide formatting
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true
  end,
}
