-- ============================================================================
-- WINDOW MANAGEMENT KEYMAPS
-- Atajos para gestión de ventanas (splits, redimensionamiento, etc.)
-- ============================================================================

local keymap = vim.keymap

-- Splits
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Redimensionar ventanas
keymap.set("n", "<C-M-h>", ":vertical resize -6<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-M-l>", ":vertical resize +6<CR>", { desc = "Increase window width" })
keymap.set("n", "<C-M-j>", ":resize -4<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-M-k>", ":resize +4<CR>", { desc = "Increase window height" })

-- Restaurar dimensiones de las ventanas
keymap.set("n", "<leader>=", "<C-w>=", { desc = "Restaurar dimensiones de las ventanas" })
