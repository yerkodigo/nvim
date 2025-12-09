-- ============================================================================
-- TABS & BUFFERS KEYMAPS
-- Atajos para gestión de pestañas y buffers
-- ============================================================================

local keymap = vim.keymap

-- Gestión de tabs

-- Crear nueva tab con Neo-tree abierto
keymap.set("n", "<C-n>", function()
  vim.cmd("tabnew")
  vim.cmd("Neotree")
end, { desc = "Open new tab with Neo-tree" })

keymap.set("n", "<A-l>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<A-h>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- Cerrar tab actual de forma inteligente
keymap.set("n", "<leader>tx", function()
  local tabs = vim.fn.tabpagenr('$')
  if tabs > 1 then
    vim.cmd("tabclose")
  else
    -- Si es la última tab, salir de Neovim
    vim.cmd("qa")
  end
end, { desc = "Close current tab" })

-- Abrir buffer actual en nueva tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
