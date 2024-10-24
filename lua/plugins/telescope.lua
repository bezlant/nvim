return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-frecency.nvim" },
      { "tsakirist/telescope-lazy.nvim" },
      { "fdschmidt93/telescope-egrepify.nvim" },
      {
        "napisani/nvim-github-codesearch",
        build = "make",
        config = function()
          ---@diagnostic disable-next-line: missing-fields
          require("nvim-github-codesearch").setup({
            ---@diagnostic disable-next-line: missing-fields, assign-type-mismatch
            github_auth_token = os.getenv("GIT_AUTH_TOKEN"),
            use_telescope = true,
          })
        end,
      },
    },

    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local previewers = require("telescope.previewers")
      local sorters = require("telescope.sorters")

      local trouble = require("trouble.sources.telescope")

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules" },
          border = true,
          hl_result_eol = true,
          multi_icon = "",

          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },

          layout_config = {
            horizontal = {
              preview_cutoff = 120,
            },
            prompt_position = "top",
          },

          file_sorter = sorters.get_fzy_sorter,
          prompt_prefix = "  ",
          color_devicons = true,
          sorting_strategy = "ascending",
          file_previewer = previewers.vim_buffer_cat.new,
          grep_previewer = previewers.vim_buffer_vimgrep.new,
          qflist_previewer = previewers.vim_buffer_qflist.new,
          mappings = {
            i = {
              ["<c-c>"] = actions.close,

              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,

              ["<C-d>"] = actions.results_scrolling_down,
              ["<C-u>"] = actions.results_scrolling_up,

              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<C-t>"] = trouble.open,

              ["<ESC><ESC>"] = actions.close,
            },
            n = {
              ["<C-d>"] = actions.results_scrolling_down,
              ["<C-u>"] = actions.results_scrolling_up,

              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<C-t>"] = trouble.open,

              ["<ESC>"] = actions.close,
            },
          },
        },
        extensions = {
          aerial = {
            format_symbol = function(symbol_path, filetype)
              if filetype == "json" or filetype == "yaml" then
                return table.concat(symbol_path, ".")
              else
                return symbol_path[#symbol_path]
              end
            end,
            show_columns = "both",
          },

          fzf = {
            fuzzy = true,
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case",
          },

          frecency = {
            db_safe_mode = false,
            matcher = "fuzzy",
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("aerial")
      telescope.load_extension("frecency")
      telescope.load_extension("egrepify")
    end,
  },
}
