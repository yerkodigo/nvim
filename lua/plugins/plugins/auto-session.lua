return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      -- Carpeta raíz donde se guardan *todas* las sesiones, cada sesión
      -- se nombrará automáticamente según el cwd en el que la generaste.
      -- Ej: ~/.local/share/nvim/session/Users-yerkodigo-MyProject/
      auto_session_root_dir    = vim.fn.stdpath("data") .. "/session/",

      -- Guarda la sesión al salir de Neovim (VimLeavePre, SIGTERM, etc.)
      auto_save_enabled        = true,

      -- Restaura automáticamente la sesión correspondiente al cwd al inicio
      auto_restore_enabled     = true,

      -- Dónde no queremos crear sesiones
      auto_session_suppress_dirs = {
        "~/",
        "~/Dev/",
        "~/Downloads",
        "~/Documents",
        "~/Desktop/",
      },

      -- Sesiones por ramas en git
      auto_session_use_git_branch = true,
    })

    -- Los atajos manuales siguen disponibles si los necesitas
    vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Guardar sesión en este proyecto" })
    vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restaurar sesión de este proyecto" })
  end,
}
