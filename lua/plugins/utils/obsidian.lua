return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  event = 'VeryLazy',
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
  config = function()
    require("obsidian").setup {
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
      }
    }
    vim.keymap.set('n', '<leader>of', '<cmd> lua require("obsidian").util.gf_passthrough()<CR>',
      { noremap = false, expr = true, desc = '[O]bsidian [F]ollow' })
    vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>',
      { noremap = false, expr = true, desc = '[O]bsidian [N]ew Note' })
    vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianTemplate<CR>',
      { noremap = false, expr = true, desc = '[O]bsidian [T]emplate' })
    vim.keymap.set('n', '<leader>od', '<cmd>require("obsidian").util.toggle_checkbox()<CR>',
      { noremap = false, expr = true, desc = '[O]bsidian [D]one' })
    vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "[O]pen in [O]bsidian App" })
    vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show [O]bsidian[B]acklinks" })
    vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show [O]bsidian[L]inks" })
    vim.keymap.set("n", "<leader>ow", "<cmd>ObsidianWorkspace<CR>", { desc = "Choose [O]bsidian [W]orkspaces" })
    vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "[O]bsidian [Q]uick Switch" })
  end
}
