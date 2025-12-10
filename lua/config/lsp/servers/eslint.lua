vim.lsp.config.eslint = {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    -- omnifunc like before
    vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
  end,

  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine",
      },
      showDocumentation = { enable = true },
    },
    codeActionOnSave = { enable = true, mode = "all" },
    problems = { shortenToSingleLine = false },
    format = true,
    nodePath = "",
    onIgnoredFiles = "off",
    quiet = false,
    rulesCustomizations = {},
    run = "onSave",
    useESLintClass = false,
    validate = "on",
    workingDirectory = { mode = "location" },
  },
}
