return {
  "zbirenbaum/copilot.lua",
  enabled = false,
  event = "InsertEnter",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v20.6.1/bin/node",
  },
}
