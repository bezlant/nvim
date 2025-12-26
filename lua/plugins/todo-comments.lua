---@type LazySpec
return {
  "folke/todo-comments.nvim",
  lazy = false,
  event = "BufEnter",
  opts = {
    signs = true,
    keywords = {
      FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG" } },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
      PERF = { icon = "󰅒 ", alt = { "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "󰍨 ", color = "hint", alt = { "INFO" } },
    },
    highlight = {
      keyword = "bg",
      after = "",
    },
  },
  keys = {
    {
      "n",
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
    },

    {
      "n",
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
    },
  },
}
