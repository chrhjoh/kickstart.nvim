local on_attach = function(client, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- See `:help K` for why this keymap
  nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')
  vim.keymap.set('i', '<C-?>', vim.lsp.buf.signature_help, { desc = 'LSP: Signature', noremap = true })
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>C', vim.lsp.buf.code_action, '[C]ode action')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

return {
  {
    'williamboman/mason-lspconfig.nvim',
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'pyright',
          'jedi_language_server',
          'bashls',
          'jsonls',
          'marksman',
          'yamlls',
          'sqlls',
          'lua_ls',
        },
        automatic_installation = true,
      }
    end
  },
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.pyright.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              diagnosticSeverityOverrides = {
                reportInvalidTypeArguments = "warning",
                reportArgumentType = "information",
                reportGeneralTypeIssues = "information",
                reportReturnType = "information",
                reportIncompatibleMethodOverride = "information",
                reportIncompatibleVariableOverride = "warning",
                reportPossiblyUnboundVariable = "warning"
              },
              typeCheckingMode = "basic"
            },
          },
        },
        filetypes = { 'python', 'snakemake' }
      }
      lspconfig.jedi_language_server.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { 'python', 'snakemake' },
        init_options = {
          diagnostics = { enable = false },
          completion = { enable = false },
          hover = { enable = false }
        }
      }
      lspconfig.bashls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }
      lspconfig.jsonls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }
      lspconfig.marksman.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }
      lspconfig.yamlls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }
      lspconfig.sqlls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { root_dir = function() return vim.loop.cwd() end }
      }
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          }
        },
      }
    end
  },
}
