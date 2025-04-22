return {
  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    version = "1.*",
    dependencies = {
      {
        "saghen/blink.compat",
        opts = { impersonate_nvim_cmp = true },
      },
      "rafamadriz/friendly-snippets",
      "fang2hou/blink-copilot",
      "onsails/lspkind.nvim",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
          })
        end,
      },
    },

    ---@module 'blink.cmp'
    opts = {
      cmdline = {},
      term = {},

      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      keymap = {
        preset = "enter",
        ["<C-q>"] = {
          function(cmp)
            cmp.show()
          end,
        },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-v>"] = { "show_signature", "hide_signature", "fallback" },
        ["C-e"] = { "hide", "fallback" },
      },

      snippets = {
        preset = "luasnip",
        expand = function(snippet)
          require("luasnip").lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require("luasnip").jumpable(filter.direction)
          end
          return require("luasnip").in_snippet()
        end,
        jump = function(direction)
          require("luasnip").jump(direction)
        end,
      },

      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "codecompanion",
          "copilot",
        },

        providers = {
          codecompanion = {
            name = "CodeCompanion",
            module = "codecompanion.providers.completion.blink",
          },
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            opts = {
              max_completions = 3,
              max_attempts = 4,
            },
            score_offset = 100,
            async = true,
            transform_items = function(_, items)
              local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = "Copilot"
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
          },
          buffer = {
            opts = {
              max_items = 10,
            },
          },
        },
      },

      completion = {
        trigger = {
          -- When true, will show the completion window after typing a trigger character
          show_on_trigger_character = true,
          -- When both this and show_on_trigger_character are true, will show the completion window
          -- when the cursor comes after a trigger character when entering insert mode
          show_on_insert_on_trigger_character = true,
          -- List of trigger characters (on top of `show_on_blocked_trigger_characters`) that won't trigger
          -- the completion window when the cursor comes after a trigger character when
          -- entering insert mode/accepting an item
          show_on_x_blocked_trigger_characters = { "'", '"', "(", "{" },
          -- or a function, similar to show_on_blocked_trigger_character
        },

        menu = {
          border = "single",
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind", gap = 1 },
            },
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,

                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
            },
          },
        },

        -- experimental auto-brackets support
        accept = {
          auto_brackets = { enabled = true },
        },

        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          treesitter_highlighting = true,
        },

        ghost_text = {
          enabled = true,
        },
      },

      signature = {
        enabled = true,
      },
    },
  },
}
