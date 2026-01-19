return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },

  -- Ruff LSP provides linting diagnostics
  -- Formatting is handled by conform.nvim for consistency
  on_attach = function(client)
    -- Disable ruff's formatting capability since we use conform.nvim
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,

  settings = {
    -- Ruff will automatically pick up settings from pyproject.toml
    -- including line-length = 100 from your storybuilder project
  },
}
