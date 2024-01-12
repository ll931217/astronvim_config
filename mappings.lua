-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader><leader>w"] = { "<cmd>HopWord<cr>", desc = "Hop Word" },
    ["<leader><leader>c"] = { "<cmd>HopChar1<cr>", desc = "Hop Character" },

    -- DAP Client debugger
    ["<leader>Db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Create breakpoint" },
    ["<leader>Dc"] = { "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
    ["<leader>Do"] = { "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
    ["<leader>Di"] = { "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
    ["<leader>DO"] = { "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },

    ["<leader>P"] = { "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>", desc = "Projects Picker" },

    -- Buffers
    ['<leader>b'] = { name = 'Buffers' },
    ['L'] = { '<cmd>lua require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)<cr>', desc = 'Next buffer' },
    ['H'] = { '<cmd>lua require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))<cr>', desc = 'Previous buffer' },
    ['>'] = { '<cmd>lua require("astronvim.utils.buffer").move(vim.v.count > 0 and vim.v.count or 1)<cr>', desc = 'Move buffer tab right' },
    ['<'] = { '<cmd>lua require("astronvim.utils.buffer").move(-(vim.v.count > 0 and vim.v.count or 1))<cr>', desc = 'Move buffer tab left'},

    -- AI
    ['<leader>a'] = { name = 'AI' },
    ['<leader>ac'] = { '<cmd>ChatGPT<cr>', desc = 'ChatGPT' },
    ['<leader>ag'] = { '<cmd>Gen<cr>', desc = 'Gen' },
    ['<leader>ao'] = { name = 'Ollama' },
    ['<leader>aoc'] = { name = 'Ollama Chat' },
    ['<leader>aop'] = { name = 'Ollama Prompt' },

    [';'] = { ':', desc = 'Enter command mode' },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
