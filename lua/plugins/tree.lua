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
    enable = true,
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
