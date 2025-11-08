-- ============================================================================
-- GENERAL KEYMAPS
-- Atajos generales del editor que no pertenecen a una categoría específica
-- ============================================================================

local keymap = vim.keymap

-- Salir de modo insert con jk
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Limpiar resaltado de búsqueda
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Copiar al portapapeles del sistema desde modo visual
keymap.set("v", "<C-c>", '"+y', { desc = "Copiar al portapapeles" })

-- Formateo y configuración
keymap.set("n", "<leader>f", ":set filetype<CR>gg=G", { desc = "Reconfigurar filetype y formatear archivo" })
keymap.set("n", "<leader>F", "=ap", { desc = "Indentación alrededor del cursor" })

-- Copiar ruta relativa del archivo actual al portapapeles
keymap.set('n', '<leader>yp', function()
  local filepath = vim.fn.expand('%:.')
  vim.fn.setreg('+', filepath)
  vim.notify('Ruta de archivo copiada al portapapeles: ' .. filepath, vim.log.levels.INFO)
end, { desc = 'Copiar ruta del archivo al portapapeles' })
