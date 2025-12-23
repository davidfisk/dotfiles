require('lazy').setup { 'nvim-treesitter/nvim-treesitter', lazy = false, build = ':TSUpdate' }
require('nvim-treesitter').install { 'javascript', 'java', 'lua' }

return {}
