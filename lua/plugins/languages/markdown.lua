---@type LazySpec
return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown" },
  config = function()
    local colors = require("dracula").colors()
    local hl = vim.api.nvim_set_hl

    -- Headings
    hl(0, "RenderMarkdownH1", { fg = colors.pink, bold = true })
    hl(0, "RenderMarkdownH2", { fg = colors.purple, bold = true })
    hl(0, "RenderMarkdownH3", { fg = colors.cyan, bold = true })
    hl(0, "RenderMarkdownH4", { fg = colors.green, bold = true })
    hl(0, "RenderMarkdownH5", { fg = colors.orange, bold = true })
    hl(0, "RenderMarkdownH6", { fg = colors.yellow, bold = true })

    -- Heading backgrounds (blend with bg)
    hl(0, "RenderMarkdownH1Bg", { bg = colors.visual })
    hl(0, "RenderMarkdownH2Bg", { bg = colors.visual })
    hl(0, "RenderMarkdownH3Bg", { bg = colors.visual })
    hl(0, "RenderMarkdownH4Bg", { bg = colors.visual })
    hl(0, "RenderMarkdownH5Bg", { bg = colors.visual })
    hl(0, "RenderMarkdownH6Bg", { bg = colors.visual })

    -- Code
    hl(0, "RenderMarkdownCode", { bg = colors.selection })
    hl(0, "RenderMarkdownCodeInline", { bg = colors.selection, fg = colors.green })

    -- Quotes
    hl(0, "RenderMarkdownQuote", { fg = colors.comment, italic = true })

    -- Lists
    hl(0, "RenderMarkdownBullet", { fg = colors.cyan })
    hl(0, "RenderMarkdownDash", { fg = colors.comment })

    -- Links
    hl(0, "RenderMarkdownLink", { fg = colors.cyan, underline = true })
    hl(0, "RenderMarkdownWikiLink", { fg = colors.purple, underline = true })

    -- Checkboxes
    hl(0, "RenderMarkdownUnchecked", { fg = colors.comment })
    hl(0, "RenderMarkdownChecked", { fg = colors.green })
    hl(0, "RenderMarkdownTodo", { fg = colors.orange })

    -- Tables
    hl(0, "RenderMarkdownTableHead", { fg = colors.purple, bold = true })
    hl(0, "RenderMarkdownTableRow", { fg = colors.fg })

    -- Callouts
    hl(0, "RenderMarkdownSuccess", { fg = colors.green })
    hl(0, "RenderMarkdownInfo", { fg = colors.cyan })
    hl(0, "RenderMarkdownHint", { fg = colors.purple })
    hl(0, "RenderMarkdownWarn", { fg = colors.orange })
    hl(0, "RenderMarkdownError", { fg = colors.red })

    require("render-markdown").setup({
      completions = { lsp = { enabled = true } },
    })
  end,
}
