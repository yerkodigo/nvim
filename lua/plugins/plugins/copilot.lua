return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_no_tab_map = true

      vim.api.nvim_set_keymap("i", "<C-CR>", 'copilot#Accept("<CR>")',
        { expr = true, silent = true, desc = "Aceptar sugerencia Copilot con Ctrl+j" })
      -- vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', { expr = true, silent = true, desc = "Aceptar sugerencia Copilot con Tab" })

      vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Next()',
        { expr = true, silent = true, desc = "Siguiente sugerencia Copilot con Ctrl+n" })
      vim.api.nvim_set_keymap("i", "<S-Tab>", 'copilot#Previous()',
        { expr = true, silent = true, desc = "Sugerencia previa Copilot con Ctrl+p" })
    end,
  },
}
