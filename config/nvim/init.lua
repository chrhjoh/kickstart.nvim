vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.loader.enable()
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {import = 'plugins.editor'},
  {import = 'plugins.git'},
  {import = 'plugins.lsp'},
  {import = 'plugins.ui'},
  {import = 'plugins.utils'},
}, {})

-- [[ Setting options ]]
require("options")
require("keymaps")
require("autocommands")
require('commands')
