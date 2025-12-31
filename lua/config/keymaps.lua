local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Pane navigation (tmux)
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")

-- Quick escape
map("i", "jk", "<ESC>")

-- Buffers
map("n", "H", "<cmd>bprevious<cr>zz")
map("n", "L", "<cmd>bnext<cr>zz")
map("n", "<leader>bd", "<cmd>bdelete! %<CR>")
map("n", "<leader>ba", "<cmd>bufdo :bdelete<CR>")
map("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>")

-- Duplicate line and comment original
map("n", "yc", "yy<cmd>normal gcc<CR>p")

-- Save
map("n", "<leader>w", "<cmd>w<CR>")

-- Highlights off
map("n", "<esc><esc>", "<cmd>noh<CR>")

-- Jump to first non-blank character
map("n", "0", "^")

-- Scrolling (centered)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Clipboard
map({ "n", "v" }, "<leader>Y", '"+Y')
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>yp", ":let @+=@%<cr>")
map({ "n", "v" }, "<leader>p", '"+p')
map({ "n", "v" }, "<leader>P", '"+P')

-- Search and replace word under cursor
map("n", "<leader>x", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Search (centered)
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Todo-comments
map("n", "<leader>ft", "<cmd>TodoQuickFix<cr>")

-- Lazy
map("n", "<leader>L", "<cmd>:Lazy<cr>")

-- Diagnostics (always available)
map("n", "]g", function()
  vim.diagnostic.jump({ count = 1, float = { border = "rounded", max_width = 100 } })
end)
map("n", "[g", function()
  vim.diagnostic.jump({ count = -1, float = { border = "rounded", max_width = 100 } })
end)

-- LSP keymaps (capability-aware via Snacks.keymap)
Snacks.keymap.set("n", "gd", vim.lsp.buf.definition, {
  desc = "Go to Definition",
  lsp = { method = "textDocument/definition" },
})

Snacks.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {
  desc = "Rename",
  lsp = { method = "textDocument/rename" },
})

Snacks.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {
  desc = "Code Action",
  lsp = { method = "textDocument/codeAction" },
})

Snacks.keymap.set("n", "K", vim.lsp.buf.hover, {
  desc = "Hover",
  lsp = { method = "textDocument/hover" },
})

Snacks.keymap.set("n", "gr", function()
  Snacks.picker.lsp_references()
end, {
  desc = "References",
  lsp = { method = "textDocument/references" },
})

Snacks.keymap.set("n", "gi", function()
  Snacks.picker.lsp_implementations()
end, {
  desc = "Implementations",
  lsp = { method = "textDocument/implementation" },
})
