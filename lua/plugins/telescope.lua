local actions    = require('telescope.actions')
local previewers = require('telescope.previewers')
local builtin    = require('telescope.builtin')
local sorters    = require('telescope.sorters')
local icons      = require('config.constants').icons

require('telescope').load_extension('fzf')

local git_icons = {
  added = icons.gitAdd,
  changed = icons.gitChange,
  copied = ">",
  deleted = icons.gitRemove,
  renamed = "➡",
  unmerged = "‡",
  untracked = "?",
}

require('telescope').setup {
  defaults = {
    border            = true,
    hl_result_eol     = true,
    multi_icon        = '',
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    layout_config     = {
      horizontal = {
        preview_cutoff = 120,
      },
      prompt_position = "top",
    },
    file_sorter       = sorters.get_fzy_sorter,
    prompt_prefix     = '  ',
    color_devicons    = true,
    git_icons         = git_icons,
    sorting_strategy  = "ascending",
    file_previewer    = previewers.vim_buffer_cat.new,
    grep_previewer    = previewers.vim_buffer_vimgrep.new,
    qflist_previewer  = previewers.vim_buffer_qflist.new,
    mappings          = {
      i = {
        ['<c-c>'] = actions.close,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-d>"] = actions.results_scrolling_down,
        ["<C-u>"] = actions.results_scrolling_up,

        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<ESC><ESC>"] = actions.close,
      },
      n = {
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,

        ["<ESC>"] = actions.close,
      }
    }
  },
  extensions = {
    fzf = {
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}
