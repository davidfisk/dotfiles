-- https://jekhokie.github.io/linux/vim/plantuml/2020/07/25/plantuml-using-vim.html
vim.pack.add { 'https://github.com/aklt/plantuml-syntax', 'https://github.com/tyru/open-browser.vim', 'https://github.com/weirongxu/plantuml-previewer.vim' }
vim.keymap.set('n', '<leader>dp', ':PlantumlOpen<CR>', { desc = '[D]ocument [P]lantuml' })
