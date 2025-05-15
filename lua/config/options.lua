local options = {
  autoindent = true,
  backspace = "indent,eol,start",
  backup = false,
  cmdheight = 0,
  completeopt = "menu,menuone,noselect",
  conceallevel = 2,
  cursorline = true,
  emoji = false,
  encoding = "utf-8",
  errorbells = false,
  expandtab = true,
  fileencoding = "utf-8",
  foldcolumn = "0",
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  foldnestmax = 0,
  hlsearch = true,
  ignorecase = true,
  inccommand = "split",
  incsearch = true,
  infercase = true,
  linebreak = true,
  mouse = "a",
  number = true,
  numberwidth = 2,
  pumheight = 10,
  relativenumber = true,
  scrolloff = 999,
  sidescrolloff = 999,
  sidescroll = 999,
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal",
  shiftwidth = 2,
  showmode = false,
  showtabline = 1,
  signcolumn = "yes",
  smartcase = true,
  smartindent = true,
  smarttab = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 4,
  termguicolors = true,
  timeoutlen = 350,
  undofile = true,
  updatetime = 50,
  virtualedit = "block",
  wildignore = "*node_modules/**",
  wrap = false,
  writebackup = false,
  winborder = "rounded",
}

local globals = {
  tmux_navigator_no_mappings = 1,
  mapleader = " ",
  speeddating_no_mappings = 1,
  skip_ts_context_commentstring_module = true,
  lazygit_floating_window_use_plenary = 1,
}

vim.opt.shortmess:append("c")
vim.opt.fillchars:append("stl: ")
vim.opt.fillchars:append("eob: ")
vim.opt.fillchars:append("fold: ")
vim.opt.fillchars:append("foldopen: ")
vim.opt.fillchars:append("foldsep: ")
vim.opt.fillchars:append("foldclose:")

for opt, value in pairs(options) do
  vim.o[opt] = value
end

for key, value in pairs(globals) do
  vim.g[key] = value
end
