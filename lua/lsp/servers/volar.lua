local M = {}

local on_attach = function(client, _)
  client.resolved_capabilities.document_formatting = false
end

M.filetypes = {
  "vue",
}

M.init_options = {}

M.on_attach = on_attach

return M
