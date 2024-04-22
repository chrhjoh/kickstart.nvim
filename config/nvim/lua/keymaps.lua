-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q',
  function()
    vim.diagnostic.setloclist({ severity = { min = vim.diagnostic.severity.WARN } })
  end,
  { desc = 'Open diagnostics list' })

-- Automatic reselect after indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set('n', 'yP', ':let @* = expand("%:p")<CR>', { desc = '[P] Copy Absolute [P]athy' })
vim.keymap.set('n', 'yp', ':let @* = expand("%")<CR>', { desc = '[p] Copy Relative [P]ath' })
vim.keymap.set('n', 'y.', ':let @* = expand("%:t")<CR>', { desc = '[.] Copy Filename' })

-- Moving between buffers
vim.keymap.set('n', '<TAB>', ':bn<CR>', { desc = 'Next Buffer', silent = true })
vim.keymap.set('n', '<S-TAB>', ':bp<CR>', { desc = 'Previous Buffer', silent = true })
