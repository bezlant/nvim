-- Return to the previous location in the file on open
vim.api.nvim_create_autocmd(
  'BufReadPost',
  { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] }
)

-- Disable diagnostics in node_modules (0 is current buffer only)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })

-- Autoread buffer on an external change
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, { command = 'checktime' })

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell"
})

-- Show `` in specific files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.txt", "*.md", "*.json" },
  command = "setlocal conceallevel=0"
})

-- Easily close useless buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sqls_output', 'help', 'startuptime', 'qf', 'lspinfo', 'httpRequest' },
  command = [[ nnoremap <buffer><silent> q :close<CR> ]],
})

vim.api.nvim_create_autocmd('FileType', { pattern = { 'man' }, command = [[ nnoremap <buffer><silent> q :quit<CR> ]] })

-- Fix that god damn formatoptions (for some reason have to do it on every BufEnter)
-- Prevent annoying comment continuation when inserting a new line with 'O'
vim.api.nvim_create_autocmd("BufEnter",
  { callback = function() vim.opt.formatoptions:remove { "c", "r", "o" } end, })
