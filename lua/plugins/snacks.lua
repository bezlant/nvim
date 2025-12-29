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

      indent = {
        enabled = true,
        char = "│",
        scope = {
          enabled = true,
        },
      },

      bufdelete = {
        enabled = true,
      },
    },
    keys = {
      -- Lazygit
      { "<leader>g", function() Snacks.lazygit() end, desc = "LazyGit" },

      -- Picker: Files
      { "<C-f>", function() Snacks.picker.smart() end, desc = "Smart Find" },
      { "<leader>f", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>ff", function() Snacks.picker.files({ hidden = true, ignored = true }) end, desc = "Find Files (all)" },
      { "<leader>fr", function() Snacks.picker.resume() end, desc = "Resume Picker" },

      -- Picker: Grep
      { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },

      -- Picker: Git
      { "<leader>fs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>fc", function() Snacks.picker.git_log() end, desc = "Git Commits" },

      -- Picker: Buffers & Registers
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>fy", function() Snacks.picker.registers() end, desc = "Registers" },

      -- Picker: Help & Exploration
      { "<leader>fh", function() Snacks.picker.help() end, desc = "Help" },
      { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>fl", function() require("utils.pickers").lazy_plugins() end, desc = "Lazy Plugins" },

      -- Picker: Diagnostics
      { "<leader>tw", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    },
  },
}
