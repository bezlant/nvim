return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {

    layout = {
      default_direction = "prefer_left",
    },
  },

  init = function()
    vim.keymap.set("n", "<leader>s", "<cmd>AerialToggle!<CR>")
  end,
}
