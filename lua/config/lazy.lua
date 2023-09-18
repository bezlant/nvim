local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('config.plugins', {
  checker = { enabled = true, notify = false },
  install = { colorscheme = { 'dracula' } },
  concurrency = 5,
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        'gzip',
        'tar',
        'tarPlugin',
        'zip',
        'zipPlugin',
        'getscript',
        'getscriptPlugin',
        'vimball',
        'vimballPlugin',
        '2html_plugin',
        'logiPat',
        'rrhelper',
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'tutor',
        'tohtml',
      },
    },
  },
  debug = false,
  ui = {
    border = require('config.constants').border.border,
  }
})
