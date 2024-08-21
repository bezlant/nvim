return {
  'napisani/nvim-github-codesearch',
  build = 'make',

  config = function ()
    require("nvim-github-codesearch").setup({
      github_auth_token = os.getenv("GIT_AUTH_TOKEN"),
      use_telescope = true
    })
  end
}
