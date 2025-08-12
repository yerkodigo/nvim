return {
  {
    "yerkodigo/yka.mono",
    name = "yka-mono",
    branch = 'dev',
    lazy = false,
    priority = 1000,
    opts = {
      background = "dark",
      transparent = false,
    },
    config = function(_, opts)
      vim.opt.termguicolors = true
      vim.opt.background = opts.background or "dark"

      vim.cmd('colorscheme ykamono')

      local function set_ykamono(style)
        vim.opt.background = style
        vim.cmd('colorscheme ykamono')
      end

      vim.keymap.set('n', '<leader>dt', function() set_ykamono('dark') end, { desc = 'YkaMono Dark' })
      vim.keymap.set('n', '<leader>lt', function() set_ykamono('light') end, { desc = 'YkaMono Light' })
    end,
  },
}
