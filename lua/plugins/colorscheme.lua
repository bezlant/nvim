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
      -- Blink completion
      BlinkCmpMenu = { fg = colors.fg, bg = colors.bg },
      BlinkCmpMenuBorder = { fg = colors.fg, bg = colors.bg },
      BlinkCmpLabel = { fg = colors.fg, bg = colors.bg },
      BlinkCmpLabelMatch = { fg = colors.cyan, bg = colors.bg },
      BlinkCmpSource = { fg = colors.purple, bg = colors.bg },

      -- Diff/Git - toned down for readability
      Added = { fg = colors.green },
      DiffAdd = { bg = "#2a3a2a" },
      DiffText = { bg = "#3a3a2a" },
      SnacksDiffAdd = { bg = "#2a3a2a" },
      SnacksPickerGitStatusAdded = { fg = colors.green },

      Removed = { fg = colors.red },
      DiffDelete = { bg = "#3a2a2a" },
      SnacksDiffDelete = { bg = "#3a2a2a" },
      SnacksPickerGitStatusDeleted = { fg = colors.red },
    }

    for group, hl in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end,
}
