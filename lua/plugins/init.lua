return {
  -- Lazy.nvim
  { "folke/lazy.nvim", version = "*" },
  
  -- Core plugins
  { import = "plugins.core" },
  
  -- LSP
  { import = "plugins.lsp" },
  
  -- Mason
  { import = "plugins.mason" },
}
