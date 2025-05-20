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
