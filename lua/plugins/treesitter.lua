require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "tsx",
    "typescript",
    "javascript",
    "html",
    "css",
    "vue",
    "astro",
    "svelte",
    "gitcommit",
    "graphql",
    "json",
    "json5",
    "lua",
    "markdown",
    "prisma",
    "vim",
    "regex",
    "markdown_inline",
    "bash"
  },

  sync_install = true,

  highlight = {
    enable = true,
  },

  indent = {
    enable = true
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
