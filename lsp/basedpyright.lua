return {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "pyrightconfig.json", ".git" },

  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "basic", -- "off", "basic", or "strict"
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
        -- Respect .venv and virtual environments
        autoImportCompletions = true,
      },
    },
  },
}
