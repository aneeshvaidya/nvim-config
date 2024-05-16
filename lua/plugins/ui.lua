return {
  { 'tpope/vim-sleuth', },
  {
    'folke/which-key.nvim',
    opts = {}
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function()
      vim.keymap.set('n', "<leader>nt", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
      vim.keymap.set('n', "<leader>nf", ":NvimTreeFindFile<cr>", { silent = true, noremap = true })
      require("nvim-tree").setup({})
    end
  },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    main = "ibl",
    opts = {}
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true  
  },
  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'gruvbox-material',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },
  {
    'windwp/nvim-autopairs',
    config = true,
  },
}
