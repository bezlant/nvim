---@type LazySpec
return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
          always_show_bufferline = true,
          enforce_regular_tabs = false,
          max_name_length = 18,
          separator_style = "thin",
          show_buffer_close_icons = false,
          tab_size = 15,
          modified_icon = "*",
          themable = true,
          style_preset = require("bufferline").style_preset.no_italic,
          numbers = "ordinal",
          close_command = function(n)
            Snacks.bufdelete(n)
          end,
          right_mouse_command = function(n)
            Snacks.bufdelete(n)
          end,
        },
        highlights = {
          buffer_selected = {
            bold = true,
            italic = true,
          },
        },
      })
    end,
  },
}
