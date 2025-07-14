local M = {}

function M.setup()
  -- Desactivar mapeo <Tab> por defecto
  vim.g.copilot_no_tab_map = true

  -- Asignar <C-j> para aceptar sugerencias
  vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
end

return M
