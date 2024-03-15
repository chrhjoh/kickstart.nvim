return {
  'akinsho/bufferline.nvim', 
  version = "*", 
  dependencies = 'nvim-tree/nvim-web-devicons',
  after="catppuccin",
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup {
     highlights = require("catppuccin.groups.integrations.bufferline").get {
        styles = { "italic", "bold" },
        custom = {
          mocha = {
            fill = { bg = "#181825" },
            hint = {bg = "#181825", fg = "#6c7086"},
            info = {bg = "#181825", fg = "#6c7086"}

          }, 
        },
      },
      options = {
        themable = true,
        hover = {
          enabled = true,
          delay = 150,
          reveal = {'close'}
        },
        diagnostics="nvim_lsp",
        always_show_bufferline=false,
        diagnostics_indicator = function(count, level)
          local icon = ""
          if level == 'error' or level == 'warning' then
            -- Display the count of errors or warnings
            return " " .. icon
          else
            -- For information and hints, don't display anything
            return ''
          end
        end


      },
    }
  end
}
