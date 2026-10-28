-- Cathode Amber: gruvbox-material with the Rex "Cathode Amber" palette.
-- Requires sainnhe/gruvbox-material on the runtimepath.
vim.o.background = 'dark'
vim.o.termguicolors = true

vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_colors_override = {
  bg_dim           = { '#0d0905', '232' },
  bg0              = { '#140f08', '233' },
  bg1              = { '#1c1409', '234' },
  bg2              = { '#1c1409', '234' },
  bg3              = { '#241a0e', '235' },
  bg4              = { '#241a0e', '235' },
  bg5              = { '#332619', '236' },
  bg_statusline1   = { '#1c1409', '234' },
  bg_statusline2   = { '#241a0e', '235' },
  bg_statusline3   = { '#332619', '236' },
  bg_visual_red    = { '#4a2a12', '52' },
  bg_visual_yellow = { '#4a3212', '94' },
  bg_visual_green  = { '#45361a', '58' },
  bg_visual_blue   = { '#3d2f16', '58' },
  bg_visual_purple = { '#44301a', '58' },
  bg_diff_red      = { '#3c1e10', '52' },
  bg_diff_green    = { '#33301a', '58' },
  bg_diff_blue     = { '#2e2410', '58' },
  bg_current_word  = { '#241a0e', '235' },
  fg0              = { '#f0c88a', '222' },
  fg1              = { '#ffe8c2', '223' },
  red              = { '#e8763f', '173' },
  orange           = { '#f2925f', '209' },
  yellow           = { '#ffb642', '214' },
  green            = { '#b8a83f', '143' },
  aqua             = { '#d4a852', '179' },
  blue             = { '#c98d4f', '173' },
  purple           = { '#cf8a62', '173' },
  bg_red           = { '#e8763f', '173' },
  bg_green         = { '#b8a83f', '143' },
  bg_yellow        = { '#ffb642', '214' },
  grey0            = { '#7a6238', '95' },
  grey1            = { '#9a7c48', '137' },
  grey2            = { '#b89661', '179' },
}

-- :colorscheme ignores nested calls, so source the plugin's colors file directly.
vim.cmd('runtime colors/gruvbox-material.vim')
vim.g.colors_name = 'cathode-amber'
