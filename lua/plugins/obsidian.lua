return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New note" },
    { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Daily note" },
    { "<leader>ot", "<cmd>edit ~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes/ideas/TODO.md<cr>", desc = "TODO" },
    { "<leader>oa", "<cmd>edit ~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes/<cr>", desc = "Browse notes" },
    {
      "<leader>oo",
      function()
        Snacks.picker.files({ dirs = { "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes" }, sort = { fields = { "modified:desc" } } })
      end,
      desc = "Find note",
    },
    {
      "<leader>os",
      function()
        Snacks.picker.grep({ dirs = { "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes" } })
      end,
      desc = "Search notes",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes",
      },
    },
    daily_notes = {
      folder = "daily",
    },
    -- Use filename as note ID (simple, no zettelkasten IDs)
    note_id_func = function(title)
      return title
    end,
    -- Don't add frontmatter by default — keep notes clean
    disable_frontmatter = true,
    -- Don't conceal markdown syntax (checkboxes, links, etc.)
    ui = { enable = false },
    -- Open URLs in default browser
    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url })
    end,
  },
}
