return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
    },

    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "tsx",
          "typescript",
          "javascript",
          "html",
          "css",
          "vue",
          "gitcommit",
          "json",
          "json5",
          "lua",
          "markdown",
          "vim",
          "regex",
          "markdown_inline",
          "bash",
        },

        sync_install = true,

        highlight = {
          enable = true,
        },

        indent = {
          enable = true,
        },

        textobjects = {
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]]"] = "@function.outer",
              ["]m"] = "@class.outer",
            },
            goto_next_end = {
              ["]["] = "@function.outer",
              ["]M"] = "@class.outer",
            },
            goto_previous_start = {
              ["[["] = "@function.outer",
              ["[m"] = "@class.outer",
            },
            goto_previous_end = {
              ["[]"] = "@function.outer",
              ["[M"] = "@class.outer",
            },
          },

          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },

          swap = {
            enable = true,
            swap_next = {
              ["`"] = "@parameter.inner",
            },
          },
        },

        textsubjects = {
          enable = true,
          keymaps = {
            ["<cr>"] = "textsubjects-smart",
          },
        },
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "BufReadPre",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
      })
    end,
  },
}
