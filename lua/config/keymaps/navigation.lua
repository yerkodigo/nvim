-- ============================================================================
-- NAVIGATION KEYMAPS
-- Atajos para navegación entre archivos y explorador de archivos
-- ============================================================================

local keymap = vim.keymap

-- Neotree - Explorador de archivos
-- Nota: Este keymap también está definido en plugins/plugins/navigation/neotree.lua
-- Se mantiene aquí para consistencia, pero el del plugin tiene precedencia
keymap.set("n", "<leader>nt", ":Neotree reveal=true toggle<CR>", { desc = "Toggle Neo-tree en ubicación actual" })

-- Nota: Los keymaps de Telescope están en plugins/plugins/navigation/telescope.lua
-- usando el formato lazy keys para mejor rendimiento:
--   <leader>p  - Find files
--   <leader>fr - Recent files
--   <leader>ag - Live grep
--   <leader>fc - Grep string under cursor
--   <leader>ft - Find TODOs
--   <leader>gs - Git status
