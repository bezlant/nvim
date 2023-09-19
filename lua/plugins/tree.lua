local api = require("nvim-tree.api")
local view = require('nvim-tree.view')

-- Restore nvim-tree properly when opening a session
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = 'NvimTree*',
  callback = function()
    if not view.is_visible() then
      api.tree.open()
    end
  end,
})

-- Go to last used hidden buffer when deleting a buffer
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    -- Only 1 window with nvim-tree left: we probably closed a file buffer
    if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
      -- Required to let the close event complete. An error is thrown without this.
      vim.defer_fn(function()
        -- close nvim-tree: will go to the last hidden buffer used before closing
        api.tree.toggle({ find_file = true, focus = true })
        -- re-open nivm-tree
        api.tree.toggle({ find_file = true, focus = true })
        -- nvim-tree is still the active window. Go to the previous window.
        vim.cmd("wincmd p")
      end, 0)
    end
  end
})

-- Opens a file when created
api.events.subscribe(api.events.Event.FileCreated, function(file)
  vim.cmd("edit " .. file.fname)
end)

require("nvim-tree").setup({
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,

  view = {
    width = 45,
    adaptive_size = false,
  },

  diagnostics = {
    enable = false,
    icons = {
      hint = '󰌵',
      info = '',
      warning = '',
      error = '',
    },
  },
  update_focused_file = {
    enable = true,
  },

  renderer = {
    group_empty = true,
    root_folder_modifier = ':~',
    indent_markers = {
      enable = true,
      icons = {
        corner = '└',
        edge = '│',
        none = ' ',
      },
    },
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        folder = {
          arrow_open = '',
          arrow_closed = '',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
        git = {
          unstaged = '',
          staged = 'S',
          unmerged = '',
          renamed = '➜',
          untracked = 'U',
          deleted = '',
          ignored = '◌',
        },
      },
    },
    special_files = {
      'Makefile',
      'build/',
      'CMakeLists.txt',
      'CMakeLists',
    },
  },

  filters = {
    dotfiles = true,
  },
})
