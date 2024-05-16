return {
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      -- vim.g.gruvbox_material_background = 'hard'
      -- vim.g.gruvbox_material_better_perfmance = 1
      -- vim.g.gruvbox_material_foreground = 'material'
      -- vim.cmd.colorscheme 'gruvbox-material'
    end,
    {
      "xero/miasma.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        -- vim.cmd("colorscheme miasma")
      end,
    },
    {
      "savq/melange-nvim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd("colorscheme melange")
      end,
    }
  },
}
