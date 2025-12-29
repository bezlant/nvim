return {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  root_markers = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml", "eslint.config.js", "eslint.config.mjs", "package.json", ".git" },

  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
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
    useFlatConfig = nil, -- auto-detect; set to true for eslint.config.js or false for .eslintrc.*
    validate = "on",
    workingDirectory = { mode = "location" },
    experimental = {
      useFlatConfig = nil, -- some versions need this in experimental
    },
  },
}
