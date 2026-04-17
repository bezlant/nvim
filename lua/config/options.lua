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
  tabstop = 2,
  smartindent = true,

  -- Scrolling (centered cursor)
  scrolloff = 999,
  sidescrolloff = 999,

  -- Splits
  splitbelow = true,
  splitright = true,
  splitkeep = "screen",

  -- Files
  swapfile = false,
  undofile = true,
  writebackup = false,
  fileencoding = "utf-8",

  -- Wrapping
  wrap = true,
  linebreak = true,
  breakindent = true,
  textwidth = 80,

  -- Misc
  confirm = true,
  exrc = true,
  grepprg = "rg --ignore-case --vimgrep",
  grepformat = "%f:%l:%c:%m,%f:%l:%m",
  mousescroll = "ver:3,hor:0",
  pumborder = "rounded",
  showbreak = "↳ ",
  completeopt = "menu,menuone,noselect",
  conceallevel = 0,
  timeoutlen = 350,
  updatetime = 50,
  virtualedit = "block",
  wildignore = "*node_modules/**",
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal",
}

local globals = {
  mapleader = " ",
  loaded_node_provider = 0,
  loaded_python3_provider = 0,
  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,
}

vim.opt.shortmess:append({ c = true, I = true, W = true, a = true, F = true })
vim.opt.suffixesadd:append({ ".js", ".ts", ".tsx", ".md" })
vim.opt.diffopt:append("vertical,context:99")
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
