-- Al usar espacio y no hacer nada muestra una ayuda de que keymaps y ayudas tenemos
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 1000
  end,
  opts = {
    -- tu configuracion aqui
    -- deja vacio si quieres dejar como default
    -- tambien puedes llamar la configuracion de un archivo externo
  }
}
