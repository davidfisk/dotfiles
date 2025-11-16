-- https://github.com/nvim-java/nvim-java
-- https://github.com/nvim-java/nvim-java/issues/374
-- https://github.com/nvim-java/nvim-java/issues/384
-- DISABLING FOR NOW - THIS PLUGIN IS NOT REALLY MAINTAINED WELL
return {
  'nvim-java/nvim-java',
  priority = 100,
  enabled = false,
  config = function()
    require('java').setup()
    -- TODO: migrate to vim.lsp.config (https://xnacly.me/posts/2025/neovim-lsp-changes/)
    vim.lsp.config('jdtls', {
      java = {
        format = {
          enabled = true,
        },
        tabSize = 4,
        insertSpaces = true,
      },
    })
  end,
}
--
--
-- return {
--   'nvim-java/nvim-java',
--   priority = 100,
--   config = false,
--   dependencies = {
--     {
--       'neovim/nvim-lspconfig',
--       opts = {
--         servers = {
--           jdtls = {
--             -- Your custom jdtls settings goes here
--             settings = {
--               java = {
--                 format = {
--                   enabled = true,
--                 },
--                 tabSize = 4,
--                 insertSpaces = true,
--               },
--             },
--           },
--         },
--         setup = {
--           jdtls = function()
--             require('java').setup {
--               -- Your custom nvim-java configuration goes here
--             }
--           end,
--         },
--       },
--     },
--   },
-- }
