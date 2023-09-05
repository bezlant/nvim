local bufferline = require("bufferline")

bufferline.setup({
  options = {
    always_show_bufferline = true,
    enforce_regular_tabs = false,
    max_name_length = 18,
    separator_style = 'thin',
    show_buffer_close_icons = false,
    tab_size = 15,
    modified_icon = '*',
    themable = true,
    style_preset = bufferline.style_preset.no_italic,
    numbers = 'ordinal',
    custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "qf" then
        return true
      end
    end,
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
