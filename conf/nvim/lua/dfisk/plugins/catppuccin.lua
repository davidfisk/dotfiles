return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  -- 'folke/tokyonight.nvim',
  -- 'sainnhe/gruvbox-material',
  'catppuccin/nvim',
  enabled = false,
  name = 'catppucin',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.cmd.colorscheme 'catppuccin-mocha'
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    -- vim.g.gruvbox_material_background = 'hard'
    -- vim.cmd.colorscheme 'gruvbox-material'
    -- You can configure highlights by doing something like:
    -- vim.cmd.hi 'Comment gui=none'
  end,
  config = function()
    require('catppuccin').setup {
      no_italic = true,
      term_colors = true,
      transparent_background = true,
      float = {
        transparent = true,
        solid = true,
      },
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = '#050511',
          mantle = '#050522',
          crust = '#050533',
        },
      },
      integrations = {
        aerial = true,
        barbar = true,
        dashboard = true,
        gitsigns = true,
        mason = true,
        notify = true,
        snacks = true,
        which_key = true,
        blink = true,
        colorful_winsep = {
          enabled = true,
          color = 'sapphire',
        },
        mini = {
          enable = true,
        },
        noice = true,
        dap = true,
        dap_ui = true,
        lsp_trouble = true,
      },
    }
  end,
}
