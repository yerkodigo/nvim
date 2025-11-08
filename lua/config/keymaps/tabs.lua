-- ============================================================================
-- TABS & BUFFERS KEYMAPS
-- Atajos para gestión de pestañas y buffers
-- ============================================================================

local keymap = vim.keymap

-- Gestión de tabs
keymap.set("n", "<C-n>", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<A-l>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<A-h>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- Descomentados si los necesitas:
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
