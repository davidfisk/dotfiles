-- return {
--   'nvim-treesitter/nvim-treesitter',
--   branch = 'main', -- New rewritten branch
--   build = ':TSUpdate',
--   config = function()
--     local ts = require 'nvim-treesitter'
--     local parsers = { 'lua', 'vim', 'vimdoc', 'bash', 'markdown', 'java' }
--
--     for _, parser in ipairs(parsers) do
--       pcall(ts.install, parser)
--     end
--
--     vim.api.nvim_create_autocmd('FileType', {
--       callback = function()
--         pcall(vim.treesitter.start)
--       end,
--     })
--   end,
-- }

return {
  'nvim-treesitter/nvim-treesitter',
  priority = 200,
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install {
      'bash',
      'c',
      'dockerfile',
      'fish',
      'javascript',
      'lua',
      'python',
      'rust',
      'typescript',
    }

    -- Automatically start treesitter for supported filetypes
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match) or args.match
        local installed = require('nvim-treesitter').get_installed 'parsers'
        if vim.tbl_contains(installed, lang) then
          vim.treesitter.start(args.buf)
        end
      end,
    })
  end,
}
