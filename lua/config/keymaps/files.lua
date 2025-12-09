-- ============================================================================
-- FILE OPERATIONS KEYMAPS
-- Atajos para guardar, cerrar y operaciones con archivos
-- ============================================================================

local keymap = vim.keymap

-- Guardar archivo
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Guardar archivo" })

-- Cerrar ventana/tab de forma inteligente
keymap.set("n", "<leader>q", function()
  local windows_in_tab = vim.fn.winnr('$')  -- Cantidad de ventanas en el tab actual

  if windows_in_tab > 1 then
    -- Si hay más de una ventana, cerrar solo esta ventana
    vim.cmd("q")
  else
    -- Si es la única ventana, aplicar lógica de cierre de tab
    local tabs = vim.fn.tabpagenr('$')  -- Cantidad total de tabs
    if tabs > 1 then
      -- Si hay más de un tab, cerrar el tab completo
      vim.cmd("tabclose")
    else
      -- Si es la única tab, salir de Neovim
      vim.cmd("qa")
    end
  end
end, { desc = "Cerrar ventana/tab inteligente" })

-- Guardar todo y cerrar (nota: el espacio después de leader es intencional)
keymap.set("n", "<leader> q", ":wqa<CR>", { desc = "Guardar todo y cerrar" })
