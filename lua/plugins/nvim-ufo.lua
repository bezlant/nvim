return {
  "kevinhwang91/nvim-ufo",
  event = "VeryLazy",
  dependencies = "kevinhwang91/promise-async",
  init = function()
    vim.keymap.set("n", "zR", function()
      require("ufo").openAllFolds()
    end)

    vim.keymap.set("n", "zM", function()
      require("ufo").closeAllFolds()
    end)

    vim.keymap.set("n", "zr", function()
      require("ufo").openFoldsExceptKinds()
    end)

    vim.keymap.set("n", "zm", function()
      require("ufo").closeFoldsWith()
    end)
  end,
}
