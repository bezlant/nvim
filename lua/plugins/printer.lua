require('printer').setup({
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

vim.keymap.set("n", "gp", "<Plug>(printer_print)iw")
