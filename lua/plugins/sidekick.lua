---@type LazySpec
return {
  "folke/sidekick.nvim",
  enabled = true,
  event = "VeryLazy",
  ---@module "sidekick"
  ---@type sidekick.Config
  opts = {
    -- Disable NES (requires Copilot subscription)
    nes = {
      enabled = false,
    },

    -- CLI configuration
    cli = {
      -- Default to Claude
      default = "claude",

      -- Window layout
      win = {
        layout = "right",
        split = {
          width = 80,
        },
      },

      -- Tmux persistence - keeps Claude session alive across Neovim restarts
      mux = {
        enabled = true,
        backend = "tmux",
        create = "split", -- Creates a tmux split
        split = {
          vertical = true,
          size = 0.4, -- 40% of screen width
        },
      },

      -- File watching - auto-reload buffers when Claude edits them
      watch = true,
    },
  },

  keys = {
    -- Toggle Claude CLI
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "AI: Toggle Claude",
    },
    {
      "<leader>ac",
      function()
        require("sidekick.cli").open("claude")
      end,
      desc = "AI: Open Claude",
    },

    -- Send context to Claude
    {
      "<leader>as",
      function()
        require("sidekick.cli").send()
      end,
      desc = "AI: Send selection",
      mode = { "n", "v" },
    },
    {
      "<leader>af",
      function()
        require("sidekick.cli").send({ msg = "{file}" })
      end,
      desc = "AI: Send file",
    },
    {
      "<leader>ad",
      function()
        require("sidekick.cli").send({ msg = "{diagnostics}" })
      end,
      desc = "AI: Send diagnostics",
    },

    -- Prompts
    {
      "<leader>ap",
      function()
        require("sidekick.cli").prompt()
      end,
      desc = "AI: Prompt library",
    },

    -- Quick actions with selection
    {
      "<leader>ae",
      function()
        require("sidekick.cli").send({ msg = "Explain {this}" })
      end,
      desc = "AI: Explain",
      mode = { "n", "v" },
    },
    {
      "<leader>ax",
      function()
        require("sidekick.cli").send({ msg = "Fix {this}" })
      end,
      desc = "AI: Fix",
      mode = { "n", "v" },
    },
    {
      "<leader>ar",
      function()
        require("sidekick.cli").send({ msg = "Refactor {this}" })
      end,
      desc = "AI: Refactor",
      mode = { "n", "v" },
    },
    {
      "<leader>at",
      function()
        require("sidekick.cli").send({ msg = "Write tests for {this}" })
      end,
      desc = "AI: Tests",
      mode = { "n", "v" },
    },

    -- Session management
    {
      "<leader>aD",
      function()
        require("sidekick.cli").detach()
      end,
      desc = "AI: Detach session",
    },
    {
      "<leader>aS",
      function()
        require("sidekick.cli").select()
      end,
      desc = "AI: Select tool",
    },
  },
}
