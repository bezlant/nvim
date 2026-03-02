return {
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { "vue" },
  root_markers = { "package.json", "vue.config.js", ".git" },

  init_options = {
    typescript = {
      tsdk = "",
    },
    vue = {
      hybridMode = true,
    },
  },

  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
