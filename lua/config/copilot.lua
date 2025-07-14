local M = {}

function M.setup()

  -- Desactivar mapeo <Tab> por defecto
  vim.g.copilot_no_tab_map = true

  -- Asignar <C-j> para aceptar sugerencias
  vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

  vim.api.nvim_create_user_command("Copilot", function(opts)
    if opts.args == "enable" then
      vim.cmd("Copilot enable")
    elseif opts.args == "disable" then
      vim.cmd("Copilot disable")
    elseif opts.args == "status" then
      vim.cmd("Copilot status")
    else
      print("Comando no reconocido. Usa: Copilot enable | disable | status")
    end
  end, { nargs = 1, desc = "Controla el estado de GitHub Copilot" })

end

return M
