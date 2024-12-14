return {
  'jose-elias-alvarez/null-ls.nvim', -- Plugin path
  dependencies = { 'nvim-lua/plenary.nvim' }, -- Ensure plenary is loaded first
  config = function()
    -- Ensure that the plugin is available before requiring it
    local null_ls = require 'null-ls'

    -- Configure null-ls to use prettierd for formatting
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.prettierd, -- Register prettierd as a formatter
      },
    }

    -- Auto-format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = { '*.ts', '*.js', '*.tsx', '*.jsx', '*.json', '*.css', '*.html', '*.yaml' },
      command = 'lua vim.lsp.buf.format()', -- Trigger formatting before save
    })
  end,
}
