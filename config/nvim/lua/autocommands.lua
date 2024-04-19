local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  pattern = {'Snakefile*', '*.smk'},
  callback = function(args)
    vim.diagnostic.disable(args.buf)
    vim.api.nvim_buf_set_option(args.buf,'filetype', 'snakemake')
  end
})

