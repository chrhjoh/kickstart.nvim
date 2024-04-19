return {
    {
        "nvimtools/none-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        config = function()
            local null_ls = require('null-ls')
            local snakemake_formatter = {
                method = null_ls.methods.FORMATTING,
                filetypes = { "snakemake" },
                generator = null_ls.formatter({
                    command = { 'snakefmt' },
                    args = { "$FILENAME" },
                    to_temp_file = true,
                })
            }
            null_ls.register(snakemake_formatter)
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                }
            })
            require("mason-null-ls").setup({
                ensure_installed = { 'snakefmt' },
                automatic_installation = true,
            })
        end
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
    }
}
