local present, conflict = pcall(require, "git-conflict")
if not present then
  return
end

conflict.setup({
  default_mappings = true,    -- disable buffer local mapping created by this plugin
  default_commands = true,    -- disable commands created by this plugin
  disable_diagnostics = true, -- this will disable the diagnostics in a buffer whilst it is conflicted
  list_opener = 'Trouble',    -- command or function to open the conflicts list
  highlights = {              -- they must have background color, otherwise the default color will be used
    incoming = "TelescopeResultsDiffChange",
    current = "TelescopeResultsDiffAdd",
  },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "GitConflictDetected",
  callback = function()
    vim.notify("Conflict detected in " .. vim.fn.expand("<afile>"))
  end,
})
