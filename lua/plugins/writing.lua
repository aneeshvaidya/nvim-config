return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "zk-org/zk-nvim",
    config = function()
      require("zk").setup({
        -- See Setup section below
      })
    end
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    'renerocksai/telekasten.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    enabled = false,
    config = function()
      require('telekasten').setup({
        home = vim.fn.expand("~/notes"),                                  -- Put the name of your notes directmry here
        dailies = vim.fn.expand("~/notes/dailies"),                       -- Put the name of your dailies directmry here
        templates = vim.fn.expand("~/notes/templates"),                   -- Put the name of your templates directmry here
        template_new_daily = vim.fn.expand("~/notes/templates/daily.md"), -- Put the name of your new daily template here
      })
    end
  },
  {
    'preservim/vim-pencil'
  }
}
