vim.diagnostic.config({
  virtual_text = false, -- 👈 desactiva los mensajes inline, si prefieres
  signs = true,         -- muestra íconos en la columna izquierda
  underline = true,     -- subraya los errores
  update_in_insert = false, -- no actualizar en modo insert
  severity_sort = true, -- prioriza errores sobre warnings
})

-- Autocomando para mostrar tooltip de error al dejar el cursor quieto
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false, -- no roba el foco
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always", -- muestra qué plugin o fuente originó el error
      prefix = " ",
      scope = "cursor",
    })
  end,
})

