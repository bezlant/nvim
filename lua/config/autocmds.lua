-- Return to the previous location in the file on open
vim.api.nvim_create_autocmd(
  "BufReadPost",
  { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] }
)

-- Disable diagnostics in node_modules
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*/node_modules/*",
  callback = function()
    vim.diagnostic.enable(false, { bufnr = 0 })
  end,
})

-- Autoread buffer on an external change
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, { command = "checktime" })


-- Easily close useless buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sqls_output", "help", "startuptime", "qf", "lspinfo", "httpRequest" },
  command = [[ nnoremap <buffer><silent> q :close<CR> ]],
})

vim.api.nvim_create_autocmd("FileType", { pattern = { "man" }, command = [[ nnoremap <buffer><silent> q :quit<CR> ]] })

-- Fix that god damn formatoptions (for some reason have to do it on every BufEnter)
-- Prevent annoying comment continuation when inserting a new line with 'O'
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Nudge iCloud sync after saving files in the Obsidian vault
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.expand("~") .. "/Library/Mobile Documents/iCloud~md~obsidian/**",
  callback = function(args)
    local dir = vim.fn.fnamemodify(args.file, ":h")
    vim.fn.jobstart({ "touch", args.file, dir }, { detach = true })
  end,
})

-- Open Oil when launched with no args
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    if vim.fn.argc() == 0 then
      vim.schedule(function()
        vim.cmd("edit " .. vim.fn.fnameescape(vim.fn.getcwd()) .. "/")
      end)
    end
  end,
})

