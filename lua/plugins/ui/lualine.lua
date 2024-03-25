return{
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    config = function ()
      require('lualine').setup{
        options = {
          icons_enabled = true,
          theme = 'catppuccin',
          component_separators = '|',
          section_separators = '',
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {
              {
                'buffers',
                symbols = {
                  alternate_file=''
                },
              }
            },
            lualine_x = {
              {
                'copilot',
                 show_colors = true
              },
              'encoding',
              'fileformat',
              'filetype'
            },
            lualine_y = {'progress'},
            lualine_z = {'location'},
        }
      }
    end
  }

