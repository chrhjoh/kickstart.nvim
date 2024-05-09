return {
    {
        "stevearc/conform.nvim",
        lazy = true,
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                -- Customize or remove this keymap to your liking
                "<leader>cf",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        -- Everything in opts will be passed to setup()
        config = function()
            require("conform").setup({
                -- Define your formatters
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "isort", "black" },
                    snakemake = { "snakefmt" },
                },
                -- Set up format-on-save
                format_on_save = function(bufnr)
                    -- Disable with a global or buffer-local variable
                    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                        return
                    end
                    return { timeout_ms = 2000, lsp_fallback = true }
                end,
                -- Customize formatters
                formatters = {
                    snakefmt = {
                        command = "snakefmt",
                        args = "$FILENAME",
                        stdin = false,
                    },
                    black = {
                        prepend_args = {
                            "--line-length",
                            "99",
                        },
                    },
                    stylua = {
                        prepend_args = {
                            "--indent-type",
                            "Spaces",
                            "--indent-width",
                            "4",
                        },
                    },
                },
            })
            require("mason-conform").setup()
        end,
        init = function()
            -- If you want the formatexpr, here is the place to set it
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    },
    {
        "zapling/mason-conform.nvim",
        lazy = true,
        dependencies = {
            "stevearc/conform.nvim",
            "williamboman/mason.nvim",
        },
        opts = {},
    },
}
