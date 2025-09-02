vim.lsp.config.jsonls = {
  settings = {
    json = {
      -- schemastore might not be installed; guard with pcall
      schemas = (function()
        local ok, s = pcall(require, "schemastore")
        if ok and s and s.json and s.json.schemas then
          return s.json.schemas()
        else
          vim.notify("schemastore not installed")
        end
        return {}
      end)(),
      validate = { enable = true },
    },
  },
}
