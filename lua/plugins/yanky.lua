---@type LazySpec
return {
  "gbprod/yanky.nvim",
  keys = {
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put After" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Before" },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "GPut After" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "GPut Before" },
    { "<C-p>", "<Plug>(YankyPreviousEntry)", desc = "Prev Yank" },
    { "<C-n>", "<Plug>(YankyNextEntry)", desc = "Next Yank" },
  },
  opts = {
    highlight = {
      timer = 100,
    },
    preserve_cursor_position = {
      enabled = true,
    },
    system_clipboard = {
      sync_with_ring = false,
    },
  },
}
