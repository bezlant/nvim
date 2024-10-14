return {
  "sindrets/diffview.nvim",

  keys = {
    {
      "<leader>gdd",
      ":DiffviewToggle<CR>",
    },
    {
      "<leader>gdm",
      ":DiffviewOpen main..HEAD<CR>",
    },
  },

  config = function(_, opts)
    vim.api.nvim_create_user_command("DiffviewToggle", function()
      local diffview = require("diffview")
      local open_view = require("diffview.lib").get_current_view()
      if open_view then
        diffview.close()
      else
        diffview.open({})
      end
    end, { nargs = "*", desc = "Toggle DiffView" })

    require("diffview").setup(opts)
  end,
}
