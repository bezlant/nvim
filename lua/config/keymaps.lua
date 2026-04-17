local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

map("n", "H", "<cmd>bprevious<cr>zz", { desc = "Previous buffer" })
map("n", "L", "<cmd>bnext<cr>zz", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete! %<CR>", { desc = "Delete buffer" })
map("n", "<leader>ba", "<cmd>bufdo :bdelete<CR>", { desc = "Delete all buffers" })
map("n", "<leader>bo", function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.bo[buf].buflisted then
      pcall(vim.api.nvim_buf_delete, buf, {})
    end
  end
end, { desc = "Delete other buffers" })

map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

map("n", "<esc><esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })

map("n", "0", "^", { desc = "First non-blank" })

map("n", "U", "<C-r>", { desc = "Redo" })
map("n", "Q", "@@", { desc = "Repeat last macro" })
map("n", "X", "<cmd>keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { desc = "Split line" })

map("n", "<C-d>", "<C-d>", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>", { desc = "Scroll up" })

-- Move through wrapped lines naturally, store large jumps in jumplist
map({ "n", "x" }, "j", [[(v:count > 1 ? "m'" . v:count : "g") . "j"]], { expr = true, desc = "Move down" })
map({ "n", "x" }, "k", [[(v:count > 1 ? "m'" . v:count : "g") . "k"]], { expr = true, desc = "Move up" })

-- Stay in visual mode after indenting
map("x", "<", "<gv", { desc = "Indent left" })
map("x", ">", ">gv", { desc = "Indent right" })

-- Apply repeat and macros over visual selections
map("x", ".", ":normal .<cr>", { desc = "Repeat in visual" })
map("x", "@", [[:<c-u>echo "@".getcmdline() | execute ":'<,'>normal @" . nr2char(getchar())<cr>]], { desc = "Macro in visual" })

-- Command mode home
map("c", "<C-a>", "<Home>", { silent = false, desc = "Go to start of line" })

map(
  "n",
  "<leader>x",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = "Search and replace word under cursor" }
)

map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Previous search result" })

map("n", "<leader>ft", "<cmd>TodoQuickFix<cr>", { desc = "Find TODOs" })

map("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy plugin manager" })

map("n", "]g", function()
  vim.diagnostic.jump({ count = 1, float = { border = "rounded", max_width = 100 } })
end, { desc = "Next diagnostic" })
map("n", "[g", function()
  vim.diagnostic.jump({ count = -1, float = { border = "rounded", max_width = 100 } })
end, { desc = "Previous diagnostic" })

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
