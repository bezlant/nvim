---@type LazySpec
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Oil File Browser" },
  },

  opts = {
    keymaps = {
      -- Disable defaults that conflict with tmux navigator
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      -- Keep useful oil keymaps
      ["<C-r>"] = "actions.refresh",
      ["<C-s>"] = { "actions.select", opts = { vertical = true } },
      ["<C-v>"] = { "actions.select", opts = { horizontal = true } },
      -- Yank file path to system clipboard
      ["gy"] = {
        callback = function()
          local oil = require("oil")
          local entry = oil.get_cursor_entry()
          local dir = oil.get_current_dir()
          if entry and dir then
            local path = vim.fn.fnamemodify(dir .. entry.name, ":.")
            vim.fn.setreg("+", path)
            vim.notify("Copied: " .. path)
          end
        end,
        desc = "Yank relative path to clipboard",
      },
      ["gY"] = {
        callback = function()
          local oil = require("oil")
          local entry = oil.get_cursor_entry()
          local dir = oil.get_current_dir()
          if entry and dir then
            local path = dir .. entry.name
            vim.fn.setreg("+", path)
            vim.notify("Copied: " .. path)
          end
        end,
        desc = "Yank absolute path to clipboard",
      },
    },

    view_options = {
      is_hidden_file = function(name, bufnr)
        local dir = require("oil").get_current_dir(bufnr)
        -- In fish config: show only personal files (my-* prefix), hide plugins
        if dir and dir:match("%.config/fish/") then
          if name:match("%.fish$") then
            return not (name:match("^my%-") or name == "fish_user_key_bindings.fish")
          end
        end
        return name:match("^%.")
      end,
    },
  },
}
