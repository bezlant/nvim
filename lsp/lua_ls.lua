return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", ".git" },

  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim", "bit", "packer_plugins" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
      telemetry = { enable = false },
      format = { enable = false },
      completion = { callSnippet = "Replace" },
      hint = { enable = true },
    },
  },

  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
