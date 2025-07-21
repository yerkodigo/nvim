require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'Tomorrow',
    component_separators = { left = '>', right = '<'},
    section_separators = { left = '>>', right = '<<'},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = { { "filename", path = 1 } },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { "filename", path = 1 } },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      {
        'tabs',
        mode = 2, -- 0 = numero, 1 = ruta relativa, 2 = nombre archivo
        tabs_color = {
          active = 'lualine_a_normal',
          inactive = 'lualine_b_inactive',
        },
        fmt = function(name)
          return vim.fn.fnamemodify(name, ':t')
        end,
      },
    },
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
