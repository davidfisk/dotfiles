-- these are options plugins have overridden that need to be overridden by my own prefs
vim.opt.colorcolumn = { 80 }
vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 'black', bg = 'black' })
