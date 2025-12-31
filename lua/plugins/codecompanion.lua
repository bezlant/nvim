---@type LazySpec
return {
  "olimorris/codecompanion.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "Davidyz/VectorCode",
      dependencies = { "nvim-lua/plenary.nvim" },
      cmd = "VectorCode",
      opts = {
        async_backend = "lsp",
      },
      cond = function()
        return vim.fn.executable("vectorcode") == 1
      end,
    },
  },
  opts = {
    strategies = {
      -- Use Claude Code (Pro subscription) for chat
      chat = {
        adapter = "claude_code",
      },
      -- Use Anthropic API for inline (faster, simpler tasks)
      inline = {
        adapter = "anthropic",
      },
    },
    adapters = {
      -- HTTP adapter for API (requires ANTHROPIC_API_KEY)
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          schema = {
            model = {
              default = "claude-sonnet-4-20250514",
            },
          },
        })
      end,
      -- Claude Code adapter (uses Pro subscription via claude CLI)
      -- Run `claude login` first to authenticate
      claude_code = function()
        return require("codecompanion.adapters").extend("claude_code", {
          -- Uses existing Claude CLI auth from `claude login`
        })
      end,
    },
    display = {
      chat = {
        window = {
          layout = "vertical",
          width = 0.4,
        },
      },
    },
    -- VectorCode extension for codebase-aware context
    extensions = {
      vectorcode = {
        opts = {
          add_tool = true,
          add_slash_command = true,
        },
        ---@type VectorCode.CodeCompanion.ToolOpts
        tool_opts = {
          query = {
            default_num = { chunk = 50, document = 10 },
          },
        },
      },
    },
  },
  keys = {
    -- Toggle chat (matches sidekick <leader>aa)
    {
      "<leader>aa",
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "AI: Toggle Chat",
      mode = { "n", "v" },
    },
    -- Open new chat (matches sidekick <leader>ac)
    {
      "<leader>ac",
      "<cmd>CodeCompanionChat<cr>",
      desc = "AI: Open Chat",
    },
    -- Send selection/context (matches sidekick <leader>as)
    {
      "<leader>as",
      "<cmd>CodeCompanionChat Add<cr>",
      desc = "AI: Send selection",
      mode = { "n", "v" },
    },
    -- Send current file (matches sidekick <leader>af)
    {
      "<leader>af",
      function()
        -- Select entire buffer and add to chat
        vim.cmd("normal! ggVG")
        vim.cmd("CodeCompanionChat Add")
        vim.cmd("normal! <Esc>")
      end,
      desc = "AI: Send file",
    },
    -- Send diagnostics (matches sidekick <leader>ad)
    {
      "<leader>ad",
      function()
        local diags = vim.diagnostic.get(0)
        if #diags > 0 then
          local lines = { "Diagnostics for " .. vim.fn.expand("%:.") .. ":" }
          for _, d in ipairs(diags) do
            table.insert(
              lines,
              string.format("Line %d: [%s] %s", d.lnum + 1, vim.diagnostic.severity[d.severity], d.message)
            )
          end
          vim.cmd("CodeCompanionChat")
          vim.defer_fn(function()
            vim.api.nvim_put(lines, "l", true, true)
          end, 100)
        else
          vim.notify("No diagnostics", vim.log.levels.INFO)
        end
      end,
      desc = "AI: Send diagnostics",
    },
    -- Prompts/Actions (matches sidekick <leader>ap)
    {
      "<leader>ap",
      "<cmd>CodeCompanionActions<cr>",
      desc = "AI: Prompt library",
      mode = { "n", "v" },
    },
    -- Explain (matches sidekick <leader>ae)
    {
      "<leader>ae",
      "<cmd>CodeCompanion /explain<cr>",
      desc = "AI: Explain",
      mode = { "n", "v" },
    },
    -- Fix (matches sidekick <leader>ax)
    {
      "<leader>ax",
      "<cmd>CodeCompanion /fix<cr>",
      desc = "AI: Fix",
      mode = { "n", "v" },
    },
    -- Refactor (matches sidekick <leader>ar)
    {
      "<leader>ar",
      "<cmd>CodeCompanion /refactor<cr>",
      desc = "AI: Refactor",
      mode = { "n", "v" },
    },
    -- Tests (matches sidekick <leader>at)
    {
      "<leader>at",
      "<cmd>CodeCompanion /tests<cr>",
      desc = "AI: Tests",
      mode = { "n", "v" },
    },
  },
}
