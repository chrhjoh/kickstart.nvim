return {
  "olimorris/persisted.nvim",
  lazy= false,
  config = function()
    require('persisted').setup({
      use_git_branch = true,
      should_autosave = false,
      autoload = true
    })
  end,

}
