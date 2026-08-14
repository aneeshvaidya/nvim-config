-- Buffer-local LSP keymaps. nvim 0.11 ships defaults for the rest:
-- grr (references), gri (implementation), grn (rename), gra (code action),
-- grt (type definition), gO (document symbols), K (hover), <C-s> (signature help, insert)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "Goto Definition" })
  end,
})

return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls"
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
      -- Advertise blink.cmp completion capabilities to all servers
      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })
      require('mason-lspconfig').setup(opts)
      -- rust-analyzer is installed via rustup so it always matches the
      -- active toolchain (Mason's build drifted from cargo); mason-lspconfig
      -- only auto-enables Mason-installed servers, so enable it here.
      vim.lsp.enable('rust_analyzer')
    end,
  },
  {
    -- LSP status updates
    'j-hui/fidget.nvim',
    opts = {}
  },
}
