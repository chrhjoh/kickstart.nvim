return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal",
      },
      {
        name = "work",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Work",
      },
    },

    -- see below for full list of options 👇
    mappings = {
      -- "Obsidian follow"
      ["<leader>of"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true, desc = '[O]bsidian [F]ollow' },
      },
      -- Toggle check-boxes "obsidian done"
      ["<leader>od"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true, desc= 'Checkbox [D]one'},
      },
      -- Create a new newsletter issue
      ["<leader>on"] = {
        action = function()
          return require("obsidian").commands.new_note("Newsletter-Issue")
        end,
        opts = { buffer = true, desc='New [N]ewsletter Note'},
      },
      ["<leader>ot"] = {
        action = function()
          return require("obsidian").util.insert_template("Newsletter-Issue")
        end,
        opts = { buffer = true, desc= 'Insert Newsletter [T]emplate' },
      },
    },
  },
}
