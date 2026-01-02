---@type table<string, boolean|number|string>
local options = {
  -- UI
  cmdheight = 0,
  cursorline = true,
  number = true,
  numberwidth = 2,
  relativenumber = true,
  showmode = false,
  showtabline = 1,
  signcolumn = "yes",
  pumheight = 10,
  winborder = "rounded",

  -- Folding (see plugins/folding.lua for method/expr/text)
  foldcolumn = "0",
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,

  -- Search
  ignorecase = true,
  smartcase = true,
  inccommand = "split",
  infercase = true,

  -- Indentation
  expandtab = true,
  shiftwidth = 2,
  tabstop = 4,
  smartindent = true,

  -- Scrolling (centered cursor)
  scrolloff = 999,
  sidescrolloff = 999,

  -- Splits
  splitbelow = true,
  splitright = true,

  -- Files
  swapfile = false,
  undofile = true,
  writebackup = false,
  fileencoding = "utf-8",

  -- Wrapping
  wrap = true,
  linebreak = true,
  textwidth = 80,

  -- Misc
  completeopt = "menu,menuone,noselect",
  conceallevel = 2,
  timeoutlen = 350,
  updatetime = 50,
  virtualedit = "block",
  wildignore = "*node_modules/**",
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal",
}

local globals = {
  mapleader = " ",
}

vim.opt.shortmess:append("c")
vim.opt.fillchars:append({
  stl = " ", -- inactive statusline
  eob = " ", -- hide ~ at end of buffer
  fold = " ", -- cleaner fold text
})

for opt, value in pairs(options) do
  vim.o[opt] = value
end

for key, value in pairs(globals) do
  vim.g[key] = value
end
