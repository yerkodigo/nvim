-- Configuración global
_G.MyConfig = require("util")

local M = {}

-- Configuración básica de opciones
M.setup = function()
  -- Cargar opciones básicas
  require("config.options")

  -- Configurar lazy.nvim
  require("config.lazy")

  -- Cargar keymaps después de lazy
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      require("config.keymaps")
      require("config.autocmds")
      require("config.commit-modal")
    end,
  })
end

M.setup()

return M
