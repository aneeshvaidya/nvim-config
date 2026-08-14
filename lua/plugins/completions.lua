return {
  {
    "supermaven-inc/supermaven-nvim",
    opts = {},
  },
  { -- Autocompletion
    'saghen/blink.cmp',
    version = '1.*', -- release tag pulls the prebuilt Rust fuzzy matcher
    event = 'InsertEnter',
    opts = {
      keymap = {
        -- 'enter' preset: <CR> confirms, <C-space> opens menu/docs, <C-e> hides
        preset = 'enter',
        -- match the old nvim-cmp muscle memory
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      },
      completion = {
        documentation = { auto_show = true },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
  },
}
