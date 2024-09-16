return {
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
}
