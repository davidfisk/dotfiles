require 'dfisk.vim_opts'
require 'dfisk.vim_keymaps'
require 'dfisk.vim_autocmd'
require 'dfisk.init'
require 'dfisk.vim_post_opts'

-- use pack if nvim > 0.12
if vim.fn.has 'nvim-0.12' == 1 then
  require 'dfisk.init'
else
  require 'dfisk.lazy'
end
