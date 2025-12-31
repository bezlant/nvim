---@type LazySpec
return {
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
  opts = {
    attach_to_untracked = true,

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation (]c/[c for changes - works in both diff and normal mode)
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.next_hunk()
        end
      end, { desc = "Next change" })

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.prev_hunk()
        end
      end, { desc = "Prev change" })

      -- Actions
      map("n", "<leader>ghs", gs.stage_hunk, { desc = "Stage hunk" })
      map("n", "<leader>ghr", gs.reset_hunk, { desc = "Reset hunk" })
      map("v", "<leader>ghs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Stage hunk" })
      map("v", "<leader>ghr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Reset hunk" })
      map("n", "<leader>ghb", gs.toggle_current_line_blame, { desc = "Toggle blame" })
    end,
  },
}
