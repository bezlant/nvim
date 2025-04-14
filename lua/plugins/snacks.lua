Snacks = Snacks

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      dashboard = { enabled = false },
      indent = { enabled = false },
      explorer = { enabled = false },
      picker = {
        enabled = true,
        previewers = {
          git = {
            native = true, -- use native (terminal) or Neovim for previewing git diffs and commits
          },
        },
        win = {
          -- input window
          input = {
            keys = {
              -- ["<Esc>"] = { "close", mode = { "n", "i" } },
              ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
              ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
              ["<c-b>"] = { "list_scroll_up", mode = { "i", "n" } },
              ["<c-f>"] = { "list_scroll_down", mode = { "i", "n" } },
            },
          },
        },
      },
      quickfile = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = {
        enabled = true,
      },
      words = { enabled = false },
    },
    keys = {
      -- ╭─────────────────────────────────────────────────────────╮
      -- │ Lazygit                                                 │
      -- ╰─────────────────────────────────────────────────────────╯
      {
        "<leader>gla",
        function()
          Snacks.lazygit.log()
        end,
        desc = "Lazygit Log (cwd)",
      },
      {
        "<leader>glc",
        function()
          Snacks.lazygit.log_file()
        end,
        desc = "Lazygit Current File History",
      },
      -- ╭─────────────────────────────────────────────────────────╮
      -- │ Picker                                                  │
      -- ╰─────────────────────────────────────────────────────────╯
      {
        "<C-f>",
        function()
          Snacks.picker.smart()
        end,
        desc = "smart files",
      },
      {
        "<leader>fg",
        function()
          Snacks.picker.grep()
        end,
        desc = "grep",
      },
      {
        "<leader>fw",
        function()
          Snacks.picker.grep_word()
        end,
        desc = "grep word",
        mode = { "n", "v" },
      },

      {
        "<leader>fp",
        function()
          Snacks.picker.projects()
        end,
        desc = "projects list",
      },
      {
        "<leader>fd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "diagnostics",
      },

      {
        "<leader>ff",
        function()
          Snacks.picker.files()
        end,
        desc = "files",
      },
      {
        "<leader>fb",
        function()
          Snacks.picker.buffers()
        end,
        desc = "buffers",
      },
      {
        "<leader>fr",
        function()
          Snacks.picker.resume()
        end,
        desc = "Resume",
      },
      {
        "<leader>fc",
        function()
          Snacks.picker.command_history()
        end,
        desc = "command history",
      },
      {
        "<leader>ss",
        function()
          Snacks.picker.search_history()
        end,
        desc = "search history",
      },
      {
        "<leader>sq",
        function()
          Snacks.picker.qflist()
        end,
        desc = "quickfix list",
      },
      {
        "<leader>sc",
        function()
          Snacks.picker.colorschemes()
        end,
        desc = "color schemes",
      },
      {
        "<leader>sd",
        function()
          Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "dotfiles",
      },
    },
  },
}
