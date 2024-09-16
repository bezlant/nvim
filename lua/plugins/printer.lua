require("printer").setup({
  keymap = "gP",
  behavior = "insert_below",
  formatters = {
    lua = function(inside, variable)
      return string.format('print("%s: " .. %s)', inside, variable)
    end,
    typescript = function(inside, variable)
      return string.format("console.log('%s: ', %s)", inside, variable)
    end,
    typescriptreact = function(inside, variable)
      return string.format("console.log('%s: ', %s)", inside, variable)
    end,
    javascriptreact = function(inside, variable)
      return string.format("console.log('%s: ', %s)", inside, variable)
    end,
    javascript = function(inside, variable)
      return string.format("console.log('%s: ', %s)", inside, variable)
    end,
  },
})

vim.keymap.set("n", "gp", "<Plug>(printer_print)iw")
