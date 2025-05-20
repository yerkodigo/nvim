return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "+" },
          change       = { text = "~" },
          delete       = { text = "-" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~-" },
        },
        -- Opcional: actualiza más rápido al guardar archivos
        update_debounce = 100,
      })
    end,
  },
}

