local constants = require("config.constants")

local M = {}

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    silent = true,
    border = constants.border.border,
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = constants.border }),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = constants.virtual_text }
  ),
}

local settings = {
  enableMoveToFileCodeAction = true,
  autoUseWorkspaceTsdk = true,
  experimental = {
    completion = {
      enableServerSideFuzzyMatch = true,
    },
  },

  typescript = {
    updateImportsOnFileMove = { enabled = "always" },
    suggest = { completeFunctionCalls = true },
    format = {
      insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
    },
    preferences = {
      importModuleSpecifier = "non-relative",
      quoteStyle = "auto",
    },
    inlayHints = {
      parameterNames = { enabled = "all" },
      parameterTypes = { enabled = false },
      variableTypes = { enabled = false },
      propertyDeclarationTypes = { enabled = false },
      functionLikeReturnTypes = { enabled = false },
      enumMemberValues = { enabled = true },
    },
  },

  javascript = {
    inlayHints = {
      parameterNames = { enabled = "all" },
      parameterTypes = { enabled = false },
      variableTypes = { enabled = false },
      propertyDeclarationTypes = { enabled = false },
      functionLikeReturnTypes = { enabled = false },
      enumMemberValues = { enabled = true },
    },
  },
}

local on_attach = function(_, bufnr)
  vim.lsp.inlay_hint.enable(true, { bufnr })
end

M.handlers = handlers
M.settings = settings
M.on_attach = on_attach

return M
