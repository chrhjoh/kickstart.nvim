return {
  "olimorris/persisted.nvim",
  event = 'VeryLazy', -- make sure the plugin is always loaded at startup
  config = function()
    require('persisted').setup({
      use_git_branch = true,
      should_autosave = function()
        -- do not autosave if the alpha dashboard is the current filetype
        if vim.bo.filetype == "alpha" then
          return false
        end
        return true
      end,
    })
  end,

}
