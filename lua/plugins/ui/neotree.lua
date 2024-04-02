
return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require('neo-tree').setup({
    window = {
      width = 70,
      mappings = {
        ['<space>'] = "none",    
        ["gy"] = "git_unstage_file",  
      },
    },
      event_handlers = {

          {
            event = "file_opened",
            handler = function(file_path)
              -- auto close
              -- vimc.cmd("Neotree close")
              -- OR
              require("neo-tree.command").execute({ action = "close" })
            end
          },}
    })
    vim.keymap.set('n', '<leader>tg', ':Neotree git_status<CR>', { desc = '[g] Toogle Tree [G]it status view' })
    vim.keymap.set('n', '<leader>tf', ':Neotree<CR>', { desc = '[T]oogle [F]ilesystem tree view' })
    vim.keymap.set('n', '<leader>tb', ':Neotree buffers<CR>', { desc = '[T]oogle [B]uffer tree view' })
  end,
}
