-- NOTE: disabled - replacing with hurl
return {
  'rest-nvim/rest.nvim',
  enabled = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/nvim-nio',
    -- {
    --   'vhyrro/luarocks.nvim',
    --   opts = {
    --     rocks = { 'lua-curl', 'nvim-nio', 'mimetypes', 'xml2lua' }, -- Specify LuaRocks packages to install
    --   },
    -- },
  },
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    table.insert(opts.ensure_installed, 'http')
    opts.rocks = { 'lua-curl', 'nvim-nio', 'mimetypes', 'xml2lua' }
  end,
  config = function()
    -- vim.g.rest_nvim = {}
    vim.keymap.set('n', '<leader>rr', ':Rest run<CR>', { desc = '[R]est [R]un' })
    vim.keymap.set('n', '<leader>rl', ':Rest logs<CR>', { desc = '[R]est [L]ogs' })
    vim.keymap.set('n', '<leader>rc', ':Rest cookies<CR>', { desc = 'Edit [R]est [C]ookies' })
    -- require('telescope').load_extension 'rest'
    -- --
    -- vim.keymap.set('n', '<leader>se', require('telescope').extensions.rest.select_env, { desc = '[S]earch Rest [E]nvs' })
  end,
}
