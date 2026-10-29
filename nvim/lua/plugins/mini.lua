vim.pack.add {
  { src = 'https://github.com/nvim-mini/mini.pick' },
  { src = 'https://github.com/nvim-mini/mini.extra' },
  { src = 'https://github.com/nvim-mini/mini.surround' },
  { src = 'https://github.com/nvim-mini/mini.ai' },
  { src = 'https://github.com/nvim-mini/mini.files' },
  { src = 'https://github.com/nvim-mini/mini.diff' },
  { src = 'https://github.com/nvim-mini/mini.clue' },
  { src = 'https://github.com/nvim-mini/mini.tabline' },
  { src = 'https://github.com/nvim-mini/mini.statusline' },
}
require('mini.pick').setup()
require('mini.extra').setup()
vim.ui.select = MiniPick.ui_select

require('mini.surround').setup {}
require('mini.ai').setup()

require('mini.files').setup()
require('mini.diff').setup { view = { style = 'sign' } }
require('mini.tabline').setup()
require('mini.statusline').setup()

local miniclue = require 'mini.clue'
miniclue.setup {
  triggers = {
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },
    { mode = 'n', keys = '<C-w>' },
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },
  },
  clues = {
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
    miniclue.gen_clues.square_brackets(),
  },
}

vim.keymap.set('n', '<leader>f', '<cmd>Pick files<CR>', { desc = 'File Picker' })
vim.keymap.set('n', '<leader>b', '<cmd>Pick buffers<CR>', { desc = 'Buffer Picker' })
vim.keymap.set('n', '<leader>/', '<cmd>Pick grep_live<CR>', { desc = 'Grep Picker' })
vim.keymap.set('n', '<leader>h', '<cmd>Pick help<CR>', { desc = 'Help Picker' })
vim.keymap.set('n', '<leader>r', '<cmd>Pick resume<CR>', { desc = 'Resumes Picker' })
vim.keymap.set('n', '<leader>o', '<cmd>Pick oldfiles<CR>', { desc = 'Recent Files Picker' })
vim.keymap.set('n', '<leader>d', '<cmd>Pick diagnostic<CR>', { desc = 'Diagnostics Picker' })
vim.keymap.set('n', '<leader>s', "<cmd>Pick lsp scope='document_symbol'<CR>", { desc = 'Symbols Picker' })
vim.keymap.set('n', '<leader>k', '<cmd>Pick keymaps<CR>', { desc = 'Keymaps Picker' })

vim.keymap.set('n', '-', function()
  require('mini.files').open()
end, { desc = 'File Tree' })
