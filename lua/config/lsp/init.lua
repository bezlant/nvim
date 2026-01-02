vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  underline = false,
  update_in_insert = false,
  virtual_text = { prefix = "  " },
})

-- Global defaults for all LSP servers
vim.lsp.config("*", {
  -- global capabilities: blink.cmp extends native LSP capabilities
  capabilities = (function()
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

local servers = {
  "bashls",
  "cssls",
  "cssmodules_ls",
  "eslint",
  "fish_lsp",
  "gopls",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "stylelint_lsp",
  "tailwindcss",
  "taplo",
  "vtsls",
  "vuels",
  "yamlls",
}

vim.lsp.enable(servers)
