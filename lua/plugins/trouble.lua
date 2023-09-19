local icons = require('config.constants').icons

require("trouble").setup {
  signs = {
    error       = icons.errorOutline,
    warning     = icons.warningTriangleNoBg,
    hint        = icons.lightbulbOutline,
    information = icons.infoOutline,
  },
};
