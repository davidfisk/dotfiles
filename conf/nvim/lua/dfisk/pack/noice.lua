vim.pack.add { 'https://github.com/MunifTanjim/nui.nvim', 'https://github.com/rcarriga/nvim-notify', 'https://github.com/folke/noice.nvim' }
require('noice').setup {
  presets = {
    -- add any options here
    lsp_doc_border = true,
  },
}
