---@type LazySpec
return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",

  config = function()
    require("codecompanion").setup({
      ignore_warnings = true,
      adapters = {
        http = {
          openai = function()
            return require("codecompanion.adapters").extend("openai", {
              env = {
                api_key = string.format("cmd:cat %s", os.getenv("HOME") .. "/.config/openai/api.key"),
              },
              schema = {
                model = { default = "gpt-4o-mini" },
              },
            })
          end,
        },
      },

      strategies = {
        chat = { adapter = "openai" },
        inline = { adapter = "openai" },
        agent = { adapter = "openai" },
      },

      display = {
        chat = { render_headers = false },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>ac", ":CodeCompanionChat<cr>", { desc = "AI: Start new chat" })
    vim.keymap.set({ "n", "v" }, "<leader>at", ":CodeCompanionChat Toggle<cr>", { desc = "AI: Toggle chat" })
  end,
}
