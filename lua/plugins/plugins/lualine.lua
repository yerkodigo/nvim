return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      fg          = "#eeeeee", -- texto claro
      bg          = "#1c1c1c", -- fondo oscuro
      light_bg    = "#2e2e2e", -- sección activa ligeramente más clara
      inactive_bg = "#3a3a3a", -- sección inactiva
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.light_bg, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.light_bg, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.light_bg, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.light_bg, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.light_bg, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.fg, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.fg },
        c = { bg = colors.inactive_bg, fg = colors.fg },
      },
    }

    lualine.setup({
      options = {
        theme = my_lualine_theme,
        -- Deshabilitar globalstatus para tener un statusline por ventana/pestaña
        globalstatus = false,
      },
      sections = {
        -- Aquí metemos el filename con path = 2 para ruta absoluta
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          { "filename", path = 1 }, -- 0 = nombre, 1 = relativo, 2 = absoluto
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      -- Opcional: usar el tabline para ver las pestañas arriba
      -- tabline = {
      --   lualine_a = { "tabs" },
      -- },
    })
  end,
}
