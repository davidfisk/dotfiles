require('nvim-treesitter.configs').setup {
  ensure_installed = { 'bash', 'c', 'dockerfile', 'javascript', 'lua', 'java', 'typescript' },
  highlight = {
    enable = true,
  },
}
