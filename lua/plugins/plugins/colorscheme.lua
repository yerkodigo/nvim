return {
  {
    'yerkodigo/yka.mono',
    name = 'yka.mono',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.mies_style = 'light'
      vim.cmd('colorscheme mies')
    end,
  },
}
