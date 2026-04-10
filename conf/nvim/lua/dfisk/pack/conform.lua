vim.pack.add {
  'https://github.com/stevearc/conform.nvim',
}

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua', stop_after_first = true },
    -- Conform can also run multiple formatters sequentially
    -- python = { "isort", "black" },
    --
    -- You can use a sub-list to tell conform to run *until* a formatter
    -- is found.
    -- javascript = { 'prettierd', 'prettier', stop_after_first = true },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}
