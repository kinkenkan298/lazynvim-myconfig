return {
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {},
  },
  {
    'saghen/blink.cmp',
    version = '0.*',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lua' },
    },
    sources = {
      completion = {
        enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'nvim_lua' },
      },
      providers = {
        nvim_lua = {
          name = 'nvim_lua', 
          module = 'blink.compat.source',
          score_offset = -3,
          opts = {},
        },
      },
    },
  },
}
