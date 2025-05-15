local ufo_config_handler = require("utils.nvim-ufo").handler

require("mason").setup()

require("mason-lspconfig").setup({
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
    "gopls",
    "vtsls",
  },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

vim.lsp.config("cssmodules_ls", {
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.definitionProvider = false
  end,
  cmd = { "/Users/abezlyudniy/cssmodules-language-server/lib/cli.js" },
})

require("lspconfig.configs").vtsls = require("vtsls").lspconfig
local vtsls = require("config.lsp.servers.vtsls")
vim.lsp.config(
  "vtsls",
  vim.tbl_extend("force", {
    capabilities = capabilities,
    on_attach = vtsls.on_attach,
    handlers = vtsls.handlers,
    settings = vtsls.settings,
  }, vtsls.extra or {})
)

local css = require("config.lsp.servers.cssls")
vim.lsp.config("cssls", {
  capabilities = capabilities,
  on_attach = css.on_attach,
  settings = css.settings,
})

local eslint = require("config.lsp.servers.eslint")
vim.lsp.config("eslint", {
  capabilities = capabilities,
  on_attach = eslint.on_attach,
  settings = eslint.settings,
})

vim.lsp.config("jsonls", {
  capabilities = capabilities,
  settings = require("config.lsp.servers.jsonls").settings,
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = require("config.lsp.servers.lua_ls").settings,
})

local vuels = require("config.lsp.servers.vuels")
vim.lsp.config("vuels", {
  filetypes = vuels.filetypes,
  init_options = vuels.init_options,
  on_attach = vuels.on_attach,
  settings = vuels.settings,
})

local stylelint = require("config.lsp.servers.stylelint")
vim.lsp.config("stylelint_lsp", {
  capabilities = capabilities,
  filetypes = stylelint.filetypes,
  settings = stylelint.settings,
})

---@diagnostic disable-next-line: missing-fields
require("ufo").setup({
  fold_virt_text_handler = ufo_config_handler,
  close_fold_kinds_for_ft = { default = { "imports" } },
  open_fold_hl_timeout = 0,
})
