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

        autotag = {
          enable = true,
        },

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
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
    },
  },
}
