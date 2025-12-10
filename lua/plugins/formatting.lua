return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      lua = { "stylua" },
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500,
    },
  },
}
