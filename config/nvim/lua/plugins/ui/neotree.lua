
return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy=true,
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
  end,
  keys = {
    {'<leader>tg', ':Neotree git_status<CR>',  desc = '[g] [G]it Tree' },
    {'<leader>tf', ':Neotree<CR>',  desc = '[F]ilesystem Tree' },
    {'<leader>tb', ':Neotree buffers<CR>',  desc = '[B]uffer Tree' }


  }
}
