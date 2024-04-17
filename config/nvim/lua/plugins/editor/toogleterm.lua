function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-t><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-t><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-t><C-n><C-w>]], opts)
    end

_G.set_terminal_keymaps()
return {
    'akinsho/toggleterm.nvim',
    version = "*",
    lazy=true,
    config = function ()
        require("toggleterm").setup{
            size = 80,
            open_mapping = false,
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = false,
            insert_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = false,
            shell = 'zsh',
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
                width=200,
                height=50
            },
        }
    end,
    keys = {
        {'<C-t>', ':ToggleTerm<CR>', desc='Toggle Terminal'}
    }
}
