-- Utilidades de detección de plataforma para configuración multiplataforma de Neovim
local M = {}

-- Detectar sistema operativo
M.is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
M.is_wsl = vim.fn.has("wsl") == 1
M.is_linux = vim.fn.has("unix") == 1 and not M.is_wsl and not M.is_windows
M.is_mac = vim.fn.has("macunix") == 1

-- Separador de rutas según plataforma
M.path_sep = M.is_windows and "\\" or "/"

-- Normalizar rutas multiplataforma
function M.normalize_path(path)
  if M.is_windows then
    return path:gsub("/", "\\")
  end
  return path
end

-- Expandir home directory de forma segura
function M.expand_home(path)
  if path:match("^~/") then
    local home = M.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
    return home .. path:sub(2)
  end
  return path
end

-- Verificar si un comando existe
function M.executable(cmd)
  return vim.fn.executable(cmd) == 1
end

-- Obtener shell según plataforma
function M.get_shell()
  if M.is_windows then
    return "pwsh.exe"  -- PowerShell 7+ preferido
  end
  return vim.o.shell
end

return M
