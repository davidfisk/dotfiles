local config = {
  cmd = {
    'jdtls',
    '--jvm-arg=' .. string.format('-javaagent:%s', vim.fn.expand '$MASON/share/jdtls/lombok.jar'),
  },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'pom.xml' }, { upward = true })[1]),
  settings = {
    runtimes = {
      -- determine runtime path on mac jenv with `jenv which 24`
      {
        name = 'jdk17',
        path = '$HOME/.jenv/versions/17.0/bin/java',
      },
      {
        name = 'jdk24',
        path = '$HOME/.jenv/versions/24/bin/java',
      },
    },
    java = {
      format = {
        enabled = false, -- NOTE: autoformat java
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
    -- sources = {
    --   organizeImports = {
    --     starThreshold = 9999,
    --     staticStarThreshold = 9999,
    --   },
    -- },
  },
}
require('jdtls').start_or_attach(config)
