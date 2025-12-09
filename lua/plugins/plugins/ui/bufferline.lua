return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  lazy = false,
  priority = 1000,
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant", -- Separadores inclinados entre tabs
      indicator = {
        style = "underline", -- Línea debajo del tab activo
      },
      show_tab_indicators = true,
      color_icons = true, -- Iconos con color
      show_close_icon = true,
      show_buffer_close_icons = false,
    },
    highlights = {
      -- Tab seleccionado (activo)
      tab_selected = {
        fg = "#000000", -- Negro
        bg = "#afe9f2", -- Cyan brillante (del colorscheme tron)
        bold = true,
      },
      -- Indicador del tab seleccionado
      indicator_selected = {
        fg = "#afe9f2", -- Cyan brillante
        bg = "#afe9f2",
      },
      -- Tab no seleccionado
      tab = {
        fg = "#afe9f2", -- Cyan
        bg = "#183136", -- Surface gris oscuro
      },
      -- Separadores
      separator_selected = {
        fg = "#afe9f2",
        bg = "#000000",
      },
      separator = {
        fg = "#183136",
        bg = "#183136",
      },
    },
  },
}
