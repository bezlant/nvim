---@type LazySpec
return {
  "monaqa/dial.nvim",
  keys = {
    { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, desc = "Increment" },
    { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, desc = "Decrement" },
    { "<C-a>", function() require("dial.map").manipulate("increment", "visual") end, mode = "v" },
    { "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end, mode = "v" },
  },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.alias.bool,
        augend.date.alias["%Y-%m-%d"],
        augend.constant.new({ elements = { "yes", "no" } }),
        augend.constant.new({ elements = { "on", "off" } }),
        augend.constant.new({ elements = { "&&", "||" }, word = false }),
      },
    })
  end,
}
