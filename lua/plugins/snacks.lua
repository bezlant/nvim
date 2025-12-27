return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
      input = {
        enabled = true,
      },
      picker = {
        enabled = true,
        ui_select = true,
        matcher = {
          fuzzy = true,
          smartcase = true,
          ignorecase = true,
          frecency = true,
        },
        layout = {
          preset = "default",
          layout = {
            backdrop = false,
          },
        },
        sources = {
          files = {
            hidden = false,
            ignored = false,
          },
          grep = {
            live = true,
          },
        },
        win = {
          input = {
            keys = {
              ["<C-j>"] = { "list_down", mode = { "i", "n" } },
              ["<C-k>"] = { "list_up", mode = { "i", "n" } },
              ["<C-d>"] = { "list_scroll_down", mode = { "i", "n" } },
              ["<C-u>"] = { "list_scroll_up", mode = { "i", "n" } },
              ["<C-q>"] = { "qflist", mode = { "i", "n" } },
              ["<C-t>"] = { "trouble_open", mode = { "i", "n" } },
            },
          },
        },
      },
      notifier = {
        style = "fancy",
        enabled = true,
        timeout = 3000,
      },
      lazygit = {
        enabled = true,
        configure = false,
        config = {
          os = { editPreset = "nvim-remote" },
        },
        win = {
          backdrop = false,
          border = "rounded",
        },
      },
      -- Replaces indent-blankline.nvim
      indent = {
        enabled = true,
        char = "│",
        scope = {
          enabled = true,
        },
      },
      -- Replaces mini.bufremove
      bufdelete = {
        enabled = true,
      },
    },
    keys = {
      {
        "<leader>g",
        function()
          Snacks.lazygit()
        end,
        desc = "LazyGit",
      },
    },
  },
}
