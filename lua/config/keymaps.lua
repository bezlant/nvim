---@type vim.keymap.set.Opts
local silent = { silent = true }

---@alias KeymapMode "n"|"i"|"v"|"x"|"c"|"o"|"t"|"s"|string[]

---@param mode KeymapMode
---@param lhs string
---@param rhs string|function
local map = function(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, silent)
end

-- I mess this up too often
map("c", "Q", "q")

-- Disable arrow keys
map({ "n", "i", "v" }, "<Up>", "<Nop>")
map({ "n", "i", "v" }, "<S-Up>", "<Nop>")
map({ "n", "i", "v" }, "<Down>", "<Nop>")
map({ "n", "i", "v" }, "<S-Down>", "<Nop>")
map({ "n", "i", "v" }, "<Left>", "<Nop>")
map({ "n", "i", "v" }, "<S-Left>", "<Nop>")
map({ "n", "i", "v" }, "<Right>", "<Nop>")
map({ "n", "i", "v" }, "<S-Right>", "<Nop>")

-- C-p & C-n to work as arrow keys
map({ "n", "i", "v" }, "<C-p>", "<Up>")
map({ "n", "i", "v" }, "<C-n> ", "<Down>")

-- Easier pane navigation
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")

-- Quick escape
map("i", "jk", "<ESC>")

-- Moving text
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")

-- Map global register to '|'
map({ "n", "v" }, '"|', '"+')

-- Buffers
map("n", "H", "<cmd>bprevious<cr>zz")
map("n", "L", "<cmd>bnext<cr>zz")
map("n", "<leader>bd", "<cmd>bdelete! %<CR>")
map("n", "<leader>ba", "<cmd>bufdo :bdelete<CR>")
map("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>")

-- Custom
-- Save on leader + w
map("n", "<leader>w", "<cmd>w<CR>")

-- Highligts off
map("n", "<esc><esc>", "<cmd>noh<CR>")

-- Jump to the first non blanck character
map("n", "0", "^")

-- Scrolling improved
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Easy yank to the system clipboard
map({ "n", "v" }, "<leader>Y", '"+Y')
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>yp", ":let @+=@%<cr>")

-- Easy paste from the system clipboard
map({ "n", "v" }, "<leader>p", '"+p')
map({ "n", "v" }, "<leader>P", '"+P')

-- You need this
map("n", "<leader>x", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Search improved
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Get to the current folder
map("n", "<leader>cd", "<cmd>cd %:p:h<cr><cmd>:pwd<cr>")

-- Plugins config
-- Snacks.picker
map("n", "<C-f>", function()
  Snacks.picker.smart()
end)

map("n", "<leader>f", function()
  Snacks.picker.files()
end)
map("n", "<leader>ff", function()
  Snacks.picker.files({ hidden = true, ignored = true })
end)
map("n", "<leader>fg", function()
  Snacks.picker.grep()
end)

map("n", "<leader>ft", "<cmd>TodoQuickFix<cr>")

map("n", "<leader>fr", function()
  Snacks.picker.resume()
end)

map("n", "<leader>fs", function()
  Snacks.picker.git_status()
end)
map("n", "<leader>fc", function()
  Snacks.picker.git_log()
end)

map("n", "<leader>fy", function()
  Snacks.picker.registers()
end)

map("n", "<leader>fb", function()
  Snacks.picker.buffers()
end)
map("n", "<leader>fh", function()
  Snacks.picker.help()
end)
map("n", "<leader>fk", function()
  Snacks.picker.keymaps()
end)
map("n", "<leader>fl", function()
  Snacks.picker.lazy()
end)

-- Vimgrep, grep, quickfix list, jump list cycle
map("n", "<leader>t", "<cmd>Trouble<CR>")
map("n", "<leader>tw", function()
  Snacks.picker.diagnostics()
end)
map("n", "<leader>tn", '<cmd>lua require("trouble").next({skip_groups = true, jump = true})<CR>')
map("n", "<leader>tp", '<cmd>lua require("trouble").previous({skip_groups = true, jump = true})<CR>')
map("n", "<leader>tq", "<cmd>Trouble quickfix<CR>")

-- Yanky
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

map("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
map("n", "<c-n>", "<Plug>(YankyNextEntry)")

-- Lazy
map("n", "<leader>L", "<cmd>:Lazy<cr>")

-- Switch & Speeddating
-- Manually invoke speeddating in case switch.vim didn't work
map("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>")
map("n", "<C-x>", ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>")

map("n", "<leader>z", "<cmd>ZenMode<cr>")

map("n", "-", "<CMD>Oil<CR>")

map("n", "<leader>v", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gr", function()
  Snacks.picker.lsp_references()
end)
map("n", "gi", function()
  Snacks.picker.lsp_implementations()
end)
map("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>")
map("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>")
map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)

-- Duplicate a line and comment out the first line
map("n", "yc", "yy<cmd>normal gcc<CR>p")
