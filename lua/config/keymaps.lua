-- configuracion de keymaps personalizados
-- Las teclas leader se configuran antes de cargar la configuración de lazy.

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exis insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>nt", ":Neotree reveal=true toggle<CR>", { desc = "Toggle Neo-tree en ubicación actual" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<C-n>", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<A-l>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<A-h>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Guardar archivo
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Guardar archivo" })

keymap.set("n", "<leader> q", ":wqa<CR>", { desc = "Guardar todo y cerrar" })

-- Cerrar buffer o ventana
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Cerrar ventana/tab" })

-- Copiar al portapapeles del sistema desde modo visual
keymap.set("v", "<C-c>", '"+y', { desc = "Copiar al portapapeles" })

-- Reconfigurar el filetype y autoformatear todo el archivo
keymap.set("n", "<leader>f", ":set filetype<CR>gg=G", { desc = "Reconfigurar filetype y formatear archivo" })

-- Identar alrededor del cursor
keymap.set("n", "<leader>F", "=ap", { desc = "Indentación alrededor del cursor" })
