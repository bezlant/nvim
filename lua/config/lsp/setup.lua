-- Setup installer & lsp configs
local mason_ok, mason = pcall(require, "mason")
local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
local ufo_config_handler = require("utils.nvim-ufo").handler

if not mason_ok or not mason_lsp_ok then
  return
end

local constants = require("config.constants")

mason.setup({
  ui = {
    border = constants.border.border,
  },
})

mason_lsp.setup({
  automatic_installation = true,
  ensure_installed = {
    "bashls",
    "cssls",
    "cssmodules_ls",
    "eslint",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    "stylelint_lsp",
    "ts_ls",
    "vtsls",
  },
})

local lspconfig = require("lspconfig")

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    silent = true,
    border = constants.border.border,
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = constants.border.border,
  }),
}

local function on_attach(_, bufnr)
  vim.lsp.inlay_hint.enable(true, { bufnr })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name)
    require("lspconfig")[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })
  end,

  ["vtsls"] = function()
    require("lspconfig.configs").vtsls = require("vtsls").lspconfig

    lspconfig.vtsls.setup({
      capabilities = capabilities,
      handlers = require("config.lsp.servers.vtsls").handlers,
      on_attach = require("config.lsp.servers.vtsls").on_attach,
      settings = require("config.lsp.servers.vtsls").settings,
    })
  end,

  ["ts_ls"] = function()
    -- Skip since we use vtsls
  end,

  ["cssls"] = function()
    lspconfig.cssls.setup({
      capabilities = capabilities,
      handlers = handlers,
      on_attach = require("config.lsp.servers.cssls").on_attach,
      settings = require("config.lsp.servers.cssls").settings,
    })
  end,

  ["eslint"] = function()
    lspconfig.eslint.setup({
      capabilities = capabilities,
      handlers = handlers,
      on_attach = require("config.lsp.servers.eslint").on_attach,
      settings = require("config.lsp.servers.eslint").settings,
    })
  end,

  ["jsonls"] = function()
    lspconfig.jsonls.setup({
      capabilities = capabilities,
      handlers = handlers,
      on_attach = on_attach,
      settings = require("config.lsp.servers.jsonls").settings,
    })
  end,

  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      handlers = handlers,
      on_attach = on_attach,
      settings = require("config.lsp.servers.lua_ls").settings,
    })
  end,

  ["vuels"] = function()
    lspconfig.vuels.setup({
      filetypes = require("config.lsp.servers.vuels").filetypes,
      handlers = handlers,
      init_options = require("config.lsp.servers.vuels").init_options,
      on_attach = require("config.lsp.servers.vuels").on_attach,
      settings = require("config.lsp.servers.vuels").settings,
    })
  end,

  ["stylelint_lsp"] = function()
    lspconfig.stylelint_lsp.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      filetypes = require("config.lsp.servers.stylelint").filetypes,
      settings = require("config.lsp.servers.stylelint").settings,
    })
  end,
})

---@diagnostic disable-next-line: missing-fields
require("ufo").setup({
  fold_virt_text_handler = ufo_config_handler,
  close_fold_kinds_for_ft = { default = { "imports" } },
  open_fold_hl_timeout = 0,
})
