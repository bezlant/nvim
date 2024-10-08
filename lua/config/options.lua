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
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal",
  shiftwidth = 2,
  showmode = false,
  showtabline = 1,
  sidescrolloff = 6,
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
  local optInfo = vim.api.nvim_get_option_info2(opt, {}) -- do empty req. to get description
  assert(optInfo ~= nil and optInfo.name == opt)

  if optInfo.scope ~= 'global' then
    vim.notify(
      ("[Options.lua] [WARNING] %s has %s scope. Setting via dangerous vim.opt")
      :format(opt, optInfo.scope), vim.log.levels.WARN)
  end

  -- Warning! Fixing this bug may break something
  do
    vim.o[opt] = nil    --  unset local (if exists)
    vim.go[opt] = value -- force value to be global
  end
end

for key, value in pairs(globals) do
  vim.g[key] = value
end


-- How to override local option with global:
vim.opt['formatoptions'] = nil                                             -- first, we must unset local one
vim.api.nvim_set_option_value('formatoptions', 'j', { scope = 'global', }) -- next, define global
