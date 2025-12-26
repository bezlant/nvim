---@type LazySpec
return {
  "Mofiqul/dracula.nvim",
  dependencies = { "echasnovski/mini.hipatterns" },
  lazy = false,
  config = function()
    vim.cmd.colorscheme("dracula")

    local hipatterns = require("mini.hipatterns")

    hipatterns.setup({
      highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })

    local colors = require("dracula").colors()

    local highlights = {
      BlinkCmpMenu = { fg = colors.fg, bg = colors.bg },
      BlinkCmpMenuBorder = { fg = colors.fg, bg = colors.bg },
      BlinkCmpLabel = { fg = colors.fg, bg = colors.bg },
      BlinkCmpSource = { fg = colors.purple, bg = colors.bg },
    }

    for group, hl in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end,
}
