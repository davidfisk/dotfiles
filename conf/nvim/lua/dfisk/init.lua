-- TODO: migrate LAZY to PACK
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
    end
  end,
})

vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-zh/colorful-winsep.nvim',
  'https://github.com/mfussenegger/nvim-jdtls',
  'https://github.com/catgoose/nvim-colorizer.lua',
}
require('colorful-winsep').setup()
require('colorizer').setup()

-- TODO: fix dir to make relative
require 'dfisk.pack.snacks'
require 'dfisk.pack.mini'
require 'dfisk.pack.aerial'
require 'dfisk.pack.nvim-lspconfig'
require 'dfisk.pack.conform'
require 'dfisk.pack.nvim-tmux-navigation'
require 'dfisk.pack.barbar'
require 'dfisk.pack.noice'
require 'dfisk.pack.everforest'
require 'dfisk.pack.which-key'
require 'dfisk.pack.gitgraph'
