if vim.loader then vim.loader.enable() end
-- ^^ enables new modern loader that byte-compiles lua

require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")

require("config.lsp.config")
require("config.lsp.setup")
