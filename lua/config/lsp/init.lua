vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "●",
      [vim.diagnostic.severity.WARN] = "●",
      [vim.diagnostic.severity.INFO] = "●",
      [vim.diagnostic.severity.HINT] = "●",
    },
  },
  underline = false,
  update_in_insert = false,
  virtual_text = { prefix = "●" },
})

-- Global defaults for all LSP servers
vim.lsp.config("*", {
  -- global caps: blink.cmp extends native LSP caps
  caps = (function()
    local caps = require("blink.cmp").get_lsp_capabilities()

    -- Enable LSP-based folding (for native folds)
    caps.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    return caps
  end)(),

  on_attach = function(_client, bufnr)
    pcall(vim.lsp.inlay_hint.enable, false, { bufnr = bufnr })
  end,
})

local servers = require("config.lsp.servers")

local all_servers = vim.list_extend(vim.list_extend({}, servers.mason), servers.external)

vim.lsp.enable(all_servers)
