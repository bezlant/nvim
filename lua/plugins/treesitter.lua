---@type LazySpec
return {
  -- Core treesitter (main branch - provides queries only)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    -- Disable nvim-treesitter's built-in module system (required for ts-install.nvim)
    init = function()
      vim.g.loaded_nvim_treesitter = 1
    end,
    config = function()
      -- Enable highlighting for all filetypes with a parser
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)

          -- Only start treesitter if parser is actually installed
          if lang and pcall(vim.treesitter.language.add, lang) then
            pcall(vim.treesitter.start, args.buf)
          end
        end,
      })
    end,
  },

  -- Parser installation and management
  {
    "lewis6991/ts-install.nvim",
    lazy = false,
    config = function()
      require("ts-install").setup({
        auto_install = true,
        -- Core parsers to have ready immediately (others auto-install on first open)
        ensure_install = {
          "lua",
          "luadoc",
          "vim",
          "vimdoc",
          "markdown",
          "markdown_inline",
          "typescript",
          "tsx",
          "javascript",
          "json",
          "html",
          "css",
          "bash",
          "go",
          "python",
          "yaml",
        },
      })
    end,
  },

  -- Treesitter-aware textobjects (main branch)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
          include_surrounding_whitespace = false,
        },
        move = {
          set_jumps = true,
        },
      })

      -- Textobject keymaps
      local ts_select = require("nvim-treesitter-textobjects.select")
      local ts_move = require("nvim-treesitter-textobjects.move")
      local ts_swap = require("nvim-treesitter-textobjects.swap")

      -- Select: function
      vim.keymap.set({ "x", "o" }, "af", function()
        ts_select.select_textobject("@function.outer", "textobjects")
      end, { desc = "Select outer function" })

      vim.keymap.set({ "x", "o" }, "if", function()
        ts_select.select_textobject("@function.inner", "textobjects")
      end, { desc = "Select inner function" })

      -- Select: class
      vim.keymap.set({ "x", "o" }, "ac", function()
        ts_select.select_textobject("@class.outer", "textobjects")
      end, { desc = "Select outer class" })

      vim.keymap.set({ "x", "o" }, "ic", function()
        ts_select.select_textobject("@class.inner", "textobjects")
      end, { desc = "Select inner class" })

      -- Select: parameter/argument
      vim.keymap.set({ "x", "o" }, "aa", function()
        ts_select.select_textobject("@parameter.outer", "textobjects")
      end, { desc = "Select outer parameter" })

      vim.keymap.set({ "x", "o" }, "ia", function()
        ts_select.select_textobject("@parameter.inner", "textobjects")
      end, { desc = "Select inner parameter" })

      -- Move
      vim.keymap.set({ "n", "x", "o" }, "]]", function()
        ts_move.goto_next_start("@function.outer", "textobjects")
      end, { desc = "Next function start" })

      vim.keymap.set({ "n", "x", "o" }, "][", function()
        ts_move.goto_next_end("@function.outer", "textobjects")
      end, { desc = "Next function end" })

      vim.keymap.set({ "n", "x", "o" }, "[[", function()
        ts_move.goto_previous_start("@function.outer", "textobjects")
      end, { desc = "Previous function start" })

      vim.keymap.set({ "n", "x", "o" }, "[]", function()
        ts_move.goto_previous_end("@function.outer", "textobjects")
      end, { desc = "Previous function end" })

      vim.keymap.set({ "n", "x", "o" }, "]m", function()
        ts_move.goto_next_start("@class.outer", "textobjects")
      end, { desc = "Next class start" })

      vim.keymap.set({ "n", "x", "o" }, "]M", function()
        ts_move.goto_next_end("@class.outer", "textobjects")
      end, { desc = "Next class end" })

      vim.keymap.set({ "n", "x", "o" }, "[m", function()
        ts_move.goto_previous_start("@class.outer", "textobjects")
      end, { desc = "Previous class start" })

      vim.keymap.set({ "n", "x", "o" }, "[M", function()
        ts_move.goto_previous_end("@class.outer", "textobjects")
      end, { desc = "Previous class end" })

      -- Move: parameter/argument
      vim.keymap.set({ "n", "x", "o" }, "]a", function()
        ts_move.goto_next_start("@parameter.outer", "textobjects")
      end, { desc = "Next parameter" })

      vim.keymap.set({ "n", "x", "o" }, "[a", function()
        ts_move.goto_previous_start("@parameter.outer", "textobjects")
      end, { desc = "Previous parameter" })

      -- Swap parameters (Option+l / Option+h on Mac)
      vim.keymap.set("n", "<M-l>", function()
        ts_swap.swap_next("@parameter.inner", "textobjects")
      end, { desc = "Swap next parameter" })

      vim.keymap.set("n", "<M-h>", function()
        ts_swap.swap_previous("@parameter.inner", "textobjects")
      end, { desc = "Swap previous parameter" })
    end,
  },

  -- Incremental selection (Tab to expand, Shift-Tab to shrink)
  {
    "daliusd/incr.nvim",
    event = "VeryLazy",
    opts = {
      incr_key = "<Tab>",
      decr_key = "<S-Tab>",
    },
  },

  -- Treesitter context (shows function/class context at top)
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = {
      max_lines = 3,
    },
    keys = {
      {
        "[c",
        function()
          require("treesitter-context").go_to_context(vim.v.count1)
        end,
        desc = "Go to context",
      },
    },
  },

  -- Auto close/rename HTML tags
  {
    "windwp/nvim-ts-autotag",
    event = "BufReadPre",
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    },
  },
}
