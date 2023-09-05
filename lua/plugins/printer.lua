require('printer').setup({
  keymap = "gp",
  behavior = "insert_below",
  formatters = {
    lua = function(inside, variable)
      return string.format('print("%s: " .. %s)', inside, variable)
    end,
    typescript = function(inside, variable)
      return string.format("console.log('%s: ', %s)", inside, variable)
    end,
  },
})

vim.keymap.set("n", "gP", "<Plug>(printer_print)iw")
