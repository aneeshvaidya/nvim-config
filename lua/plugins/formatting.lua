-- Formatting (conform.nvim) and linting (nvim-lint), replacing none-ls.
return {
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = 'ConformInfo',
    keys = {
      {
        '<leader>gf',
        function() require('conform').format({ async = true, lsp_format = 'fallback' }) end,
        desc = 'Format Document',
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        -- prettier resolves from the project's node_modules/.bin
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        css = { 'prettier' },
      },
      -- Filetypes without an entry above fall back to their LSP formatter,
      -- matching the old BufWritePre vim.lsp.buf.format() behavior.
      format_on_save = { timeout_ms = 1000, lsp_format = 'fallback' },
    },
  },
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPost', 'BufWritePost', 'InsertLeave' },
    config = function()
      local lint = require('lint')
      lint.linters_by_ft = {
        javascript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
      }

      -- eslint_d isn't installed globally; use the project-local binary
      local function eslint_d_cmd()
        local found = vim.fs.find('node_modules/.bin/eslint_d', {
          upward = true,
          path = vim.api.nvim_buf_get_name(0),
        })[1]
        return found or 'eslint_d'
      end
      lint.linters.eslint_d.cmd = eslint_d_cmd

      vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost', 'InsertLeave' }, {
        group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
        callback = function()
          if not lint.linters_by_ft[vim.bo.filetype] then return end
          if vim.fn.executable(eslint_d_cmd()) == 1 then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
