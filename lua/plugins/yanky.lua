---@type LazySpec
return {
  "gbprod/yanky.nvim",
  event = "BufEnter",
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
