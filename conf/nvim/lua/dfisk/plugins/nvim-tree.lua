-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-tree/nvim-tree.lua',
    enabled = false,
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'b0o/nvim-tree-preview.lua',
    },
    config = function()
      require('nvim-tree').setup {
        disable_netrw = true,
        view = {
          adaptive_size = true,
          float = {
            enable = false,
          },
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        on_attach = function(bufnr)
          local api = require 'nvim-tree.api'

          -- Important: When you supply an `on_attach` function, nvim-tree won't
          -- automatically set up the default keymaps. To set up the default keymaps,
          -- call the `default_on_attach` function. See `:help nvim-tree-quickstart-custom-mappings`.
          api.config.mappings.default_on_attach(bufnr)

          local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          local preview = require 'nvim-tree-preview'

          vim.keymap.set('n', 'P', preview.watch, opts 'Preview (Watch)')
          vim.keymap.set('n', '<Esc>', preview.unwatch, opts 'Close Preview/Unwatch')
          vim.keymap.set('n', '<C-f>', function()
            return preview.scroll(4)
          end, opts 'Scroll Down')
          vim.keymap.set('n', '<C-b>', function()
            return preview.scroll(-4)
          end, opts 'Scroll Up')

          -- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
          vim.keymap.set('n', '<Tab>', function()
            local ok, node = pcall(api.tree.get_node_under_cursor)
            if ok and node then
              if node.type == 'directory' then
                api.node.open.edit()
              else
                preview.node(node, { toggle_focus = true })
              end
            end
          end, opts 'Preview')
        end,
      }
      -- configure nvim-tree
      -- optionally enable 24-bit colour
      vim.opt.termguicolors = true

      -- setup keymaps
      vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<CR>', { desc = 'Ope[n] [N]vimTree' })
      vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>', { desc = '[N]vimTree [F]ind' })

      -- open nvim-tree on setup
      local function open_nvim_tree(data)
        -- buffer is a [No Name]
        local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

        -- buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1

        if not no_name and not directory then
          return
        end

        -- change to the directory:
        if directory then
          vim.cmd.cd(data.file)
        end

        -- open the tree
        require('nvim-tree.api').tree.open()
      end

      -- NOTE disable vim enter for now
      -- vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
    end,
  },
}
