local colors = require('dracula').colors();

local highlights = {
  CmpItemAbbr = { fg = colors.fg, bg = "NONE" },
  CmpItemMenu = { fg = "#C586C0", bg = "NONE" },
  CmpItemAbbrMatch = { fg = "#569CD6", bg = "NONE" },
  CmpItemAbbrMatchFuzzy = { fg = "#569CD6", bg = "NONE" },
}

vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = colors.cyan })

for group, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, hl)
end
