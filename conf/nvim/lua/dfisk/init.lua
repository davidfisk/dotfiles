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

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = ' ', Warn = ' ', Hint = ' 󰜴', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-zh/colorful-winsep.nvim',
  'https://github.com/mfussenegger/nvim-jdtls',
  'https://github.com/catgoose/nvim-colorizer.lua',
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  'https://github.com/jmbuhr/otter.nvim',
  'https://github.com/folke/todo-comments.nvim',
}
require('colorful-winsep').setup()
require('colorizer').setup()
require('render-markdown').setup()
require('otter').setup()
require('todo-comments').setup { signs = true }

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
require 'dfisk.pack.trouble'
require 'dfisk.pack.plantuml'
require 'dfisk.pack.todo-comments'
