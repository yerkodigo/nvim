return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Deshabilitar mapeo de Tab por defecto para evitar conflictos
      vim.g.copilot_no_tab_map = true

      -- Mapear Shift+Tab para aceptar sugerencias
      vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', {
        expr = true,
        replace_keycodes = false,
        desc = "Accept Copilot suggestion"
      })

      -- Navegación de sugerencias
      vim.keymap.set('i', '<C-j>', '<Plug>(copilot-next)', { desc = "Next Copilot suggestion" })
      vim.keymap.set('i', '<C-k>', '<Plug>(copilot-previous)', { desc = "Previous Copilot suggestion" })
      vim.keymap.set('i', '<C-l>', '<Plug>(copilot-suggest)', { desc = "Trigger Copilot suggestion" })

      vim.api.nvim_set_keymap("i", "<C-h>", 'copilot#Accept("<CR>")',
        { expr = true, silent = true, desc = "Aceptar sugerencia Copilot con Ctrl+j" })
    end,
  },
}
