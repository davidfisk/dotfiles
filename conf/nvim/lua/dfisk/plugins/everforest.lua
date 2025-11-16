return {
  'sainnhe/everforest',
  priority = 1000,
  enabled = true,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.everforest_enable_italic = true
    vim.g.everforest_transparent_background = 2
    vim.cmd.colorscheme 'everforest'
    vim.api.nvim_set_hl(0, 'FloatTitle', { fg = '#afafaf', bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#afafaf', bg = 'none' })
  end,
}
