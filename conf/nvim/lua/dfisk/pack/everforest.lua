vim.pack.add { 'https://github.com/sainnhe/everforest' }

-- Optionally configure and load the colorscheme
-- directly inside the plugin declaration.
vim.g.everforest_enable_italic = true
vim.g.everforest_transparent_background = 2
vim.g.everforest_dim_inactive_windows = 1
vim.cmd.colorscheme 'everforest'
vim.api.nvim_set_hl(0, 'FloatTitle', { fg = '#afafaf', bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#afafaf', bg = 'none' })
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#222234' })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = '#222234' })
-- vim.api.nvim_set_hl(0, 'FloatTitle', { fg = '#afafaf', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#afafaf', bg = 'none' })
