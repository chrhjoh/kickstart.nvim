return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
      config = function()
        require("telescope").load_extension('fzf')
      end
    },
    {"fbuchlak/telescope-directory.nvim"}
  },
  config = function()
    require('telescope').setup {
      extensions = {
        persisted = {
          layout_config = {
            width = 0.5,
            height = 0.5,
          }
        }
      },
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = require('telescope.actions').delete_buffer
          },
          n = {
            ['<C-d>'] = require('telescope.actions').delete_buffer
          }, -- n
        },
      }
    }
    require("telescope").load_extension("persisted")
    require("telescope").load_extension("directory")
  end,
  keys = {
    {
      '<leader>sc',
      function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = 'Fuzzily [S]earch in [C]urrent buffer'
    },
    {
      '<leader>s/',
      function()
        require('telescope.builtin').live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end,
      desc = '[S]earch [/] in Open Files'
    },
    {
      '<leader>ss',
      function()
        require('telescope.builtin').builtin()
      end,
      desc = '[S]earch [S]elect Telescope'
    },
    {
      '<leader>sf',
      function()
        require('telescope.builtin').git_files()
      end,
      desc = '[S]earch git [F]iles'
    }, {
    '<leader>sF',
    function()
      require('telescope.builtin').find_files{no_ignore=true}
    end,
    desc = '[S]earch all [F]iles'
  },
    {
      '<leader>so',
      function()
        require('telescope.builtin').oldfiles()
      end,
      desc = '[S]earch [O]ld files'
    },
    {
      '<leader>sb',
      function()
        require('telescope.builtin').buffers()
      end,
      desc = '[S]earch Open [B]uffers'
    },
    {
      '<leader>sh',
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = '[S]earch [H]elp'
    },
    {
      '<leader>sk',
      function()
        require('telescope.builtin').keymaps()
      end,
      desc = '[S]earch [K]eymaps'
    },
    {
      '<leader>sw',
      function()
        require('telescope.builtin').grep_string()
      end,
      desc = '[S]earch current [W]ord'
    },
    {
      '<leader>sg',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = '[S]earch by [G]rep'
    },
    {
      '<leader>sG',
      ':LiveGrepGitRoot<cr>',
      desc = '[S]earch by [G]rep on Git Root'
    },
    {
      '<leader>sd',
      function()
        require('telescope.builtin').diagnostics()
      end,
      desc = '[S]earch [D]iagnostics'
    },
    {
      '<leader>sr',
      function()
        require('telescope.builtin').resume()
      end,
      desc = '[S]earch [R]esume'
    },
    {
      '<leader>sa',
      function()
        require('telescope.builtin').find_files {
          no_ignore=true,
          hidden=true,
        }
      end,
      desc = '[S]earch [A]ll files'
    },
    {
      "<Leader>sD",
      function()
        require("telescope").extensions.directory.live_grep{no_ignore=true}         -- find_files|grep_string|live_grep
      end,
      desc = "[S]elect [D]irectory for Live Grep",
    },
    {
      "<Leader>sd",
      function()
        require("telescope").extensions.directory.find_files{no_ignore=true}         -- find_files|grep_string|live_grep
      end,
      desc = "[S]elect [D]irectory for Find Files",
    },

  }
}
