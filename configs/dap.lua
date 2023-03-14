local configs = {}

for _, language in ipairs { 'typescript', 'javascript' } do
  configs[language] = {
    {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = 'Attach to process',
      type = 'pwa-node',
      request = 'attach',
      processId = require'dap.utils'.pick_process,
      cwd = '${workspaceFolder}',
    },
    {
      name = 'Launch Jukwaa',
      type = 'pwa-node',
      request = 'launch',
      cwd = '${workspaceFolder}',
      rootPath = '${workspaceFolder}',
      runtimeExecutable = 'npm',
      runtimeArgs = {
        'run-script',
        'server',
      },
      outFiles = {
        '${workspaceFolder}/**/*.js',
        '!**/node_modules/**'
      },
      env = {
        GRAPHQL_HASHED_QUERY_SECRET = 'some_secret',
        NODE_K8S_POOL = 'graphql',
        TEMPO_URL = 'http://localhost:9411/api/v2/spans',
      },
    },
    {
      name = 'Launch Graphene',
      type = 'pwa-node',
      request = 'launch',
      cwd = '${workspaceFolder}',
      rootPath = '${workspaceFolder}',
      runtimeExecutable = 'npm',
      runtimeArgs = {
        'run-script',
        'maintain',
      },
      outFiles = {
        '${workspaceFolder}/**/*.js',
        '!**/node_modules/**'
      },
      env = {
        GRAPHQL_HASHED_QUERY_SECRET = 'some_secret',
        NODE_K8S_POOL = 'graphql',
        TEMPO_URL = 'http://localhost:9411/api/v2/spans',
      },
    },
    {
      name = 'Launch Mocha Test (Single file)',
      type = 'pwa-node',
      request = 'launch',
      cwd = '${workspaceFolder}',
      rootPath = '${workspaceFolder}',
      runtimeExecutable = 'node',
      runtimeArgs = {
        './node_modules/mocha/bin/mocha.js',
        '-s',
        '0',
        '--require',
        'ts-node/register',
        '--colors',
        '${file}',
      },
      console = 'integratedTerminal',
      internalConsoleOptions = 'neverOpen',
    }
  }

  -- Snippet on how to combine 2 tables
  -- for _, test in ipairs(mocha_tests) do
  --   local temp = vim.deepcopy(mocha_template)
  --
  --   temp.name = test.name
  --   temp.program = test.program
  --
  --   table.insert(configs[language], temp)
  -- end
end

return configs
