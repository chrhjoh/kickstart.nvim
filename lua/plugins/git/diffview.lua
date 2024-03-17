return {
  "sindrets/diffview.nvim",
  lazy = false,
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    require('diffview').setup()
    vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', {desc = "[D]iffview Open"})
    vim.keymap.set('n', '<leader>gc', ':DiffviewClose<CR>', {desc = "Diffview [C]lose"})
  end
}
