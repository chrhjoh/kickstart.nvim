vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
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
      require("neo-tree.command").execute({ action = "focus", source = "filesystem", })
    end
  },

}
    })
  end,
}
