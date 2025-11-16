-- https://jekhokie.github.io/linux/vim/plantuml/2020/07/25/plantuml-using-vim.html
vim.keymap.set('n', '<leader>dp', ':PlantumlOpen<CR>', { desc = '[D]ocument [P]lantuml' })
return {
  'aklt/plantuml-syntax',
  'tyru/open-browser.vim',
  'weirongxu/plantuml-previewer.vim',
  lazy = true,
  ft = { 'plantuml', 'puml' },
}
