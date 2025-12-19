local ufo_utils = require("utils.nvim-ufo")
local ufo_config_handler = ufo_utils.handler

-- Diagnostic config
local constants = require("config.constants")

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
  virtual_text = { prefix = constants.icons.circle },
})

-- Global defaults for all LSP servers (new native API)
vim.lsp.config("*", {
  -- global capabilities: blink.cmp extends native LSP capabilities
  capabilities = (function()
    local caps = require("blink.cmp").get_lsp_capabilities()
    caps.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    caps.textDocument.semanticTokens = {
      dynamicRegistration = false,
      formats = { "relative" },
      multilineTokenSupport = true,
      overlappingTokenSupport = true,
      requests = { range = true, full = { delta = true } },
      tokenModifiers = {},
      tokenTypes = {},
    }
    return caps
  end)(),

  -- global on_attach: run for every server; prefer buffer-local setup here
  on_attach = function(client, bufnr)
    -- Example: enable inlay hints if server supports it
    pcall(vim.lsp.inlay_hint.enable, true, { bufnr = bufnr })
    -- set up any global LspAttach behavior in an autocommand if needed
  end,
})

-- Deprioritize in favor of treesitter
vim.highlight.priorities.semantic_tokens = 95

require("config.lsp.servers")

-- UFO setup for folding
require("ufo").setup({
  fold_virt_text_handler = ufo_config_handler,
  close_fold_kinds_for_ft = { default = { "imports" } },
  open_fold_hl_timeout = 0,
})
