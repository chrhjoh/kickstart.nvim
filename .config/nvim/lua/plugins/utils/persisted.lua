return {
  "olimorris/persisted.nvim",
  lazy = true,
  config = function()
    require('persisted').setup({
      use_git_branch = true,
      should_autosave = false,
      autoload = false
    })
  end,

}
