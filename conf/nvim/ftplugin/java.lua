local config = {
  cmd = {
    'jdtls',
    '--jvm-arg=' .. string.format('-javaagent:%s', vim.fn.expand '$MASON/share/jdtls/lombok.jar'),
  },
  root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw', 'pom.xml' }),
  settings = {
    java = {
      format = {
        enabled = true, -- NOTE: autoformat java
      },
      tabSize = 4,
      insertSpaces = true,
    },
    contentProvider = { preferred = 'fernflower' },
    implementationsCodeLens = {
      enabled = true,
    },
    referencesCodeLens = {
      enabled = true,
    },
    signatureHelp = { enabled = true },
    capabilities = {
      workspace = {
        configuration = true,
      },
      textDocument = {
        completion = {
          completionItem = {
            snippentSupport = true,
          },
        },
      },
    },
    -- sources = {
    --   organizeImports = {
    --     starThreshold = 9999,
    --     staticStarThreshold = 9999,
    --   },
    -- },
  },
}
require('jdtls').start_or_attach(config)
