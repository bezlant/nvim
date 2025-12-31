return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luacheckrc", ".stylua.toml", "stylua.toml", ".git" },

  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = {
        globals = { "vim", "Snacks" },
        unusedLocalExclude = { "_*" },
      },
      -- Do NOT set workspace.library - lazydev.nvim handles this
      workspace = {
        checkThirdParty = false,
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
