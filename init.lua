-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- ********** COPILOT CONFIGURATION **********
-- Mejorar completeopt para autocompletado
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

-- Configurar Which-key para mostrar atajos de Copilot Chat
if pcall(require, "which-key") then
  require("which-key").register({
    ["<leader>cc"] = { name = "Copilot Chat" },
  })
end
-- ********** COPILOT CONFIGURATION FIN **********

-- Configuración inicial
require("config")
