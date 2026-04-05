-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local function augroup(name)
  return vim.api.nvim_create_augroup('dfisk.vim.' .. name, { clear = true })
end
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup 'jenkinsfile_detect',
  pattern = { 'Jenkinsfile' },
  callback = function()
    vim.cmd 'set filetype=groovy'
  end,
})
