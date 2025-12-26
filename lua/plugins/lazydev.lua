---@type LazySpec
return {
  "folke/lazydev.nvim",
  enabled = true,
  ft = "lua",
  opts = {
    library = {
      -- Load luvit types when vim.uv is found
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      -- Load snacks types when Snacks is used
      { path = "snacks.nvim", words = { "Snacks" } },
      -- Always load lazy.nvim types (we're in a lazy.nvim config)
      "lazy.nvim",
    },
  },
}
