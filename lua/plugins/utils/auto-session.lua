return {
  'rmagatti/auto-session',
  event = 'VeryLazy',
  config = function()
    require("auto-session").setup {
      log_level = "error",
      auto_session_enable_last_session = true,
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true

    }
  end
}
