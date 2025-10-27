return {
  {
    -- DEV
    -- "yka-tron-local",
    -- dir = vim.fn.expand("~/.config/yka.tron"),
    -- dev = true,

    -- REPO
    "yerkodigo/yka.tron",
    name = "yka-tron",
    branch = 'main',

    lazy = false,
    priority = 1000,
    opts = {
      background = "dark",
      transparent = false,
    },
    config = function(_, opts)
      local vi = vim
      local colorscheme_dark = "tron"
      local colorscheme_light = "flynn"
      local HORA_FRONTERA = 19

      local function get_colorscheme_by_time()
        local hora_actual = tonumber(os.date("%H"))

        if hora_actual >= HORA_FRONTERA then
          return colorscheme_dark, "dark"
        else
          -- Modo diurno (< 19:00)
          return colorscheme_light, "light"
        end
      end

      local colorscheme_name, background = get_colorscheme_by_time()

      vi.opt.termguicolors = true
      vi.opt.background = background

      vi.cmd('colorscheme ' .. colorscheme_name)

      local function set_colorscheme(scheme, style)
        vi.opt.background = style
        vi.cmd('colorscheme ' .. scheme)
      end

      vi.keymap.set('n', '<leader>dt', function() set_colorscheme(colorscheme_dark, 'dark') end,
        { desc = 'Tron Dark' })
      vi.keymap.set('n', '<leader>lt', function() set_colorscheme(colorscheme_light, 'light') end,
        { desc = 'Flynn Light' })
    end,
  }
}
