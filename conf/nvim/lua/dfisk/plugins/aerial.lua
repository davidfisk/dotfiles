return {
  'stevearc/aerial.nvim',
  enabled = true,
  opts = {},
  -- Optional dependencies
  config = function()
    require('aerial').setup {
      layout = {
        default_direction = 'right',
        min_width = 20,
      },
      highlight_on_hover = true,
      float = {
        -- Determines location of floating window
        --   cursor - Opens float on top of the cursor
        --   editor - Opens float centered in the editor
        --   win    - Opens float centered in the window
        relative = 'cursor',
      },
      open_automatic = false,
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { desc = '[A]erial Next', buffer = bufnr })
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { desc = '[A]erial Previous', buffer = bufnr })
      end,
    }
    vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle<CR>', { desc = 'Toggle [A]erial' })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
