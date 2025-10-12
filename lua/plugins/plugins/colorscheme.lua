return {
  {
    -- DEV
    -- "ykacolors-local",
    -- dir = vim.fn.expand("~/.config/ykacolors.vim"), -- Use vim.fn.expand
    -- dev = true,

    -- REPO
    "yerkodigo/yka.mono",
    name = "yka-mono",
    branch = 'dev',

    lazy = false,
    priority = 1000,
    opts = {
      background = "light",
      transparent = false,
    },
    config = function(_, opts)
      local vi = vim

      vi.opt.termguicolors = true
      vi.opt.background = opts.background or "light"

      vi.cmd('colorscheme ykamono')

      local function set_ykamono(style)
        vi.opt.background = style
        vi.cmd('colorscheme ykamono')
      end

      vi.keymap.set('n', '<leader>dt', function() set_ykamono('dark') end, { desc = 'YkaMono Dark' })
      vi.keymap.set('n', '<leader>lt', function() set_ykamono('light') end, { desc = 'YkaMono Light' })
    end,
  },
}
