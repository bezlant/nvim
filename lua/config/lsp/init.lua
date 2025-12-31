---@type config.Constants
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
  ---@param bufnr integer
  on_attach = function(_, bufnr)
    -- Example: enable inlay hints if server supports it
    pcall(vim.lsp.inlay_hint.enable, true, { bufnr = bufnr })
    -- set up any global LspAttach behavior in an autocommand if needed
  end,
})

-- Deprioritize in favor of treesitter
vim.highlight.priorities.semantic_tokens = 95

-- Enable all LSP servers (native Neovim 0.11+ API)
-- Server configs are in ~/.config/nvim/lsp/*.lua
---@type string[]
local servers = {
  "bashls",
  "cssls",
  "cssmodules_ls",
  "eslint",
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
