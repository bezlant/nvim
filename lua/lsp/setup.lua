-- Setup installer & lsp configs
local mason_ok, mason = pcall(require, "mason")
local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
local ufo_config_handler = require("plugins.nvim-ufo").handler

if not mason_ok or not mason_lsp_ok then
  return
end

local constants = require('config.constants')

mason.setup({
  ui = {
    border = constants.border.border or "rounded",
  },
})

mason_lsp.setup({
  'cssmodules_ls',
  'marksman',
  'stylelint_lsp',
  "bashls",
  "cssls",
  "eslint",
  "html",
  "jsonls",
  "lua_ls",
  -- "graphql",
  -- "prismals",
  -- "tailwindcss"
  automatic_installation = true,
})

local lspconfig = require("lspconfig")

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    silent = true,
    border = constants.border.border,
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = constants.border.border }),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      underline = true,
      virtual_text = {
        spacin = 5,
        severity_limit = 'Warning',
      },
      update_in_insert = true
    }
  ),
}

local function on_attach(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    require("lsp.functions").enable_format_on_save()
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
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

lspconfig.cssls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("lsp.servers.cssls").on_attach,
  settings = require("lsp.servers.cssls").settings,
})

lspconfig.eslint.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("lsp.servers.eslint").on_attach,
  settings = require("lsp.servers.eslint").settings,
})

lspconfig.jsonls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("lsp.servers.jsonls").settings,
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("lsp.servers.lua_ls").settings,
})

lspconfig.vuels.setup({
  filetypes = require("lsp.servers.vuels").filetypes,
  handlers = handlers,
  init_options = require("lsp.servers.vuels").init_options,
  on_attach = require("lsp.servers.vuels").on_attach,
  settings = require("lsp.servers.vuels").settings,
})

for _, server in ipairs({ 'cssmodules_ls', 'marksman', 'stylelint_lsp', "bashls", "html", "yamlls" }) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
  })
end

require("ufo").setup({
  fold_virt_text_handler = ufo_config_handler,
  open_fold_hl_timeout = 0,
  close_fold_kinds = { "imports" },
  preview = {
    win_config = {
      border = { '', '─', '', '', '', '─', '', '' },
      winhighlight = 'Normal:Folded',
      winblend = 0
    },
    mappings = {
      scrollU = '<C-u>',
      scrollD = '<C-d>',
      jumpTop = '[',
      jumpBot = ']'
    }
  },
})
