-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local output = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })

  -- Validar que el clone fue exitoso
  if vim.v.shell_error ~= 0 then
    vim.notify("Error clonando lazy.nvim:\n" .. output, vim.log.levels.ERROR)
    return
  end
end

vim.opt.rtp:prepend(lazypath)

-- Configuración inicial
require("config")
