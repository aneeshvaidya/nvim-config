return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'main', -- the old master branch is frozen; main is the rewrite
    build = ':TSUpdate',
    lazy = false,
    config = function()
      -- Parsers to install (async, no-op once installed).
      -- lua/vim/markdown/c/query also ship bundled with nvim itself.
      require('nvim-treesitter').install {
        'c', 'cpp', 'go', 'gleam', 'lua', 'python', 'rust',
        'tsx', 'typescript', 'vim', 'markdown', 'markdown_inline',
      }

      -- On main, highlighting/indentation are driven by core nvim per buffer.
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
        callback = function(args)
          -- pcall: filetypes without an installed parser fall back to regex syntax
          local ok = pcall(vim.treesitter.start, args.buf)
          if ok and vim.bo[args.buf].filetype ~= 'python' then -- python indent was disabled before
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = { lookahead = true }, -- jump forward to nearest textobj, like targets.vim
        move = { set_jumps = true },   -- add movements to the jumplist
      }

      local select = require('nvim-treesitter-textobjects.select')
      local move = require('nvim-treesitter-textobjects.move')
      local swap = require('nvim-treesitter-textobjects.swap')

      local function sel(lhs, query)
        vim.keymap.set({ 'x', 'o' }, lhs, function()
          select.select_textobject(query, 'textobjects')
        end)
      end
      sel('aa', '@parameter.outer')
      sel('ia', '@parameter.inner')
      sel('af', '@function.outer')
      sel('if', '@function.inner')
      sel('ac', '@class.outer')
      sel('ic', '@class.inner')

      local function mov(lhs, fn, query)
        vim.keymap.set({ 'n', 'x', 'o' }, lhs, function()
          move[fn](query, 'textobjects')
        end)
      end
      mov(']m', 'goto_next_start', '@function.outer')
      mov(']]', 'goto_next_start', '@class.outer')
      mov(']M', 'goto_next_end', '@function.outer')
      mov('][', 'goto_next_end', '@class.outer')
      mov('[m', 'goto_previous_start', '@function.outer')
      mov('[[', 'goto_previous_start', '@class.outer')
      mov('[M', 'goto_previous_end', '@function.outer')
      mov('[]', 'goto_previous_end', '@class.outer')

      vim.keymap.set('n', '<leader>a', function()
        swap.swap_next('@parameter.inner')
      end)
      vim.keymap.set('n', '<leader>A', function()
        swap.swap_previous('@parameter.inner')
      end)
    end,
  },
}
