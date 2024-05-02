return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'AndreM222/copilot-lualine',
  },
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'catppuccin',
        section_separators = '',
        component_separators = '|',
        disabled_filetypes = { 'alpha' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', { 'diagnostics', sections = { 'error', 'warn' } } },
        lualine_c = {
          {
            'buffers',
            symbols = {
              alternate_file = ''
            },
          }
        },
        lualine_x = {
          { 'copilot', show_colors = true },
          'filetype'
        },
        lualine_y = {
          'progress',
          { "aerial", colored = true, }
        },
        lualine_z = { 'location' },
      }
    }
  end
}
