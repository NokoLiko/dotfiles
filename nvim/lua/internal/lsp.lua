vim.lsp.config('pyrefly', {
  root_markers = { '.git', 'pyproject.toml', 'setup.py', 'requirements.txt' },
})

vim.lsp.config('lua_ls', {
  root_markers = { '.git', '.luarc.json', '.stylua.toml' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.enable {
  'astro',
  'clangd',
  'cssls',
  'dartls',
  'gopls',
  'html',
  'jsonls',
  'lexical',
  'lua_ls',
  'markdown_oxide',
  'ols',
  'pyrefly',
  'rust_analyzer',
  'svelte',
  'sqlls',
  'taplo',
  'ts_ls',
  'tailwindcss',
  'yamlls',
  'zls',
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LSP', { clear = true }),
  desc = 'Attach some keybidings when a lsp is attached',
  callback = function(args)
    vim.keymap.set('n', 'gd', function()
      vim.lsp.buf.definition()
    end, { buffer = args.buf, desc = 'Go To Definition' })
  end,
})

vim.lsp.inlay_hint.enable()

vim.keymap.set('n', '<leader>i', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle Inlay Hints' })
