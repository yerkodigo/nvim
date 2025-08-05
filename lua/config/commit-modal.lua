-- commit_modal.lua
-- Muestra un floating window centrado con el listado de tipos de commit

local M = {}

function M.show_commit_help()
  -- Define el contenido de la ventana
  local lines = {
    "adv:     Avance de una funcionalidad",
    "build:   Cambios en el sistema de build, tareas de despliegue o instalación.",
    "change:  Cambio en alguna funcionalidad existente",
    "docs:    Cambios en la documentación.",
    "feat:    Una nueva característica para el usuario.",
    "fix:     Arregla un bug que afecta al usuario.",
    "perf:    Cambios que mejoran el rendimiento del sitio.",
    "refactor: Refactorización del código (renombre de variables, funciones...).",
    "release: Característica lista para subir a producción.",
    "style:   Cambios de formato, tabulaciones, espacios o puntos y coma; no afectan al usuario.",
    "test:    Añade tests o refactoriza uno existente.",
    "",
    "Presiona 'q' o <Esc> para cerrar."
  }

  -- Crea un buffer no listable y scratch
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

  -- Inserta las líneas
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Calcula dimensiones
  local width = math.min(math.max(0, #lines[1] + 4), vim.o.columns - 4)
  for _, l in ipairs(lines) do
    width = math.max(width, #l + 4)
  end
  local height = #lines

  -- Posición centrada
  local row = math.floor((vim.o.lines - height) / 2 - 1)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Opciones del floating window
  local opts = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "rounded"
  }

  -- Abre la ventana
  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Mapea 'q' y <Esc> para cerrar esta ventana
  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { silent = true })
  vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "<cmd>close<CR>", { silent = true })
end

-- Crea el comando :Commit que invoca la función
vim.api.nvim_create_user_command("Commit", function()
  M.show_commit_help()
end, { desc = "Muestra los tipos de commit disponibles" })

return M
