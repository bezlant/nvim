local actions    = require('telescope.actions')
local builtin    = require('telescope.builtin')
local previewers = require('telescope.previewers')
local sorters    = require('telescope.sorters')
local telescope  = require("telescope")

local trouble    = require("trouble.providers.telescope")
local icons      = require('config.constants').icons

telescope.load_extension("live_grep_args")
telescope.load_extension('fzf')

local git_icons = {
  added = icons.gitAdd,
  changed = icons.gitChange,
  copied = ">",
  deleted = icons.gitRemove,
  renamed = "➡",
  unmerged = "‡",
  untracked = "?",
}

telescope.setup {
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
        ["<C-t>"] = trouble.open_with_trouble,

        ["<ESC><ESC>"] = actions.close,

      },
      n = {
        ["<C-d>"] = actions.results_scrolling_down,
        ["<C-u>"] = actions.results_scrolling_up,

        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-t>"] = trouble.open_with_trouble,

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
