return {
  "windwp/nvim-autopairs",
  -- Optional dependency
  event = "InsertEnter",
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    require("nvim-autopairs").setup {}
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
    local python_handler = cmp_autopairs.filetypes["python"]["("].handler
    cmp_autopairs.filetypes["python"]["("].handler = function(char, item, bufnr, rules, commit_character)
      local utils = require('nvim-autopairs.utils')
      local line = utils.text_get_current_line(bufnr)
      if line:match("^(from.*import.*)$") then
        return
      end
      python_handler(char, item, bufnr, rules, commit_character)
    end
  end,
}
