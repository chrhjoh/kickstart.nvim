vim.api.nvim_exec([[
    autocmd VimEnter * :Neotree
]], false)

require("neo-tree").setup({
        event_handlers = {

          {
            event = "file_opened",
            handler = function(file_path)
              -- auto close
              -- vimc.cmd("Neotree close")
              -- OR
              require("neo-tree.command").execute({ action = "close", source = "filesystem", })
              require("neo-tree.command").execute({ action = "close", source = "buffers", })
            end
          },

        }
      })
