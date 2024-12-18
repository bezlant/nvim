local types = require("cmp.types")

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local function deprioritize_snippet(entry1, entry2)
  if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
    return false
  end
  if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
    return true
  end
end

local function limit_lsp_types(entry, ctx)
  local kind = entry:get_kind()
  local line = ctx.cursor.line
  local col = ctx.cursor.col
  local char_before_cursor = string.sub(line, col - 1, col - 1)
  local char_after_dot = string.sub(line, col, col)

  if char_before_cursor == "." and char_after_dot:match("[a-zA-Z]") then
    if
      kind == types.lsp.CompletionItemKind.Method
      or kind == types.lsp.CompletionItemKind.Field
      or kind == types.lsp.CompletionItemKind.Property
    then
      return true
    else
      return false
    end
  elseif string.match(line, "^%s+%w+$") then
    if kind == types.lsp.CompletionItemKind.Function or kind == types.lsp.CompletionItemKind.Variable then
      return true
    else
      return false
    end
  end

  return true
end

local has_words_before = function()
  if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

local function get_lsp_completion_context(completion, source)
  local ok, source_name = pcall(function()
    return source.source.client.config.name
  end)
  if not ok then
    return nil
  end
  if source_name == "tsserver" or source_name == "typescript-tools" then
    return completion.detail
  elseif source_name == "pyright" then
    if completion.labelDetails ~= nil then
      return completion.labelDetails.description
    end
  end
end

local icons = require("config.constants").icons

local source_mapping = {
  npm = icons.terminal .. "NPM",
  cmp_tabnine = icons.light,
  Copilot = icons.copilot,
  cody = icons.cody .. "CDY",
  Codeium = icons.codeium,
  nvim_lsp = icons.stack .. "LSP",
  buffer = icons.buffer .. "BUF",
  nvim_lua = icons.bomb,
  luasnip = icons.snippet .. "SNP",
  calc = icons.calculator,
  path = icons.folderOpen2,
  treesitter = icons.tree,
  zsh = icons.terminal .. "ZSH",
}

local buffer_option = {
  -- Complete from all visible buffers (splits)
  get_bufnrs = function()
    local bufs = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      bufs[vim.api.nvim_win_get_buf(win)] = true
    end
    return vim.tbl_keys(bufs)
  end,
}

return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
      "saadparwaiz1/cmp_luasnip",
      { "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
      {
        "sourcegraph/sg.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
          ---@diagnostic disable-next-line: missing-parameter
          require("sg").setup()
        end,
      },
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    config = function()
      local lspkind = require("lspkind")
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local copilot_cmp_comparators = require("copilot_cmp.comparators")

      require("luasnip/loaders/from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<space>q"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif cmp.visible() and has_words_before() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<C-l>"] = cmp.mapping(function(fallback)
            if luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<C-h>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        }),

        ---@diagnostic disable-next-line: missing-fields
        formatting = {
          fields = { "kind", "abbr", "menu" },

          format = function(entry, vim_item)
            local item_with_kind = lspkind.cmp_format({
              mode = "symbol",
              maxwidth = 45,
              symbol_map = source_mapping,
            })(entry, vim_item)

            item_with_kind.menu = source_mapping[entry.source.name]
            item_with_kind.menu = (vim_item.menu or "") .. " "
            item_with_kind.abbr = " " .. string.sub(item_with_kind.abbr, 1, item_with_kind.maxwidth)

            local completion_context = get_lsp_completion_context(entry.completion_item, entry.source)
            if completion_context ~= nil and completion_context ~= "" then
              item_with_kind.menu = item_with_kind.menu .. [[ -> ]] .. completion_context
            end

            return item_with_kind
          end,
        },

        sources = {
          {
            name = "cody",
            priority = 10,
          },
          {
            name = "copilot",
            priority = 10,
            max_item_count = 3,
          },
          {
            name = "nvim_lsp",
            priority = 9,
            -- Limits LSP results to specific types based on line context (FIelds, Methods, Variables)
            entry_filter = limit_lsp_types,
          },
          { name = "npm", priority = 9 },
          { name = "luasnip", priority = 7 },
          {
            name = "buffer",
            priority = 7,
            keyword_length = 5,
            max_item_count = 10,
            option = buffer_option,
          },
          { name = "nvim_lua", priority = 5 },
          { name = "path", priority = 4 },
          { name = "calc", priority = 3 },
        },

        sorting = {
          priority_weight = 2,
          comparators = {
            deprioritize_snippet,
            copilot_cmp_comparators.prioritize or function() end,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.offset,
            cmp.config.compare.sort_text,
            cmp.config.compare.order,
            cmp.config.compare.locality,
          },
        },

        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },

        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          }),
        },

        experimental = {
          ghost_text = true,
        },

        ---@diagnostic disable-next-line: missing-fields
        performance = {
          max_view_entries = 100,
        },
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
