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

-- Easier pane navigation
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")

-- Quick escape
map("i", "jk", "<ESC>")

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

-- Todo-comments (standalone plugin)
map("n", "<leader>ft", "<cmd>TodoQuickFix<cr>")

-- Lazy
map("n", "<leader>L", "<cmd>:Lazy<cr>")

-- LSP (core vim.lsp, not plugin-specific)
map("n", "<leader>v", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
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
