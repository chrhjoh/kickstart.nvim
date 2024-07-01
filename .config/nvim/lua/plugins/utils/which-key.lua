return {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup({
            icons = {
                separator = "→",
            },
        })
        -- document existing key chains
        require("which-key").register({
            ["<leader>C"] = { name = "+[C]opilot" },
            ["<leader>c"] = { name = "+[C]ode" },
            ["<leader>g"] = { name = "+[G]it" },
            ["<leader>gh"] = { name = "+[G]it [H]unk" },
            ["<leader>r"] = { name = "+[R]ename" },
            ["<leader>s"] = { name = "+[S]earch" },
            ["<leader>w"] = { name = "+[W]indow" },
            ["<leader>d"] = { name = "+[D]ebug" },
            ["<leader>o"] = { name = "+[O]bsidian" },
            ["<leader>f"] = { name = "+[F]iles" },
            ["<leader>b"] = { name = "+[B]uffers" },
            ["<leader>x"] = { name = "+Diagnostics/quickfi[X]" },
            ["<leader>t"] = { name = "+[T]erminal" },
            ["<leader>u"] = { name = "+Toggle" },
            ["<leader>l"] = { name = "+[L]atex" },

            ["g"] = { name = "+goto" },
            ["gs"] = { name = "+surround" },
            ["z"] = { name = "+fold" },
            ["]"] = { name = "+next" },
            ["["] = { name = "+prev" },
        }, { mode = { "n", "v" } })
    end,
}
