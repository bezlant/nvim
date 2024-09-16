return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme dracula]])
      require("config.colorscheme")
    end,
  },

  { "nvim-lua/plenary.nvim" },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    config = function()
      require("plugins.treesitter")
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require("plugins.telescope")
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    servers = nil,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>M", "<cmd>Mason<cr>", desc = "mason ui" },
    },
  },

  { "onsails/lspkind-nvim" },

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("plugins.trouble")
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    config = function()
      require("plugins.nvim-cmp")
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "saadparwaiz1/cmp_luasnip",
      { "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
      {
        "David-Kunz/cmp-npm",
        opts = {
          ignore = {},
          only_semantic_versions = true,
        },
      },
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
  },

  {
    "pmizio/typescript-tools.nvim",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "typescript", "typescriptreact" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("plugins.typescript-tools")
    end,
  },

  {
    "axelvc/template-string.nvim",
    event = "InsertEnter",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = true,
  },

  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    opts = {
      watch = true,
      auto_start_watch_mode = true,
    },
  },

  {
    "Wansmer/treesj",
    lazy = true,
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    keys = {
      { "gJ", "<cmd>TSJToggle<CR>", desc = "toggle formatting" },
    },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
        max_join_length = 240,
      })
    end,
  },

  {
    "numToStr/Comment.nvim",
    lazy = false,
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("plugins.comment")
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    config = function()
      if vim.fn.has("nvim") and vim.fn.executable("nvr") then
        vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
      end
    end,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-speeddating", lazy = false },
  { "AndrewRadev/switch.vim", lazy = false },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    event = "BufEnter",
    config = function()
      require("plugins.todo-comments")
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          highlight = { backdrop = false },
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.bufremove",
    },
    config = function()
      require("plugins.bufferline")
    end,
    keys = {
      { "<Leader>1", "<cmd>BufferLineGoToBuffer 1<CR>" },
      { "<Leader>2", "<cmd>BufferLineGoToBuffer 2<CR>" },
      { "<Leader>3", "<cmd>BufferLineGoToBuffer 3<CR>" },
      { "<Leader>4", "<cmd>BufferLineGoToBuffer 4<CR>" },
      { "<Leader>5", "<cmd>BufferLineGoToBuffer 5<CR>" },
      { "<Leader>6", "<cmd>BufferLineGoToBuffer 6<CR>" },
      { "<Leader>7", "<cmd>BufferLineGoToBuffer 7<CR>" },
      { "<Leader>8", "<cmd>BufferLineGoToBuffer 8<CR>" },
      { "<Leader>9", "<cmd>BufferLineGoToBuffer 9<CR>" },
      { "<M-1>", "<cmd>BufferLineGoToBuffer 1<CR>" },
      { "<M-2>", "<cmd>BufferLineGoToBuffer 2<CR>" },
      { "<M-3>", "<cmd>BufferLineGoToBuffer 3<CR>" },
      { "<M-4>", "<cmd>BufferLineGoToBuffer 4<CR>" },
      { "<M-5>", "<cmd>BufferLineGoToBuffer 5<CR>" },
      { "<M-6>", "<cmd>BufferLineGoToBuffer 6<CR>" },
      { "<M-7>", "<cmd>BufferLineGoToBuffer 7<CR>" },
      { "<M-8>", "<cmd>BufferLineGoToBuffer 8<CR>" },
      { "<M-9>", "<cmd>BufferLineGoToBuffer 9<CR>" },
      { "<Leader>bb", "<cmd>BufferLineMovePrev<CR>" },
      { "<Leader>bl", "<cmd>BufferLineCloseLeft<CR>" },
      { "<Leader>bn", "<cmd>BufferLineMoveNext<CR>" },
      { "<Leader>bp", "<cmd>BufferLinePick<CR>" },
      { "<Leader>bP", "<cmd>BufferLineTogglePin<CR>" },
      { "<Leader>bsd", "<cmd>BufferLineSortByDirectory<CR>" },
      { "<Leader>bse", "<cmd>BufferLineSortByExtension<CR>" },
      { "<Leader>bsr", "<cmd>BufferLineSortByRelativeDirectory<CR>" },
    },
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        timeout = 3000,
        fps = 60,
        stages = "static",
        icons = {
          ERROR = " ",
          WARN = " ",
          INFO = " ",
          DEBUG = " ",
          TRACE = "✎ ",
        },
      })
    end,
    init = function()
      local banned_messages = {
        "No information available",
        "LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+.",
        "LSP[tsserver] Inlay Hints request failed. File not opened in the editor.",
      }
      vim.notify = function(msg, ...)
        for _, banned in ipairs(banned_messages) do
          if msg == banned then
            return
          end
        end
        return require("notify")(msg, ...)
      end
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },

  {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
      vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
    end,
  },

  {
    "rareitems/printer.nvim",
    event = "BufEnter",
    ft = {
      "lua",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = function()
      require("plugins.printer")
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugins.indent")
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.noice-ui")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("plugins.dressing")
    end,
  },

  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {},
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("plugins.autopairs")
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    event = "InsertEnter",
    config = function()
      require("plugins.copilot")
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.git.signs")
    end,
  },

  {
    "gbprod/yanky.nvim",
    event = "BufEnter",
    config = function()
      require("plugins.yanky")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
    config = function()
      require("plugins.lualine")
    end,
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "cpea2506/relative-toggle.nvim",
    opts = {},
  },

  {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    config = function()
      require("plugins.zen")
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
  },

  {
    "b0o/schemastore.nvim",
  },

  {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "napisani/nvim-github-codesearch",
    build = "make",
    config = function()
      require("nvim-github-codesearch").setup({
        github_auth_token = os.getenv("GIT_AUTH_TOKEN"),
        use_telescope = true,
      })
    end,
  },

  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.aerial")
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  { -- optional completion source for require statements and module annotations
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
      },
    },
  },
}
