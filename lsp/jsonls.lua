return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },

  settings = {
    json = {
      schemas = (function()
        local ok, s = pcall(require, "schemastore")
        if ok and s and s.json and s.json.schemas then
          return s.json.schemas()
        end
        return {}
      end)(),
      validate = { enable = true },
    },
  },
}
