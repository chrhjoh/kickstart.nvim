return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin-mocha"
    require("catppuccin").setup({
      integrations = {
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        alpha = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        markdown = true,
        mason = true,
        neotree = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        indent_blankline = {
          enabled = true,
          scope_color = "lavender",   -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        telescope = {
          enabled = true,
          -- style = "nvchad"
        },
        which_key = true,
        noice = true
      },
    })
  end,
}
