vim.lsp.config.cssmodules_ls = {
  capabilities = capabilities,
  on_attach = function(client)
    -- match your previous behavior: disable go-to-definition from this server
    client.server_capabilities.definitionProvider = false
  end,
  -- keep your local path to the language-server binary
  cmd = { "/Users/abezlyudniy/cssmodules-language-server/lib/cli.js" },
}
