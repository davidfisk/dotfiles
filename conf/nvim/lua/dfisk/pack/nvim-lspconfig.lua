vim.pack.add {
  'https://github.com/folke/neodev.nvim',
  { src = 'https://github.com/saghen/blink.cmp', version = 'main' },
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/L3MON4D3/LuaSnip',
  'https://github.com/hrsh7th/vim-vsnip',
  'https://github.com/mfussenegger/nvim-lint',
  'https://github.com/rshkarin/mason-nvim-lint',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/j-hui/fidget.nvim',
}

require('blink.cmp').setup {
  snippets = { preset = 'default' },
  -- 'default' for mappings similar to built-in completion
  -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
  -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
  keymap = { preset = 'default' },

  appearance = {
    -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',
  },

  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = { implementation = 'lua' },
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
  callback = function(event)
    -- NOTE: Remember that Lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    -- Opens a popup that displays documentation about the word under your cursor
    --  See `:help K` for why this keymap.
    map('K', vim.lsp.buf.hover, 'Hover Documentation')

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    -- NOTE: replaced by SNACKS
    -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

-- LSP servers and clients are able to communicate to each other what features they support.
--  By default, Neovim doesn't support everything that is in the LSP specification.
--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. Available keys are:
--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes for the server
--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
local servers = {
  -- gopls = {},
  -- pyright = {},
  rust_analyzer = {},
  -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
  --
  -- Some languages (like typescript) have entire language plugins that can be useful:
  --    https://github.com/pmizio/typescript-tools.nvim
  --
  -- But for many setups, the LSP (`tsserver`) will work just fine
  --
  -- TODO: disable jdtls formatting for now - it conflicts with nvim-java it seems and loads
  -- jdtls inconsistently.. need to find a new way to set fomratting options in nvim-java
  -- specifically
  -- jdtls = {
  --   settings = {
  --     java = {
  --       format = {
  --         enabled = true,
  --       },
  --       tabSize = 4,
  --       insertSpaces = true,
  --     },
  --   },
  -- },
  ts_ls = {},
  phpactor = {},
  intelephense = {},
  clangd = {},
  svelte = {
    on_attach = function(client, bufnr)
      if client.name == 'svelte' then
        vim.api.nvim_create_autocmd('BufWritePost', {
          pattern = { '*.js', '*.ts' },
          group = vim.api.nvim_create_augroup('svelte_ondidchangetsorjsfile', { clear = true }),
          callback = function(ctx)
            -- Here use ctx.match instead of ctx.file
            client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
          end,
        })
      end
    end,
  },
  tailwindcss = {},
  jsonls = {
    settings = {
      json = {
        tabSize = 2,
      },
    },
  },
  html = {},
  lua_ls = {
    -- cmd = {...},
    filetypes = { 'lua', 'p8' },
    -- capabilities = {},
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
        workspace = {
          -- make language server aware of runtime files
          library = {
            [vim.fn.expand '$VIMRUNTIME/lua'] = true,
            [vim.fn.stdpath 'config' .. '/lua'] = true,
          },
        },
      },
    },
  },
}

for server, config in pairs(servers) do
  -- passing config.capabilities to blink.cmp merges with the capabilities in your
  -- `opts[server].capabilities, if you've defined it
  config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
  vim.lsp.enable(server)
  vim.lsp.config(server, config)
end

-- Ensure the servers and tools above are installed
--  To check the current status of installed tools and/or manually install
--  other tools, you can run
--    :Mason
--
--  You can press `g?` for help in this menu.
require('mason').setup()

-- You can add other tools here that you want Mason to install
-- for you, so that they are available from within Neovim.
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'stylua', -- Used to format Lua code
  -- 'quick_lint_js',
  'ts_ls', -- Used to format javascript
  -- 'vtsls',
  'biome',
  'jsonls',
  'pylsp',
  'dockerls',
  'docker_compose_language_service',
  'phpactor',
  'intelephense',
  'clangd',
  'codelldb',
  'lua_ls',
  'rust_analyzer',
  'prettier',
  'markdownlint',
  'svelte',
  'tailwindcss',
  'cmake-language-server',
  'jdtls',
  'vscode-spring-boot-tools',
  'bashls',
  'html',
  -- 'groovy',
  -- 'sonarlint-language-server',
})
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      -- This handles overriding only values explicitly passed
      -- by the server configuration above. Useful when disabling
      -- certain features of an LSP (for example, turning off formatting for tsserver)
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      vim.lsp.config(server_name, server)
    end,
  },
  ensure_installed = {},
  automatic_installation = {},
  automatic_enable = {},
}

--Enable (broadcasting) snippet capability for completion
capabilities.textDocument.completion.completionItem.snippetSupport = true
