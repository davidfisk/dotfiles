return {
  'nyoom-engineering/oxocarbon.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  enabled = false,
  config = function()
    vim.opt.background = 'dark' -- set this to dark or light
    vim.cmd.colorscheme 'oxocarbon'
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatTitle', { fg = '#afafaf', bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#afafaf', bg = 'none' })
  end,
}
