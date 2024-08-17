local constants = require('config.constants')
local baseDefinitionHandler = vim.lsp.handlers["textDocument/definition"]

local filter = require("lsp.utils.filter").filter
local filterReactDTS = require("lsp.utils.filterReactDTS").filterReactDTS

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
  ["textDocument/definition"] = function(err, result, method, ...)
    if vim.tbl_islist(result) and #result > 1 then
      local filtered_result = filter(result, filterReactDTS)
      return baseDefinitionHandler(err, filtered_result, method, ...)
    end

    baseDefinitionHandler(err, result, method, ...)
  end,
}

require("typescript-tools").setup({
  on_attach = function(_, bufnr)
    if constants.hints and vim.fn.has("nvim-0.10") then
      vim.lsp.inlay_hint.enable(true, { bufnr })
    end

    local map = function(key, command)
      vim.keymap.set('n', key, command, { buffer = bufnr })
    end

    map('<leader>v', vim.lsp.buf.signature_help)
    map('gd', vim.lsp.buf.definition)
    map('gr', '<cmd>Telescope lsp_references<cr>')
    map('gi', '<cmd>Telescope lsp_implementations<cr>')
    map(']g', vim.diagnostic.goto_next)
    map('[g', vim.diagnostic.goto_prev)
    map('<leader>r', vim.lsp.buf.rename)
    map('<leader>a', vim.lsp.buf.code_action)
  end,
  handlers = handlers,
  settings = {
    complete_function_calls = true,
    separate_diagnostic_server = true,
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeCompletionsForModuleExports = true,
      importModuleSpecifierPreference = "non-relative",
      quotePreference = "auto",
    },
    tsserver_format_options = {
      insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
    },
  },

})
