vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    -- Core plugins
    { import = "plugins" },
    -- Plugins organizados por categoría
    { import = "plugins.plugins.editor" },
    { import = "plugins.plugins.ui" },
    { import = "plugins.plugins.navigation" },
    { import = "plugins.plugins.git" },
    { import = "plugins.plugins.tools" },
  },
  defaults = {
    lazy = true, -- Habilitar lazy loading por defecto para mejor rendimiento
    version = false,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
