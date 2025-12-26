return {
  cmd = { "vtsls", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },

  settings = {
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
  },
}
