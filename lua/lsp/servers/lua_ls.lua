local M = {}

local on_attach = function(client, _)
  client.resolved_capabilities.document_formatting = false
end

M.settings = {
  Lua = {
    format = {
      enable = true,
    },
    diagnostics = {
      globals = { 'vim', 'bit', 'packer_plugins' }
    }
  }
}

M.on_attach = on_attach

return M
