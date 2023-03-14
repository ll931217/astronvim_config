local project, telescope = require('project_nvim'), require('telescope')

project.setup({
  datapath = vim.env.HOME .. '/houzz/Workspaces/nvim',
})

telescope.load_extension('projects')
