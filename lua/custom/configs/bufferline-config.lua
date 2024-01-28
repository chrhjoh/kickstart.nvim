vim.opt.termguicolors = true
local bufferline = require('bufferline')

bufferline.setup{
    options = {
        style_preset = bufferline.style_preset.minimal,
        hover = {
            enabled = true,
            delay = 150,
            reveal = {'close'}
        },
        always_show_bufferline = false
    }
}
