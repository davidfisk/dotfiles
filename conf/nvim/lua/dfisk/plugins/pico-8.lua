on_attach = function(current_client, bufnr)
  print 'inside on_attach for pico-8'
end

-- use local version as when i use the remote git version for some reason the indents on pico 8 "shorthand if" does not work as expected, even though code should be identical. must be some lazy quirk.
-- I would rather fetch this plugin via lazy so figure this out someday.
return {
  'Bakudankun/PICO-8.vim',
  --  dir = '~/src/nvim/PICO-8.vim',
  ft = 'pico8',
  init = function()
    -- print 'init pico-8 syntax highlighting'
    vim.api.nvim_create_autocmd({ 'BufNew', 'BufEnter' }, {
      pattern = { '*.p8' },
      callback = function(args)
        vim.lsp.start {
          name = 'pico8-ls',
          cmd = { 'pico8-ls', '--stdio' },
          root_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(args.buf)),
          -- Setup your keybinds in the on_attach function
          on_attach = on_attach,
        }
      end,
    })
    vim.g.pico8_config = {
      imitate_console = 0,
      -- use_keymap = 0,
      colorize_graphics = 1,
    }
  end,
}
