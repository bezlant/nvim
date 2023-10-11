local silent = { silent = true }
local map = function(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, silent)
end

-- I mess this up too often
map('c', 'Q', 'q')

-- Disable arrow keys
map({ 'n', 'i', 'v' }, '<Up>', '<Nop>')
map({ 'n', 'i', 'v' }, '<S-Up>', '<Nop>')
map({ 'n', 'i', 'v' }, '<Down>', '<Nop>')
map({ 'n', 'i', 'v' }, '<S-Down>', '<Nop>')
map({ 'n', 'i', 'v' }, '<Left>', '<Nop>')
map({ 'n', 'i', 'v' }, '<S-Left>', '<Nop>')
map({ 'n', 'i', 'v' }, '<Right>', '<Nop>')
map({ 'n', 'i', 'v' }, '<S-Right>', '<Nop>')

-- C-p & C-n to work as arrow keys
map({ 'n', 'i', 'v' }, '<C-p>', '<Up>')
map({ 'n', 'i', 'v' }, '<C-n> ', '<Down>')

-- Easier pane navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Quick escape
map('i', 'jk', '<ESC>')

-- Moving text
map('x', 'J', ":move '>+1<CR>gv-gv")
map('x', 'K', ":move '<-2<CR>gv-gv")

-- Map global register to '|'
map({ 'n', 'v' }, '"|', '"+')

-- Buffers
map('n', 'H', '<cmd>bprevious<cr>zz')
map('n', 'L', '<cmd>bnext<cr>zz')
map('n', '<leader>bd', '<cmd>bdelete! %<CR>')
map('n', '<leader>ba', '<cmd>bufdo :bdelete<CR>')
map('n', '<leader>bo', '<cmd>%bd|e#|bd#<CR>')

-- Custom
-- Save on leader + w
map('n', '<leader>w', '<cmd>w<CR>')

-- Highligts off
map('n', '<esc><esc>', '<cmd>noh<CR>')

-- Jump to the first non blanck character
map('n', '0', '^')

-- Scrolling improved (Neoscroll fixes this)
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Easy yank to the system clipboard
map({ 'n', 'v' }, '<leader>Y', '"+Y')
map({ 'n', 'v' }, '<leader>y', '"+y')
map({ 'n', 'v' }, '<leader>yp', ':let @+=@%<cr>')

-- Easy paste from the system clipboard
map({ 'n', 'v' }, '<leader>p', '"+p')
map({ 'n', 'v' }, '<leader>P', '"+P')

-- You need this
map('n', '<leader>x', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Search improved
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Get to the current folder
map('n', '<leader>cd', '<cmd>cd %:p:h<cr><cmd>:pwd<cr>')

-- Plugins config
-- Telescope
map(
  'n',
  '<C-f>',
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ previewer = false, layout_config = { height = 0.2 }}))<cr>"
)

map(
  'n',
  '<leader>f',
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ previewer = false, layout_config = { height = 0.2 }}))<cr>"
)

map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>')
map("n", "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>fi', '<cmd>Telescope media_files<cr>')
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
map('n', '<leader>fm', '<cmd>Telescope man_pages<cr>')
map('n', '<leader>fo', '<cmd>Telescope vim_options<cr>')
map('n', '<leader>fr', '<cmd>Telescope resume<cr>')
map('n', '<leader>fs', '<cmd>Telescope luasnip<cr>')
map('n', '<leader>ft', '<cmd>TodoTelescope<cr>')
map('n', '<leader>fy', '<cmd>Telescope yank_history<cr>')

-- NvimTree
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')

-- Vimgrep, grep, quickfix list, jump list cycle
map('n', '<leader>t', '<cmd>TroubleToggle<CR>')
map('n', '<leader>tw', '<cmd>Trouble workspace_diagnostics<CR>')
map('n', '<leader>td', '<cmd>Trouble document_diagnostics<CR>')
map('n', '<leader>tn', '<cmd>lua require("trouble").next({skip_groups = true, jump = true})<CR>')
map('n', '<leader>tp', '<cmd>lua require("trouble").previous({skip_groups = true, jump = true})<CR>')
map('n', '<leader>tq', '<cmd>Trouble quickfix<CR>')

-- Yanky
map('x', 'y', '<Plug>(YankyYank)')
map('n', 'y', '<Plug>(YankyYank)')
map('n', 'y', '<Plug>(YankyYank)')
map('n', 'p', '<Plug>(YankyPutAfter)')
map('n', 'p', '<Plug>(YankyPutAfter)')
map('n', 'P', '<Plug>(YankyPutBefore)')
map('x', 'p', '<Plug>(YankyPutAfter)')
map('x', 'P', '<Plug>(YankyPutBefore)')
map('n', 'gp', '<Plug>(YankyGPutAfter)')
map('n', 'gP', '<Plug>(YankyGPutBefore)')
map('x', 'gp', '<Plug>(YankyGPutAfter)')
map('x', 'gP', '<Plug>(YankyGPutBefore)')
map('n', '<c-p>', '<Plug>(YankyCycleForward)')
map('n', '<c-n>', '<Plug>(YankyCycleBackward)')

-- Lazy
map('n', '<leader>L', '<cmd>:Lazy<cr>')

-- Switch & Speeddating
-- Manually invoke speeddating in case switch.vim didn't work
map("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>")
map("n", "<C-x>", ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>")


map("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)

map("n", "<leader>z", '<cmd>ZenMode<cr>')
