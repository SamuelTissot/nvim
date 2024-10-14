return {
  {
    'hrsh7th/nvim-cmp',
    lazy = false,
    priority = 100,
    dependencies = {
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
      'saadparwaiz1/cmp_luasnip',
      {
        'MattiasMTS/cmp-dbee',
        dependencies = {
          { 'kndndrj/nvim-dbee' },
        },
        ft = 'sql', -- optional but good to have
        opts = {}, -- needed
      },
    },
    config = function()
      require 'hels.core.completion'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
