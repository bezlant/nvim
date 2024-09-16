return {
  "rareitems/printer.nvim",
  event = "BufEnter",
  ft = {
    "lua",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
  opts = {
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
  },

  keys = {
    "n",
    "gP",
    "<Plug>(printer_print)iw",
  },
}
