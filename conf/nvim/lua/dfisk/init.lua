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
-- NOTE: ez configs
require('colorful-winsep').setup()
require('colorizer').setup()
require('render-markdown').setup()
require('otter').setup()
require('todo-comments').setup { signs = true }

-- NOTE:: more complicated configs are in individual files for cleaner, easier to read init
-- require 'dfisk.pack.fff'
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
