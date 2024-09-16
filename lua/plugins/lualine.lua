local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " },
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = false,
}

local location = {
  "location",
  padding = 0,
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local noice = require("noice")

require("lualine").setup({
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "dracula-nvim",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        noice.api.statusline.mode.get,
        cond = noice.api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      },
    },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { diff, spaces, "encoding", filetype, "fileformat" },
    lualine_z = { "progress" },
    lualine_y = { location },
  },
})
