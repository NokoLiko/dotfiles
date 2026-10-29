vim.cmd 'packadd nvim.undotree'
vim.cmd 'packadd nvim.difftool'

vim.keymap.set('n', '<leader>u', '<cmd>Undotree<CR>', { desc = 'Undo Tree' })
