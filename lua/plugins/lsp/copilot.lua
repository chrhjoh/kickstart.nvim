return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = true,
        auto_refresh = true,
      },
      suggestion = { enabled = false },
      panel = { enabled = false }
    })
  end,
  dependencies = {
    'AndreM222/copilot-lualine',
    {
      "zbirenbaum/copilot-cmp",
      config = function()
        require("copilot_cmp").setup()
      end,
    },


  }
}
