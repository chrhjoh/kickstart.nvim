return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    }
    )
    -- REQUIRED

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end
    vim.keymap.set("n", "<leader>bp", function() toggle_telescope(harpoon:list()) end,
      { desc = "Open harpoon window" })
  end,

  keys = function()
    local keys = {
      {
        "<leader>bP",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>bp",
        desc = 'Open Harpoon Window'
      }
    }

    for i = 1, 5 do
      table.insert(keys, {
        "<leader>b" .. i,
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end
    return keys
  end,
}
