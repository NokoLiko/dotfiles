local setlocal = vim.opt_local

setlocal.expandtab = true
setlocal.textwidth = 78
setlocal.tabstop = 4
setlocal.shiftwidth = 4

-- Restore tag jumping, the global <C-]> is mapped to :bnext
vim.keymap.set('n', '<C-]>', '<C-]>', { buffer = true })
