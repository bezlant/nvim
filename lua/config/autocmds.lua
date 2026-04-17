local augroup = vim.api.nvim_create_augroup("my.config", { clear = true })

-- Return to the previous location in the file on open
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(ev.buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Disable diagnostics in node_modules
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup,
  pattern = "*/node_modules/*",
  callback = function()
    vim.diagnostic.enable(false, { bufnr = 0 })
  end,
})

-- Autoread buffer on an external change
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  group = augroup,
  command = "checktime",
})

-- Easily close useless buffers
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "sqls_output", "help", "startuptime", "qf", "lspinfo", "httpRequest" },
  command = [[ nnoremap <buffer><silent> q :close<CR> ]],
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "man" },
  command = [[ nnoremap <buffer><silent> q :quit<CR> ]],
})

-- Fix that god damn formatoptions (for some reason have to do it on every BufEnter)
-- Prevent annoying comment continuation when inserting a new line with 'O'
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Nudge iCloud sync after saving files in the Obsidian vault
vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup,
  pattern = vim.fn.expand("~") .. "/Library/Mobile Documents/iCloud~md~obsidian/**",
  callback = function(args)
    local dir = vim.fn.fnamemodify(args.file, ":h")
    vim.fn.jobstart({ "touch", args.file, dir }, { detach = true })
  end,
})

-- Auto-equalize splits when terminal is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  command = "wincmd =",
})

-- Syntax highlighting for .env files
vim.api.nvim_create_autocmd("BufRead", {
  group = augroup,
  pattern = { ".env", ".env.*", ".secrets" },
  callback = function()
    vim.bo.filetype = "dosini"
  end,
})

-- Open Oil when launched with no args
vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup,
  once = true,
  callback = function()
    if vim.fn.argc() == 0 then
      vim.schedule(function()
        vim.cmd("edit " .. vim.fn.fnameescape(vim.fn.getcwd()) .. "/")
      end)
    end
  end,
})

