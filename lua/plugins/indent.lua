return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    vim.opt.list = true

    require("ibl").setup({
      exclude = {
        filetypes = { "help", "dashboard", "packer", "NvimTree", "Trouble", "TelescopePrompt", "Float" },
        buftypes = { "terminal", "nofile", "telescope" },
      },
      indent = {
        char = "│",
      },
      scope = {
        enabled = true,
        show_start = false,
      },
    })
  end,
}
