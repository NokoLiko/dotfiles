vim.pack.add({ "https://github.com/NeogitOrg/neogit" })

local neogit = require('neogit')
neogit.setup({})

vim.keymap.set('n', '<leader>g', function() neogit.open() end, { desc = 'Neogit' })
