return {
  {
    "echasnovski/mini.bufremove",
    opts = {},
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.bufremove",
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
            require("mini.bufremove").delete(n, false)
          end,
          right_mouse_command = function(n)
            require("mini.bufremove").delete(n, false)
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

    keys = {
      { "<Leader>1", "<cmd>BufferLineGoToBuffer 1<CR>" },
      { "<Leader>2", "<cmd>BufferLineGoToBuffer 2<CR>" },
      { "<Leader>3", "<cmd>BufferLineGoToBuffer 3<CR>" },
      { "<Leader>4", "<cmd>BufferLineGoToBuffer 4<CR>" },
      { "<Leader>5", "<cmd>BufferLineGoToBuffer 5<CR>" },
      { "<Leader>6", "<cmd>BufferLineGoToBuffer 6<CR>" },
      { "<Leader>7", "<cmd>BufferLineGoToBuffer 7<CR>" },
      { "<Leader>8", "<cmd>BufferLineGoToBuffer 8<CR>" },
      { "<Leader>9", "<cmd>BufferLineGoToBuffer 9<CR>" },
      { "<M-1>", "<cmd>BufferLineGoToBuffer 1<CR>" },
      { "<M-2>", "<cmd>BufferLineGoToBuffer 2<CR>" },
      { "<M-3>", "<cmd>BufferLineGoToBuffer 3<CR>" },
      { "<M-4>", "<cmd>BufferLineGoToBuffer 4<CR>" },
      { "<M-5>", "<cmd>BufferLineGoToBuffer 5<CR>" },
      { "<M-6>", "<cmd>BufferLineGoToBuffer 6<CR>" },
      { "<M-7>", "<cmd>BufferLineGoToBuffer 7<CR>" },
      { "<M-8>", "<cmd>BufferLineGoToBuffer 8<CR>" },
      { "<M-9>", "<cmd>BufferLineGoToBuffer 9<CR>" },
      { "<Leader>bb", "<cmd>BufferLineMovePrev<CR>" },
      { "<Leader>bl", "<cmd>BufferLineCloseLeft<CR>" },
      { "<Leader>bn", "<cmd>BufferLineMoveNext<CR>" },
      { "<Leader>bp", "<cmd>BufferLinePick<CR>" },
      { "<Leader>bP", "<cmd>BufferLineTogglePin<CR>" },
      { "<Leader>bsd", "<cmd>BufferLineSortByDirectory<CR>" },
      { "<Leader>bse", "<cmd>BufferLineSortByExtension<CR>" },
      { "<Leader>bsr", "<cmd>BufferLineSortByRelativeDirectory<CR>" },
    },
  },
}
