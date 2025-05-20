vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>nt", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- Moverse entre ventanas con Ctrl + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Mover foco a la ventana izquierda" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Mover foco a la ventana derecha" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Mover foco a la ventana abajo" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Mover foco a la ventana arriba" })

vim.keymap.set("n", "<leader>ag", function()
  require("telescope.builtin").live_grep()
end, { desc = "Buscar palabra o frase en todo el proyecto" })

vim.keymap.set("n", "<leader>p", function()
  require("telescope.builtin").find_files()
end, { desc = "Buscar archivos por nombre" })

-- Abrir nueva tab en raíz del proyecto (donde está .git)
vim.keymap.set("n", "<C-n>", function()
  vim.cmd("tabnew")        -- Abre nueva tab
  vim.cmd("enew")          -- Abre un buffer vacío (sin el buffer heredado)
  vim.cmd("Neotree toggle")-- Abre Neo-tree
end, { desc = "Nueva tab con Neo-tree" })

-- Moverse entre tabs con Ctrl + flechas
vim.keymap.set("n", "<C-Left>", ":tabprevious<CR>", { desc = "Tab anterior" })
vim.keymap.set("n", "<C-Right>", ":tabnext<CR>", { desc = "Siguiente tab" })

-- Guardar archivo
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Guardar archivo" })

-- Cerrar buffer o ventana
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Cerrar ventana/tab" })
