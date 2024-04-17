return {
  "olimorris/persisted.nvim",
  lazy= true,
  cmd = 'Sessions',
  config = function()
    require('persisted').setup({
      use_git_branch = true,
      should_autosave = false,
    })
  end,

}
