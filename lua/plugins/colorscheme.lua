return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_better_perfmance = 1
      vim.g.gruvbox_material_foreground = 'mix'
      vim.cmd("colorscheme gruvbox-material")
    end,
  },
  {
    "atelierbram/Base4Tone-nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme base4tone_classic_c_dark")
    end
  },
  {
    "atelierbram/vim-colors_atelier-schemes",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      vim.cmd("colorscheme Atelier_SavannaDark")
    end
  },
  {
    'sainnhe/everforest',
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_background = 'hard'
      vim.g.everforest_better_performance = 1
      vim.g.everforest_enable_italic = true
      vim.cmd.colorscheme('everforest')
    end
  },
  {
    "xero/miasma.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme miasma")
    end,
  },
  {
    "savq/melange-nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme melange")
    end,
  },
  {
    'sainnhe/sonokai',
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_style = 'andromeda'
      vim.g.sonokai_better_perfmance = 1
      vim.cmd.colorscheme('sonokai')
    end
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      require 'nordic'.load()
      vim.cmd.colorscheme('nordic')
    end
  },
  {
    'Everblush/nvim',
    name = 'everblush',
    enabled = false,
    config = function()
      require('everblush').setup()
      vim.cmd.colorscheme('everblush')
    end
  },
  {
    "Alexis12119/nightly.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      require("nightly").setup()
      vim.cmd.colorscheme "nightly"
    end,
  }
}
