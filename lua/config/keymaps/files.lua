-- ============================================================================
-- FILE OPERATIONS KEYMAPS
-- Atajos para guardar, cerrar y operaciones con archivos
-- ============================================================================

local keymap = vim.keymap

-- Guardar archivo
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Guardar archivo" })

-- Cerrar ventana/tab
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Cerrar ventana/tab" })

-- Guardar todo y cerrar (nota: el espacio después de leader es intencional)
keymap.set("n", "<leader> q", ":wqa<CR>", { desc = "Guardar todo y cerrar" })
