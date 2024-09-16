require("aerial").setup({
  layout = {
    default_direction = "prefer_left",
  },
})

vim.keymap.set("n", "<leader>s", "<cmd>AerialToggle!<CR>")
