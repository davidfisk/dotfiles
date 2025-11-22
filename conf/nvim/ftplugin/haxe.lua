local config = {
  cmd = { 'haxe-language-server' },
  -- cmd = { 'node', '/Users/david/src/nodejs/haxe-language-server/bin/server.js' },
  filetypes = { 'haxe', 'hx' },
  root_markers = { 'build.hxml', '.git' },
  settings = {
    haxe = {
      executable = 'haxe',
      enableCodeLens = true,
    },
  },
  -- Default value is set by on_new_config.
  init_options = {
    displayArguments = { 'build.hxml' },
  },
  -- on_new_config = function(new_config, new_root_dir)
  --   if new_config.init_options.displayArguments then
  --     return
  --   end
  --
  --   local hxml = find_hxml(new_root_dir)[1]
  --   if hxml then
  --     vim.notify('Using HXML: ' .. hxml)
  --     new_config.init_options.displayArguments = { hxml }
  --   end
  -- end,
  docs = {
    description = [[
        https://github.com/vshaxe/haxe-language-server

        The Haxe language server can be built by running the following commands from
        the project's root directory:

        npm install
        npx lix run vshaxe-build -t language-server

        This will create `bin/server.js`. Note that the server requires Haxe 3.4.0 or
        higher.

        After building the language server, set the `cmd` setting in your setup
        function:

        ```lua
        lspconfig.haxe_language_server.setup({
            cmd = {"node", "path/to/bin/server.js"},
        })
        ```

        By default, the language server is configured with the HXML compiler arguments
        contained in the first `.hxml` file found in your project's root directory.
        If you want to specify which one to use, set the `init_options.displayArguments`
        setting:

        ```lua
        lspconfig.haxe_language_server.setup({
            -- ...
            init_options = {
                displayArguments = { "build.hxml" },
            },
        })
        ```

        ]],
  },
}

-- config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
vim.lsp.config('haxe_language_server', config)
vim.lsp.enable 'haxe_language_server'
