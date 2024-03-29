return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false }
      })
    end,
  },
  { 'AndreM222/copilot-lualine' },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup {
        debug = false, -- Enable debugging
        -- See Configuration section for rest
        prompts = {
          Review = {
            prompt = 'Review the code above. Write a detailed code review that includes suggestions for improvement.',
          },
          Refactor = {
            prompt = "Please refactor the following code to improve its clarity and readability."
          },
          FixError = {
            prompt = "Please explain the error in the following text and provide a solution."
          },
          BetterNamings = {
            prompt = "Please provide better names for the following variables and functions."
          },
        },

        window = {
          layout = 'float',
          relative = 'cursor',
          width = 1,
          height = 0.4,
          row = 1
        },
        mappings = {
          close = {
            normal = 'q',
            insert = '<C-q>'
          },
          reset = {
            insert = '<C-c>',
            normal = '<C-c>'
          }
        },
      }
      -- Quick chat with Copilot
      vim.keymap.set(
        { 'n', 'v' },
        "<leader>cq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        { desc = "CopilotChat - Quick chat" }
      )
      -- Show prompts actions with telescope
      vim.keymap.set(
        { 'n', 'v' },
        "<leader>cp",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        { desc = "CopilotChat - Prompt actions" }
      )
      vim.keymap.set({ 'n', 'v' }, "<leader>ce", "<cmd>CopilotChatExplain<cr>", { desc = "CopilotChat - Explain code" })
      vim.keymap.set({ 'n', 'v' }, "<leader>cs", "<cmd>CopilotChatSuggest<cr>", { desc = "CopilotChat - Suggest code" })
      vim.keymap.set({ 'n', 'v' }, "<leader>ct", "<cmd>CopilotChatTests<cr>", { desc = "CopilotChat - Generate tests" })
      vim.keymap.set({ 'n', 'v' }, "<leader>cc", "<cmd>CopilotChatComment<cr>", { desc = "CopilotChat - Comment code" })
      vim.keymap.set({ 'n', 'v' }, "<leader>cr", "<cmd>CopilotChatReview<cr>", { desc = "CopilotChat - Review code" })
      vim.keymap.set({ 'n', 'v' }, "<leader>cR", "<cmd>CopilotChatRefactor<cr>", { desc = "CopilotChat - Refactor code" })
      vim.keymap.set({ 'n', 'v' }, "<leader>cn", "<cmd>CopilotChatBetterNamings<cr>",
        { desc = "CopilotChat - Better Naming" })
      vim.keymap.set({ 'n', 'v' }, "<leader>cd", "<cmd>CopilotChatDocs<cr>", { desc = "CopilotChat - Generate Documentation" })

      -- Generate commit message based on the git diff
      vim.keymap.set(
        { 'n', 'v' },
        "<leader>cm",
        "<cmd>CopilotChatCommit<cr>",
        { desc = "CopilotChat - Generate commit message for all changes" }
      )
      vim.keymap.set(
        { 'n', 'v' },
        "<leader>cM",
        "<cmd>CopilotChatCommitStaged<cr>",
        { desc = "CopilotChat - Generate commit message for staged changes" }
      )
      -- Debug
      vim.keymap.set({ 'n', 'v' }, "<leader>cD", "<cmd>CopilotChatDebugInfo<cr>", { desc = "CopilotChat - Debug Info" })
      -- Fix the issue with diagnostic
      vim.keymap.set({ 'n', 'v' }, "<leader>cf", "<cmd>CopilotChatFixDiagnostic<cr>",
        { desc = "CopilotChat - Fix Diagnostic" })
    end
  },
  -- See Commands section for default commands if you want to lazy load on them
}
