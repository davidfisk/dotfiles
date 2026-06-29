-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('dfisk-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local function augroup(name)
  return vim.api.nvim_create_augroup('dfisk-vim.' .. name, { clear = true })
end
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup 'jenkinsfile_detect',
  pattern = { 'Jenkinsfile' },
  callback = function()
    vim.cmd 'set filetype=groovy'
  end,
})

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
    end
  end,
})

vim.api.nvim_create_user_command('LspInfo', 'checkhealth vim.lsp', { desc = 'Show LSP Info' })

-- prevent "process exited 0" from displaying when nvim terminals run successful commands
vim.api.nvim_clear_autocmds { group = 'nvim.terminal', event = 'TermClose' }
