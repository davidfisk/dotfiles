vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- local util = require 'lspconfig.util'
-- -- vim.lsp.enable 'pico8_ls'
-- local config = {
--   cmd = { 'pico8-ls', '--stdio' },
--   filetypes = { 'p8' },
--   root_dir = function(bufnr, on_dir)
--     local fname = vim.api.nvim_buf_get_name(bufnr)
--     on_dir(util.root_pattern '*.p8'(fname))
--   end,
--   settings = {},
-- }
--
-- require('pico8_ls').start_or_attach(config)
